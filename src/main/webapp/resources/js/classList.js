(function($) {

	"use strict";

	document.addEventListener('DOMContentLoaded', function(){
    var today = new Date(),
        year = today.getFullYear(),
        month = today.getMonth(),
        day = today.getDate(),
        days = document.getElementsByTagName('td'),
        selectedDay,
        setDate,
        daysLen = days.length;
	// options should like '2014-01-01'
    let now = year + String(month + 1).padStart(2,"0") + String(day).padStart(2, "0")
    getClassList(now)
    function Calendar(selector, options) {
        this.options = options;
        this.draw();
    }
    
    Calendar.prototype.draw  = function() {
        this.getCookie('selected_day');
        this.getOptions();
        this.drawDays();
        var that = this,
            pre = document.getElementsByClassName('pre-button'),
            next = document.getElementsByClassName('next-button');
            
            pre[0].addEventListener('click', function(){that.preMonth(); });
            next[0].addEventListener('click', function(){that.nextMonth(); });
        while(daysLen--) {
            days[daysLen].addEventListener('click', function(){that.clickDay(this); });
        }
    };

    Calendar.prototype.drawHeader = function(e) {
        var headDay = document.getElementsByClassName('head-day'),
            headMonth = document.getElementsByClassName('head-month');

            e?headDay[0].innerHTML = e : headDay[0].innerHTML = day;
            headMonth[0].innerHTML = year +"년 " + (month + 1) +"월";        
     };
    
    Calendar.prototype.drawDays = function() {
        var startDay = new Date(year, month, 1).getDay(),
            nDays = new Date(year, month + 1, 0).getDate(),    
            n = startDay;
        for(var k = 0; k <42; k++) {
            days[k].innerHTML = '';
            days[k].id = '';
            days[k].className = '';
        }

        for(var i  = 1; i <= nDays ; i++) {
            days[n].innerHTML = i; 
            n++;
        }
        
        for(var j = 0; j < 42; j++) {
            if(days[j].innerHTML === ""){
                
                days[j].id = "disabled";
                
            }else if(j === day + startDay - 1){
                if((this.options && (month === setDate.getMonth()) && (year === setDate.getFullYear())) || (!this.options && (month === today.getMonth())&&(year===today.getFullYear()))){
                    this.drawHeader(day);
                    days[j].id = "today";
                }
            }
            if(selectedDay){
                if((j === selectedDay.getDate() + startDay - 1)&&(month === selectedDay.getMonth())&&(year === selectedDay.getFullYear())){
                days[j].className = "selected";
                this.drawHeader(selectedDay.getDate());
                }
            }
        }
    };
    
    Calendar.prototype.clickDay = function(o) {
        var selected = document.getElementsByClassName("selected"),
            len = selected.length;
        if(len !== 0){
            selected[0].className = "";
        }
        o.className = "selected";
        selectedDay = new Date(year, month, o.innerHTML);
        this.drawHeader(o.innerHTML);
        this.setCookie('selected_day', 1);
        let tarDate = year + String(month+1).padStart(2,"0") + o.innerHTML.padStart(2,"0")
        $("#listTableBody").empty()
        console.log(tarDate)
        getClassList(tarDate)        
    };
    
    Calendar.prototype.preMonth = function() {
        if(month < 1){ 
            month = 11;
            year = year - 1; 
        }else{
            month = month - 1;
        }
        this.drawHeader(1);
        this.drawDays();
    };
    
    Calendar.prototype.nextMonth = function() {
        if(month >= 11){
            month = 0;
            year =  year + 1; 
        }else{
            month = month + 1;
        }
        this.drawHeader(1);
        this.drawDays();
    };
    
    Calendar.prototype.getOptions = function() {
        if(this.options){
            var sets = this.options.split('-');
                setDate = new Date(sets[0], sets[1]-1, sets[2]);
                day = setDate.getDate();
                year = setDate.getFullYear();
                month = setDate.getMonth();
        }
    };
    
     
    
    Calendar.prototype.setCookie = function(name, expiredays){
        if(expiredays) {
            var date = new Date();
            date.setTime(date.getTime() + (expiredays*24*60*60*1000));
            var expires = "; expires=" +date.toGMTString();
        }else{
            var expires = "";
        }
        document.cookie = name + "=" + selectedDay + expires + "; path=/";
    };
    
    Calendar.prototype.getCookie = function(name) {
        if(document.cookie.length){
            var arrCookie  = document.cookie.split(';'),
                nameEQ = name + "=";
            for(var i = 0, cLen = arrCookie.length; i < cLen; i++) {
                var c = arrCookie[i];
                while (c.charAt(0)==' ') {
                    c = c.substring(1,c.length);
                    
                }
                if (c.indexOf(nameEQ) === 0) {
                    selectedDay =  new Date(c.substring(nameEQ.length, c.length));
                }
            }
        }
    };
    var calendar = new Calendar();    
        
}, false);
	
	
	
	function getClassList(tarDate){
		$("#listTableBody").empty()
		// ajax로 해당 날짜의 수업 목록 가져오기
		$.ajax({
			url: '/dangdangdang/reservation/getClassList.jsp',
			type: 'post',
			
			data: {
				date: tarDate
			},
			success : function(response){
				if(response == '' ){
					let tr = "<tr><td colspan='8'>예약 내역이 없습니다</td></tr>"
					$("#listTableBody").append(tr)
				}
				let tmp = JSON.parse(response)
				$(tmp).each(function(idx){
					
					let tr = "<tr><td><input type='checkbox' name='attendCheck' value=" + this.no +"></td>"
							+"<td>"+ (idx + 1) +"</td>"
							+"<td>"+this.dogNo+"</td>"
							+"<td>"+this.classDate.substring(0, 10)+"</td>"
							+"<td>"+this.regDate.substring(0, 10)+"</td>"
							+"<td>"+ (( this.status == 'A')? "확정" : (this.status == 'C') ? "취소" : "만료") + "</td>"
							+"<td class='attendance'>"+ ((this.attendance == 'P') ? "출석" : "" )+"</td>"
							+"<td><a href='writeActivity.do?classNo="+ this.no +"' class='btn btn-dark btn-sm'>일지쓰기</a></td></tr>"
					$("#listTableBody").append(tr)
				})
				
			},
			error : function(){
				alert('실패')
			}
})
	}

})(jQuery);
