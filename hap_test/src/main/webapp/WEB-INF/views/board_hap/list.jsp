<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>업소목록</title>

<style type="text/css">
table, .td {
	border: 1px solid black;
}

table {
	width: 100%;
	heigth: 100px;
	margin: auto;
	text-align: center;
	text-valign: middle;
}
</style>

<script type="text/javascript">
	function read(board_num) {
		var url = "${pageContext.request.contextPath}/board_hap/read";
		url += "?board_num=" + board_num;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;
	}
</script>

</head>
<body>
	<input type = "hidden" name = "word" value = "${param.word }">
	<input type = "hidden" name = "col" value = "${param.col }">
	<div class="container">
		<br>
		<form class="form-inline" method="post" action="list">
			<div class="form-group">
				<h2>실시간 빈 방 검색</h2>
			</div>
			<br>
<div class = "form-group">
   		<select name = "col" class = "form-control">
   		<option value="지역"<c:if test="${col=='지역'}">selected</c:if>>지역을 선택하세요</option>
   		<option value="강원"<c:if test="${col=='강원'}">selected</c:if>>강원</option>
		<option value="경기"<c:if test="${col=='경기'}">selected</c:if>>경기</option>
		<option value="서울"<c:if test="${col=='서울'}">selected</c:if>>서울</option>
		<option value="제주"<c:if test="${col=='제주'}">selected</c:if>>제주</option>
		<option value="전라"<c:if test="${col=='전라'}">selected</c:if>>전라</option>
		<option value="충청"<c:if test="${col=='충청'}">selected</c:if>>충청</option>
		<option value="경상"<c:if test="${col=='경상'}">selected</c:if>>경상</option>
   	</select>
   </div>

			<div class="form-inline">
				<input type="text" class="form-control" name="word"
					 value="${word }">
			</div>

			<button class="btn">검색</button>

			<c:if
				test="${not empty sessionScope.member_id &&sessionScope.member_grade =='H' }">
				<button class="btn" type="button"
					onclick="location.href='${pageContext.request.contextPath}/board_hap/create'">업소등록</button>
			</c:if>

		</form>


		<c:forEach var="dto" items="${list }">

			<table>
				<thead>
					<tr>
						<th>사진</th>
						<th>숙박명</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><img
							src="${pageContext.request.contextPath}/storage/${dto.board_filename}"
							class="img-rounded " width="100px" height="100px"
							onclick="javascript:read('${dto.board_num}')"></td>
						<td>${dto.board_name}</td><br>
					</tr>
				</tbody>

				<c:if
					test="${not empty sessionScope.member_id &&sessionScope.member_grade =='H' }">
					<button class="btn"
						onclick="location.href='${pageContext.request.contextPath}/board_hap/delete?board_num=${dto.board_num }'">업소
						삭제</button>
					<button class="btn"
						onclick="location.href='${pageContext.request.contextPath}/board_hap/update?board_num=${dto.board_num }'">업소
						정보수정</button>
					<button class="btn"
						onclick="location.href='${pageContext.request.contextPath}/board_hap/updateFile?board_num=${dto.board_num }&oldfile=${dto.board_filename }'">업소
						사진수정</button>
					<br>
				</c:if>

			</table>

		</c:forEach>

		${paging }
	</div>

</body>
</html>