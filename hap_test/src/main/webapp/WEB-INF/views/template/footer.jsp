<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
	  <ol class="carousel-indicators">
	    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
	    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
	    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
	  </ol>
	<div class="container" style="height: 18vh;">
		<div id="myCarousel" class="carousel slide" data-ride="carousel"
			style="height: 20vh;">

			<!-- Wrapper for slides -->
			<div class="carousel-inner" style="height: 25vh;">

				<div class="item active">
					<img src="${pageContext.request.contextPath }/images/notice1.png" alt="Los Angeles"
						style="position: absolute top:0 left: 0 width: 100% height: 100%;">
					<div class="carousel-caption"></div>
				</div>

				<div class="item">
					<img src="${pageContext.request.contextPath }/images/notice2.png" alt="Chicago"
						style="position: absolute top:0 left: 0 width: 100% height: 100%;">
					<div class="carousel-caption"></div>
				</div>

				<div class="item">
					<img src="${pageContext.request.contextPath }/images/notice3.png" alt="New York"
						style="position: absolute top:0 left: 0 width: 100% height: 100%;">
					<div class="carousel-caption"></div>
				</div>

			</div>

		</div>
	</div>
	<br><br>
	  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </a>
	</div>
	<!-- Footer -->
	<footer id="footer">
		<div class="container">
			<ul class="icons">
				<li><a href="#" class="icon fa-facebook"></a></li>
				<li><a href="#" class="icon fa-twitter"></a></li>
				<li><a href="#" class="icon fa-instagram"></a></li>
			</ul>
			<ul class="copyright">
				<li>&copy; Team Project</li>
				<li><a href="www.naver.com">Naver</a></li>
				<li>Images: <a href="http://unsplash.com">Unsplash</a></li>
			</ul>
		</div>
	</footer>
