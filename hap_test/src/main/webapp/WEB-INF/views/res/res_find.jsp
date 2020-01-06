<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>예약 검색</title>
<meta charset="utf-8">
<style type="text/css">
#need {
	color: red;
}

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
	height: 40vh;
	display: flex;
	width: 30vw;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.3);
}
.container-notice1 {
height: 50vh;
	display: flex;
	justify-content: center;
	align-items: center;
}
.btn {
	height: 3.5rem;
}

.table {
	width: 100%;
	max-width: 100%;
	margin-bottom: 20px;
	box-shadow: -60px 0px 120px -90px #000000, 60px 0px 120px -90px #000000;
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
</head>
<body>
	<div class="container-notice1">
		<br>
		<form class="container-notice" action="res_find" method="post">
			<div align="center">
				<h3>예약 확인</h3>
				<p>예약 시 받은 예약 번호를 정확하게 입력하세요</p>
				<div class="form-group">
					<input type="text" name="res_rannum" id="res_rannum"
						required="required">
				</div>
				<button type="submit">검색</button>
			</div>
		</form>
	</div>
</body>
</html>
