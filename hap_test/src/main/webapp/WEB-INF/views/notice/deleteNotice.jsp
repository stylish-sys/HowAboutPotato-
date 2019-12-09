<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form class="form-horizontal" action="deleteNotice" method="post" enctype="multipart/form-data">
	<input type="hidden" name="notice_num" value="${param.notice_num}">
	<input type="hidden" name="col" value="${param.col}>"> 
	<input type="hidden" name="word" value="${param.word}"> 
	<input type="hidden" name="nowPage" value="${param.nowPage}"> 
	<input type="hidden" name="notice_oldfile" value="${param.notice_oldfile}"> 
	<p id="red" class="col-sm-offset-2 col-sm-6">삭제하면 복구할 수 없음</p>
		<div class="form-group">
			<label class="control-label col-sm-2" for="notice_passwd">비밀번호 :</label>
			<div class="col-sm-6">
				<input type="password" class="form-control" id="notice_passwd" placeholder="Enter password" name="notice_passwd">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-8">
				<button type="submit" class="btn">삭제</button>
				<button type="reset" class="btn" onclick="location.href='./list'">취소</button>
			</div>
		</div>
</form>
</body>
</html>