<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<c:set var="root" value="${pageContext.request.contextPath }"></c:set>

<c:choose>
	<c:when
		test="${not empty sessionScope.member_id && sessionScope.member_grade== 'H'}">
		<c:set var="str">관리자페이지입니다.</c:set>
	</c:when>
	<c:when
		test="${not empty sessionScope.member_id && sessionScope.member_grade!= 'H'}">
		<c:set var="str">안녕하세요. ${sessionScope.member_id }님!</c:set>
	</c:when>
	<c:otherwise>
		<c:set var="str">기본페이지</c:set>
	</c:otherwise>

</c:choose>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${root }/js/ajaxError.js"></script>
<style type="text/css">
#grade {
	color: red;
}
</style>
</head>

<body class="landing">
	<a href="#menu" class="navPanelToggle"> <span class="fa fa-bars"></span></a>
	<header id="header" class="alt">
		<nav id="nav">
			<ul>
				<li><a href="${root}">Home</a></li>
				<li><a href="${root}/notice/listNotice">Notice</a></li>
				<li><a href="${root}/qna/listQna">QnA</a></li>
				<li><a href="${root}/board_hap/list">방</a></li>
				<li><a href="${root}/res/res_find">예약 검색</a></li>

				<c:choose>
					<c:when test="${empty sessionScope.member_id }">
						<li><a href="${root}/member_hap/agree">Join</a></li>
						<li><a href="${root}/member_hap/login">Sign-in</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${root}/res/list">RESLIST</a></li>
						<li><a href="${root}/member_hap/member_read">Profile</a></li>
						<li><a href="${root}/member_hap/logout">Sign-out</a></li>
					</c:otherwise>
				</c:choose>

				<c:if
					test="${not empty sessionScope.member_id && sessionScope.member_grade=='H'}">
					<li><a href="${root}/res/list">RESLIST</a></li>
					<li><a href="${root}/res/res_acc">승인 대기</a></li>
				</c:if>
			</ul>
		</nav>
	</header>


	<section id="banner">
		<h2>Logo</h2>
		<p>
			${str} <br /> 메인 페이지
		</p>
		<ul class="actions">
			<li><a href="#" class="button special big">Find Location</a></li>
		</ul>
	</section>
</body>
</html>