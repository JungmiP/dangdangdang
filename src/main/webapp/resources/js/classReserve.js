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
    let now = date.getFullYear() + String(date.getMonth()+1).padStart(2, "0") + String(today).padStart(2, "0")
    $(classForm.date).val(now)
    
    checkReserve(now)
    show_events(date.getMonth() + 1, today);
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
    for(var i=0; i < 35 + first_day; i++) {
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
            
            if(today===day && $(".active-date").length===0) {
                curr_date.addClass("active-date");
                show_events(month + 1, day);
            }
            // Set onClick handler for clicking a date
            curr_date.click({ year: year, month: month + 1, day:day}, date_click);
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
    $(".events-container").show(250);
    $(".active-date").removeClass("active-date");
    $(this).addClass("active-date");
    show_events(event.data.month, event.data.day);
    let now = event.data.year + String(event.data.month).padStart(2, "0") + String(event.data.day).padStart(2, "0")
    checkReserve(now)
    $(classForm.date).val(now)
};

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
function show_events(month, day) {
    // Clear the dates container
    $(".event-card").empty();
    $(".event-card").show(250);
    let event_name = $("<div class='event-name'>" + month + "월 " + day + "일 수업 예약</div>");
    $(".event-card").append(event_name);
}

// Checks if a specific date has any events
function check_events(day, month, year) {
    var events = [];
    for(var i=0; i<event_data["events"].length; i++) {
        var event = event_data["events"][i];
        if(event["day"]===day &&
            event["month"]===month &&
            event["year"]===year) {
                events.push(event);
            }
    }
    return events;
}

// 해당 날짜에 예약이 다 찬 선생님은 선택 불가로 만드는 함수
function checkReserve(tarDate){
	//ajax로 예약 수 확인
	
	$.ajax({
				url: '/dangdangdang/reservation/getClassCnt.jsp',
				type: 'post',
				
				data: {
					date: tarDate
				},
				success : function(response){
					let list = JSON.parse(response)
					$(list).each(function(){
						// 예약 횟수가 10 이상이면 클릭 금지
						if(this.CNT >= 10){
							$("#"+this.TEACHERID).attr("onclick", "return false;")
							//css 변경도 추가할 것
						}
					})					
				},
				error : function(){
					alert('실패')
				}
	})

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
