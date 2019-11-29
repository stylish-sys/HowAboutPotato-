<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function updateM(memono) {
		var url = "update";
		url += "?memono=" + memono;
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
	function deleteM(memono) {
		var url = "delete";
		url += "?memono=" + memono;
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
	function listb(){
		var url = "list";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
</script>

</head>
<body>

	<div class="container">

		<h2>조회</h2>
		<div class="panel panel-default">
			<div class="panel-heading">숫자</div>
			<div class="panel-body">${dto.memono}</div>

			<div class="panel-heading">제목</div>
			<div class="panel-body">${dto.title}</div>

			<div class="panel-heading">내용</div>
			<div class="panel-body">${dto.content}</div>

			<div class="panel-heading">조회수</div>
			<div class="panel-body">${dto.viewcnt}</div>

			<div class="panel-heading">등록일</div>
			<div class="panel-body">${dto.wdate}</div>

		</div>


		<div>
			<button class="btn btn-default" onclick="location.href='create'">등록</button>
			<button class="btn btn-default" onclick="updateM('${dto.memono}')">수정</button>
			<button class="btn btn-default" onclick="deleteM('${dto.memono}')">삭제</button>
			<button class="btn btn-default" onclick="history.back()">목록</button>
		</div>

	</div>
</body>
</html>

