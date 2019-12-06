<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>비밍번호찾기</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<style type="text/css">
#red {
	color: red;
}
</style>

</head>
<body>

	<div class="container">
		<h1 class="col-sm-offset-2 col-sm-10">비밀번호찾기</h1>

		<form class="form-horizontal" action="passwdFind" method="post">

			<div class="form-group">
				<label class="control-label col-sm-2" for="member_name">이름:</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="member_name"
						placeholder="Enter Name" name="member_name" required="required">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="member_id">아이디:</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="member_id"
						placeholder="Enter ID" name="member_id" required="required">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="member_email">E-mail:</label>
				<div class="col-sm-6">
					<input type="email" class="form-control" id="member_email"
						placeholder="Enter E-mail" name="member_email" required="required">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8">
					<button type="submit" class="btn">확인</button>
					<button type="reset" class="btn">취소</button>
				</div>
			</div>

		</form>
	</div>

</body>
</html>