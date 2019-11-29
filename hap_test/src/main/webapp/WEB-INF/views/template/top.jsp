<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<c:set var="root" value="${pageContext.request.contextPath }" />
<c:choose>
	<c:when test="${not empty sessionScope.id && sessionScope.grade=='A'}">
		<c:set var="str">Admin Page</c:set>
	</c:when>
	<c:when test="${not empty sessionScope.id && sessionScope.grade!='A'}">
		<c:set var="str">Hello ${sessionScope.id } !!</c:set>
	</c:when>
	<c:otherwise>
		<c:set var="str">How About Potato?</c:set>
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
	<header id="header" class="alt">
		<nav id="nav">
			<ul>
				<li><a href="${root}">Home</a></li>
				<li><a href="${root}/memo/list">Notice</a></li>
				<li><a href="${root}/res/list">RESLIST</a></li>
				<li><a href="${root}/res/create?board_num=1">RESCREATE</a></li>
				
				<c:choose>
					<c:when test="${empty sessionScope.id }">
						<li><a href="${root}/member/agree">Join</a></li>
						<li class="dropdown"><a href="${root}/member/login">Log-in</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${root}/member/read">MyInfo</a></li>
						<li><a href="${root}/member/update">MyPage</a></li>
						<li><a href="${root}/member/logout">Logout</a></li>
					</c:otherwise>
				</c:choose>
				<c:if test="${not empty sessionScope.id && sessionScope.grade=='A'}">
					<li><a href="${root}/admin/list">Room List</a></li>
				</c:if>
			</ul>
		</nav>
	</header>
	<a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>

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