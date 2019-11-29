<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>member</title>
<meta charset="utf-8">
<script type="text/javascript">
	function read(res_num) {
		var url = "read";
		url += "?res_num=" + res_num;

		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";

		location.href = url;
	}
	function update(res_num) {
		var url = "update";
		url += "?res_num=" + res_num;

		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";

		location.href = url;
	}
	function deletem(res_num) {
		var url = "delete";
		url += "?res_num=" + res_num;

		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";

		location.href = url;
	}
</script>
</head>
<body>
	<!-- 날짜 선택 -->
	<div class="container">
		<br>
		<form class="form-inline" action="list">
			<div class="form-group">
				<select name="col" class="form-control">
					<option value="res_name"
						<c:if test="${col=='res_name'}">selected</c:if>>예약자명</option>
				</select>
				<div class="form-group">
					<input type="text" class="form-control" name="word"
						required="required" value="${word }">
				</div>
				<button class="btn">검색</button>
			</div>
		</form>
	</div>
	<div class="container">
		<table>
			<col width="200px">
			<col width="100px">
			<col width="100px">
			<col width="100px">
			<tr>
				<th>예약내역</th>
				<th>예약상태</th>
				<th>예약일</th>
				<th>예약수정</th>
			</tr>
			<c:choose>
				<c:when test="${empty list}">
					<tr>
						<td colspan="4">등록된 예약이 없습니다. 예약하세요.</td>
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${list}">
					<%-- var = "dto_b" items="${board_hap}"
					var="dto_r" items="${room_hap}"> --%>
						<tr>
							<td>
								<p>예약번호 : ${dto.res_rannum}</p>
								<p>예약자명 : ${dto.res_name}</p>
								<p>사용인원 : ${dto.res_people}</p>
								<p>입실일시 : ${dto.res_res1}</p>
								<p>퇴실입실 : ${dto.res_res2}</p>
								<p>
									<a href="javascript:read('${dto.res_num}')">[예약정보 상세보기]</a>
								</p>
							</td>
							<td class="order_state_col"><a
								href="javascript:deletem('${dto.res_num}')">예약 취소 요청</a></td>
							<td>${dto.res_res1 }</td>
							<td><a href="javascript:update('${dto.res_num}')">예약
									수정하기</a></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>

		<div class="container">${paging}</div>
	</div>
</body>
</html>