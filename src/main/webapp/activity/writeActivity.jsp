<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="/error.jsp" %>
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
    <link href="/dangdangdang/resources/css/classListstyle.css" rel="stylesheet">
    
      <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/dangdangdang/resources/lib/wow/wow.min.js"></script>
    <script src="/dangdangdang/resources/lib/easing/easing.min.js"></script>
    <script src="/dangdangdang/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="/dangdangdang/resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/dangdangdang/resources/js/main.js"></script>
	

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
	                    <h1 class="mb-3">Write Activity Report</h1>
	             </div>
	        </div>
	       	<div class="bg-light rounded">
                    <div class="row justify-content-center">
                        <div class="col-lg-8 d-flex flex-column wow fadeIn" data-wow-delay="0.1s">
                            <div class="h-100 d-flex flex-column justify-content-center p-5">
                                <form name="activityForm" action="/dangdangdang/activityForm.do" method="post" enctype="multipart/form-data">
                                	<input type="hidden" name="activityDate" value="${classVo.classDate}">
                                    <div class="row g-3">
                                        <div class="col-sm-6">
                                            <div class="form-floating">
                                                <input type="text" class="form-control border-0" id="teacherId" name ="teacherId"  value="${classVo.teacherId}" readonly>
                                                <label for="teacherId">선생님</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-floating">
                                                <input type="text" class="form-control border-0" id="dogNo" name="dogNo" value="${classVo.dogNo}" readonly>
                                                <label for="dogNo">강아지</label>
                                            </div>
                                        </div>                                     
                                        <div class="col-12">
                                            <div class="form-floating">
                                                <input type="text" class="form-control border-0" id="activityDate" name="activityDate" value="${classVo.classDate}" readonly>
                                                <label for="ativityDate">수업일</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-floating">
                                                <textarea class="form-control border-0" placeholder="활동 내용 작성란" name="activityContent" id="activityContent" style="height: 100px" required></textarea>
                                                <label for="activityContent">활동 내용</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-floating">
                                                <input type="file" class="form-control border-0" id="attachImg" name="attachImg" accept="image/*" required>
                                                <label for="attachImg">사진 첨부</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <button class="btn btn-primary w-100 py-3" type="submit">일지 등록</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                      </div>
                      </div>
        </section>


       
		
		<jsp:include page="/include/footer.jsp" />
        

        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

  

</body>

</html>