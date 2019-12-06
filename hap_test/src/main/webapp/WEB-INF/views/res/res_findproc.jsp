<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>예약 상세보기</title>
<meta charset="utf-8">
<style type="text/css">
#need {
	color: red;
}
</style>
<script type="text/javascript">
	
</script>
</head>
<body>
	<div class="container">
		<br> <BR> <BR>
		<form class="form-horizontal" action="" method="post">
			<input type="hidden" name="res_rannum" value="${param.res_rannum}">
			<input type="hidden" name="res_num" value="${dto.res_num }">
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
					<td>${param.res_rannum}</td>
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
					<td colspan="2"><h3>결제 내역</h3></td>
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
					<td>${dto_r.room_price}원</td>
				</tr>
				<tr>
					<th>현금영수증</th>
					<td>${dto.res_phone }</td>
				</tr>
			</table>
			<span id="need">수정 및 취소하려면 로그인을 하세요.</span>
		</form>
		<div class="container" align="center">
			<c:choose>
				<c:when test="${dto.member_id == sessionScope.member_id }">
					<button type="button" class="btn"
						onclick="location.href='./read?res_num=${dto.res_num}'">수정
						및 취소 요청하기</button>
				</c:when>
				<c:otherwise>
					<button type="button" class="btn"
						onclick="location.href='../member_hap/login'">로그인</button>
				&nbsp; &nbsp;&nbsp; &nbsp;
				</c:otherwise>
			</c:choose>
			<button type="button" class="btn" onclick="history.back()">뒤로
				가기</button>
		</div>
	</div>
</body>
</html>
