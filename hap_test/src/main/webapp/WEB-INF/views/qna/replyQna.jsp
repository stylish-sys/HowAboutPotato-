<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html>
<html>
<head>
  <title>qna</title>
  <meta charset="utf-8">
  </head>
<body>
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">qna 답변</h1>

<form class="form-horizontal" action="replyQna" method="post" enctype="multipart/form-data">
		<input type="hidden" name="qna_num" value="${param.qna_num}">
		<input type="hidden" name="qna_ref" value="${dto.qna_ref}">
		<input type="hidden" name="qna_indent" value="${dto.qna_indent}">
		<input type="hidden" name="qna_ansnum" value="${dto.qna_ansnum}">
		
		<input type="hidden" name="col" value="${param.col}">
		<input type="hidden" name="word" value="${param.word}">
		<input type="hidden" name="nowPage" value="${param.nowPage}">

		<div class="form-group">
		<label class="control-label col-sm-2" for="member_id">작성자</label>
		<div class="col-sm-6">
			<input type="text" class="form-control" id="member_id" name="member_id">
		</div>
			
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="qna_title">제목 :</label>
		<div class="col-sm-6">
			<input type="text" class="form-control" id="qna_title" name="qna_title" value="${dto.qna_title}">
		</div>
			
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="qna_content">내용 :</label>
		<div class="col-sm-6">
			<input type="text" class="form-control" id="qna_content" name="qna_content">
		</div>
			
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="qna_passwd">Password :</label>
		<div class="col-sm-6">
			<input type="password" class="form-control" id="qna_passwd" name="qna_passwd">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="qna_filename">파일명 :</label>
		<div class="col-sm-6">
			<input type="file" class="form-control" id="qna_filename" name="qna_filenameMF">
		</div>
			
	</div>
	
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-8">
			<button type="submit" class="btn">답변</button>
			<button type="reset" class="btn">취소</button>
		</div>
	</div>	
</form>
</div>
</body>
</html>