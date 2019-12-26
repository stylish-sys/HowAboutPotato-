<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css?family=Noto+Sans+KR:700&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css?family=Nanum+Gothic:700&display=swap')
	;

.btn {
	height: 3.5rem;
}

input[type="text"], input[type="password"], input[type="email"], select
	{
	height: 3.5rem;
	font-size: 1.5rem;
}

table, .td {
	border: 1px solid black;
}

table {
	width: 100%;
	heigth: 100px;
	margin: auto;
	text-align: center;
	text-valign: middle;
}

.list-title {
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 4rem;
}

.list-container {
	width: 100%;
	height: 80vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

.list-content {
	width: 23.5vw;
	height: 20vh;
	display: flex;
	margin: 3%;
	flex-direction: row;
	-webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px
		rgba(0, 0, 0, 0.1) inset;
	-moz-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px
		rgba(0, 0, 0, 0.1) inset;
	box-shadow: 0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1)
		inset;
}

.list-content-picture {
	width: 20vw;
	height: 20vh;
	background-color: gray;
}

.list-content-content {
	width: 30vw;
	height: 20vh;
	display: flex;
	justify-content: space-evenly;
	align-items: flex-end;
	flex-direction: column;
}

.list-content-content-title {
	width: 96%;
	height: 30%;
	font-size: 2rem;
	font-family: 'Nanum Gothic', sans-serif;
	text-align: start;
}

.list-content-content-review {
	
}

.list-content-content-price {
	color: #de2e5f;
	font-size: 2rem;
}

.list-content-content-sale {
	width: 35%;
	height: 15%;
	text-align: end;
	display: flex;
	flex-direction: row;
	border: 1px solid #de2e5f;
}

.list-content-content-sale-content1 {
	width: 50%;
	height: 100%;
	color: white;
	background-color: #de2e5f;
	display: flex;
	align-items: center;
	justify-content: center;
}

.list-content-content-sale-content2 {
	width: 50%;
	height: 100%;
	color: #de2e5f;
	display: flex;
	align-items: center;
	justify-content: center;
}

.list-content-content-delete {
	width: 100%;
	text-align: end;
	height: 15%;
	color: #d3d3d3;
	font-size: 2rem;
}

.list-ad-container {
	width: 20vw;
	height: 40vh;
	border-radius: 10%;
	background-color: gray;
	margin: 1%;
}

.list-ad-container {
	text-align: center;
	height: 25vh;
	display: flex;
	width: 15vw;
	flex-direction: column;
	justify-content: space-around;
	align-items: center;
}

.list-ad-container img {
	display: block;
	border-radius: 5%;
	height: 100;
	height: 25vh;
	width: 15vw;
	position: absolute;
	z-index: 1;
}

.list-ad-container-ad {
	z-index: 2;
	width: 90%;
	height: 15%;
	display: flex;
	justify-content: space-between;
	align-items: center;
	color: white;
}

.list-ad-container-ad1 {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: white;
	color: black;
	border-radius: 10%;
	width: 13%
}

.list-ad-container-ad2 {
	font-family: 'Noto Sans KR', sans-serif;
	color: #d3d3d3;
	border: 2px solid #d3d3d3;
	border-radius: 10%;
	opacity: 0.5;
	width: 13%
}

.list-ad-container-content {
	z-index: 2;
	width: 90%;
	text-align: start;
	height: 60%;
	display: flex;
	flex-direction: column;
	justify-content: flex-end;;
}

.list-ad-container-content1 {
	z-index: 2;
	font-size: 2rem;
	color: white;
}

.list-ad-container-content2 {
	z-index: 2;
	color: white;
	opacity: 0.8;
}

.list-mini-container {
	text-align: center;
	height: 10vh;
	display: flex;
	width: 10vh;
	flex-direction: row;
	justify-content: space-around;
	align-items: center;
	z-index: 2;
	color: white;
	font-size: 2rem;
	margin: 0.5%;
	font-family: 'Noto Sans KR', sans-serif;
}

.list-mini-container img {
	display: block;
	border-radius: 40%;
	height: 100;
	height: 10vh;
	width: 10vh;
	position: absolute;
	z-index: 1;
	height: 100;
	height: 10vh;
	width: 10vh;
	position: absolute;
}

.list-mini-list {
	width: 100%;
	height: 20%;
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
}

.lsit-ad-list {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: row;
	width: 100%;
	height: 30%;
}

.list-main-container {
	display: flex;
	flex-direction: row;
	width: 100%;
	heght: 100vh;
	justify-content: center;
	align-items: center;
	margin-top: 5%;
	margin-bottom: 5%;
}

.list-main-container1 {
	display: flex;
	flex-direction: column;
	width: 40%;
	align-items: center;
	border-right: 1px solid #d3d3d3;
}

.list-main-container2 {
	width: 40%;
	display: flex;
	align-items: center;
	flex-direction: column;
}
</style>

