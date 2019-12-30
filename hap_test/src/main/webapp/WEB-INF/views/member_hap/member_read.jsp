<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="userImg" value="${dto.member_fname}" />

<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<meta charset="utf-8">
<script src="https://kit.fontawesome.com/4c89f26522.js"
	crossorigin="anonymous"></script>
<script type="text/javascript">
	function deleteH() {
		var url = "member_delete";
		url += "?member_id=${dto.member_id}";
		url += "&oldfile=${dto.member_fname}";
		location.href = url;
	}

	function updateH() {
		var url = "member_update";
		url += "?member_id=${dto.member_id}";
		url += "&oldfile=${dto.member_fname}";
		location.href = url;
	}

	function updateFile() {
		var url = "member_updateFile";

		url += "?oldfile=${dto.member_fname}";
		location.href = url;
	}

	function updatebFile() {
		var url = "member_updatebFile";

		url += "?oldfile=${dto.member_backfile}";
		location.href = url;
	}

	function updatePW() {
		var url = "member_updatePw";

		location.href = url;
	}

	function updateNick() {
		var url = "member_updateNick";
		url += "?member_nickname=${dto.member_nickname}";
		location.href = url;
	}
</script>
<style>
@import
	url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400&display=swap')
	;

.profile-container {
	width: 100%;
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

.profile-container1 {
	text-align: center;
	height: 30%;
	width: 100%;
	display: flex;
	width: 15vw;
	flex-direction: column;
	justify-content: space-around;
	align-items: center;
	display: flex;
	width: 80%;
}

.profile-container2 {
	text-align: center;
	height: 20%;
	display: flex;
	width: 80%;
	flex-direction: row;
	justify-content: space-around;
	align-items: center;
	z-index: 40;
}

.profile-container3 {
	text-align: center;
	height: 35%;
	display: flex;
	width: 80%;
	flex-direction: row;
	justify-content: space-around;
	align-items: center;
	z-index: 40;
}

.profile-container {
	
}

.profile-container1 {
	background-image:url(/webtest/storage/${dto.member_backfile});
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	z-index: 1;
}

.profile-cover {
	text-align: center;
	height: 45vh;
	display: flex;
	justify-content: center;
	align-items: flex-start;
	z-index: 1;
	position: absolute;
	border-radius: 100%;
}

.profile-cover img {
	display: block;
	border-radius: 100%;
	height: 15vh;
	width: 15vh;
	z-index: 100;
}

.col-md-5 {
	background-color: #7CABB3;
	height: 100%;
	display: flex;
	justify-content: center;
	flex-direction: column;
}

.col-md-2 {
	height: 100%;
}

.line-3 {
	height: 100%;
	background-color: #F6F6FA;
	display: flex;
	flex-direction: column;
	justify-content: space-evenly;
	align-items: center;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.col-md-7 {
	height: 100%;
	background-color: #5AC6C8;
}

.profile-activity {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	align-items: center;
}

.profile-activity-title {
	height: 20%;
	width: 100%;
	display: flex;
	align-items: center;
	color: white;
	font-size: 2.5rem;
}

.profile-activity-res {
	display: flex;
	justify-content: flex-start;
	align-items: center;
	width: 90%;
}

.profile-activity-link {
	width: 100%;
	text-align: end;
	height: 10%;
}

a {
	color: gray;
	text-decoration: none;
	opacity: 0.8;
}

.fa-home {
	font-size: 4rem;
	color: white;
}

.profile-activity-res-content {
	color: white;
	font-size: 2rem;
	text-align: start;
}

.profile-activity-res-detail {
	color: white;
	font-size: 1.5rem;
}

.profile-activity-res-container {
	margin-left: 2%;
}

.profile-nickname {
	height: 85%;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 2rem;
	font-family: 'Nanum Gothic', sans-serif;
}

.porfile-info-title {
	font-size: 2.5rem;
	color: gray;
	width: 95%;
	height: 20%;
	text-align: start;
	display: flex;
	align-items: center;
}

.profile-info-content {
	font-size: 2rem;
	width: 85%;
	height: 17%;
	text-align: start;
	display: flex;
	align-items: center;
	color: gray;
}

.profile-info-content-content {
	font-size: 2rem;
	width: 50%;
	height: 17%;
	text-align: start;
	display: flex;
	align-items: center;
	color: gray;
}

.social-content {
	font-size: 6rem;
	color: white;
}

.profile-social {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 80%;
}

.profile-social-content {
	margin: 10%
}

.profile-id {
	color: white;
	font-size: 3rem;
	height: 80%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.profile-change {
	
}
</style>

</head>
<body>
	<div class="profile-container">
		<div class="profile-container1" onclick="location.href='javascript:updatebFile()'">
		</div>
		<div class="profile-container2">
			<div class="col-md-5">
				<div class="profile-id">${dto.member_id}님!환영합니다.</div>
				<div class="profile-activity-link">
					<a href="javascript:updatePW()">비밀번호 변경 ></a>
				</div>
			</div>
			<div class="col-md-2">
				<div class="profile-nickname">${dto.member_nickname }</div>
				<div class="profile-activity-link">
					<a href="javascript:updateNick()">별명 변경하기 ></a>
				</div>
			</div>
			<div class="col-md-5">
				<div class="profile-social">
					<div class="profile-social-content">
						<a href="https://www.instagram.com/"> <i class="fab fa-instagram social-content"></i>
						</a>
					</div>
					<div class="profile-social-content">
						<a href="https://www.facebook.com/profile.php"> <i class="fab fa-facebook-square social-content"></i>
						</a>
					</div>
					<div class="profile-social-content">
						<a href="https://www.blogger.com/"> <i class="fas fa-blog social-content"></i>
						</a>
					</div>

				</div>
				<div class="profile-activity-link">
					<a link="">소셜 링크 설정하기 ></a>
				</div>
			</div>
		</div>
		<div class="profile-container3">
			<div class="col-md-5 line-3">
				<div class="porfile-info-title">내 정보</div>
				<div class="profile-info-content">
					<div class="profile-info-content-content">이름</div>
					<div class="profile-info-content-content">${dto.member_name }
					</div>
				</div>
				<div class="profile-info-content">
					<div class="profile-info-content-content">이메일</div>
					<div class="profile-info-content-content">${dto.member_email }
					</div>
				</div>
				<div class="profile-info-content">
					<div class="profile-info-content-content">전화번호</div>
					<div class="profile-info-content-content">${dto.member_phone }
					</div>
				</div>
				<div class="profile-info-content">
					<div class="profile-info-content-content">생일</div>
					<div class="profile-info-content-content">
						${dto.member_birth}</div>
				</div>
				<div class="profile-activity-link">
					<a href="javascript:updateH()">내 정보 수정하기 ></a>
				</div>
			</div>
			<div class="col-md-7 profile-activity">
				<div class="profile-activity-title" font="bold">최근 사용 내역</div>
				<c:choose>
					<c:when test="${empty dto_r}">
						<div class="profile-activity-res">
							<i class="fas fa-home"></i>
							<div class="profile-activity-res-container">
								<div class="profile-activity-res-content">예약 내역이 없습니다.</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="dto_r" items="${dto_r}">
							<div class="profile-activity-res">
								<i class="fas fa-home"></i>
								<div class="profile-activity-res-container">
									<div class="profile-activity-res-content"></div>
									<div class="profile-activity-res-detail">예약번호 :
										${dto_r.res_rannum } 일시 : ${dto_r.res_res1 }</div>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<div class="profile-activity-link">
					<a href="${pageContext.request.contextPath }/res/list">전체 내역 보기 ></a>
				</div>
			</div>
		</div>
		<div class="profile-cover">
			<c:if
				test="${not empty sessionScope.member_id &&sessionScope.member_grade !='H' }">
				<a href="javascript:updateFile()"> <c:choose>
						<c:when test="${fn:contains(userImg, 'http')}">
							<img src="${dto.member_fname }" width="250px" height="250px"
								class="img-rounded">
						</c:when>
						<c:otherwise>
							<img
								src="${pageContext.request.contextPath }/storage/${dto.member_fname}"
								width="250px" height="250px" class="img-rounded">

						</c:otherwise>
					</c:choose>
				</a>
			</c:if>
		</div>
	</div>

	<c:if
		test="${not empty sessionScope.member_id &&sessionScope.member_grade =='H' }">
		<button class="btn"
			onclick="location.href='${pageContext.request.contextPath}/admin/member_list'">회원목록</button>
	</c:if>
	<br>
	<br>
	<br>
</body>
</html>