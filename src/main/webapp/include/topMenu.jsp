<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top px-4 px-lg-5 py-lg-0">
	<a href="/dangdangdang/index.jsp" class="navbar-brand">
    	<h1 class="m-0 text-primary"><i class="fa fa-book-reader me-3"></i>Dang</h1>
    </a>
	<button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
    	<span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
    	<div class="navbar-nav mx-auto">
        	<a href="/dangdangdang/index.jsp" class="nav-item nav-link active">Home</a>
        	<div class="nav-item dropdown">
            	<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">수업 및 이용권</a>
            	<div class="dropdown-menu rounded-0 rounded-bottom border-0 shadow-sm m-0">
                	<a href="facility.html" class="dropdown-item">수업 소개</a>
                    <a href="/dangdangdang/pass.do" class="dropdown-item">이용권 결제</a>
                </div>
            </div>
            <div class="nav-item dropdown">
            	<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">예약</a>
            	<div class="dropdown-menu rounded-0 rounded-bottom border-0 shadow-sm m-0">
                	<a href="/dangdangdang/reservation/visitReservation.jsp" class="dropdown-item">상담 예약</a>
                    <a href="/dangdangdang/reservation/classReservation.jsp" class="dropdown-item">수업 예약</a>
                </div>
           	</div>
            <a href="/dangdangdang/activity/activity.jsp" class="nav-item nav-link">활동 일지</a>
            <a href="/dangdangdang/contact/contact.jsp" class="nav-item nav-link">온라인 상담</a>
        </div>
        <a href="" class="btn btn-primary rounded-pill px-3 d-none d-lg-block">로그인<i class="fa fa-arrow-right ms-3"></i></a>
	</div>
</nav>
        <!-- Navbar End -->