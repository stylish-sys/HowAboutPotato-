<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>비밀번호 변경</title>
<meta charset="utf-8">
<script type="text/javascript">
	function incheck(f) {
		if (f.passwd.value == "") {
			alert("비밀번호를 입력하세요");
			f.passwd.focus();
			return false;
		}
		if (f.repasswd.value == "") {
			alert("비밀번호 확인를 입력하세요");
			f.repasswd.focus();
			return false;
		}
		if (f.passwd.value != f.repasswd.value) {
			alert("비밀번호가 서로 다릅니다.");
			f.repasswd.value = "";
			f.repasswd.focus();
			return false;

		}

	}
</script>
</head>
<body>

	<div class="container">
		<h2 class="col-sm-offset-2 col-sm-10">비밀번호 변경</h2>
		<form class="form-horizontal" action="updatePw" method="post"
			onsubmit="return incheck(this)">

			<div class="form-group">
				<label class="control-label col-sm-2" for="passwd">비밀번호</label>
				<div class="col-sm-5">
					<input type="password" name="passwd" id="passwd"
						class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="repasswd">비밀번호 확인</label>
				<div class="col-sm-5">
					<input type="password" name="repasswd" id="repasswd"
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
