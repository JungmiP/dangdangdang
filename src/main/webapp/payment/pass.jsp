<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
    	$(document).ready(function(){
    		let param = ''
    		<c:forEach var="p" items="${passList}" varStatus="stat">
    			param += 'no=${p.no}'
	    		<c:if test="${ not stat.last }">
	    			param += '$'
	    		</c:if>
    		</c:forEach>    		
    		$("#buyBtn").click(function(){
    			location.href="payment.do?"+param
    		})
    	})
    </script>
</head>
<body>
	<div class="container-xxl bg-white p-0">
	<jsp:include page="../include/topMenu.jsp" />
	<!-- Page Header End -->
        <div class="container-xxl py-5 page-header position-relative mb-5">
            <div class="container py-5">
                <h1 class="display-2 text-white animated slideInDown mb-4">Class passes</h1>
                <nav aria-label="breadcrumb animated slideInDown">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Passes</a></li>
                        <li class="breadcrumb-item text-white active" aria-current="page">수업 이용권</li>
                    </ol>
                </nav>
            </div>
        </div>
        <!-- Page Header End -->
        
          <!-- Team Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                    <h1 class="mb-3">Class Passes</h1>
                    <p>Eirmod sed ipsum dolor sit rebum labore magna erat. Tempor ut dolore lorem kasd vero ipsum sit
                        eirmod sit. Ipsum diam justo sed rebum vero dolor duo.</p>
                </div>
                <div class="row g-4" align="center">
                	<c:forEach items="${passList}" var="pass" varStatus="status">
                	<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.${status.count}s">
                        <div class="card border-0 position-relative bg-light">
                            <img class="img-fluid" src="/dangdangdang/resources/img/dog_outdoor03.jpg" >
                            <div class="card-body justify-content-center">
                            <h3 class="card-title">${ pass.name }</h3>
                            <hr>
                            	<table class="card-text">
                            	<tr><th>이용횟수</th><td>${pass.totalClasses}</td></tr>
                            	<tr><th>기간</th><td>${ pass.duration }개월</td></tr>
                            	<tr><th>가격</th><td><fmt:formatNumber value="${pass.price}" />원</td></tr>
                            	<tr><td colspan="2">${pass.description }</td></tr>
                            	</table>
                            </div>
                        </div>
                    </div>
                	
                	
                	</c:forEach>
                    
                    
                  <button class="btn btn-primary w-80 py-3" id="buyBtn">이용권 구매하기</button>
                </div>
            </div>
        </div>
        <!-- Team End -->


	<jsp:include page="../include/footer.jsp" />
	<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
</div>
</body>
</html>