<script type="text/javascript">
	function read(board_num) {
		var url = "${pageContext.request.contextPath}/board_hap/read";
		url += "?board_num=" + board_num;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;
	}
</script>

</head>
<body>
	<input type = "hidden" name = "word" value = "${param.word }">
	<input type = "hidden" name = "col" value = "${param.col }">
	<input type = "hidden" name = "nowPage" value = "${param.nowPage }">
	<div class="container">
		<br>
		<form class="form-inline" method="post" action="list">
			<div class="form-group">
				<h2>실시간 빈 방 검색</h2>
			</div>
		<br>
		<div class="list-mini-list">
		<div class="list-mini-container">
			<img
				src="http://ihg.scene7.com/is/image/ihg/even-hotels-eugene-5405616297-4x3" />
			<div class="list-mini-container">호텔</div>
		</div>
		<div class="list-mini-container">
			<img
				src="http://ihg.scene7.com/is/image/ihg/even-hotels-eugene-5405616297-4x3" />
			<div class="list-mini-container">호텔</div>
		</div>
		<div class="list-mini-container">
			<img
				src="http://ihg.scene7.com/is/image/ihg/even-hotels-eugene-5405616297-4x3" />
			<div class="list-mini-container">호텔</div>
		</div>
		<div class="list-mini-container">
			<img
				src="http://ihg.scene7.com/is/image/ihg/even-hotels-eugene-5405616297-4x3" />
			<div class="list-mini-container">호텔</div>
		</div>
		<div class="list-mini-container">
			<img
				src="http://ihg.scene7.com/is/image/ihg/even-hotels-eugene-5405616297-4x3" />
			<div class="list-mini-container">호텔</div>
		</div>
		<div class="list-mini-container">
			<img
				src="http://ihg.scene7.com/is/image/ihg/even-hotels-eugene-5405616297-4x3" />
			<div class="list-mini-container">호텔</div>
		</div>
	</div>
	<div class="lsit-ad-list">
		<div class="list-ad-container">
			<img
				src="http://ihg.scene7.com/is/image/ihg/even-hotels-eugene-5405616297-4x3" />
			<div class="list-ad-container-ad">
				<div class="list-ad-container-ad1">강원</div>
				<div class="list-ad-container-ad2">AD</div>
			</div>
			<div class="list-ad-container-content">
				<div class="list-ad-container-content1">강원 한라 호텔</div>
				<div class="list-ad-container-content2">바로 예약하기 ></div>
			</div>
		</div>
		<div class="list-ad-container">
			<img
				src="http://ihg.scene7.com/is/image/ihg/even-hotels-eugene-5405616297-4x3" />
			<div class="list-ad-container-ad">
				<div class="list-ad-container-ad1">강원</div>
				<div class="list-ad-container-ad2">AD</div>
			</div>
			<div class="list-ad-container-content">
				<div class="list-ad-container-content1">강원 한라 호텔</div>
				<div class="list-ad-container-content2">바로 예약하기 ></div>
			</div>
		</div>
		<div class="list-ad-container">
			<img
				src="http://ihg.scene7.com/is/image/ihg/even-hotels-eugene-5405616297-4x3" />
			<div class="list-ad-container-ad">
				<div class="list-ad-container-ad1">강원</div>
				<div class="list-ad-container-ad2">AD</div>
			</div>
			<div class="list-ad-container-content">
				<div class="list-ad-container-content1">강원 한라 호텔</div>
				<div class="list-ad-container-content2">바로 예약하기 ></div>
			</div>
		</div>
	</div>
	<div class="list-main-container">
		<div class="list-main-container1">
			<div class="list-content">
				<div class="list-content-picture"></div>
				<div class="list-content-content">
					<div class="list-content-content-title">강릉 마젤란펜션
						(주문진해수욕장,MD추천)</div>
					<div class="list-content-content-review">후기 n개</div>
					<div class="list-content-content-sale">
						<div class="list-content-content-sale-content1">선착순</div>
						<div class="list-content-content-sale-content2">5개</div>
					</div>
					<div class="list-content-content-delete">
						<del>250,000</del>
					</div>
					<div class="list-content-content-price">42% -> 120,000</div>
				</div>
			</div>
			<div class="list-content">
				<div class="list-content-picture"></div>
				<div class="list-content-content">
					<div class="list-content-content-title">강릉 마젤란펜션
						(주문진해수욕장,MD추천)</div>
					<div class="list-content-content-review">후기 n개</div>
					<div class="list-content-content-sale">
						<div class="list-content-content-sale-content1">선착순</div>
						<div class="list-content-content-sale-content2">5개</div>
					</div>
					<div class="list-content-content-delete">
						<del>250,000</del>
					</div>
					<div class="list-content-content-price">42% -> 120,000</div>
				</div>
			</div>
			<div class="list-content">
				<div class="list-content-picture"></div>
				<div class="list-content-content">
					<div class="list-content-content-title">강릉 마젤란펜션
						(주문진해수욕장,MD추천)</div>
					<div class="list-content-content-review">후기 n개</div>
					<div class="list-content-content-sale">
						<div class="list-content-content-sale-content1">선착순</div>
						<div class="list-content-content-sale-content2">5개</div>
					</div>
					<div class="list-content-content-delete">
						<del>250,000</del>
					</div>
					<div class="list-content-content-price">42% -> 120,000</div>
				</div>
			</div>
		</div>
		<div class="list-main-container2">
			<div class="list-content">
				<div class="list-content-picture"></div>
				<div class="list-content-content">
					<div class="list-content-content-title">강릉 마젤란펜션
						(주문진해수욕장,MD추천)</div>
					<div class="list-content-content-review">후기 n개</div>
					<div class="list-content-content-sale">
						<div class="list-content-content-sale-content1">선착순</div>
						<div class="list-content-content-sale-content2">5개</div>
					</div>
					<div class="list-content-content-delete">
						<del>250,000</del>
					</div>
					<div class="list-content-content-price">42% -> 120,000</div>
				</div>
			</div>
			<div class="list-content">
				<div class="list-content-picture"></div>
				<div class="list-content-content">
					<div class="list-content-content-title">강릉 마젤란펜션
						(주문진해수욕장,MD추천)</div>
					<div class="list-content-content-review">후기 n개</div>
					<div class="list-content-content-sale">
						<div class="list-content-content-sale-content1">선착순</div>
						<div class="list-content-content-sale-content2">5개</div>
					</div>
					<div class="list-content-content-delete">
						<del>250,000</del>
					</div>
					<div class="list-content-content-price">42% -> 120,000</div>
				</div>
			</div>
			<div class="list-content">
				<div class="list-content-picture"></div>
				<div class="list-content-content">
					<div class="list-content-content-title">강릉 마젤란펜션
						(주문진해수욕장,MD추천)</div>
					<div class="list-content-content-review">후기 n개</div>
					<div class="list-content-content-sale">
						<div class="list-content-content-sale-content1">선착순</div>
						<div class="list-content-content-sale-content2">5개</div>
					</div>
					<div class="list-content-content-delete">
						<del>250,000</del>
					</div>
					<div class="list-content-content-price">42% -> 120,000</div>
				</div>
			</div>
		</div>
	</div>
