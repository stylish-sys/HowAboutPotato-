<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  
</head>
<body> 


<div class = "container">

<form class = "form-horizontal" action = "delete" method = "post" >

	<input type ="hidden" name="room_num" value="${param.room_num}">
	<input type ="hidden" name="board_num" value="${param.board_num}">
	<input type = "hidden" name = "oldfile" value = "${param.oldfile }">

<div class = "jumbotron">
	<h3>삭제확인</h3>
	  <p>삭제를 하면 복구 될 수 없습니다.<br><br>
	삭제하시려면 삭제버튼을 클릭하세요<br><br></p>
</div>

	<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8">
					<button type="submit" class="btn">삭제</button>
					<button type="reset" class="btn" onclick="history.back()">취소</button>
				</div>
			</div>

</form>
</div>
</body>
</html>
