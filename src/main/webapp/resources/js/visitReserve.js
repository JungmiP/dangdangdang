(function($) {

	"use strict";

	// Setup the calendar with the current date
$(document).ready(function(){
    var date = new Date();
    var today = date.getDate();
    // Set click handlers for DOM elements
    $(".right-button").click({date: date}, next_year);
    $(".left-button").click({date: date}, prev_year);
    $(".month").click({date: date}, month_click);
   
    // Set current month as active
    $(".months-row").children().eq(date.getMonth()).addClass("active-month");
    init_calendar(date);
    check_date(today, date.getMonth()+1, date.getFullYear());
    show_date(date.getMonth() + 1, today);
});

// Initialize the calendar by appending the HTML dates
function init_calendar(date) {
    $(".tbody").empty();
 
    var calendar_days = $(".tbody");
    var month = date.getMonth();
    var year = date.getFullYear();
    var day_count = days_in_month(month, year);
    var row = $("<tr class='table-row'></tr>");
    var today = date.getDate();
    // Set date to 1 to find the first day of the month
    date.setDate(1);
    var first_day = date.getDay();
    // 35+firstDay is the number of date elements to be added to the dates table
    // 35 is from (7 days in a week) * (up to 5 rows of dates in a month)
    for(var i=0; i<35+first_day; i++) {
        // Since some of the elements will be blank, 
        // need to calculate actual date from index
        var day = i-first_day+1;
        // If it is a sunday, make a new row
        if(i%7===0) {
            calendar_days.append(row);
            row = $("<tr class='table-row'></tr>");
        }
        // if current index isn't a day in this month, make it blank
        if(i < first_day || day > day_count) {
            var curr_date = $("<td class='table-date nil'>"+"</td>");
            row.append(curr_date);
        }   
        else {
            var curr_date = $("<td class='table-date'>"+day+"</td>");
            check_date(day, month + 1, year);
            if(today===day && $(".active-date").length===0) {
                curr_date.addClass("active-date");
                show_date(month + 1, day);
            }
            // Set onClick handler for clicking a date
            curr_date.click({year:year, month: month+1, day:day}, date_click);
            row.append(curr_date);
        }
    }
    // Append the last row and set the current year
    calendar_days.append(row);
    $(".year").text(year);
}

// Get the number of days in a given month/year
function days_in_month(month, year) {
    var monthStart = new Date(year, month, 1);
    var monthEnd = new Date(year, month + 1, 1);
    return (monthEnd - monthStart) / (1000 * 60 * 60 * 24);    
}

// Event handler for when a date is clicked
function date_click(event) {
    $(".events-card").show(250);    
    $(".active-date").removeClass("active-date");
    $(this).addClass("active-date");   
    show_date(event.data.month, event.data.day);
	$("input:radio[name='time']").prop('checked', false)
   // 해당 날짜가 오늘 포함 이전이면 모두 블락
    let currDate = event.data.year + String(event.data.month).padStart(2, "0") +String(event.data.day).padStart(2, "0")
   	let now = new Date();
  	let today = now.getFullYear() + String(now.getMonth() + 1).padStart(2, "0") + String(now.getDate()).padStart(2, "0")
    if( currDate < today){
		$(".radio-time").attr("onclick", "return false;")
		$("input[name='time'] + label").addClass("reserved")
	}else if(currDate == today){
		let hour = String(now.getHours()).padStart(2,"0") + ":00"
		$(".radio-time").each(function(){
			if($(this).val() < hour){
				$(".radio-time").attr("onclick", "return false;")
				$("input[name='time'] + label").addClass("reserved")
			}
		})
	}else{
		$(".radio-time").removeAttr("onclick")    	
    	$("label[class='reserved']").removeClass("reserved")
	    //ajax로 해당 날짜의 예약 리스트 불러오기
	    $(reserveForm.redate).val(currDate);
	    fetch('/dangdangdang/reservation/getReservation.jsp?date=' + currDate)
	    .then((response) => response.text())
	    .then((response) => {
			let dates = JSON.parse(response)
			checkReserved(dates)
		})
	}
};

// request로 받아온 reserveDate 목록에 포함된 시간은 선택 불가하게 처리하는 함수
function checkReserved(reserveDates){
	$(reserveForm.time).each(function(_, el){
		if(reserveDates.includes(el.value)){
			let tmp = el.id
  			$("#"+ tmp).attr("onclick", "return false;")
  			$("label[for="+tmp+"]").addClass("reserved");
  		}	
  	})
}


// Event handler for when a month is clicked
function month_click(event) {
    $(".events-container").show(250);
   
    var date = event.data.date;
    $(".active-month").removeClass("active-month");
    $(this).addClass("active-month");
    var new_month = $(".month").index(this);
    date.setMonth(new_month);
    init_calendar(date);
}

// Event handler for when the year right-button is clicked
function next_year(event) {
   
    var date = event.data.date;
    var new_year = date.getFullYear()+1;
    $("year").html(new_year);
    date.setFullYear(new_year);
    init_calendar(date);
}

// Event handler for when the year left-button is clicked
function prev_year(event) {
    var date = event.data.date;
    var new_year = date.getFullYear()-1;
    $("year").html(new_year);
    date.setFullYear(new_year);
    init_calendar(date);
}


// Display all events of the selected date in card views
function show_date(month, day) {
    // Clear the dates container
    $(".events-card").empty();
    $(".events-card").show(250);
    
    let event_name = "<h4 class='m-1' style='color:#FFF5F3;'>" + month + "월 " + day + "일 예약하기</h4>";
    $(".events-card").append(event_name);
}

// Checks if a specific date has any events
function check_date(day, month, year) {
	let date = year + String(month).padStart(2, "0") +String(day).padStart(2, "0")
    $(reserveForm.redate).val(date)
}

const months = [ 
    "January", 
    "February", 
    "March", 
    "April", 
    "May", 
    "June", 
    "July", 
    "August", 
    "September", 
    "October", 
    "November", 
    "December" 
];

})(jQuery);
