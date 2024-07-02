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
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@600&family=Lobster+Two:wght@700&family=IBM+Plex+Sans+KR&family=Song+Myung&display=swap" rel="stylesheet">
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
  		
  		.reserved {
  			background-color: #9e9e9e !important; 
  			color: #e6e6e6;
  		}
  		
  	</style>
  	<script src="/dangdangdang/resources/js/jquery.min.js"></script>
  	<script src="/dangdangdang/resources/js/popper.js"></script>
  	<script src="/dangdangdang/resources/js/bootstrap.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/dangdangdang/resources/lib/wow/wow.min.js"></script>
    <script src="/dangdangdang/resources/lib/easing/easing.min.js"></script>
    <script src="/dangdangdang/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="/dangdangdang/resources/lib/owlcarousel/owl.carousel.min.js"></script>  	
  	<script src="/dangdangdang/resources/js/main.js"></script>
  	<script src="/dangdangdang/resources/js/visitReserve.js"></script>
  	<script>
  	$(document).ready(function(){
  		<c:if test="${not empty msg}">
  			alert("${msg}")
  			<c:remove var="msg" scope="request" />
  		</c:if>
	  	/*<c:if test="${not empty msg}">
	  	// alert 대신 모달창 띄우기
	  		$("#exampleModal").modal("show");
	  		<c:remove var="msg" scope="request" />
	  	</c:if>
	  	$("#closeModal").click(function() {
			$("#exampleModal").modal("hide")
		});
	  	
	  	*/
	  	let now = new Date()
	  	let hour = String(now.getHours()).padStart(2,"0") + ":00"
		$(".radio-time").each(function(){
			if($(this).val() < hour){
				$(".radio-time").attr("onclick", "return false;")
				$("input[name='time'] + label").addClass("reserved")
			}
		})
	  	
	  	
	  	let reserveDates = [];
	  	<c:forEach items="${reserveList}" var="reserve" varStatus="status">
	  		reserveDates['${status.index}'] = '${fn:substring(reserve.reserveDate, 11, 16)}'
	  	</c:forEach>
	  		
	  	$(reserveForm.time).each(function(i, el){
	  		if(reserveDates.includes(el.value)){
	  			let tmp = el.id
	  			$("#"+ tmp).attr("onclick", "return false;")
	  			$("label[for="+tmp+"]").addClass("reserved")
	  		}	
	  	})	
	  	
  	})
  	
  	function cancelVisit(no){
	  		console.log(no)
	  		if(confirm('취소하시겠습니까?')){
	  			$.ajax({
	  				url: '/dangdangdang/reservation/cancelVisit.jsp',
	  				type: 'post',			
	  				data: {
	  					"no": no
	  				},
	  				success : function(response){
	  					console.log('성공')
	  					// 상태 취소로 업데이트
	  					location.reload();
	  				},
	  				error : function(){
	  					alert('실패')
	  				}
	  			})
	  		}
	  	}
  	</script>
</head>
<body>

<div class="container-xxl bg-white p-0">
	<jsp:include page="/include/topMenu.jsp" />

<!-- Modal 

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
        ${msg}
      </div>
      <div class="modal-footer">
        <button type="button" id="closeModal" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
Modal end -->
<!-- Page Header Start -->
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
				    	<div class="row justify-content-center">
				    		<p style="width:95%; margin:2px; padding:2px; background-color:#FFF5F3;">안내사항<br>
				    			1. 당일 예약, 당일 취소 불가<br>
				    			2. 사유를 구체적으로 적어주시면 상담이 더 원활하게 이루어집니다.</p>				    		
				    		<form action="/dangdangdang/reserveForm.do" method="post" id="reserveForm" >
				          		<div class="form-container" style="margin-top: 3px;">
				          			<input type="hidden" name="redate" />
				          			<!-- 로그인한 유저 아이디로 바꾸기 -->
				          			<input type="hidden" name="memberId" value="${member.id}" />
					            	<div class="form-label" >예약 가능 시간</div>
					            	
					            		<input type="radio" id="am10" name="time" value="10:00" class="radio-time" required/>
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
			<c:if test="${not empty myReserveList}">
			<div class="text-center ">
			<h3>상담 예약 내역</h3>
			<table class="table table-bordered">
				<thead class="thead-dark">
				<tr>
					<th>번호</th>
					<th>방문일시</th>
					<th>예약 상태</th>
					<th>예약일</th>
					<th></th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${myReserveList}" var="reserve">
					<tr>
						<td>${reserve.no}</td>
						<td>${reserve.reserveDate}</td>
						<td>${(reserve.status == 'A')?"확정":(reserve.status == 'C')?"취소":"만료"}</td>
						<td>${reserve.regDate}</td>
						<td>
							<c:if test="${reserve.status == 'A'}">
								<button class="btn btn-dark btn-sm" onclick="cancelVisit(${reserve.no})">취소</button>
							</c:if>
							<c:if test="${reserve.status != 'A'}">
								<button class="btn btn-secondary btn-sm" onclick="return false;">취소</button>
							</c:if>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</div>
			</c:if>
		</div>
	</section>
	
	<jsp:include page="/include/footer.jsp" />
	<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
</div>
</body>
</html>