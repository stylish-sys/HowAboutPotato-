<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container" style="height: 20vh;">
		<div id="myCarousel" class="carousel slide" data-ride="carousel"
			style="height: 20vh;">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" style="height: 20vh;">

				<div class="item active">
					<img src="images/notice1.png" alt="Los Angeles"
						style="position: absolute top:0 left: 0 width: 100% height: 100%;">
					<div class="carousel-caption"></div>
				</div>

				<div class="item">
					<img src="images/notice2.png" alt="Chicago"
						style="position: absolute top:0 left: 0 width: 100% height: 100%;">
					<div class="carousel-caption"></div>
				</div>

				<div class="item">
					<img src="images/notice3.png" alt="New York"
						style="position: absolute top:0 left: 0 width: 100% height: 100%;">
					<div class="carousel-caption"></div>
				</div>

			</div>

		</div>
	</div>
	<section id="one" class="wrapper style1 special">
		<div class="container">
			<header class="major">
				<h2>추천 호텔</h2>
			</header>
			<div class="row 150%">
				<!-- 사진 누르면 게시글로 바로 가게 -->
				<div class="6u 12u$(xsmall)">
					<div class="image fit captioned">
						<img src="images/1번 호텔.jpg" alt="" />
						<h3>롯데 호텔 제주</h3>
					</div>
				</div>
				<div class="6u$ 12u$(xsmall)">
					<div class="image fit captioned">
						<img src="images/2번 호텔.jpg" alt="" />
						<h3>신라 호텔 제주</h3>
					</div>
				</div>
				<div class="6u 12u$(xsmall)">
					<div class="image fit captioned">
						<img src="images/3번 호텔.jpg" alt="" />
						<h3>신라 스테이 광화문</h3>
					</div>
				</div>
				<div class="6u$ 12u$(xsmall)">
					<div class="image fit captioned">
						<img src="images/4번 호텔.jpg" alt="" />
						<h3>SOMERSET 종로</h3>
					</div>
				</div>
			</div>
			<ul class="actions">
				<c:if test="${empty sessionScope.member_id }">
					<li><a href="${pageContext.request.contextPath}/member_hap/login"
						class="button special big"> 로그인</a></li>
				</c:if>
				<c:if test="${not empty sessionScope.member_id}">
					<li><a
						href="${pageContext.request.contextPath }/board_hap/list"
						class="button special big">방 예약하러 가기</a></li>
				</c:if>
			</ul>
		</div>
	</section>

	<!-- Two -->
	<section id="two" class="wrapper style2">
		<div class="container">
			<header class="major special">
				<h2>당신의 여행 이유는?</h2>
			</header>
			<div class="feature-grid">
				<div class="feature">
					<div class="image rounded">
						<img src="images/수영장.jpg" alt="" />
					</div>
					<div class="content">
						<header>
							<h4>수영장</h4>
							<p>swimming pool</p>
						</header>
						<p>
							수영장에서 가족 혹은 연인과 함께 물놀이를 즐기실 수 있습니다.<br> You can enjoy
							swimming with your family or lover in the swimming pool.
						</p>
					</div>
				</div>
				<div class="feature">
					<div class="image rounded">
						<img src="images/식당.jpg" alt="" />
					</div>
					<div class="content">
						<header>
							<h4>뷔페 식당</h4>
							<p>an infinite refill restaurant</p>
						</header>
						<p>
							가족 혹은 연인과 함께 맛있는 식사를 즐길 수 있는 혜택이 주어집니다.<br> You will get the
							benefit of enjoying a delicious meal with your family or lover.
						</p>
					</div>
				</div>
				<div class="feature">
					<div class="image rounded">
						<img src="images/침실.jpg" alt="" />
					</div>
					<div class="content">
						<header>
							<h4>침실</h4>
							<p>a room for sleeping</p>
						</header>
						<p>
							가족 혹은 연인과 편안한 침대에서 피로를 풀 수 있습니다.<br>You can relax in bed
							with your family or lover.
						</p>
					</div>
				</div>
				<div class="feature">
					<div class="image rounded">
						<img src="images/헬스장.jpg" alt="" />
					</div>
					<div class="content">
						<header>
							<h4>헬스장</h4>
							<p>fitness center</p>
						</header>
						<p>
							가족 혹은 연인과 함께 간단한 운동을 즐기세요.<br> 최고의 트레이너가 당신들을 지도할 것입니다.<br>Enjoy
							simple exercise with your family or lover. <br>The best
							trainer will guide you.
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- three -->
	<section id="three" class="wrapper style1">
		<div class="container 75%">
			<div class="row 200%">
				<div class="6u 12u$(medium)">
					<header class="major">
						<h2>숙박 예약 사이트에 초대합니다.</h2>
						<p>Invite to the accommodation reservation site.</p>
					</header>
				</div>
				<div class="6u$ 12u$(medium)">
					<p>
						팀 프로젝트를 진행하여 제작 하였습니다.<br> 'github'에 오픈된 소스가 있습니다.<br>
						'bootstrap3'을 사용하였으며, 'tomcat 8.5 version'을 사용하였습니다.<br> 필요한
						것은 언제든 이메일로 문의주시길 바랍니다.
					</p>
				</div>
			</div>
		</div>
	</section>
</body>
</html>