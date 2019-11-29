<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#red {
	color: red;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>id 중복확인</title>
<meta charset="utf-8">
</head>
<body>
	<div class="container">
	<br> <br>
		<form class="form-horizontal" action="id_FindProc" method="post"
			name="aa">
			<div class="form-group">
				<label class="control-label col-sm-2" for="mname">이름 입력</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="mname"
						placeholder="Enter mname" name="mname" required="required" value="1">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="email">이메일 입력</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="email"
						placeholder="Enter email" name="email" required="required" value ="1@1">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8">
					<button type= "submit" class="btn btn-default">찾기</button>
					<button type="reset" class="btn btn-default"
						onclick="window.close()">취소</button>
				</div>
			</div>
		</form>

	</div>
</body>
</html>