<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>member</title>
<meta charset="utf-8">
<script type="text/javascript">
</script>
</head>
<body>
	<div class="container" style="padding-bottom: 60px;">
		<br> <br> <br>
		<form class="form-horizontal" action="update" method="post">
			<input type="hidden" name="res_num" value="${param.res_num}">
			<input type="hidden" name="col" value="${param.col}">
			<input type="hidden" name="word" value="${param.word}">
			<input type="hidden" name="nowPage" value="${param.nowPage}">
			
			<table style="width: 724px;">
				<col width="150px">
				<col width="">
				<tr>
					<td colspan="2"><h3>예약 수정</h3></td>
				</tr>
				<tr>
					<th>예약번호</th>
					<td>${dto.res_rannum}</td>
				<tr>
				<tr>
					<th>아이디</th>
					<td>test1</td>
				</tr>
				<!-- 수정 불가능 -->
				<tr>
					<th>성명</th>
					<td>이선용</td>
				</tr>
				<!-- 수정 불가능 -->
				<tr>
					<th>이메일</th>
					<td>test@test.test</td>
				</tr>
				<!-- 수정 불가능 -->
				<tr>
					<th>휴대전화번호</th>
					<td>010-1234-1234</td>
				</tr>
				<!-- 수정요청가능 -->
				<tr>
					<th>실사용자(성명)</th>
					<td><input type="text" name="res_name" id="res_name"
						value="${dto.res_name }"></td>
				</tr>
				<!-- 수정요청가능 -->
				<tr>
					<th>실사용자 연락처<br>[휴대전화]
					</th>
					<td><input type="text" name="res_phone" id="res_phone"
						value="${dto.res_phone }"></td>
				</tr>
				<!-- 수정요청가능 -->
				<tr>
					<th>예약접수날짜</th>
					<td>2019.16.16</td>
				</tr>
				<!-- 수정 불가능 -->
				<tr>
					<th style="width: 263px;">숙박 상호</th>
					<td>H호텔</td>
				</tr>
				<tr>
					<th>숙박명</th>
					<td>디럭스 룸</td>
				</tr>
				<!-- 수정요청가능 -->
				<tr>
					<th>입실일시</th>
					<td><input type="date" name="res_res1" id="res_res1"
						value="${dto.res_res1 }"></td>
				</tr>
				<!-- 수정요청가능 -->
				<tr>
					<th>퇴실일시</th>
					<td><input type="date" name="res_res2" id="res_res2"
						value="${dto.res_res2}"></td>
				</tr>
				<tr>
					<th>남기실 말</th>
					<td><textarea name="res_content" id="res_content">${dto.res_content }</textarea></td>
				</tr>
				<!-- 수정요청가능 -->
				<tr>
					<td><h3>결제 내역</h3></td>
				</tr>
				<tr>
					<th>입금계좌정보</th>
					<td>351-1234-1234</td>
				</tr>
				<tr>
					<th>입금자명(실사용자랑 동일해야함)</th>
					<td>이선용</td>
				</tr>
				<tr>
					<th>입금액</th>
					<td>80000원</td>
				</tr>
				<tr>
					<th>현금영수증신청여부</th>
					<td>미신청</td>
				</tr>
			</table>
			<span>3일 이내의 예약은 수정이 불가능합니다.<br> 팬션 사이트에 직접 연락하여 수정하시길
				바랍니다.<br> 환불 규정은 정책에 따라 행해짐을 알려드립니다.
			</span> <br> <br> <br>
			<div class="form-group" align="center">
				<button type="submit" class="btn">수정요청</button>
				<button type="button" class="btn" onclick="history.back()">예약 상세 정보</button>
			</div>
		</form>
	</div>
</body>
</html>