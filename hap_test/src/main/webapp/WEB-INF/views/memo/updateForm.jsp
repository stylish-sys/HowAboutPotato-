<%@ page contentType="text/html; charset=UTF-8"%>


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
	<script>
	function list() {
		var url = "list";
		url	+= "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;

	}</script>
</head>
<body>
	<div class="container">
		<h1 class="col-sm-offset-2 col-sm-10">메모 수정</h1>
		<form class="form-horizontal" action="update" method="post">
			<input type="hidden" name="memono" value="${param.memono }">
			<input type="hidden" name="col" value="${param.col }">
			<input type="hidden" name="word" value="${param.word}">
			<input type="hidden" name="nowPage" value="${param.nowPage }">
			<div class="form-group">
				<label class="control-label col-sm-2" for="title">제목</label>
				<div class="col-sm-6">
					<input type="text" name="title" id="title" class="form-control"
						value="${dto.title }">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="content">내용</label>
				<div class="col-sm-6">
					<textarea rows="5" cols="5" id="content" name="content"
						class="form-control">${dto.content }</textarea>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-5">
					<button class="btn" type="submit">수정</button>
					<button type="button" class="btn" onclick="list()">취소</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
