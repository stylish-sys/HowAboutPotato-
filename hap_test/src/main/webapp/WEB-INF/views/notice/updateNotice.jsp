<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Notice</title>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script type="text/JavaScript">
window.onload=function(){
	CKEDITOR.replace('notice_content');  // <TEXTAREA>태그 id 값
};
</script>
<body>
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">게시판 수정</h1>

<form class="form-horizontal" action="updateNotice" method="post" enctype="multipart/form-data" onsubmit="return input(this)">

	<input type="hidden" name="notice_num" value="${param.notice_num}"> 
	
	<input type="hidden" name="col" value="${param.col}">
	<input type="hidden" name="word" value="${param.word}">
	<input type="hidden" name="nowPage" value="${param.nowPage}">
	<input type="hidden" name="notice_oldfile" value="${param.notice_oldfile}"> 
	
	<div class="form-group">
		<label class="control-label col-sm-2" for="member_id">작성자</label>
		<div class="col-sm-6">
			<input type="text" class="form-control" value="${dto.member_id}" name="member_id">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="notice_title">제목</label>
		<div class="col-sm-6">
			<input type="text" class="form-control" id="notice_title" value="${dto.notice_title}" name="notice_title">
		</div>	
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="notice_content">내용</label>
		<div class="col-sm-6">
			<input type="text" class="form-control" id="notice_content" value="${dto.notice_content}" name="notice_content">
		</div>	
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="notice_filename">파일</label>
		<div class="col-sm-6">
			<input type="file" class="form-control" id="notice_filename" name="notice_filenameMF">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="notice_passwd">비밀번호 </label>
		<div class="col-sm-6">
			<input type="password" class="form-control" name="notice_passwd">
		</div>
	</div>

	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-8">
			<button type="submit" class="btn">수정</button>
			<button type="reset" class="btn" onclick="history.back()">취소</button>
		</div>
	
	</div>
</form>
</div>
</body>
</html>