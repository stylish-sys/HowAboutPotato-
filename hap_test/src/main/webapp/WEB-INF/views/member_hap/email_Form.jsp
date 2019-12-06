<%@ page contentType="text/html; charset=UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<title>email 중복확인</title>
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
		<h1 class="col-sm-offset-2 col-sm-10">E-mail 중복확인</h1>

		<form class="form-horizontal" action="email_Proc" method="post">
			<p id="red" class="col-sm-offset-2 col-sm-10">E-mail을 입력하세요</p>


			<div class="form-group">
				<label class="control-label col-sm-2" for="member_email">E-mail:</label>
				<div class="col-sm-6">
					<input type="email" class="form-control" id="member_email"
						placeholder="Enter E-mail" name="member_email" required="required">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8">
					<button type="submit" class="btn">중복확인</button>
					<button type="reset" class="btn">취소</button>
				</div>
			</div>

		</form>
	</div>

</body>
</html>