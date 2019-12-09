<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice read</title>
<script type="text/javascript">
function listNotice(){
	var url="listNotice";
	url+="?col=${param.col}";
	url+="&word=${param.word}";
	url+="&nowPage=${param.nowPage}";
	location.href=url;
}
function updateNotice(){
	var url="updateNotice";
	url+="?notice_num=${dto.notice_num}";
	url+="&col=${param.col}";
	url+="&word=${param.word}";
	url+="&nowPage=${param.nowPage}";
	url+="&notice_oldname=${dto.notice_filename}";
	location.href=url;
}
function deleteNotice(){
	var url="deleteNotice";
	url+="?notice_num=${dto.notice_num}";
	url+="&col=${param.col}";
	url+="&word=${param.word}";
	url+="&nowPage=${param.nowPage}";
	url+="&notice_oldname=${dto.notice_filename}";
	location.href=url;
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
		<div class="panel-body">${dto.notice_title}</div>
		
		<div class="panel-heading">내용</div>
		<div class="panel-body">${dto.notice_content}</div>
		
		<div class="panel-heading">조회수</div>
		<div class="panel-body">${dto.notice_viewcnt}</div>
		
		<div class="panel-heading">파일명</div>
		<div class="panel-body">${dto.notice_filename}</div>
		
		<div class="panel-heading">등록일</div>
		<div class="panel-body">${dto.notice_wdate}</div>
		
	</div>
	<c:if test="${not empty sessionScope.member_id && sessionScope.member_grade=='H' }">
		<button class="btn" onclick="location.href='./createNotice'">등록</button>
		<button class="btn" onclick="javascript:updateNotice()">수정</button>
		<button class="btn" onclick="javascript:deleteNotice()">삭제</button>
	</c:if>

	
</div><!-- container -->
</body>
</html>