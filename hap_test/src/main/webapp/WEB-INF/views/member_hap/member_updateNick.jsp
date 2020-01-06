<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>별명 변경</title>
<meta charset="utf-8">
</head>
<body>

	<div class="container">
		<h2 class="col-sm-offset-2 col-sm-10">별명 변경</h2>
		<form class="form-horizontal" action="member_updateNick" method="post"
			onsubmit="return incheck(this)">
			<div class="form-group">
				<label class="control-label col-sm-2" for="nickname">기존 별명</label>
				<div class="col-sm-5">
					<input type="text" name="" id="" value="${param.member_nickname }"
						class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="nickname">별명</label>
				<div class="col-sm-5">
					<input type="text" name="member_nickname" id="member_nickname"
						class="form-control">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-5">
					<button class="btn">변경</button>
					<button type="button" class="btn" onclick="history.back()">취소</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
