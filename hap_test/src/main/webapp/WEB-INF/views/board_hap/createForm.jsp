<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>숙소 등록</title>
<style type="text/css">
#need {
	color: red;
}
</style>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					//document.getElementById("sample6_extraAddress").value = extraAddr;

				} else {
					//document.getElementById("sample6_extraAddress").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('board_zipcode').value = data.zonecode;
				document.getElementById("board_address1").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("board_address2").focus();
			}
		}).open();
	}
</script>

<script type="text/javascript">
	function board_nameCheck(board_name) {
		if (board_name == '') {
			alert("숙소이름을 입력하세요")
			document.frm.board_name.focus();
		} else {
			var url = "board_namecheck"; //board_namecheck
			url += "?board_name=" + board_name;

			$.get(url, function(data, textStatus) {
				$("#board_namecheck").text(data.str);
			})

		}
	}
</script>
<script type="text/javascript">
	function inCheck(f) {

		if (f.board_name.value.length == 0) {
			alert("숙소이름을 입력하세요.");
			f.board_name.focus();
			return false;
		}

		if (f.board_map.value.length == 0) {
			alert("약도를 입력하세요.");
			f.board_map.focus();
			return false;
		}

	}
</script>
<style>
#board_namecheck {
	color: red;
}
</style>

</head>
<body>
	<div class="container">
		<h1 class="col-sm-offset-2 col-sm-10">숙소 등록</h1>
		<label class="col-sm-offset-2 col-sm-10">(<span id="need">*</span>
			필수입력사항)
		</label>
		<form class="form-horizontal" action="create" method="post" name='frm'
			enctype="multipart/form-data" onsubmit="return inCheck(this)">


			<div class="form-group">
				<label class="control-label col-sm-2" for="board_filename">업소
					소개 사진</label>
				<div class="col-sm-6">
					<input type="file" class="form-control" id="board_filename"
						name="board_filenameMF" accept=".jpg,.gif,.png">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="board_name"><span
					id="need">*</span>업소 이름</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="board_name"
						placeholder="숙소 이름을 입력하세요" name="board_name">
					<!-- id->board_name -->
				</div>
				<button type="button" class="btn col-sm-2"
					onclick="board_nameCheck(document.frm.board_name.value)">중복체크</button>
				<div id="board_namecheck"></div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="sample6_postcode">우편번호:</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="board_zipcode"
						id="board_zipcode" placeholder="우편번호">
				</div>
				<button type="button" class="btn col-sm-2"
					onclick="sample6_execDaumPostcode()">주소검색</button>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="sample6_address">주소:</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="board_address1"
						placeholder="주소" name="board_address1"> <input type="text"
						class="form-control" id="board_address2" placeholder="상세주소"
						name="board_address2">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="board_account">계좌:</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="board_account"
						placeholder="입금받을 계좌번호를 입력하세요" name="board_account">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="board_content">숙소안내사항:</label>
				<div class="col-sm-6">
					<textarea rows="12" cols="6" class="form-control"
						id="board_content" name="board_content"
						placeholder="숙소 안내사항을 입력하세요"></textarea>
				</div>
			</div>


			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8">
					<button type="submit" class="btn">등록</button>
					<button type="reset" class="btn">취소</button>
				</div>
			</div>
		</form>

	</div>
</body>
</html>