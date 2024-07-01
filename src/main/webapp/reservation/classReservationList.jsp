<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>학교종이 댕댕댕</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="./resources/img/favicon.ico" rel="icon">

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
    <link href="/dangdangdang/resources/css/classListstyle.css" rel="stylesheet">
    
      <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/dangdangdang/resources/lib/wow/wow.min.js"></script>
    <script src="/dangdangdang/resources/lib/easing/easing.min.js"></script>
    <script src="/dangdangdang/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="/dangdangdang/resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/dangdangdang/resources/js/main.js"></script>
    <script src="/dangdangdang/resources/js/classList.js"></script>
	<script>
	function changeAttendance(){
			
			let checkbox = $("input[name=attendCheck]:checked");
			let arr = []; 
			checkbox.each(function(i, el){
				let tmp = { "classNo" : $(el).val()}
				arr.push(tmp)
			})
			
			$.ajax({
			url: '/dangdangdang/reservation/updateAttendance.jsp',
			type: 'post',			
			data: {
				"classNoList": JSON.stringify(arr)
			},
			success : function(response){
				console.log('성공')
				checkbox.each(function(i, el){
				$(el).parent().parent().children(".attendance").text("출석")
			})
				
			},
			error : function(){
				alert('실패')
			}
		})
			
		}
	</script>

</head>

<body>
    <div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->

		<jsp:include page="/include/adminMenu.jsp" />
        
        <!-- Page Header Start -->
        <div class="container-xxl py-5 page-header position-relative mb-5">
            <div class="container py-5">
                <h1 class="display-2 text-white animated slideInDown mb-4">Reservation</h1>
                <nav aria-label="breadcrumb animated slideInDown">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Reservation</a></li>
                        <li class="breadcrumb-item text-white active" aria-current="page">수업 관리</li>
                    </ol>
                </nav>
            </div>
        </div>
        <!-- Page Header End -->
        
        <section class="container-xxl py-5 ftco-section">
			<div class="container">
				<div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
	                    <h1 class="mb-3">Class Reservation List</h1>
	             </div>
	        </div>
	        <div class="container">
			
			<div class="row">
				<div class="col-md-12">
					<div class="elegant-calencar d-md-flex">
						<div class="wrap-header d-flex align-items-center">
				      
			        <div id="header" class="p-0">
		            <div class="pre-button d-flex align-items-center justify-content-center"><i class="fa fa-chevron-left"></i></div>
		            <div class="head-info">
		                <div class="head-day"></div>
		                <div class="head-month"></div>
		            </div>
		            <div class="next-button d-flex align-items-center justify-content-center"><i class="fa fa-chevron-right"></i></div>
			        </div>
			      </div>
			      <div class="calendar-wrap">
			        <table id="calendar">
		            <thead>
		                <tr>
		                    <th>Sun</th>
		                    <th>Mon</th>
		                    <th>Tue</th>
		                    <th>Wed</th>
		                    <th>Thu</th>
		                    <th>Fri</th>
		                    <th>Sat</th>
		                </tr>
		            </thead>
		            <tbody>
	                <tr>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                </tr>
	                <tr>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                </tr>
	                <tr>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                </tr>
	                <tr>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                </tr>
	                <tr>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                </tr>
	                <tr>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                  <td></td>
	                </tr>
		            </tbody>
			        </table>
			      </div>
			    </div>
				</div>
			</div>
		</div>
		
	       <div class="container">
	       <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
	                    <h3 class="mb-3">수업 예약 목록</h3>
	             </div>
	        	<table class="table table-bordered" id="listTable" style="border: 1px solid;">
	        		<thead class="thead-dark">
	        		<tr>
	        			<th><input type="checkbox" id="checkAll"></th>    			
	        			<th>번호</th>
	        			<th>강아지</th>
	        			<th>수업일</th>
	        			<th>예약일</th>
	        			<th>예약 상태</th>
	        			<th>출석체크</th>
	        			<th></th>
	        		</tr>
	        		</thead>
	        		<tbody id="listTableBody"></tbody>
	        	</table>
	        	<button id="attendBtn" class="btn btn-primary" onclick="changeAttendance()">출석체크</button>
	        </div>
        </section>
		<%-- 
			- 출석 체크 조건 => status가 c가 아니고 수업일이 오늘 이하여야 함
			- 일지 쓰기 조건 => 출석이 P여야 함. 
		 --%>

       
		
		<jsp:include page="/include/footer.jsp" />
        

        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

  

</body>

</html>