<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>

<!DOCTYPE html>
<html>
<head>
<title>Qna List</title>
<meta charset="utf-8">
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
	width: 60%;
	max-width: 100%;
	margin-bottom: 20px;
	box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.3);
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
<script type="text/javascript">
	function read(qna_num) {
		var url = "readQna";
		url += "?qna_num=" + qna_num;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;
	}
</script>
</head>
<body>
	<div class="container-notice">
		<table class="table">
			<thead id="noticeThead">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성자</th>
				</tr>
			</thead>
			<tbody class="first-notice-tbody">
				<c:choose>
					<c:when test="${empty list_Y }">
						<tr>
							<td colspan="6">등록된 공지사항이 없음!!</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="dto" items="${list_Y }">
							<tr>
								<td>${dto.qna_num}</td>
								<td><c:forEach begin="1" end="${dto.qna_indent }">&nbsp&nbsp
									</c:forEach> <c:if test="${dto.qna_indent>0 }">
										<img src="${pageContext.request.contextPath }/images/re.jpg">
									</c:if> <a href="javascript:read('${dto.qna_num}')"> <span
										style="color: red; font-weight: bold">${dto.qna_title}</span></a>
									<c:if test="${util:newImg(dto.qna_wdate) }">
										<img src="${pageContext.request.contextPath }/images/new.gif">
									</c:if></td>
								<td>${dto.qna_viewcnt }</td>
								<td>관리자</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			<tbody>
				<c:choose>
					<c:when test="${empty list }">
						<tr>
							<td colspan="6">등록된 글이 없음</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="dto" items="${list }">
							<tr>
								<td>${dto.qna_num}</td>
								<td><c:forEach begin="1" end="${dto.qna_indent }">&nbsp&nbsp
									</c:forEach> <c:if test="${dto.qna_indent>0 }">
										<img src="${pageContext.request.contextPath }/images/re.jpg">
									</c:if> <a href="javascript:read('${dto.qna_num}')">${dto.qna_title}</a>
									<c:if test="${util:newImg(dto.qna_wdate) }">
										<img src="${pageContext.request.contextPath }/images/new.gif">
									</c:if></td>
								<td>${dto.qna_viewcnt }</td>
								<td>${dto.member_id}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<div>${paging }</div>
		<br>
		<br>
		<br>

		<form class="form-inline" action="./listQna">
			<div align="center">
				<div class="form-group">
					<select class="form-control" name="col" id="qna_select">
						<option value="member_id"
							<c:if test="${col=='member_id' }">selected</c:if>>성명</option>
						<option value="title"
							<c:if test="${col=='qna_title' }">selected</c:if>>제목</option>
						<option value="content"
							<c:if test="${col=='qna_content' }">selected</c:if>>내용</option>
						<option value="title_content"
							<c:if test="${col=='qna_title_content' }">selected</c:if>>제목+내용</option>
						<option value="total"
							<c:if test="${col=='total' }">selected</c:if>>전체검색</option>
					</select>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="검색어 입력"
						name="word" value="${word}" id="qna_input">
				</div>
				<button type="submit" class="btn">검색</button>
				<button type="button" class="btn"
					onclick="location.href='./createQna'">등록</button>
			</div>
		</form>


	</div>
</body>
</html>