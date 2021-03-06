<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice read</title>
<script src="https://kit.fontawesome.com/4c89f26522.js"
	crossorigin="anonymous"></script>
<script type="text/javascript">
	function listNotice() {
		var url = "listNotice";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
	function updateNotice() {
		var url = "updateNotice";
		url += "?notice_num=${dto.notice_num}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		url += "&notice_oldname=${dto.notice_filename}";
		location.href = url;
	}
	function deleteNotice() {
		var url = "deleteNotice";
		url += "?notice_num=${dto.notice_num}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		url += "&notice_oldname=${dto.notice_filename}";
		location.href = url;
	}

	$(document).ready(function() {

		var menu = $('.main-banner').offset();
		$(window).scroll(function() {
			$('.main-banner').removeClass('fixed');
		});
	});
</script>
<style>
@import
	url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap')
	;

.container {
	display: flex;
	justify-content: center;
	align-items: center;
}

.read-notice-main {
	width: 45%;
	height: 60vh;
	background-color: #ebe7f1;
	box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.3);
	display: flex;
	justify-content: flex-end;
	align-items: center;
	flex-direction: column;
	border-radius: 1%;
	margin: 5%;
	font-family: 'Noto Sans KR', sans-serif;
}

.read-notice-title {
	display: flex;
	justify-content: space-around;
	align-items: center;
	width: 100%;
	height: 5rem;
	font-size: 3rem;
	/* border-top: 1px solid black; */
	/* border-bottom: 1px solid black; */
	background-color: #f2fcf6;
}

.read-notice-title-writer {
	display: flex;
	justify-content: flex-start;
	width: 30%;
	align-items: center;
	background-color: none;
}

.read-notice-title-content {
	display: flex;
	justify-content: flex-start;
	width: 60%;
	background-color: none;
	font: bold;
}

.container {
	flex-direction: column;
}

.read-notice-count {
	display: flex;
	justify-content: flex-end;
	align-items: center;
	width: 90%;
	height: 6%;
	flex-direction: flex-end;
	background-color: white;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

.read-notice-count div {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 25%;
	height: 6%;
	flex-direction: flex-end;
	background-color: white;
}

.read-notice-content {
	height: 88%;
	width: 100%;
	background-color: white;
	display: flex;
	justify-content: space-evenly;
	align-items: center;
	flex-direction: column;
}

.read-notice-content-file {
	height: 6%;
	width: 100%;
	background-color: white;
	display: flex;
	justify-content: flex-end;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

.read-notice-content-content {
	height: 80%;
	width: 80%;
	background-color: white;
}

.read-notice-etc {
	display: flex;
	flex-direction: row;
	justify-content: flex-end;
	width: 80%;
}

.read-notice-title-eye {
	width: 19%;
	display: flex;
	justify-content: flex-end;
}

.read-notice-title-writer {
	display: flex;
	justify-content: flex-end;
	width: 30%;
	align-items: center;
	background-color: none;
}

.read-notice-etc {
	display: flex;
	flex-direction: row;
	justify-content: flex-end;
	width: 80%;
}

.read-notice-content-content {
	height: 80%;
	width: 70%;
	background-color: white;
	font-size: 1.7rem;
}

.read-notice-etc {
	display: flex;
	flex-direction: row;
	justify-content: flex-end;
	width: 80%;
	height: 7%;
	border-radius: 2%;
}
</style>
</head>
<body>
	<div class="container">
		<div class="read-notice-main">
			<div class="read-notice-etc">
				<div class="read-notice-title-writer">
					<i class="fas fa-pencil-alt"></i>&nbsp;&nbsp;관리자
				</div>
				<div class="read-notice-title-writer">
					<i class="fas fa-calendar-week"></i>&nbsp;&nbsp;${dto.notice_wdate }
				</div>
				<div class="read-notice-title-eye">
					<div class="read-notice-title-writer">
						<i class="fas fa-eye"></i>&nbsp;&nbsp;${dto.notice_viewcnt }
					</div>
				</div>
			</div>
			<div class="read-notice-title">
				<div class="read-notice-title-content">${dto.notice_title }</div>
			</div>
			<div class="read-notice-content">

				<div class="read-notice-content-content">${dto.notice_content }
				</div>
			</div>
			<div align="center">
				<c:if
					test="${dto.member_id == sessionScope.member_id || sessionScope.member_grade=='H' }">
					<button class="btn" onclick="updateNotice()">수정</button>
					<button class="btn" onclick="deleteNotice()">삭제</button>
				</c:if>
				<button class="btn" onclick="history.back()">목록</button>
			</div>
		</div>

	</div>
	<!-- container -->
</body>
</html>