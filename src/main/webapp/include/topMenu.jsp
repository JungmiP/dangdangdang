<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top px-4 px-lg-5 py-lg-0">
	<a href="/dangdangdang/index.jsp" class="navbar-brand">
    	<h1 class="m-0 text-primary"><i class="fa fa-book-reader me-3"></i>Dang</h1>
    </a>
	<button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
    	<span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
    	<div class="navbar-nav mx-auto">
        	<a href="/dangdangdang/" class="nav-item nav-link active">Home</a>
        	<div class="nav-item dropdown">
            	<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">수업 및 이용권</a>
            	<div class="dropdown-menu rounded-0 rounded-bottom border-0 shadow-sm m-0">
                	<a href="/dangdangdang/about.do" class="dropdown-item">수업 소개</a>
                    <a href="/dangdangdang/pass.do" class="dropdown-item">이용권 결제</a>
                </div>
            </div>
            <div class="nav-item dropdown">
            	<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">예약</a>
            	<div class="dropdown-menu rounded-0 rounded-bottom border-0 shadow-sm m-0">
                	<a href="/dangdangdang/visitReserve.do" class="dropdown-item">상담 예약</a>
                    <a href="/dangdangdang/classReserve.do" class="dropdown-item">수업 예약</a>
                </div>
           	</div>
            <a href="/dangdangdang/activity.do" class="nav-item nav-link">활동 일지</a>
            <a href="/dangdangdang/contact/contact.jsp" class="nav-item nav-link">온라인 상담</a>
            <c:if test="${not empty member}">
            <div class="nav-item dropdown">
            	<a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">마이 페이지</a>
            	<div class="dropdown-menu rounded-0 rounded-bottom border-0 shadow-sm m-0">
                	<a href="/dangdangdang/myPayment.do" class="dropdown-item">결제 내역</a>
                    <a href="/dangdangdang/mySubscription.do" class="dropdown-item">이용권 내역</a>
                </div>
           	</div>
           	</c:if>
           
        </div>
        <c:if test="${empty member}">
        	<%-- 통합페이지로 가게 로직 바꿀 것! --%>
        	<a href="/dangdangdang/login.do" class="btn btn-primary rounded-pill px-3 d-none d-lg-block">로그인<i class="fa fa-arrow-right ms-3"></i></a>
        </c:if>
        <c:if test="${not empty member}">
        	<%-- 통합페이지로 가게 로직 바꿀 것! --%>
        	<a href="/dangdangdang/login.do" class="btn btn-primary rounded-pill px-3 d-none d-lg-block">로그아웃<i class="fa fa-arrow-right ms-3"></i></a>
        </c:if>
	</div>
</nav>
        <!-- Navbar End -->