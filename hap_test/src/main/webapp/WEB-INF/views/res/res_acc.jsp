<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script>
	function read(res_num) {
		var url = "read_acc";
		url += "?res_num=" + res_num;

		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";

		location.href = url;
	}
	
	function delete_admin(res_num) {
		var url = "delete_admin";
		url += "?res_num=" + res_num;

		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";

		location.href = url;
	}
</script>
<title>예약 승인</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<body>
	<div class="container">

		<h2>예약 목록</h2>
		<form class="form-inline" action="res_acc" method="post">
			<div class="form-group">
				<select class="form-control" name="col">
					<option value="res_name"
						<c:if test="${col=='res_name' }">selected</c:if>>이름</option>
					<option value="res_acc"
						<c:if test="${col=='res_acc' }">selected</c:if>>승인 내역</option>
					<option value="res_res1"
						<c:if test="${col=='res_res1' }">selected</c:if>>예약 날짜</option>
					<option value="total" <c:if test="${col=='total' }">selected</c:if>>전체</option>
				</select>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Enter 검색어"
					name="word" value="${word}">
			</div>
			<button class="btn">검색</button>

			<table class="table table-striped">
				<thead>
					<tr>
						<th>예약 번호</th>
						<th>예약 이름</th>
						<th>예약 날짜</th>
						<th>승인 여부</th>
						<th>승인 처리</th>
						<th>취소 처리</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="4">승인 처리할 에약이 없습니다.</td>
							<tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="dto" items="${list }">
								<tr>
									<td>${dto.res_rannum}</td>
									<td>${dto.res_name}</td>
									<td>${dto.res_res1}</td>
									<td><c:if test="${dto.res_acc == 'Y' }">예약 승인	</c:if>
										<c:if test="${dto.res_acc == 'R' }">예약 요청	</c:if>
										<c:if test="${dto.res_acc == 'U' }">예약 수정 요청</c:if>
										<c:if test="${dto.res_acc == 'D' }">삭제 요청 중</c:if>
										<c:if test="${dto.res_acc == 'X' }">예약 거절	</c:if></td>
									<td><a href="javascript:read('${dto.res_num}')">[승인
											처리]</a>
									</td>
									<td><a href="javascript:delete_admin('${dto.res_num}')">[취소 처리]</a>
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div>${paging_acc}</div>
		</form>
	</div>
</body>
</html>
