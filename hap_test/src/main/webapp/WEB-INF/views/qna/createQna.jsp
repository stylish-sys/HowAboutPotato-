<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna create</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script type="text/JavaScript">
	window.onload = function() {
		CKEDITOR.replace('qna_content'); // <TEXTAREA>태그 id 값
	};
</script>
</head>
<body>
	<div class="container">
		<h3 class="col-sm-offset-2 col-sm-10">QnA 등록</h3>
		<form class="form-horizontal" action="createQna" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="member_id" value="${member_id}">

			<div class="form-group">
				<label class="control-label col-sm-2" for="member_id">작성자</label>
				<c:if test="${not empty member_id}">
					<div class="col-sm-6">
						<input type="text" name="member_id" id="member_id"
							value="${member_id }" disabled>
					</div>
				</c:if>
				<c:if test="${empty member_id }">
					<div class="col-sm-6">
						<input type="text" name="member_id" id="member_id" value="비회원"
							disabled>
					</div>
				</c:if>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="qna_title">제목</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="qna_title">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="qna_content">내용</label>
				<div class="col-sm-6">
					<!-- 			<input type="text" name="qna_content" class="form-control"> -->
					<textarea rows="10" cols="10" class="form-control" id="qna_content"
						name="qna_content"></textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="qna_filename">파일</label>
				<div class="col-sm-6">
					<input type="file" class="form-control" id="qna_filename"
						name="qna_filenameMF">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="qna_passwd">비밀번호
				</label>
				<div class="col-sm-6">
					<input type="password" class="form-control" name="qna_passwd">
				</div>
			</div>
			<c:if
				test="${not empty sessionScope.member_id && sessionScope.member_grade=='H'}">
				<div class="from-group">
					<label class="control-label col-sm-2" for="qna_noti"> 게시물
						상단</label>
					<div class="col-sm-6">
						<input type="radio" id="qna_noti" name="qna_noti" value="Y">
						<label for="qna_noti"> 중요 공지</label>
					</div>
				</div>
			</c:if>
			<c:if test="${empty sessionScope.member_id }">
				<input type="hidden" id="qna_noti" name="qna_noti" value="N">
			</c:if>
			
			<br> <br>
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