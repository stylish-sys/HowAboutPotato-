<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>예약 목록</title>
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
					<option value="res_acc"
						<c:if test="${col=='res_acc'}">selected</c:if>>
						예약 상태</option>
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
				<th>예약취소</th>
				<th>예약수정</th>
				<th>예약상태</th>
			</tr>
			<c:choose>
				<c:when test="${empty list}">
					<tr>
						<td colspan="4">등록된 예약이 없습니다. 예약하세요.</td>
					</tr>
				</c:when>
				<c:when test="${sessionScope.member_grade=='H'}">
					<c:forEach var="dto" items="${list}">
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
							<td><a href="javascript:deletem('${dto.res_num}')">예약 취소
									요청</a></td>
							<td><a href="javascript:update('${dto.res_num}')">예약
									수정하기</a></td>
							<td><c:if test="${dto.res_acc == 'Y' }">예약 승인	</c:if> <c:if
										test="${dto.res_acc == 'R' }">예약 요청 중</c:if>
										<c:if test="${dto.res_acc == 'U' }">수정 요청 중</c:if>
										<c:if test="${dto.res_acc == 'D' }">취소 요청 중</c:if>
										<c:if test="${dto.res_acc == 'X' }">거절 처리	</c:if></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${list}">
						<c:if test="${dto.member_id == sessionScope.member_id}">
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
								<td><a href="javascript:deletem('${dto.res_num}')">예약
										취소 요청</a></td>
								<td><a href="javascript:update('${dto.res_num}')">예약
										수정하기</a></td>
								<td><c:if test="${dto.res_acc == 'Y' }">예약 승인	</c:if> <c:if
										test="${dto.res_acc == 'R' }">예약 요청 중</c:if>
										<c:if test="${dto.res_acc == 'U' }">수정 요청 중</c:if>
										<c:if test="${dto.res_acc == 'D' }">취소 요청 중</c:if>
										<c:if test="${dto.res_acc == 'X' }">거절 처리	</c:if>
										</td>
							</tr>
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		<div class="container">${paging}</div>
	</div>
</body>
</html>