<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top px-4 px-lg-5 py-lg-0">
	<a href="/dangdangdang/admin.jsp" class="navbar-brand">
    	<h1 class="m-0 text-primary"><i class="fa fa-book-reader me-3"></i>Dang</h1>
    </a>
	<button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
    	<span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
    	<div class="navbar-nav mx-auto">
        	<a href="/dangdangdang/admin.jsp" class="nav-item nav-link active">Home</a>
        	<div class="nav-item dropdown">
            	<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">결제 및 이용권</a>
            	<div class="dropdown-menu rounded-0 rounded-bottom border-0 shadow-sm m-0">
                	<a href="/dangdangdang/paymentList.do" class="dropdown-item">결제 관리</a>
                    <a href="/dangdangdang/subscriptionList.do" class="dropdown-item">이용권 관리</a>
                </div>
            </div>
            <div class="nav-item dropdown">
            	<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">수업 관리</a>
            	<div class="dropdown-menu rounded-0 rounded-bottom border-0 shadow-sm m-0">
                	<a href="/dangdangdang/classList.do" class="dropdown-item">수업 예약 관리</a>
                    <a href="/dangdangdang/activityList.do" class="dropdown-item">활동 일지</a>
                </div>
           	</div>
            <a href="/dangdangdang/visitList.do" class="nav-item nav-link">상담 예약 관리</a>
            <a href="/dangdangdang/contact/contact.jsp" class="nav-item nav-link">온라인 상담</a>
        </div>
        	<a href="/dangdangdang/logout.do" class="btn btn-primary rounded-pill px-3 d-none d-lg-block">로그아웃<i class="fa fa-arrow-right ms-3"></i></a>
	</div>
</nav>
        <!-- Navbar End -->