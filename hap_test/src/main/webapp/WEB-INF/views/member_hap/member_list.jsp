<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="userImg" value="${dto.member_fname}" />

<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<meta charset="utf-8">

<script type="text/javascript">
	function read(member_id) {
		var url = "${pageContext.request.contextPath}/member_hap/member_read";
		url += "?member_id=" + member_id;

		location.href = url;
	}
</script>

</head>

<body>
	<div class="container">
		<br>
		<h2 class="col-sm-offset-2 col-sm-10">Member List</h2>
		<br>
		<form class="form-inline" method="post" action="list">

			<div class="form-group">
				<select name="col" class="form-control">
					<option value="member_name"
						<c:if test="${col=='member_name' }">selected</c:if>>성명</option>
					<option value="member_id"
						<c:if test="${col=='member_id' }">selected</c:if>>아이디</option>
					<option value="member_email"
						<c:if test="${col=='member_email' }">selected</c:if>>E-mail</option>
					<option value="member_total"
						<c:if test="${col=='member_total' }">selected</c:if>>전체출력</option>
				</select>
			</div>

			<div class="form-group">
				<input type="text" class="form-control" name="word"
					required="required" value="${word}">
			</div>

			<button class="btn">Search</button>
			<button class="btn" type="button"
				onclick="location.href='${pageContext.request.contextPath}/member_hap/member_create'">등록</button>

		</form>
		<br>

		<c:forEach var="dto" items="${member_list }">

			<table class="table table-bordered">
				<tr>
					<c:choose>

						<c:when test="${fn:contains(userImg, 'http')}">
							<tr>
								<td colspan="2" style="text-align: center"><img
									src="${dto.member_fname }" width="250px" height="250px"
									class="img-rounded"></td>
							</tr>
						</c:when>

						<c:otherwise>
							<tr>
								<td colspan="2" style="text-align: center"><img
									src="${pageContext.request.contextPath }/storage/${dto.member_fname}"
									width="250px" height="250px" class="img-rounded"></td>
							</tr>

						</c:otherwise>
					</c:choose>
					<th class="col-sm-2">ID:</th>
					<td class="col-sm-8"><a
						href="javascript:read('${dto.member_id}')">${dto.member_id}</a></td>
				</tr>

				<tr>
					<th class="col-sm-2">Name:</th>
					<td class="col-sm-8">${dto.member_name}</td>
				</tr>

				<tr>
					<th class="col-sm-2">Birth:</th>
					<td class="col-sm-8">${dto.member_birth}</td>
				</tr>

				<tr>
					<th class="col-sm-2">Phone:</th>
					<td class="col-sm-8">${dto.member_phone}</td>
				</tr>

				<tr>
					<th class="col-sm-2">E-mail:</th>
					<td class="col-sm-8">${dto.member_email}</td>
				</tr>

			</table>

		</c:forEach>
		<br> <br>



	</div>

	${paging}
</body>
</html>