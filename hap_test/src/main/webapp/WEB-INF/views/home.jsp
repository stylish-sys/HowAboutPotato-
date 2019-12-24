<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="home.css">
<title>Insert title here</title>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css?family=Lobster&display=swap');

.body-container {
	width: 100vw;
	height: 100vh;
	z-index: 100;
}

.row {
	border-bottom: 0;
}

.row .col-md-4 {
	text-align: center;
	display: flex;
	justify-content: flex-start;
	align-items: flex-end;
	flex-direction: row;
	height: 60vh;
	padding: 0%;
}

.row .col-md-4 img {
	overflow: hidden;
	height: 60vh;
	padding: 0%;
	width: 100%;
	display: block;
}

.row .col-md-8 {
	text-align: center;
	display: flex;
	justify-content: flex-start;
	align-items: flex-end;
	flex-direction: row;
	height: 60vh;
	padding: 0%;
}

.row .col-md-8 img {
	overflow: hidden;
	height: 60vh;
	padding: 0%;
	width: 100%;
	display: block;
}

.hover-cover {
	width: 33.33333%;
	height: 60vh;
	z-index: 20;
	background-color: gray;
	opacity: 0.5;
}

.hover-cover-ver8 {
	width: 66.66666%;
	height: 60vh;
	z-index: 20;
	background-color: gray;
	opacity: 0.5;
}

.col-md-content {
	height: 60vh;
	width: 33.333333%;
	display: flex;
	justify-content: flex-start;
	align-items: flex-end;
	font-family: 'Lobster', cursive;
	font-size: 8rem;
}
</style>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
	$(document).ready(function() {
		$('.row .col-md-4').hover(function() {
			$(this).addClass('hover-cover');
		}, function() {
			$(this).removeClass('hover-cover');
		});
		$('.row .col-md-8').hover(function() {
			$(this).addClass('hover-cover-ver8');
		}, function() {
			$(this).removeClass('hover-cover-ver8');
		});
	});
</script>

</head>
<body>
	<!-- Tocplus 15.1 -->
	<script type="text/javascript">
		tocplusTop = 1150;
		tocplusLeft = 5;
		tocplusMinimizedImage = 'http://kr03.tocplus007.com/img/minimized_ko.gif';
		tocplusHAlign = 'right';
		tocplusLocaleFixed = 'ko';
		tocplusWidth = 180;
		tocplusHeight = 220;
		tocplusUserName = '손님은왕';
		tocplusFrameColor = '#FFA500';
		tocplusFloatingWindow = true;
		var tocplusHost = (("https:" == document.location.protocol) ? "https://"
				: "http://");
		document
				.write(unescape("%"
						+ "3Cscript src='"
						+ tocplusHost
						+ "kr03.tocplus007.com/chatLoader.do?userId=jorney0' type='text/javascript'"
						+ "%" + "3E" + "%" + "3C/script" + "%" + "3E"));
	</script>
	<!-- End of Tocplus -->

	<div class="row">
		<div class="col-md-4" id="main-content-first">
			<img src="${pageContext.request.contextPath }/images/수영장.jpg">
		</div>
		<div class="col-md-4" id="main-content-second">
			<img src="${pageContext.request.contextPath }/images/1번 호텔.jpg">
		</div>
		<div class="col-md-content">Ocean</div>
	</div>
	<div class="row">
		<div class="col-md-content">Mountain</div>
		<div class="col-md-8" id="main-content-third">
			<img src="${pageContext.request.contextPath }/images/banner.jpg">
		</div>
	</div>
	<div class="row">
		<div class="col-md-4" id="main-content-fourth">
			<img src="${pageContext.request.contextPath }/images/수영장.jpg">
		</div>
		<div class="col-md-4" id="main-content-fifth">
			<img src="${pageContext.request.contextPath }/images/헬스장.jpg">
		</div>
		<div class="col-md-content">Leisure</div>
	</div>
	<div class="row">
		<div class="col-md-content">Healing</div>
		<div class="col-md-8" id="main-content-sixth">
			<img src="${pageContext.request.contextPath }/images/침실.jpg">
		</div>
	</div>

</body>
</html>