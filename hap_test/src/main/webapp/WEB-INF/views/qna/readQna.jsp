<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice read</title>
<script type="text/javascript">
	function listQna() {
		var url = "listQna";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
	function updateQna() {
		var url = "updateQna";
		url += "?qna_num=${dto.qna_num}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		url += "&qna_oldfile=${dto.qna_filename}";
		location.href = url;
	}
	function deleteQna() {
		var url = "deleteQna";
		url += "?qna_num=${dto.qna_num}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		url += "&qna_oldfile=${dto.qna_filename}";
		location.href = url;
	}
	function replqQna() {
		var url = "replyQna";
		url += "?qna_num=${dto.qna_num}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
</script>
</head>
<body>
	<div class="container">
		<h2>조회</h2>

		<div class="panel panel-default">
			<div class="panel-heading">작성자</div>
			<div class="panel-body">${dto.member_id}</div>

			<div class="panel-heading">제목</div>
			<div class="panel-body">${dto.qna_title}</div>

			<div class="panel-heading">내용</div>
			<div class="panel-body">${dto.qna_content}</div>

			<div class="panel-heading">조회수</div>
			<div class="panel-body">${dto.qna_viewcnt}</div>

			<div class="panel-heading">파일명</div>
			<div class="panel-body">${dto.qna_filename}</div>

			<div class="panel-heading">등록일</div>
			<div class="panel-body">${dto.qna_wdate}</div>

		</div>
		<c:if
			test="${dto.member_id == sessionScope.member_id || sessionScope.member_grade=='H' }">
			<button class="btn" onclick="location.href='./createQna'">등록</button>
			<button class="btn" onclick="updateQna()">수정</button>
			<button class="btn" onclick="deleteQna()">삭제</button>
			<button class="btn" onclick="replqQna()">답변</button>
		</c:if>
		<c:if test="${empty sessionScope.member_id }">
			<button class="btn" onclick="location.href='./createQna'">등록</button>
			<button class="btn" onclick="updateQna()">수정</button>
			<button class="btn" onclick="deleteQna()">삭제</button>
		</c:if>
		<button class="btn" onclick="listQna()">목록</button>


	</div>
	<!-- container -->
</body>
</html>