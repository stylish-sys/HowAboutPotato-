<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function idCheck() {
			var url = "id_FindForm";
						
			wr=window.open(url, "id_FindForm", "width=500, height=500");
			wr.moveTo((window.screen.width-500)/2,(window.screen.height-350)/2);
		}

	
	function passwdCheck(){
			var url = "passwd_FindForm";
			
			wr=window.open(url,"email중복확인","width=500, height=500");
			wr.moveTo((window.screen.width-500)/2,(window.screen.height-350)/2);
		}

</script>
<title>로그인 처리</title>
<meta charset="utf-8">
</head>
<body>
	<div class="container">
		<h1 class="col-sm-offset-2 col-sm-10">로그인</h1>
		<form class="form-horizontal"
			action="${pageContext.request.contextPath }/member/login"
			method="post" name="aa">
			<input type="hidden" name="rurl" value="${param.rurl }"/>
			<input type="hidden" name="bbsno" value="${param.bbsno }"/>
			<input type="hidden" name="nowPage" value="${param.nowPage }"/>
			<input type="hidden" name="nPage" value="${param.nPage }"/>
			<input type="hidden" name="col" value="${param.col}"/>
			<input type="hidden" name="word" value="${param.word}"/>
			<div class="form-group">
				<label class="control-label col-sm-2" for="id">아이디</label>
				<div class="col-sm-4">
					<input type="text" name="id" id="id" class="form-control"
						placeholder="Enter ID" required="required" value='${c_id_val}'>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">비밀번호</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="pwd"
						placeholder="Enter password" name="passwd">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8">
					<div class="checkbox">
						<label> <c:choose>
								<c:when test="${c_id=='Y' }">
									<input type='checkbox' name='c_id' value='Y' checked='checked'>
								</c:when>
								<c:otherwise>
									<input type='checkbox' name='c_id' value='Y'> Remember me
								</c:otherwise>
							</c:choose>
						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8">
					<button type="submit" class="btn btn-default">로그인</button>
					<button type="button" class="btn btn-default" onclick="idCheck()">아이디
						찾기</button>
					<button type="button" class="btn btn-default"
						onclick="passwdCheck()">비밀번호 찾기</button>
					<button type="button" class="btn btn-default"
						onclick="location.href='agree'">회원가입</button>
				</div>
			</div>
		</form>

	</div>
</body>
</html>