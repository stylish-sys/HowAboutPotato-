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
</head>
<body>
	<div class="container">
		<br>
		<BR>
		<BR>
		<!-- style="padding-bottom: 60px;" -->
		<form class="form-horizontal" action="update" method="post">
			<table class="order_item_table" style="width: 724px;">
				<col width="150px">
				<col width="">
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
				<tr>
					<td colspan="2" ><h3>결제 내역</h3></td>
				</tr>
				<tr>
					<th>약도 보기</th>
					<td>${dto_b.board_map}</td>
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
		</form>
		<div class="container" align="center">
			<a href="javascript:update('${dto.res_num}')">수정 및 취소 요청</a>
				&nbsp; &nbsp;&nbsp; &nbsp;
			<a href="javascript:history.back()">뒤로 가기</a>
		</div>
	</div>
</body>
</html>
