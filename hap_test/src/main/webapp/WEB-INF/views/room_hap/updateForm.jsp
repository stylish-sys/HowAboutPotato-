<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>방 정보 수정</title>
</head>
<body>
	<div class="container">
		<h1 class="col-sm-offset-2 col-sm-10">방 등록</h1>
		
		<input type="hidden" name="col" value="${param.col }">	
		<input type="hidden" name="word" value="${param.word }">
		<input type="hidden" name="nowPage" value="${param.nowPage }">

		<form class="form-horizontal" action="update" method="post" name='frm'
			enctype="multipart/form-data">
		

			<div class="form-group">
				<label class="control-label col-sm-2" for="room_name">방 이름</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="room_name"
						placeholder="${dto.room_name }" name="room_name" >
					<!-- id->room_name -->
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="room_price">가격:</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="room_price"
						placeholder="${dto.room_price }" name="room_price">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="room_max">최대 숙박인원:</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="room_max"
						placeholder="${dto.room_max }" name="room_max">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="room_content">방정보:</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="room_content"
						placeholder="${dto.room_content }" name="room_content">
				</div>
			</div>
		<input type="hidden" name="board_num" value=${param.board_num}>
		<input type="hidden" name="room_num" value=${dto.room_num}>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8">
					<button type="submit" class="btn">등록</button>
					<button type="reset" class="btn">취소</button>
				</div>
			</div>
		</form>

	</div>
</body>
</html>