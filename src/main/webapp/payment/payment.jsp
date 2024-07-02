<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <style>
    
    input{
    	background-color: white !important;
    }
    
  	 [type="radio"]:checked {
    	border: 2px solid #FE5D37 !important;
    }
    </style>
    <script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script>
    	$(document).ready(function(){
    		$(paymentForm.pass).click(function(){
    			/*
    			$.ajax({
    				url:"payment/temp.jsp",
    				data: {
    					no : $(this).val()
    				},
    				success: function(response){
    					$("#amount").val(response)
    				},
    				error:function(){
    					alert("값을 가져올 수 없습니다.")
    				}
    			})
    			*/
    			fetch('payment/temp.jsp?no=' + $(this).val())
    			.then((response)=>response.text())
    			.then((response)=>{
    				$("#amount").val(response)
    			})
    			
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
                <h1 class="display-2 text-white animated slideInDown mb-4">Payment</h1>
                <nav aria-label="breadcrumb animated slideInDown">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Passes</a></li>
                        <li class="breadcrumb-item text-white active" aria-current="page">결제 하기</li>
                    </ol>
                </nav>
            </div>
        </div>
        <!-- Page Header End -->

	<div class="container-xxl py-5">
            <div class="container">
                <div class="bg-light rounded">
                    <div class="row g-0">
                        <div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">
                            <div class="h-100 d-flex flex-column justify-content-center p-5">
                                <h1 class="mb-4">Payment</h1>
                                <form action="/dangdangdang/paymentForm.do" method="post" id="paymentForm">
                                	<input type="hidden" name="memberId" value="user">
                                    <div class="row g-3">
                                    	<div class="col-sm-12">이용권 선택</div>
                                        <div class="col-sm-4">
                                            <div class="form-floating">
                                                <input type="radio" class="form-control border-0" id="one" name="pass" value="${passNoList[0]}">
                                                <label for="one">1회권</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-floating">
                                                <input type="radio" class="form-control border-0" id="ten" name="pass" value="${passNoList[1]}">
                                                <label for="ten">10회권</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-floating">
                                                <input type="radio" class="form-control border-0" id="thirty" name="pass" value="${passNoList[2]}">
                                                <label for="thirty">30회권</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">가격</div>
                                        <div class="col-sm-12">
                                            <div class="form-floating">
                                                <input type="text" class="form-control border-0" id="amount" name="amount" readonly>
                                                <label for="amount">(원)</label>
                                            </div>
                                        </div>
                                       	<div class="col-sm-12">결제 방식</div>
                                        <div class="col-sm-6">
                                            <div class="form-floating">
                                                <input type="radio" class="form-control border-0" id="cash" name="payMethod" value="cash">
                                                <label for="cash">무통장 입금</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-floating">
                                                <input type="radio" class="form-control border-0" id="card" name="payMethod" value="card">
                                                <label for="card">신용카드</label>
                                            </div>
                                        </div>
                                        
                                        <div class="col-12">
                                            <button class="btn btn-primary w-100 py-3" type="submit" >결제하기</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s" style="min-height: 400px;">
                            <div class="position-relative h-100">
                                <img class="position-absolute w-100 h-100 rounded" src="/dangdangdang/resources/img/dog_playing02.jpg" style="object-fit: cover;">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	<jsp:include page="/include/footer.jsp" />
	<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
</div>
</body>
</html>