<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>예약 상세보기</title>
<meta charset="utf-8">
<script type="text/javascript">
function update(res_num){
	var url="update";
	url += "?res_num="+res_num;
	url += "&col=${col}";
	url += "&word=${word}";
	url += "&nowPage=${nowPage}";
	
	location.href = url;
}
</script>
<style type="text/css">
#notice_select {width =50px;
	
}

#notice_input {width =200px;
	
}

head {
	color: #FF0000;
}

#noticeThead {
	background-color: #ebe7f1;
	border-radius: 2%
}

.tabel-striped {
	background-color: #ebe7f1;
}

tr {
	background-color: white;
}

.container-notice {
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

.btn {
	height: 3.5rem;
}

.table {
	width: 100%;
	max-width: 100%;
	margin-bottom: 20px;
	box-shadow: -60px 0px 120px -90px #000000, 60px 0px 120px -90px #000000;
	background-color: white;
}

table tbody tr:nth-child(2n + 1) {
	background-color: white;
}

.first-notice-tbody tr {
	background-color: gray;
}

.first-notice-tbody td {
	background-color: #f2fcf6;
}

#noticeThead tr {
	background-color: #e6e6f2;
}

.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover,
	.pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover
	{
	z-index: 3;
	color: black;
	cursor: default;
	background-color: white;
	border-color: white;
}

input[type="text"], input[type="password"], input[type="email"], select
	{
	height: 3.5rem;
	font-size: 1.5rem;
}
</style>
</head>
<body>
	<div class="container-notice">
		<br> <BR> <BR>
		<!-- style="padding-bottom: 60px;" -->
		<table class="table">
			<tr>
				<td colspan="2"><h3>예약 내역</h3></td>
			</tr>
			<tr>
				<th>방사진</th>
				<td>${dto_r.room_filename}</td>
			<tr>
				<th>예약번호</th>
				<td>${dto.res_rannum}</td>
			<tr>
			<tr>
				<th>아이디</th>
				<td>${dto.member_id}</td>
			</tr>
			<tr>
				<th>성명</th>
				<td>${dto_m.member_name}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${dto_m.member_email}</td>
			</tr>
			<tr>
				<th>실사용자(성명)</th>
				<td>${dto.res_name}</td>
			</tr>
			<tr>
				<th>실사용자 연락처<br>[휴대전화]
				</th>
				<td>${dto.res_phone }</td>
			</tr>
			<tr>
				<th>남긴 내용</th>
				<td>${dto.res_content }</td>
			</tr>
			<tr>
				<th>휴대전화번호</th>
				<td>${dto_m.member_phone}</td>
			</tr>
			<tr>
				<th>예약접수날짜</th>
				<td>${dto.res_res1 }</td>
			</tr>
			<tr>
				<th style="width: 263px;">숙박 상호</th>
				<td>${dto_b.board_name}</td>
			</tr>
			<tr>
				<th>숙박명</th>
				<td>${dto_r.room_name}</td>
			</tr>
			<tr>
				<th>입실일시</th>
				<td>${dto.res_res1 }</td>
			</tr>
			<tr>
				<th>퇴실일시</th>
				<td>${dto.res_res2 }</td>
			</tr>
		</table>
		<table class="table">
			<tr>
				<td colspan="2"><h3>결제 내역</h3></td>
			</tr>
			<tr>
				<th>입금계좌</th>
				<td>${dto_b.board_account}</td>
			</tr>
			<tr>
				<th>입금자명</th>
				<td>${dto.res_name}</td>
			</tr>
			<tr>
				<th>입금액</th>
				<td>${dto_r.room_price}</td>
			</tr>
			<tr>
				<th>현금영수증</th>
				<td>${dto.res_phone }</td>
			</tr>
		</table>
		<div class="container" align="right">
			&nbsp; &nbsp;&nbsp; &nbsp;
			<button type="btn" onclick="history.back()">뒤로가기</button>

		</div>
		<br> <br> <br> <br>
	</div>
</body>
</html>
