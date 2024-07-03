<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  		
  		input[name=subNo] + label {
  			width: 98%;
  		}
  		
  		.button-white {
  			background-color: #FFF5F3;
  			color:#FE5D37;  			
  			margin: 5px;
  		}
  		
  		#submitBtn {
  			float:right;
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
  	<script src="/dangdangdang/resources/js/classReserve.js"></script>
	<script>
	<c:if test="${not empty msg}">
		alert("${msg}")
		<c:remove var="msg" scope="request" />
	</c:if>
	
	function cancelClass(no){
		if(confirm('취소하시겠습니까?')){
			$.ajax({
  				url: '/dangdangdang/reservation/cancelClass.jsp',
  				type: 'post',			
  				data: {
  					"no": no
  				},
  				success : function(response){
  					console.log('성공')
  					// 상태 취소로 업데이트
  					// 달력 다시 로드?
  					// 예약 내역에서 상태 삭제로 변경
  					// 
  					$('#tr' + no).children().children().button().removeClass('btn-dark')
	  				$('#tr' + no).children().children().button().addClass('btn-secondary')
	  				$('#tr' + no).children().children().button().attr('onclick', 'return false;')
	  				$('#tr' + no +' td:nth-child(5)').text('취소')
  					
  				},
  				error : function(){
  					alert('실패')
  				}
  			})
		}
	}
	
	function checkLogin(){
		if('${member}' != null){
			// 강아지 등록 페이지로 이동
  		}else{
  			alert('로그인을 해주세요')
  		}
	}
	
	
	function existClass(){
		$("#listTableBody tr td:nth-child(3)").each(function(){ 
			if(classForm.dogNo.value == this.innerText){
				alert('이미 수업을 예약하셨습니다')
				return false;	
			}
		})
		return true;
	}
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
                        <li class="breadcrumb-item text-white active" aria-current="page">수업 예약</li>
                    </ol>
                </nav>
            </div>
        </div>
        <!-- Page Header End -->
         
                
	<section class="container-xxl py-5 ftco-section">
		<div class="container">
			<div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                    <h1 class="mb-3">Class Reservation</h1>
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
				    <div class="events-container">
				    	<div class="events-card">
				    	
				    	</div>
				    	<div class="row justify-content-center">
				    	<c:if test="${empty member}">
				    		<button class="button button-white">회원가입</button>
				    		<button class="button button-white">로그인</button>
				    	</c:if>
				    	<c:if test="${not empty member}">
				    		<form action="/dangdangdang/classForm.do" method="post" id="classForm" onsubmit="return existClass()">
				    		<input type="hidden" name="memberId" value="${member.id}">
				    		<input type="hidden" name="date">
				    			<div class="form-label">강아지 선택</div>
				    				<%-- 강아지 목록 있으면 강아지 목록, 없으면 강아지 등록 --%>
				    				<c:if test="${not empty dogList }">
					    				<c:forEach items="${ dogList }" var="dog">
					    					<input type="radio" id="${dog.name}" name="dogNo" value="${dog.no}" class="radioDog" required/>
											<label for="${dog.name}">${dog.name}</label>
					    				</c:forEach>
				    				</c:if>
				    				<c:if test="${empty dogList}">
				    					<button class="btn btn-light" onclick="checkLogin()">강아지 등록하기</button>
				    				</c:if>
				    			<div class="form-label">선생님 선택</div>
				    				<%-- 선생님 이름 조회 후 목록 만들고 가능 여부 설정 --%>
					    			<c:forEach items="${ teacherList }" var="teacher">
					    				<input type="radio" id="${teacher.id}" name="teacherId" value="${teacher.id}" class="radioTeacher" required />
										<label for="${teacher.id}">${teacher.name}</label>
					    			</c:forEach>				    				
				    			<div class="form-label">이용권 선택</div>
				    				<%-- 이용권 날짜, 남은 횟수 조회 후 가능만 radio로 선택 --%>
					    			<c:forEach items="${ subList }" var="sub">
					    				<input type="radio" id="sub${sub.no}" name="subNo" value="${sub.no}" class="radioSub" required/>
										<label for="sub${sub.no}">이용권 NO: ${sub.no} 남은 횟수: ${sub.remainClasses} 만료일: ${sub.endDate.substring(0, 10)}</label>
					    			</c:forEach>				    				
				    		<button class="button button-white" type="submit" id="submitBtn" >수업 예약</button>
				    		</form>
				    		</c:if>
				    	</div>
				    </div>				    
				  </div>
				</div>
			</div>
			<div class="text-center table-bordered">
				<h3>수업 예약 내역</h3>
				<table class="table" id="classListTable">
					<thead>
					<tr>
						<th>번호</th>
						<th>수업일</th>
						<th>강아지</th>
						<th>담당 선생님</th>
						<th>예약 상태</th>
						<th>예약일</th>
						<th></th>
					</tr>
					</thead>
					<tbody id="listTableBody">
			
					</tbody>
				</table>
			</div>
		</div>
	</section>

	<jsp:include page="/include/footer.jsp" />
	<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
</div>
</body>
</html>