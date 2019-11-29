<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#need {
	color: red;
}
</style>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; 
                var extraAddr = ''; 

                if (data.userSelectedType === 'R') { 
                    addr = data.roadAddress;
                } else { 
                    addr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                //    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                 //   document.getElementById("sample6_extraAddress").value = '';
                }

                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<title>member</title>
<meta charset="utf-8">
<script type="text/javascript">
function idCheck(id) {
	if (id == '') {
		alert("아이디를 입력하세요");
		document.frm.id.focus();
	} else {
		var url = "idcheck";
		var param = "id=" + id;

		$.get(url, param, function(data, textStatus) {
			$("#idcheck").text(data.str);
		});
	}
}

function emailCheck(email){
	if(email==''){
		alert("이메일을 입력하세요");
		document.frm.email.focus();
	}else{
		var url = "emailcheck";
		var param= "email="+email;
		
		$.get(url, param, function(data, textStatus){
			$("#emailcheck").text(data.str);
		});
	}
}
function inCheck(f){
	if(f.id.value.length==0){
		alert("아이디를 입력하세요")
		f.id.focus();
		return false;
	}
	if(f.passwd.value.length==0){
		alert("비밀번호를 입력하세요")
		f.passwd.focus();
		return false;
	}
	if(f.repasswd.value.length==0){
		alert("비밀번호 확인을 입력하세요")
		f.repasswd.focus();
		return false;
	}
	if(f.mname.value.length==0){
		alert("이름을 입력하세요");
		f.mname.focus();
		return false;
	}
	if(f.mname.value.length==0){
		alert("이름을 입력하세요");
		f.mname.focus();
		return false;
	}
	if(f.tel.value.length==0){
		alert("전화번호를 입력하세요");
		f.tel.focus();
		return false;
	}
	if(f.email.value.length==0){
		alert("이메일을 입력하세요");
		f.email.focus();
		return false;
	}
	if(f.passwd.value != f.repasswd.value){
		alert("비밀번호가 일치하지 않습니다");
		f.passwd.value="";
		f.repasswd.value="";
		f.passwd.focus();
		return false;
	}
	if(f.job.selectedIndex==0){
		alert("직업을 선택하세요");
		f.job.focus();
		return false;
	}
}
</script>
<style type="text/css">
#idcheck, #emailcheck {
	color: red;
}
</style>
</head>
<body>
	<div class="container">
		<h2 class="col-sm-offset-2 col-sm-10">회원가입</h2>
		<label class="col-sm-offset-2 col-sm-10">(<span id="need">*</span>
			필수입력사항)
		</label>
		<form class="form-horizontal"
		action="createProc"
		method="post"
		name="frm"
		enctype="multipart/form-data"
		onsubmit="return inCheck(this)">
			<div class="form-group">
				<label class="control-label col-sm-2" for="fname">사진</label>
				<div class="col-sm-4">
					<input type="file" class="form-control" id="fname" name="fnameMF"
						accept=".jpg,.gif,.png">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="id"><span
					id="need">*</span>아이디</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="id"
						placeholder="Enter id" name="id">
				</div>
				<button type="button" class="btn btn-default col-sm-2"
					onclick="idCheck(document.frm.id.value)">Id 중복확인</button>
				<div id="idcheck"></div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="passwd"><span
					id="need">*</span>비밀번호</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="passwd"
						placeholder="Enter passwd" name="passwd">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="repasswd"><span
					id="need">*</span>비밀번호 확인</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="repasswd"
						placeholder="Enter passwd" name="repasswd">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="mname"><span
					id="need">*</span>이름</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="mname"
						placeholder="Enter 이름" name="mname">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="tel"><span
					id="need">*</span>전화번호</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="tel"
						placeholder="Enter 전화번호" name="tel">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="email"><span
					id="need">*</span>이메일</label>
				<div class="col-sm-3">
					<input type="email" class="form-control" id="email"
						placeholder="Enter email" name="email">
				</div>

				<button type="button" class="btn btn-default col-sm-2"
					onclick="emailCheck(document.frm.email.value)">Email 중복확인</button>
				<div id="emailcheck"></div>

			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="sample6_postcode">우편번호</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="sample6_postcode"
						placeholder="우편번호" name="zipcode">
				</div>

				<button type="button" class="btn btn-default col-sm-2"
					onclick="sample6_execDaumPostcode()">주소 검색</button>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="sample6_address">주소</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="sample6_address"
						placeholder="주소" name="address1"> <input type="text"
						class="form-control" id="sample6_detailAddress" placeholder="상세주소"
						name="address2">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="job"><span
					id="need">*</span>직업</label>
				<div class="col-sm-2">
					<select name="job" class="form-control">
						<option value="0">선택하세요</option>
						<option value="A01">회사원</option>
						<option value="A02">전산관련직</option>
						<option value="A03">연구전문직</option>
						<option value="A04">각종학교학생</option>
						<option value="A05">일반자영업</option>
						<option value="A06">공무원</option>
						<option value="A07">의료인</option>
						<option value="A08">법조인</option>
						<option value="A09">종교/언론/예술인</option>
						<option value="A10">기타</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8">
					<button class="btn">등록</button>
					<button type="reset" class="btn">취소</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>