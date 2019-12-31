<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>예약 취소</title>
<meta charset="utf-8">
<script type="text/javascript">
	function list() {
		var url = "list";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
</script>
<style>
@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');
.delete-container {
	    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.3);
    width: 25vw;
    height: 27vh;
    font-family: 'Noto Sans KR', sans-serif;

}
.container1 {
	width: 100%;
	
    display: flex;
    align-items: center;
    justify-content: center;
    height: 40vh;
}
</style>
</head>
<body>
	<div class="container1">
		<br>
		<br>
		<br>
		<form method="post" class="form-horizontal" action="delete">
			<input type="hidden" name="res_num" value="${param.res_num}">
			<input type="hidden" name="col" value="${param.col }"> <input
				type="hidden" name="word" value="${param.word}"> <input
				type="hidden" name="nowPage" value="${param.nowPage }">

			<div class="delete-container">
				<h3>예약을 취소하시겠습니까?</h3>

				<p>
					예약 취소시 복구 할 수 없습니다.<br> 예약 취소하시려면 취소 버튼을 눌러주세요.<br>
					<br>  취소는 '목록'버튼을 누르세요
				</p>
				<button class="btn" type="submit">취소 요청</button>
			</div>
		</form>
	</div>
</html>