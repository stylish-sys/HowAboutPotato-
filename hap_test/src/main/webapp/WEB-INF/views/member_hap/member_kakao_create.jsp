<%@ page contentType="text/html; charset=UTF-8"%>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<title>HAP 회원가입 양식</title>
<meta charset="utf-8">
<style type="text/css">
#need {
	color: red;
}
</style>
<script type="text/javascript">
	function idCheck(member_id) {
		if (member_id == '') {
			alert("아이디를 입력하세요");
			alter("id");
			document.frm.member_id.focus();
		} else {
			var url = "idcheck"
			url+= "?member_id=" + member_id;

			$.get(url, function(data, textStatus) {
				$("#idcheck").text(data.str);
				
			})

		}
	}

	function emailCheck(member_email) {
		if (member_email == '') {
			alert("이메일을 입력하세요");
			document.frm.member_email.focus();
		} else {
			var url = "emailcheck"
			url += "?member_email=" + member_email;

			$.get(url, function(data, textStatus) {
				$("#emailcheck").text(data.str);
			})
		}
	}
</script>

<script type="text/javascript">
	function inCheck(f) {
		if (f.member_id.value.length == 0) {
			alert("아이디를 입력하세요.");
			f.member_id.focus();
			return false;
		}

		if (f.member_passwd.value.length == 0) {
			alert("비밀번호를 입력하세요.");
			f.member_passwd.focus();
			return false;
		}
		if (f.member_repasswd.value.length == 0) {
			alert("비밀번호 확인을 입하세요.");
			f.member_repasswd.focus();
			return false;
		}
		if (f.member_passwd.value != f.member_repasswd.value) {
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			f.member_passwd.value = "";
			f.member_repasswd.value = "";
			f.member_passwd.focus();
			return false;
		}

		if (f.member_name.value.length == 0) {
			alert("이름을 입력하세요.");
			f.member_name.focus();
			return false;
		}

		if (f.member_phone.value.length == 0) {
			alert("핸드폰번호를 입력하세요.");
			f.member_phone.focus();
			return false;
		}

		if (f.member_email.value.length == 0) {
			alert("E-mail을 입력하세요.");
			f.member_email.focus();
			return false;
		}

	}
</script>

<style>
#idcheck, #emailcheck {
	color: red;
}
</style>

</head>
<body>

<br>
	<div class="container">

		<h2 class="col-sm-offset-2 col-sm-10">HAP 회원 가입 양식</h2>
		<label class="col-sm-offset-2 col-sm-10">(<span id="need">*</span> 
			은 필수입력 항목입니다.)
		</label>


		<form class="form-horizontal" action="member_createProc" method="post"
			name="frm" enctype="multipart/form-data"
			onsubmit="return inCheck(this)">

			<div class="form-group">
				<label class="control-label col-sm-2" for="member_fname" >사진</label>
				<div class="col-sm-4">
					<input type=text class="form-control" id="member_fname" name="member_fname" readonly value="${kakao_fname }">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="member_id"><span
					id="need">*</span>아이디</label>
				<div class="col-sm-4">
				
					<input type="text" class="form-control" id="member_id"
						placeholder="Enter 아이디" name="member_id" value="${fn:split(kakao_email,'@')[0]}" readonly>
				</div>

				<button type="button" class="btn col-sm-1.3"
					onclick="idCheck(document.frm.member_id.value)">ID 중복확인</button>
				<div id="idcheck"></div>

			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="member_name"><span
					id="need">*</span>이름</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="member_name"
						placeholder="Enter 이름" value="${kakao_name}"name="member_name" readonly>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="member_passwd"><span
					id="need">*</span>비밀번호</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="member_passwd"
						placeholder="Enter 비밀번호" name="member_passwd">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="member_repasswd"><span
					id="need">*</span>비밀번호확인</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="member_repasswd"
						placeholder="Enter 비밀번호 확인" name="member_repasswd">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="member_birth"><span
					id="need">*</span>생년월일</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="member_birth"
						placeholder="Enter 생년월일" name="member_birth">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="member_phone"><span
					id="need">*</span>전화번호</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="member_phone"
						placeholder="Enter 전화번호" name="member_phone">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="member_email"><span
					id="need">*</span>E-mail</label>
				<div class="col-sm-4">
					<input type="email" class="form-control" id="member_email"
						placeholder="Enter E-mail" name="member_email" value="${kakao_email}">
				</div>
				<button type="button" class="btn col-sm-1.3"
					onclick="emailCheck(document.frm.member_email.value)">E-mail 중복확인</button>
				<div id="emailcheck"></div>
			</div>
				
			<br>
			<br>

			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-5">
					<button type="submit" class="btn">등록</button>
					<button type="reset" class="btn">취소</button>
				
					<br>
					<br>
					<br>
				</div>
			</div>

		</form>
	</div>
	
</body>
</html>