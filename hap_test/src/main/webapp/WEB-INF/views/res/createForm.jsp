<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
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
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

.btn {
	height: 3.5rem;
}

.login-main {
	width: 80%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	box-shadow: -60px 0px 120px -90px #000000, 60px 0px 120px -90px #000000;
	background-color: white;
}

.table {
	width: 150%;
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
<meta charset="UTF-8">
<title>예약 접수</title>

<script type="text/javascript">
	function inCheck(f) {
		if (f.agree.checked == false) {
			alert('예약 약관에 동의해야 예약이 가능합니다.');
			document.frm.agree.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container">
		<form class="form-horizontal" action="create" method="post"
			onsubmit="return inCheck(this)" name="frm">
			<%
				int res_rannum = (int) (Math.random() * 100000000);
			%>
			
			<input type="hidden" name="res_rannum" value="<%=res_rannum%>">
			<input type="hidden" name="board_num" value="${param.board_num}">
			<input type="hidden" name="member_id" value="${dto.member_id}">
			<div class="form_group">
				<div class="form-group">
					<div>
						<div class="order_form_term_sub_wrap">
							<div class="form-group">
								<h2>약관 내역</h2>
								<br> <label> 펜션/콘도/카라반 예약 주의사항에 동의 내용</label>
							</div>
							<div class="order_form_term_text">
								<p>1. 홈페이지를 통하여 예약 진행시 회원 혜택을 받을 수 있습니다.(현장 직접 예약시 혜택 불가)</p>
								<p>2. 당일 예약은 불가하며, 토/일/월요일 이용은 금요일 오후 16시까지 입금확인 시 예약이
									완료됩니다.</p>
								<p>3. 객실은 입금 선착순 마감됩니다.(입금 안내 문자 전송 후 24시간 이내 미입금 시 예약 자동취소)</p>
								<p>
									4. 기준인원에 대한 객실 요금입니다.(숙박업체 규정 안내사항)<br> (기준인원 초과 시 1인당
									인원추가 비용 발생 / 최대 인원 초과 시 예약 완료라도 입실이 거부 될 수 있으며, 예약 금액은 반환되지
									않습니다.)
								</p>
								<p>5. 예약 완료 후 취소 시에는 해당 숙박업체의 환불 규정에 따라 위약금이 발생됩니다.(예약완료 후
									변경 시에도 동일 적용)</p>
								<p>6. 고객센터 이용 시간(10시 - 17시) 이외의 요청은 익일로 처리되오니 참고 바랍니다.</p>
								<p>7. 해당 숙박 업체별 입/퇴실 시간을 준수해야 합니다.</p>
								<p>8. 미성년자는 예약을 받지 않습니다.</p>
								<p>9. 애완동물과 함께 입실 할 수 없습니다.</p>
								<p>10. 제휴처는 당사의 사정에 따라 예고 없이 변경 될 수 있습니다.</p>
								<p>11. 성수기 / 연휴 기간에는 이용 금액과 환불 규정이 변경 될 수 있습니다.</p>
								<p>12. 패밀리와 럭셔리 이용은 총 월 2회까지 가능합니다.(연박가능 / 1일 2객실 사용불가)</p>
								<p>13. 당사는 통신판매 중개자로 펜션운영은 펜션주의 책임하에 운영되고 있습니다. 펜션 현장에서 일어난
									일에 대해서는 당사의 책임이 없습니다.</p>
								<p>14. 당사는 숙박상품의 판매대행처로 소득세법과 부가가치세법에 따라 세금계산서 발행이 불가합니다.(단,
									현금영수증 발급은 가능)</p>
							</div>
							<div class="form-group">
								<label> 이용시 유의사항에 동의 내용</label>
							</div>
							<div class="order_form_term_text">
								※ 위 금액은 기준인원에 대한 객실 요금입니다. 기준인원 초과 시 1인당 인원추가 비용이 발생됩니다.<br>
								사전에 협의 되지 않은 방문객 또는 영·유아 포함 최대인원 초과 시에는 <br> 예약완료임에도 불구하고
								입실이 거부 될 수 있으며, 예약 금액은 반환되지 않습니다.<br> ※ 인원추가비용: 0세 부터 1만원<br>
								※ 입실시간: 오후 3시 , 퇴실시간: 오전 11시 <br> (22시 이후의 입실은 사전에 반드시 연락을
								주시기 바랍니다.)<br> ※ 부대시설 : 바베큐<br> - 바베큐 (숯,그릴) 2인
								15,000원<br> ※ 환불 규정 안내 (이용일 기준)<br> 기본 위약금 10%, 5일전
								90% 환불, 4일전 80% 환불, 3일전 70% 환불, 2일전 50% 환불, 1일전 30% 환불, 당일 환불금액
								없음
							</div>
							<div class="form-group">
								<label> 이용자가 미성년자가 아니며 성인임에 동의 내용</label>
							</div>
							<div>
								<div class="form-group">
									<input id="agree" type="checkbox" name="agree" value="1"><label
										for="agree"> 모두 동의합니다 </label>
								</div>
							</div>
						</div>
					</div>
				</div>
				<br>
				<div class="form-group">
					<div class="form-group">
						<table>
							<colgroup>
								<col style="width: 80px">
								<col style="width: 200px">
								<col style="width: 80px">
								<col style="width: 80px">
							</colgroup>
							<thead>
								<tr>
									<td colspan="2"><h3>예약 하기</h3></td>
								</tr>
								<tr>
									<th>선택하기</th>
									<th>객실명</th>
									<th>기준인원</th>
									<th>최대인원</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty room_hap }">
										<tr>
											<td colspan="4">등록된 방정보가 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="dto" items="${room_hap}">
											<tr>
												<td><input type="radio" name="room_num"
													id="${dto.room_num}" value="${dto.room_num }"
													checked="checked"><label for="${dto.room_num }">선택</label></td>
												<td>${dto.room_name}</td>
												<td>2명</td>
												<td>${dto.room_max }명</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>

				<div class="container-notice">
								<p>예약정보입력</p>
								<div>
									<table>
										<tbody>
											<tr>
												<th>성명(예약자)</th>
												<td><input type="text" name="" id=""
													value="${dto.member_name }" disabled></td>
											</tr>
											<tr>
												<th>전화번호</th>
												<td><input type="text" name=""
													value="${dto.member_phone }" id="" disabled></td>
											</tr>
											<tr>
												<th>E-MAIL</th>
												<td><input type="text" name=""
													value="${dto.member_email }" id="" disabled></td>
											</tr>
											<tr>
												<th>성명(실사용자) <span id="need">*</span></th>
												<td><input type="text" name="res_name" id="res_name"
													required>
													<p>
														<span id="need"> ※ 회원명으로 예약되며, 모든 연락은 실사용자로 진행됩니다.
														</span>
													</p></td>
											</tr>
											<tr>
												<th>휴대전화(실사용자) <span id="need">*</span></th>
												<td><input type="text" name="res_phone" id="res_phone"
													required></td>
											</tr>
											<tr>
												<th>남기실말</th>
												<td><textarea name="res_content" id="res_content"
														style="width: 265px; height: 81px;"></textarea></td>
											</tr>
											<tr>
												<td>입실일<span id="need">*</span></td>
												<td><input class="col-sm-4" type="date" name="res_res1"
													id="res_res1" required></td>
											</tr>
											<tr>
												<td>퇴실일<span id="need">*</span></td>
												<td><input class="col-sm-4" type="date" name="res_res2"
													id="res_res2" required></td>
											</tr>
											<tr>
												<td>총인원<span id="need">*</span></td>
												<td><input type="text" name="res_people"
													id="res_people" placeholder="2" class="form-control"
													required="required"> <span id="need"> ※ 기준인원
														초과 시 인원추가비용 발생<br>※ 영유아 or 방문객 포함 최대인원 초과 시 예약 불가합니다.
												</span></td>
											</tr>
											<tr>
												<th>결제방식</th>
												<td>무통장입금
													<p>
														<span id="need"> ※ 반드시 고객센터에서 안내 받으신 후 진행 해주십시오.<br>
															※ 결제금액은 유선안내드립니다.
														</span>
													</p>
												</td>
											</tr>
											<tr>
												<th>입금계좌정보</th>
												<td>${dto_b.board_account}</td>
											</tr>
											<tr>
												<th>입금자명 <span id="need">*</span></th>
												<td><input type="text" class="form-control" name=""
													id=""></td>
											</tr>
											<tr>
												<th>현금영수증<br> 123
												</th>
												<td><input id="agree1" type="checkbox" name=""
													value="1"><label for="agree1"><span
														id="need"> 등록된 핸드폰 번호로 처리되며, 변경 시 해당 업소에 연락하시길
															바랍니다. </span> </label></td>
											</tr>
										</tbody>
									</table>
									<div class="form-group" align="center">
										<div class="col-sm-offset-2 col-sm-8">
											<button type="submit" class="btn">상담 접수</button>
											<button type="reset" class="btn">다시 작성</button>
										</div>
									</div>
								</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>