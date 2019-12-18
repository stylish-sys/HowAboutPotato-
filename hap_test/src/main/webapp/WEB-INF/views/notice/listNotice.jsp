<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>

<!DOCTYPE html>
<html>
<head>
<title>Notice List</title>
<meta charset="utf-8">
<style type="text/css">
#notice_select {width =50px;
	
}

#notice_input {width =200px;
	
}

head {
	color: #FF0000;
}
</style>
<script type="text/javascript">
	function read(notice_num) {
		var url = "readNotice";
		url += "?notice_num=" + notice_num;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;
	}
</script>
</head>
<body>
	<div class="container">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>조회수</th>

				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty list_Y }">
						<tr>
							<td colspan="6">등록된 공지사항이 없음</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="dto" items="${list_Y }">
							<tr>
								<td>${dto.notice_num}</td>

								<td><a href="javascript:read('${dto.notice_num}')"> <span
										style="color: red; font-weight: bold">
											${dto.notice_title} </span>
								</a> <c:if test="${util:newImg(dto.notice_wdate)}">
										<img src="${pageContext.request.contextPath }/images/new.gif">
									</c:if></td>

								<td>관리자</td>
								<td>${dto.notice_wdate }</td>
								<td>${dto.notice_viewcnt }</td>

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
								<td>${dto.notice_num}</td>
								<td><a href="javascript:read('${dto.notice_num}')">${dto.notice_title}</a>
									<c:if test="${util:newImg(dto.notice_wdate)}">
										<img src="${pageContext.request.contextPath }/images/new.gif">
									</c:if></td>
								<td>관리자</td>
								<td>${dto.notice_wdate }</td>
								<td>${dto.notice_viewcnt }</td>

							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>

		<div>${paging }</div>
		<br> <br> <br>
		<form class="form-inline" action="./listNotice">
			<div align="center">
				<div class="form-group">
					<select class="form-control" name="col" id="notice_select">
						<option value="title"
							<c:if test="${col=='notice_title' }">selected</c:if>>제목</option>
						<option value="content"
							<c:if test="${col=='notice_content' }">selected</c:if>>내용</option>
						<option value="title_content"
							<c:if test="${col=='notice_title_content' }">selected</c:if>>제목+내용</option>
						<option value="total"
							<c:if test="${col=='total' }">selected</c:if>>전체검색</option>
					</select>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="검색어 입력"
						name="word" value="${word}" id="notice_input">
				</div>
				<button type="submit" class="btn">검색</button>

				<c:if
					test="${not empty sessionScope.member_id && sessionScope.member_grade=='H' }">
					<button type="button" class="btn"
						onclick="location.href='./createNotice'">등록</button>
				</c:if>
			</div>
		</form>
	</div>
</body>
</html>