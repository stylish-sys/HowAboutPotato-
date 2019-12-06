<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<meta charset="utf-8">

<script type="text/javascript">
 function idFind(){
	 var url="idFind";
	 
	 var wr= window.open(url,"아이디찾기","width=400, height=350");
		wr.moveTo((window.screen.width-400)/2, (window.screen.height-350)/2); 	  
 }  
 
 function passwdFind(){
	 var url="passwdFind";
	 
	 var wr= window.open(url,"비밀번호찾기","width=400, height=450");
		wr.moveTo((window.screen.width-400)/2, (window.screen.height-450)/2); 	 
 }
  
 </script>

</head>
<body>
	<div class="container">
	<br>
		<h1 class="col-sm-offset-2 col-sm-10">Log-in</h1>

		<form class="form-horizontal"
			action="${pageContext.request.contextPath}/member_hap/login"
			method="post" name="frm">
			
			<input type="hidden" name="rurl" value="${param.rurl }">
			<input type="hidden" name="member_num" value="${param.member_num }">
			<input type="hidden" name="nowPage" value="${param.nowPage }">
			<input type="hidden" name="nPage" value="${param.nPage }">
			<input type="hidden" name="col" value="${param.col }">
			<input type="hidden" name="word" value="${param.word }">
			
				
			<div class="form-group">
			
				<label class="control-label col-sm-2" for="member_id">아이디:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="member_id"
						placeholder="Enter id" name="member_id" required="required">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="member_passwd">비밀번호:</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="member_passwd"
						placeholder="Enter password" name="member_passwd" required="required">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8">
					<div class="checkbox">
						<label> <c:choose>
								<c:when test="${c_member_id=='Y' }">
									<input type="checkbox" name="c_member_id" value="Y" checked="checked"> Remember ID
          	</c:when>
								<c:otherwise>
									<input type='checkbox' name='c_member_id' value='Y'> Remember ID
          	</c:otherwise>
							</c:choose>
						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8">
					<button type="submit" class="btn">로그인</button>

					<button type="button" class="btn"
						onclick="location.href='agree'">회원가입</button>
					<button type="button" class="btn" onclick="idFind()">아이디 찾기</button>
					<button type="button" class="btn" onclick="passwdFind()">비밀번호 찾기</button>
				</div>
			</div>
		</form>
	</div>

</body>
</html>