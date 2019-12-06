<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>회원탈퇴</title>
<meta charset="utf-8">
</head>
<body>

	<div class="container">
		<br>
	
		<h2 class="col-sm-offset-2 col-sm-10">회원탈퇴</h2>
		<br>
		<form class="form-horizontal" action="member_delete" method="post">

			<input type="hidden" name="member_id" value="${param.member_id}"> <input
				type="hidden" name="oldfile" value="${param.oldfile}">

			<div class="form-group">
				<label class="col-sm-offset-2 col-sm-8"> 탈퇴를 하시면 더이상 컨텐츠를
					제공받을 수 없습니다<br> 그래도 탈퇴를 원하시면 아래 탈퇴버튼을 클릭하세요
				</label>

			</div>
			<br>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-5">
					<button class="btn">탈퇴</button>
					<button type="button" class="btn"
						onclick="history.back()">취소</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
