<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <title>학교종이 댕댕댕</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="/dangdangdang/resources/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@600&family=Lobster+Two:wght@700&family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/dangdangdang/resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/dangdangdang/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/dangdangdang/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/dangdangdang/resources/css/style.css" rel="stylesheet">
    	
	<link rel="stylesheet" href="/dangdangdang/resources/css/calendar_style.css">
	
  	<style>
  		input[type=radio]{
  			display: none;
  			margin:10px;
  		}
  		
  		input[type=radio] + label{
  			display: inline-block;
  			margin: 2px;
  			padding: 8px;
  			background-color: #FFF5F3;
			text-align:center;
			border-radius: 10px;
			width: 30%;
  		}
  		
  		input[type=radio]:checked + label{
  			color: #FE5D37;
  			font-weight: bold;
  		}
  		
  		#submitBtn {
  			background-color: #FFF5F3;
  			color:#FE5D37;
  			float:right;
  			margin: 5px;
  		}
  		
  		.form-label {
  			margin: 5px;
  			font-size: 1em;
  			align-items:flex-start;
  			font-weight: bold;
  		}
  		
  		
  	</style>
  	<script src="/dangdangdang/resources/js/jquery.min.js"></script>
  	<script src="/dangdangdang/resources/js/popper.js"></script>
  	<script src="/dangdangdang/resources/js/bootstrap.min.js"></script>
  	<script src="/dangdangdang/resources/js/calendar_main2.js"></script>
  	<script>
  	
  	<c:if test="${not empty msg}">
  		alert("${msg}")
  		<c:remove var="msg" scope="request" />
  	</c:if>
  	
  	let reserveDates = [];
  	<c:forEach items="${reserveList}" var="reserve" varStatus="status">
  		reserveDates['${status.index}'] = '${fn:substring(reserve.reserveDate, 11, 16)}'
  	</c:forEach>
  		
  		$(document).ready(function(){
  			$(reserveForm.time).each(function(i, el){
  				if(reserveDates.includes(el.value)){
  					let tmp = el.id
  					$("#"+ tmp).attr("onclick", "return false;")
  					$("label[for="+tmp+"]").css({"background-color": "#9e9e9e", "color" : "#e6e6e6"})
  				}	
  			})
  			
  		})
  	</script>
</head>
<body>
<div class="container-xxl bg-white p-0">
	<jsp:include page="/include/topMenu.jsp" />
	<!-- Page Header End -->
        <div class="container-xxl py-5 page-header position-relative mb-5">
            <div class="container py-5">
                <h1 class="display-2 text-white animated slideInDown mb-4">Reservation</h1>
                <nav aria-label="breadcrumb animated slideInDown">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Reservation</a></li>
                        <li class="breadcrumb-item text-white active" aria-current="page">방문 상담 예약</li>
                    </ol>
                </nav>
            </div>
        </div>
        <!-- Page Header End -->
         
                
	<section class="container-xxl py-5 ftco-section">
		<div class="container">
			<div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                    <h1 class="mb-3">Visit Reservation</h1>
             </div>
			<div class="row">
				<div class="col-md-12">
					<div class="content w-100">
				    <div class="calendar-container">
				      <div class="calendar"> 
				        <div class="year-header"> 
				          <span class="left-button fa fa-chevron-left" id="prev"> </span> 
				          <span class="year" id="label"></span> 
				          <span class="right-button fa fa-chevron-right" id="next"> </span>
				        </div> 
				        <table class="months-table w-100"> 
				          <tbody>
				            <tr class="months-row">
				              <td class="month">Jan</td> 
				              <td class="month">Feb</td> 
				              <td class="month">Mar</td> 
				              <td class="month">Apr</td> 
				              <td class="month">May</td> 
				              <td class="month">Jun</td> 
				              <td class="month">Jul</td>
				              <td class="month">Aug</td> 
				              <td class="month">Sep</td> 
				              <td class="month">Oct</td>          
				              <td class="month">Nov</td>
				              <td class="month">Dec</td>
				            </tr>
				          </tbody>
				        </table> 
				        
				        <table class="days-table w-100"> 
				          <td class="day">Sun</td> 
				          <td class="day">Mon</td> 
				          <td class="day">Tue</td> 
				          <td class="day">Wed</td> 
				          <td class="day">Thu</td> 
				          <td class="day">Fri</td> 
				          <td class="day">Sat</td>
				        </table> 
				        <div class="frame"> 
				          <table class="dates-table w-100"> 
			              <tbody class="tbody">             
			              </tbody> 
				          </table>
				        </div>
				      </div>
				    </div>
				    <div class="events-container" >
				    	<div class="events-card">				    		
				    	</div>
				    	<div class="row g-3">
				    		<form action="/dangdangdang/reserveForm.do" method="post" id="reserveForm">
				          		<div class="form-container">
				          			<!-- 로그인한 유저 아이디로 바꾸기 -->
				          			<input type="hidden" name="memberId" value="user">
					            	<div class="form-label" >예약 가능 시간</div>
					            	
					            		<input type="radio" id="am10" name="time" value="10:00" class="radio-time" />
										<label for="am10">AM 10:00</label>
						            	<input type="radio" id="am11" name="time" value="11:00" class="radio-time" />
										<label for="am11">AM 11:00</label>
					            		<input type="radio" id="pm14" name="time" value="14:00" class="radio-time" />
										<label for="pm14">PM 14:00</label>
					            		<input type="radio" id="pm15" name="time" value="15:00" class="radio-time" />
										<label for="pm15">PM 15:00</label>
					            		<input type="radio" id="pm16" name="time" value="16:00" class="radio-time" />
										<label for="pm16">PM 16:00</label>
					            	
					            	<br>
					            	<label class="form-label" for="detail" >상담 상세 내용</label>
					            	<textarea id="detail" name="detail"  cols="40" rows="5" placeholder="상담받고 싶은 내용을 입력하세요."></textarea>
					            	<button class="button" type="submit" id="submitBtn" >예약하기</button>
				          		</div>
				        	</form>				    	
				    	</div>				    	
				    </div>
				    
				  </div>
				</div>
			</div>
		</div>
	</section>
	
	<jsp:include page="/include/footer.jsp" />
	<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
</div>
</body>
</html>