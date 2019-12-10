<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>방 등록</title>
</head>
<body>

	<div class="container">
	<br>
	<br>
		<h1 class="col-sm-offset-2 col-sm-10">방 등록</h1>

		<form class="form-horizontal" action="create" method="post" name='frm'
			enctype="multipart/form-data">
		
			<div class="form-group">
				<label class="control-label col-sm-2" for="room_filename">방 사진</label>
				<div class="col-sm-6">
					<input type="file" class="form-control" id="room_filename"
						name="room_filenameMF" accept=".jpg,.gif,.png">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="room_name">방 이름</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="room_name"
						placeholder="방 이름을 입력하세요" name="room_name">
					<!-- id->room_name -->
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="room_price">가격:</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="room_price"
						placeholder="방의 가격을 입력하세요" name="room_price">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="room_max">최대 숙박인원:</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="room_max"
						placeholder="방 최대 인원을 입력하세요" name="room_max">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="room_content">방정보:</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="room_content"
						placeholder="방 정보를 입력하세요" name="room_content">
				</div>
			</div>
		<input type="hidden" name="board_num" value=${param.board_num}>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8">
					<button type="submit" class="btn btn-default">등록</button>
					<button type="reset" class="btn btn-default">취소</button>
				</div>
			</div>
		</form>

	</div>
</body>
</html>