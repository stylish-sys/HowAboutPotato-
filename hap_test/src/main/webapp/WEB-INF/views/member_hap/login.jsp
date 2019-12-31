<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<meta charset="utf-8">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://kit.fontawesome.com/4c89f26522.js" crossorigin="anonymous"></script>
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('40c7acb685fb1a07ba5cb37a10f4029e');
    function loginWithKakao() {
      // 로그인 창을 띄웁니다.
      Kakao.Auth.login({
        success: function(authObj) {
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
                  }
             });
/*           alert(JSON.stringify(authObj)); */
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
    };
  //]]>
</script>
<script>
    $(document).ready(function() {

    	var menu = $( '.main-banner' ).offset();
    		$( window ).scroll( function() {    			
    				$( '.main-banner' ).removeClass( 'fixed' );	
    	});
    });
    </script>
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
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>
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
<style>
.login-container {
	width: 100%;
	height: 70vh;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

.login-main {
	width: 30%;
	height: 80%;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.3);
    background-color: white;
}

.login-logo {
	width: 80%;
	height: 25%;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 6rem;
}

.login-form {
	width: 80%;
	height: 15%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.login-else {
	width: 80%;
	height: 7%;
	display: flex;
	justify-content: center;
	align-items: center;
	border-top: 1px solid gray;
}

.login-btn {
	width: 80%;
	height: 10%;
	display: flex;
	justify-content: center;
	align-items: center;
}

#naver_id_login {
	width: 100%;
	height: 10%;
	display: flex;
	justify-content: center;
	align-items: center;
}

#kakao_id_login {
	width: 100%;
	height: 10%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.login-input {
	width: 80%;
	height: 90%;
}

.imageContainer {
	text-align: center;
	height: 40vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

.imageContainer img {
	display: block;
	border-radius: 100%;
	height: 30vh;
	width: 30vh;
}

.btn-kakao {
	width: 100%;
	background-color: rgba(255,232,0);
}

.btn-naver {
	width: 100%;
	background-color: #2DB400;
}

.login-submit {
	width: 100%;
	background-color: #2f4f4f;
}

.login-a {
	width: 33.3%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.login-else a {
	color: gray;
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="login-container">
		<form class="login-main"
			action="${pageContext.request.contextPath}/member_hap/login"
			method="post" name="frm">

			<input type="hidden" name="rurl" value="${param.rurl }"> <input
				type="hidden" name="member_num" value="${param.member_num }">
			<input type="hidden" name="nowPage" value="${param.nowPage }">
			<input type="hidden" name="nPage" value="${param.nPage }"> <input
				type="hidden" name="col" value="${param.col }"> <input
				type="hidden" name="word" value="${param.word }">
			<div class="login-logo">Sign In</div>
			<div class="login-form">
				<input class="login-input" type="text" placeholder="아이디"
					id="member_id" name="member_id" required="required">
			</div>
			<div class="login-form">
				<input type="password" class="login-input" id="member_passwd"
					placeholder="비밀번호" name="member_passwd" required="required">
			</div>
			<div class="login-btn">
				<input class="login-submit" type="submit" value="로그인">
			</div>
			<div class="login-btn">
				<div id="kakao_id_login">
					<button id="custom-login-btn" type="button" class="btn-kakao"
						onclick="loginWithKakao()">
							<i class="fas fa-comment"></i>
							카카오계정으로 로그인
						</button>
				</div>
			</div>


			<div class="login-btn">
				<div id="naverIdLogin"></div>
				<div id="naver_id_login">
					<button onclick="location.href='${url }'" type="button"
						class="btn-naver">
							N
							네이버로 로그인
						</button>
				</div>
			</div>
			<div class="login-else">
				<div class="login-a">
					<a href="javascript:idFind()">아이디 찾기</a>
				</div>
				<div class="login-a">
					<a href="javascript:passwdFind()">비번 찾기</a>
				</div>
				<div class="login-a">
					<a href="agree">회원가입</a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>