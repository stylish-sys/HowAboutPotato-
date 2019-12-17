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
		<form class="form-inline" action="#" method="post">
			<div class="form-group">
				<h3>예매 확인</h3>
				<p>예매 시 받은 예약 번호를 정확하게 입력하세요</p>
				<div class="form-group">
					<input type="text" name="member_id" id="member_id"
						required="required" style="width: 350px;" vaules>
				</div>
				<button type="button" onclick="location.href='../'">메인 페이지 가기</button>
			</div>
		</form>
	</div>
</body>
</html>
