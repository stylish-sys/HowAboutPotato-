<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script type="text/javascript">
	function read(memono) {
		var url = "read";
		url += "?memono="+memono;
		
		url+="&col=${col}";
		url+="&word=${word}";
		url+="&nowPage=${nowPage}";
		location.href = url;
	}
</script>

</head>
<body>
	<div class="container">

		<h2>메모 목록</h2>
		<form class="form-inline" action="./list">
			<div class="form-group">
				<select class="form-control" name="col">
					<option value="title" <c:if test="${col=='title' }">selected</c:if>>제목	</option>
					<option value="content"<c:if test="${col=='content' }">selected</c:if>>내용</option>
					<option value="title_content"<c:if test="${col=='title_content' }">selected</c:if>>제목+내용</option>
					<option value="total" <c:if test="${col=='total' }">selected</c:if>>전체</option>
				</select>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Enter 검색어"
					name="word" value="${word}">
			</div>
			<button class="btn btn-default">검색</button>
			<button type="button" class="btn btn-default"
				onclick="location.href='create'">등록</button>
		</form>
		
		<table class="table table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${empty list}">						
					<tr>
						<td colspan="4">등록된 메모가 없습니다.</td>
					<tr>
				</c:when>
		        <c:otherwise>	
					<c:forEach var="dto" items="${list }">
                    <tr>
					<td>${dto.memono}</td>
					<td><a href="javascript:read('${dto.memono}')">${dto.title}</a>
						<c:if test="${Utility.compareDAy(dto.wdate)}">
							<img src="${root }/images/new1.gif">
						</c:if></td>

					<td>${dto.wdate}</td>
					<td>${dto.viewcnt}</td>
					</tr>
					</c:forEach>
			  </c:otherwise>
			</c:choose>
			</tbody>
		</table>
		<div>
			${paging}
		</div>
	</div>
</body>
</html>
