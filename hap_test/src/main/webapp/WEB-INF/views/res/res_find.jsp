<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>예약 검색</title>
<meta charset="utf-8">
<style type="text/css">
#need {
	color: red;
}
</style>
</head>
<body>
	<div class="container">
		<br>
		<form class="form-inline" action="res_find" method="post">
			<div class="form-group">
				<h3>예매 확인</h3>
				<p>예매 시 받은 예약 번호를 정확하게 입력하세요</p>
				<ul>
					<li><span id="#need"> <label for="res_rannum">예매
								번호를 입력하세요</label> <br>
					</span></li>
				</ul>
				<div class="form-group">
					<input type="text" name="res_rannum" id="res_rannum"
						required="required" style="width: 350px;">
				</div>
				<button type="submit">조회</button>
			</div>
		</form>
	</div>
</body>
</html>
