<%@ page contentType="text/html; charset=UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<title>회원정보수정</title>
<meta charset="utf-8">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<style type="text/css">
#need {
	color: red;
}
</style>

<script type="text/javascript">


	function emailMsg(){
   		alert("이메을 수정을 원하시면 email 변경 버튼을 사용하세요");
    }

	function emailCheck(){
		 if(member_email==''){
			  alert("E-mail를 입력하세요");
			  document.frm.member_email.focus();
		  }else{
			  var url="email_Form";
			 		  
			  var wr1= window.open(url, "E-mail 중복확인","width=500,height=300");
			  wr.moveTo((window.screen.width-500)/2,(window.screen.height-320)/2);
		  }
	  }
 

    function incheck(f){
	      if(f.member_phone.value.length==0){
	        alert("전화번호을 입력하세요");
	        f.member_phone.focus();
	        return false;
	      }
	      if(f.member_email.value.length==0){
	        alert("이메일을 입력하세요");
	        f.member_email.focus();
	        return false;
	      }

    }
  </script>

</head>
<body>

	<div class="container">
		<h2 class="col-sm-offset-2 col-sm-10">회원수정</h2>
		<label class="col-sm-offset-2 col-sm-10">(<span id="need">*</span>
			필수입력사항)
		</label>
		<form class="form-horizontal" action="member_update" method="post" name="frm"
			onsubmit="return incheck(this)">

			<input type="hidden" name="member_id" value="${member_id }" />
			<div class="form-group">
				<label class="control-label col-sm-2">아이디</label> <label
					class="col-sm-3"> ${dto.member_id} </label>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2">성명</label>
				<div class="col-sm-4">${dto.member_name}</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2">생년월일</label>
				<div class="col-sm-3">${dto.member_birth}</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="member_phone"><span
					id="need">*</span>전화번호</label>
				<div class="col-sm-4">
					<input type="text" name="member_phone" id="member_phone" class="form-control"
						value="${dto.member_phone}">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="member_email"><span
					id="need">*</span>이메일</label>
				<div class="col-sm-3">
					<input type="email" name="member_email" id="member_email" class="form-control"
						value="${dto.member_email}" readonly="readonly" onclick="emailMsg()">
				</div>

				<button type="button" onclick="emailCheck()" class="btn col-sm-2">Email
					변경</button>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-5">
					<button class="btn">수정</button>
					<button type="reset" class="btn">취소</button>

				</div>
			</div>
		</form>
	</div>
</body>
</html>

