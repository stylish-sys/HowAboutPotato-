<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<meta charset="utf-8">

<script type="text/javascript">
 function deleteH(){
	 var url="member_delete";
	 url+="?member_id=${dto.member_id}";
	 url+="&oldfile=${dto.member_fname}";	 
	 location.href=url;
 }
 
 function updateH(){
	 var url="member_update";
	 url+="?member_id=${dto.member_id}";
	 url+="&oldfile=${dto.member_fname}";	 
	 location.href=url;
 }
 
 function updateFile(){
	 var url="updateFile";

	 url+="?oldfile=${dto.member_fname}";	 
	 location.href=url;
 }
 
 function updatePW(){
	 var url="updatePw";

	 location.href=url;
 }
 
	
</script>


</head>
<body>
	<div class="container">
		<br>
		<h2 class="col-sm-offset-2 col-sm-10">${dto.member_name}의회원정보</h2>

		<table class="table table-bordered">
			<tr>
				<td colspan="2" style="text-align: center"><img
					src="${pageContext.request.contextPath }/storage/${dto.member_fname}"
					width="250px" height="250px" class="img-rounded"></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>${dto.member_id}</td>
			</tr>

			<tr>
				<th>성명</th>
				<td>${dto.member_name}</td>
			</tr>

			<tr>
				<th>이메일</th>
				<td>${dto.member_email}</td>
			</tr>

			<tr>
				<th>전화번호</th>
				<td>${dto.member_phone}</td>
			</tr>

			<tr>
				<th>생일</th>
				<td>${dto.member_birth}</td>
			</tr>

		</table>

		<div style="text-align: center">
			<button class="btn" onclick="updateH()">정보수정</button>


			<c:if test="${not empty sessionScope.member_id &&sessionScope.member_grade !='H' }">

				<button class="btn" onclick="updateFile()">사진수정</button>
				<button class="btn" onclick="updatePW()">패스워드변경</button>
				<button class="btn" onclick="deleteH()">회원탈퇴</button>
				<button class="btn"
					onclick="location.href='${pageContext.request.contextPath}/download?dir=/storage&filename=${dto.member_fname}'">다운로드</button>
			</c:if>

			<c:if test="${not empty sessionScope.member_id &&sessionScope.member_grade =='H' }">
				<button class="btn"
					onclick="location.href='${pageContext.request.contextPath}/admin/member_list'">회원목록</button>
			</c:if>



			<br>
			<br>
			<br>
		</div>
	</div>
</body>
</html>