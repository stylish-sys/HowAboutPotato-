<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>예약 상세보기</title>
<meta charset="utf-8">
</head>
<body>
	<div class="container">
		<br> <BR> <BR>
		<form class="form-horizontal" action="read_acc" method="post">
			<input type="hidden" name="res_rannum" value="${dto.res_rannum}">
			<input type="hidden" name="res_num" value="${param.res_num}">
			<input type="hidden" name="col" value="${param.col}">
			<input type="hidden" name="word" value="${param.word}">
			<input type="hidden" name="nowPage" value="${param.nowPage}">
			<table style="width: 724px;">
				<col width="150px">
				<col width="">
				<tr>
					<td colspan="2"><h3>예약 승인 처리</h3></td>
				</tr>
				<tr>
					<th>성명</th>
					<td>${dto.res_name }</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>${dto.res_phone}</td>
				</tr>
				<tr>
					<th>인원</th>
					<td>${dto.res_people}</td>
				</tr>
				<tr>
					<th style="width: 263px;">숙박 상호</th>
					<td>${dto_b.board_name}</td>
				</tr>
				<tr>
					<th>숙박명</th>
					<td>${dto_r.room_name }</td>
				</tr>
				<tr>
					<th>입실일시</th>
					<td>${dto.res_res1 }</td>
				</tr>
				<!-- 수정요청가능 -->
				<tr>
					<th>퇴실일시</th>
					<td>${dto.res_res2}</td>
				</tr>
				<tr>
					<th>승인여부</th>
					<td>
					<c:if test="${dto.res_acc == 'Y' }">예약 승인	</c:if>
					<c:if test="${dto.res_acc == 'R' }">예약 요청	</c:if>
					<c:if test="${dto.res_acc == 'U' }">예약 수정 요청</c:if>
					<c:if test="${dto.res_acc == 'X' }">예약 거절	</c:if>
					<select name="res_acc" class="form-control">
							<option value="Y">승인완료</option>
							<option value="R">보류상태</option>
							<option value="U">수정완료</option>
							<option value="X">거절완료</option>
					</select></td>
				</tr>
			</table>
			<br> <br> <br>
			<div class="form-group" align="center">
				<button type="submit" class="btn">처리</button>
				<button class="btn" onclick="location.href='./res_acc'">목록 가기</button>
			</div>
		</form>
	</div>
</body>
</html>
