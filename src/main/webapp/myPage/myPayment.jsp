<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="/error.jsp" %>
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
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/dangdangdang/resources/lib/wow/wow.min.js"></script>
    <script src="/dangdangdang/resources/lib/easing/easing.min.js"></script>
    <script src="/dangdangdang/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="/dangdangdang/resources/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="/dangdangdang/resources/js/main.js"></script>
	<script>
	function openRefundModal(no){
		$(refundForm.paymentNo).val(no)
		$("#staticBackdrop").css("display", "block")
	}

	function closeModal(){
		$("#staticBackdrop").css("display", "none")
	}
	
	function confirmRefund(){
		return confirm('정말 환불하시겠습니까?')
	}
	
	function openRefundDetail(){
		
	}
	
	$(document).ready(function(){
		$("#reasonSelect").change(function(){
			if($("#reasonSelect").val() == "type"){
				$("#reasonText").val("")
				$("#reasonText").attr("disabled", false)
			}else{
				$("#reasonText").val($("#reasonSelect").val())
				$("#reasonText").attr("disabled", true)
			}
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
                <h1 class="display-2 text-white animated slideInDown mb-4">My Page</h1>
                <nav aria-label="breadcrumb animated slideInDown">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">MyPage</a></li>
                        <li class="breadcrumb-item text-white active" aria-current="page">결제 내역</li>
                    </ol>
                </nav>
            </div>
        </div>
        <!-- Page Header End -->
        
         
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                    <h1 class="mb-3">My Payment List</h1>
                </div>
                <div class="" align="center">
                	<div>
                		<table class="table">
                			<thead>
                				<tr>
                					<th>번호</th>
                					<th>결제 번호</th>
                					<th>이용권</th>
                					<th>결제금액</th>
                					<th>결제 방법</th>
                					<th>결제 일자</th>
                					<th>결제 상태</th>
                					<th></th>
                				</tr>
                			</thead>
                			<tbody>
                				<c:if test="${ empty paymentList }">
                					<tr><td colspan="8">결제 내역이 없습니다.</td></tr>
                				</c:if>
                				<c:if test="${ not empty paymentList }">
                					<c:forEach items="${ paymentList }" var="payment" varStatus="stat">
                					<tr>
                						<td>${ stat.count }</td>
                						<td>${ payment.no }</td>
                						<td>${ payment.passNo }</td>
                						<td>${ payment.amount }</td>
                						<td>${ payment.payMethod }</td>
                						<td>${ payment.payDate }</td>
                						<td>${ (empty payment.refundVO.no)? "결제 완료": (payment.refundVO.status eq "W")? "환불 처리중":(payment.refundVO.status eq "A")?"환불 완료": "환불 취소"}</td>
                						<td>
                							<c:if test="${empty payment.refundVO.no }">
                								<button class="btn btn-dark btn-sm" onclick="openRefundModal(${payment.no})">환불</button>
                							</c:if>
                							<c:if test="${not empty payment.refundVO.no }">
                								<button class="btn btn-dark btn-sm" onclick="">환불상세</button>
                							</c:if>
                						</td>
                					</tr>
                					</c:forEach>
                				</c:if>
                			</tbody>
                		</table>
                	</div>
                	<!-- Refund Modal -->
					<div class="modal" id="staticBackdrop">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h1 class="modal-title fs-5" id="staticBackdropLabel">환불하기</h1>
					        <button type="button" class="btn-close"  aria-label="Close" onclick="closeModal()"></button>
					      </div>
					      <div class="modal-body">
					       	<form action="/dangdangdang/refundForm.do" method="post" id="refundForm" onsubmit="return confirmRefund()">
					          <div class="mb-3">
					            <label for="paymentNo" class="col-form-label">결제 번호:</label>
					            <input type="text" id="paymentNo" name="paymentNo" readonly>
					          </div>
					          <div class="mb-3">
					            <label for="reason" class="col-form-label">환불 사유:</label>
					            <input id="reasonText" type="text" name="reason"  required>
					            <select id="reasonSelect" name="reason">
					            	<option value="type">직접 입력</option>
					            	<option value="단순 변심">단순 변심</option>
					            	<option value="서비스 불만족">서비스 불만족</option>
					            	<option value="이사">이사</option>
					            	<option value="이용권 변경">이용권 변경</option>
					            </select>
					          </div>
					        </form>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" onclick="closeModal()">Close</button>
					        <button type="submit" form="refundForm" class="btn btn-primary">완료</button>
					      </div>
					    </div>
					  </div>
					</div>
                	<!-- Refund Modal End -->
					
					
                	<!-- Refund Detail Modal -->
					<div class="modal" id="refundDetail">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h1 class="modal-title fs-5" id="staticBackdropLabel">환불하기</h1>
					        <button type="button" class="btn-close"  aria-label="Close" onclick="closeModal()"></button>
					      </div>
					      <div class="modal-body">
					       	
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" onclick="closeModal()">Close</button>
					        <button type="submit" form="refundForm" class="btn btn-primary">완료</button>
					      </div>
					    </div>
					  </div>
					</div>
                	<!-- Refund Detail Modal End -->
                	
                	
                </div>
            </div>
        </div>
        


	<jsp:include page="../include/footer.jsp" />
	<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
</div>
</body>
</html>