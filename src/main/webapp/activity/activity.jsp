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
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@600&family=Lobster+Two:wght@700&family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap" rel="stylesheet">
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
    
	<link href="/dangdangdang/resources/fullcalendar/fullcalendar/packages/core/main.css" rel="stylesheet" />
    <link href="/dangdangdang/resources/fullcalendar/fullcalendar/packages/daygrid/main.css" rel="stylesheet" />
    
    <script src="/dangdangdang/resources/js/jquery.min.js"></script>
  	<script src="/dangdangdang/resources/js/popper.js"></script>
  	<script src="/dangdangdang/resources/js/bootstrap.min.js"></script>
    

    <script src='/dangdangdang/resources/fullcalendar/fullcalendar/packages/core/main.js'></script>
    <script src='/dangdangdang/resources/fullcalendar/fullcalendar/packages/interaction/main.js'></script>
    <script src='/dangdangdang/resources/fullcalendar/fullcalendar/packages/daygrid/main.js'></script>
	<script>
      document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
	let today = new Date()
	let now = today.getFullYear()+ "-" + String(today.getMonth() + 1).padStart(2,"0")+ "-" + String(today.getDate()).padStart(2, "0")
	
    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid' ],
      defaultDate: now,
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: [
        {
          title: 'All Day Event',
          start: '2024-07-01'
        },
        {
          title: 'Long Event',
          start: '2024-07-07',
          end: '2024-07-10'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2024-07-09T16:00:00'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2024-07-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2024-07-11',
          end: '2024-07-13'
        },
        {
          title: 'Meeting',
          start: '2024-07-12T10:30:00',
          end: '2024-07-12T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2024-07-12T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2024-07-12T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2024-07-12T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2024-07-12T20:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2024-07-13T07:00:00'
        },
        {
          title: 'Click for Google',
          url: 'http://google.com/',
          start: '2024-07-28'
        }
      ]
    });

    calendar.render();
  });

    </script>
</head>
<body>
<div class="container-xxl bg-white p-0">
	<jsp:include page="../include/topMenu.jsp" />
	<!-- Page Header End -->
        <div class="container-xxl py-5 page-header position-relative mb-5">
            <div class="container py-5">
                <h1 class="display-2 text-white animated slideInDown mb-4">Activity</h1>
                <nav aria-label="breadcrumb animated slideInDown">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Activity</a></li>
                        <li class="breadcrumb-item text-white active" aria-current="page">활동일지</li>
                    </ol>
                </nav>
            </div>
        </div>
        <!-- Page Header End -->         
                
	<section class="container-xxl py-5 ftco-section">
		<div class="container">
			<div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                    <h1 class="mb-3">Activity Reports</h1>
             </div>			
			
    		<div id="calendar"></div> 			
  			
		</div>
	</section>
	

    
	<jsp:include page="/include/footer.jsp" />
	<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
</div>
</body>
</html>
