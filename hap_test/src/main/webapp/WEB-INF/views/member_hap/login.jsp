<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<meta charset="utf-8">
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>
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
<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "BXMDz85NBcpraqKToWuU",
			callbackUrl: "http://localhost:8000/webtest/member_hap/callback",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
	</script>


<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<div class="container">
		<br>
		<h1 class="col-sm-offset-2 col-sm-10">Log-in</h1>

		<form class="form-horizontal"
			action="${pageContext.request.contextPath}/member_hap/login"
			method="post" name="frm">

			<input type="hidden" name="rurl" value="${param.rurl }"> <input
				type="hidden" name="member_num" value="${param.member_num }">
			<input type="hidden" name="nowPage" value="${param.nowPage }">
			<input type="hidden" name="nPage" value="${param.nPage }"> <input
				type="hidden" name="col" value="${param.col }"> <input
				type="hidden" name="word" value="${param.word }">


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
						placeholder="Enter password" name="member_passwd"
						required="required">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8">
					<div class="checkbox">
						<label> <c:choose>
								<c:when test="${c_member_id=='Y' }">
									<input type="checkbox" name="c_member_id" value="Y"
										checked="checked"> Remember ID
          	</c:when>
								<c:otherwise>
									<input type='checkbox' name='c_member_id' value='Y'> Remember ID
          	</c:otherwise>
							</c:choose>
						</label>
					</div>
				</div>
			</div>
			<!-- 네이버아이디로로그인 버튼 노출 영역 -->
			<div id="naverIdLogin"></div>
			<!-- //네이버아이디로로그인 버튼 노출 영역 -->

			<!-- 네이버아디디로로그인 초기화 Script -->

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-8">
					<button type="submit" class="btn">로그인</button>

					<button type="button" class="btn" onclick="location.href='agree'">회원가입</button>
					<button type="button" class="btn" onclick="idFind()">아이디
						찾기</button>
					<button type="button" class="btn" onclick="passwdFind()">비밀번호
						찾기</button>
					<div id="naver_id_login">
						<br> <a href="${url}"> <img src="../images/네이버로 회원가입.png" /></a>
						<a id="kakao-login-btn"><img src="../images/카카오로 회원가입.png"></a>
						<a href="http://developers.kakao.com/logout"></a>


						<!-- Kakao Login -->
<script type="text/javascript">
      // 사용할 앱의 JavaScript 키를 설정해 주세요.
      Kakao.init('40c7acb685fb1a07ba5cb37a10f4029e');
      // 카카오 로그인 버튼을 생성합니다.
      Kakao.Auth.createLoginButton({
        container: '#kakao-login-btn',
        success: function(authObj) {
          // 로그인 성공시, API를 호출합니다.
          Kakao.API.request({
            url: '/v1/user/me',
            success: function(res) {
              console.log(JSON.stringify(res.kaccount_email));
              console.log(JSON.stringify(res.id));
              console.log(JSON.stringify(res.properties.profile_image));
              console.log(JSON.stringify(res.properties.nickname));
              function sendPost(action, params) {
            		var form = document.createElement('form');
            		form.setAttribute('method', 'post');
            		form.setAttribute('action', action);
            		document.charset = "utf-8";
            		for ( var key in params) {
            			var hiddenField = document.createElement('input');
            			hiddenField.setAttribute('type', 'hidden');
            			hiddenField.setAttribute('name', key);
            			hiddenField.setAttribute('value', params[key]);
            			form.appendChild(hiddenField);
            		}
            		document.body.appendChild(form);
            		form.submit();
            	}
              sendPost('member_kakao_create',{
            	  'name': res.properties.nickname,
            	  'email' : res.kaccount_email,
            	  'id' : res.id,
            	  'fname': res.properties.profile_image})
            },
            fail: function(error) {
              alert(JSON.stringify(error));
            }
          });
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
</script>
					</div>
				</div>
			</div>
		</form>
	</div>

</body>
</html>