<div class = "list-mini-list">
   		<select name = "col" class = "form-control">
   		 <option value="지역"<c:if test="${col=='지역'}">selected</c:if>>지역을 선택하세요</option>
   		 <option value="강원"<c:if test="${col=='강원'}">selected</c:if>>강원</option>
		 <option value="경기"<c:if test="${col=='경기'}">selected</c:if>>경기</option>
		 <option value="서울"<c:if test="${col=='서울'}">selected</c:if>>서울</option>
		 <option value="제주"<c:if test="${col=='제주'}">selected</c:if>>제주</option>
		 <option value="전라"<c:if test="${col=='전라'}">selected</c:if>>전라</option>
		 <option value="충청"<c:if test="${col=='충청'}">selected</c:if>>충청</option>
		 <option value="경상"<c:if test="${col=='경상'}">selected</c:if>>경상</option>
   		</select>
		 <input type="text" class="form-control" name="word" value="${word }" placeholder = "상세주소">
				<button class="btn">검색</button>
   </div>

			<div class="form-inline">
			</div>


			<c:if
				test="${not empty sessionScope.member_id &&sessionScope.member_grade =='H' }">
				<button class="btn" type="button"
					onclick="location.href='${pageContext.request.contextPath}/board_hap/create'">업소등록</button>
			</c:if>

		</form>


		<c:forEach var="dto" items="${list }">

			<table>
				<thead>
					<tr>
						<th>사진</th>
						<th>숙박명</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><img
							src="${pageContext.request.contextPath}/storage/${dto.board_filename}"
							class="img-rounded " width="100px" height="100px"
							onclick="javascript:read('${dto.board_num}')"></td>
						<td>${dto.board_name}</td><br>
					</tr>
				</tbody>

				<c:if
					test="${not empty sessionScope.member_id &&sessionScope.member_grade =='H' }">
					<button class="btn"
						onclick="location.href='${pageContext.request.contextPath}/board_hap/delete?board_num=${dto.board_num }'">업소
						삭제</button>
					<button class="btn"
						onclick="location.href='${pageContext.request.contextPath}/board_hap/update?board_num=${dto.board_num }'">업소
						정보수정</button>
					<button class="btn"
						onclick="location.href='${pageContext.request.contextPath}/board_hap/updateFile?board_num=${dto.board_num }&oldfile=${dto.board_filename }'">업소
						사진수정</button>
					<br>
				</c:if>

			</table>

		</c:forEach>

		${paging }
	</div>

</body>
</html>