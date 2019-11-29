<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<title>member</title>
<meta charset="utf-8">
<script type="text/javascript">
	function updateFile() {
		var url = "updateFile";
		url += "?oldfile=${dto.fname}";

		location.href = url;
	}

	function updatePw() {
		var url = "updatePw";

		location.href = url;
	}
	function updateM() {
		var url = "update";
		url += "?id=${dto.id}";

		location.href = url;
	}
	function deleteM() {
		var url = "delete";
		url += "?id=${dto.id}";
		url += "&oldfile=${dto.fname}";

		location.href = url;
	}
/* 
	function listb() {
		var url = "list";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";

		location.href = url;
	} */
</script>
</head>
<body>
	<div class="container">
		<h3 class="col-sm-offset-2 col-sm-10">${dto.mname}의회원 정보</h3>
		<table class="table table-bordered">
			<tr>
				<td colspan="2" style="text-align: center"><a
					href="${pageContext.request.contextPath }/download?dir=/storage&filename=${dto.fname}">
						<img
						src="${pageContext.request.contextPath }/storage/${dto.fname}"
						width="250px" height="250px" class="img-rounded">
				</a></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>${dto.id}</td>
			</tr>
			<tr>
				<th>성명</th>
				<td>${dto.mname}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${dto.tel}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${dto.email}</td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td>${dto.zipcode}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${dto.address1}${dto.address2}</td>
			</tr>
			<tr>
				<th>직업</th>
				<td>직업코드:${dto.job}(${util:jobName(dto.job)})</td>
			</tr>
			<tr>
				<th>날짜</th>
				<td>${dto.mname}</td>
			</tr>
		</table>
		<div style="text-align: center">
			<button class="btn btn-default" onclick="updateM()">정보 수정</button>
			<button class="btn btn-default" onclick="updateFile()">사진 수정</button>
			<c:if
				test="${not empty sessionScope.id && sessionScope.grade != 'A' }">
				<button class="btn btn-default" onclick="updatePw()">비밀번호
					수정</button>
				<button class="btn btn-default" onclick="deleteM()">회원 탈퇴</button>
			</c:if>
			<c:if
				test="${not empty sessionScope.id && sessionScope.grade == 'A' }">
				<button class="btn btn-default" onclick="history.back()">회원 목록</button>

				<button class="btn btn-default"
					onclick="location.href='${pageContext.request.contextPath }/download?dir=/storage&filename=${dto.fname}'">
					다운로드</button>
			</c:if>
		</div>
	</div>
</body>
</html>