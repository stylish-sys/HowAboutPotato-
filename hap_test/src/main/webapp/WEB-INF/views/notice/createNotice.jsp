<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice create</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script type="text/JavaScript">
	window.onload = function() {
		CKEDITOR.replace('notice_content'); // <TEXTAREA>태그 id 값
	};
</script>
</head>

<body>
	<div class="container">
		<h3 class="col-sm-offset-2 col-sm-10">공지사항 등록</h3>
		<form class="form-horizontal" action="create" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="member_id" value="${member_id}">
			<input type="hidden" name="notice_noti" value="N">
			<div class="form-group">
				<label class="control-label col-sm-2" for="member_id">작성자</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="" name=""
						value="${member_id }" disabled>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="notice_title">제목
				</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="notice_title"
						required>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="notice_content">내용
				</label>
				<div class="col-sm-6">
					<!-- 		<input type="text" name="notice_content" class="form-control" row="100" col="20"> -->
					<textarea rows="10" cols="10" id="notice_content"
						name="notice_content" class="form-control"
						placeholder="내용을 입력해주세요"></textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="notice_filename">파일</label>
				<div class="col-sm-6">
					<input type="file" class="form-control" id="notice_filename"
						name="notice_filenameMF">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="notice_passwd">비밀번호
				</label>
				<div class="col-sm-6">
					<input type="password" class="form-control" name="notice_passwd"
						required>
				</div>
			</div>
			<div class="from-group">
				<label class="control-label col-sm-2" for="notice_noti">
					게시물 상단</label>
				<div class="col-sm-6">
					<input type="checkbox" id="notice_noti" name="notice_noti"
						value="Y"> <label for="notice_noti"> 등록</label>
				</div>
			</div>
			<br>
			<br>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn">등록</button>
					<button type="reset" class="btn" onclick="history.back()">취소</button>
				</div>
			</div>

		</form>

	</div>
</body>
</html>