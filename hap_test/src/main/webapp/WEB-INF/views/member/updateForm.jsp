<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#need {
	color: red;
}
</style>
<script type="text/javascript">
	
	function emailCheck(){
		
			var url = "email_form";
			
			wr=window.open(url,"email중복확인","width=500, height=500");
			wr.moveTo((window.screen.width-500)/2,(window.screen.height-350)/2);
			
	
	}
</script>
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
<title>회원 수정</title>
<meta charset="utf-8">
<script type="text/javascript">
function inCheck(f){
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
function emailMsg(){
	alert("이메일을 변경을 원하시면 email 변경 버튼을 클릭하세요.");
}
</script>
</head>
<body>

	<div class="container">
		<h2 class="col-sm-offset-2 col-sm-10">회원 수정</h2>
		<form class="form-horizontal" action="update" method="post"
			name="frm" onsubmit="return inCheck(this)">
			<input type="hidden" name="id" value="${dto.id}">
			<div class="form-group">
				<label class="control-label col-sm-2" for="id">아이디</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" readonly
						value="${dto.id}">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="mname">이름</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" readonly
						value="${dto.mname}">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="tel">전화번호</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="tel"
						value="${dto.tel}" name="tel">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="email"><span
					id="need">*</span>이메일</label>
				<div class="col-sm-3">
					<input type="email" class="form-control" id="email"
						value="${dto.email}" readonly name="email"
						onclick="emailMsg()">
				</div>
				<button type="button" class="btn btn-default col-sm-2"
					onclick="emailCheck()">Email 변경</button>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="sample6_postcode">우편번호</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="sample6_postcode"
						value="${dto.zipcode}" name="zipcode">
				</div>

				<button type="button" class="btn btn-default col-sm-2"
					onclick="sample6_execDaumPostcode()">주소 검색</button>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="sample6_address">주소</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="sample6_address"
						value="${dto.address1}" name="address1"> <input
						type="text" class="form-control" id="sample6_detailAddress"
						value="${dto.address2}" name="address2">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="job"><span
					id="need">*</span>직업</label>
				<div class="col-sm-2">
					<select name="job" class="form-control">
						<option value="0">선택하세요</option>
						<option value="A01" selected>회사원</option>
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
					<script type="text/javascript">
						document.frm.job.value='${dto.job}';
					</script>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8">
					<button class="btn">수정</button>
					<button type="reset" class="btn">취소</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>