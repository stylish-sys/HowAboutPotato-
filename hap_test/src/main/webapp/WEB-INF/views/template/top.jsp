<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<c:set var="root" value="${pageContext.request.contextPath }"></c:set>

<c:choose>
	<c:when
		test="${not empty sessionScope.member_id && sessionScope.member_grade== 'H'}">
		<c:set var="str">관리자페이지입니다.</c:set>
	</c:when>
	<c:when
		test="${not empty sessionScope.member_id && sessionScope.member_grade!= 'H'}">
		<c:set var="str">안녕하세요. ${sessionScope.member_id }님!</c:set>
	</c:when>
	<c:otherwise>
		<c:set var="str">기본페이지</c:set>
	</c:otherwise>

</c:choose>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${root }/js/ajaxError.js"></script>
<script type="text/javascript" src="${root }/js/useAnimation.js"></script>
<style type="text/css">
#grade {
	color: red;
}

.main-background {
	position: relative;
	height: 100%;
	width: 100%;
	z-index: 1;
}
.main-header {
	display: flex;
	justify-content: flex-start;
	flex-direction: column;
	width: 80vw;
	z-index: 9999;
	position: relative;
	height: 13vh;
	align-items: center;
	opacity: 1;
    transition: visibility 0s, opacity 0.09s linear;
}
.main-header-down {
	display: flex;
	justify-content: flex-start;
	flex-direction: column;
	width: 80vw;
	z-index: 9999;
	position: relative;
	height: 13vh;
	align-items: center;
	opacity: 0;
    transition: visibility 0s, opacity 0.09s linear;
}

.main-banner {
	display: flex;
    align-items: center;
    justify-content: flex-start;
    flex-direction: column;
    width: 83vw;
    z-index: 9999;
    position: relative;
    background-color: white;
    height: 13vh;
    opacity: 1;
}

.main-background {
	width: 100%;
	height: 100%;
}

.navbar-default .navbar-collapse .navbar-default .navbar-default .navbar-collapse, .navbar-default .navbar-form {
	background-color: rgba( 255, 255, 255, 0 );
}

.navbar-default{
	background-color: rgba( 255, 255, 255, 0 );
	border-color: rgba( 255, 255, 255, 0 );
}

.navbar-default .navbar-nav>.active>a {
	background-color: rgba( 255, 255, 255, 0 );
}

.jbTitle {
        text-align: center;
      }
      .jbMenu {
        text-align: center;
        background-color: yellow;
        padding: 10px 0px;
        width: 100%;
      }
      .jbContent {
        height: 2000px;
      }
      .jbFixed {
        position: fixed;
        top: 0px;
      }
      

.body {
	width: 100%;
	height: 100%;
}
.fixed {
	position: fixed;
	top: 0px;
}
.top_bar_fix{position:fixed; top:0; left:0; width:100%;}
.pd_top_80{padding-top:80px;}
#header-background {
	z-index: 0;
	width: 100vw;
	height: 100vh;
}

.main-background {
text-align: center;
height: 40vh;
display: flex;
justify-content: center;
align-items: center;
}
.main-background img {
display: block;
    height: 170vh;
    width: 100%;
    z-index: 0;
    position: absolute;
}
.main-background div {
position: relative;
display: inline-block;
*display: inline;
zoom: 1;
border-radius: 100%;
}
.main-background span {
position: absolute;
left: 0;
bottom: 0;

width: 100%;
background: #000;
background: rgba(0,0,0,.5);
}

.main-banner-fade-out {
	opacity: 1;
}


</style>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script>
	    $(document).ready(function() {
	
	    	var menu = $( '.main-banner' ).offset();
	    	var limit = $( '.login-container' ).offset();
	    		$( window ).scroll( function() {
	    			if ( $( document ).scrollTop() > menu.top ) {
	    				$( '.main-banner' ).addClass( 'fixed' );
	    			}
	            	 else {
	    				$( '.main-banner' ).removeClass( 'fixed' );
	    			}
	    	});
	    });
    </script>
    
    <script>
    	jQuery(window).scroll(function(){
    	    $('#main-header').attr('class','main-header-down');
    	    setTimeout(function() {         
    	    	$('#main-header').attr('class','main-header');     
        	    }, 900);

    	});

    </script>
</head>

<body>
	<header id="main-header" role="banner" class= "main-header">
		
		<div class= "main-banner">
		<img id="logo-main" src="${pageContext.request.contextPath }/images/로고2.png" width="200" alt="Logo Thing main logo">
			<nav id="navbar-primary" class="navbar navbar-default" role="navigation">
			  <div class="container-fluid">
			    <!-- Brand and toggle get grouped for better mobile display -->
			    <div class="navbar-header">
			      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-primary-collapse">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			      </button>
			    </div>
			    <div class="collapse navbar-collapse" id="navbar-primary-collapse">
			      <ul class="nav navbar-nav">
			        <li><a href="${root}">Home</a></li>
					<li><a href="${root}/notice/listNotice#move-to-container" class="js-scroll-trigger">Notice</a></li>
					<li><a href="${root}/qna/listQna">QnA</a></li>
					<li><a href="${root}/board_hap/list">방</a></li>
					<li><a href="${root}/res/res_find">예약 검색</a></li>
	
					<c:choose>
						<c:when test="${empty sessionScope.member_id }">
							<li><a href="${root}/member_hap/agree">Join</a></li>
							<li><a href="${root}/member_hap/login">Sign-in</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${root}/res/list">RESLIST</a></li>
							<li><a href="${root}/member_hap/member_read">Profile</a></li>
							<li><a href="${root}/member_hap/logout">Sign-out</a></li>
						</c:otherwise>
					</c:choose>
	
					<c:if
						test="${not empty sessionScope.member_id && sessionScope.member_grade=='H'}">
						<li><a href="${root}/res/res_acc">승인 대기</a></li>
					</c:if>
			      </ul>
			    </div><!-- /.navbar-collapse -->
			  </div><!-- /.container-fluid -->
			</nav>
			</div>
		</header><!-- header role="banner" -->
</body>
</html>