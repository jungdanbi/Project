<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="euc-kr">
<title>도서관~~</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<link href="/book/resources/css/sub/base.css" rel="stylesheet" type="text/css" />
<link href="/book/resources/css/sub/layout.css" rel="stylesheet" type="text/css" />
<link href="/book/resources/css/sub/board.css" rel="stylesheet" type="text/css" />
<link href="/book/resources/css/sub/btn.css" rel="stylesheet" type="text/css" />
<link href="/book/resources/css/sub/ui.css" rel="stylesheet" type="text/css" />

<link href="/book/resources/css/sub/sub.css" rel="stylesheet" type="text/css" />

<link href="<c:url value="/resources/css/freeBoard.css"/>" rel="stylesheet" type="text/css">
	
<link href="/book/resources/css/sub/member.css" rel="stylesheet" type="text/css" />

<script src="/book/resources/script/jquery-3.3.1.min.js"></script>


<script type="text/javaScript">
		//<![CDATA[
		$(document).ready(function($) {
			
			window.fn_menu_layout = function() {
				var dept_1_mnu = $('#site_nav > ul > li').length;
				var site_mnu_width = 100 / dept_1_mnu;
				$('#site_nav > ul > li').css('width', site_mnu_width + '%');
				$("#site_nav > ul > li").hover(function(){
					$("ul:not(:animated)",this).slideDown("fast");
				}, function(){
					$("ul",this).slideUp("fast");
				});
			};

			window.fn_leftmenu_control = function(code) {
				
				$("#left_"+code+" > a").parents('li').addClass('selected');
				$("#left_"+code+" > a").next().slideDown("slow");
			};

			window.onload = function() { 
				
				fn_leftmenu_control("");
				
			}
		});
		//]]>
		</script>



<script type="text/javascript">
//<![CDATA[
function fnSearchBook() {
	var theForm = eval("document.frmSearch");

	var str = alltrim(theForm.value1.value);
	if (str.length == 0) {
		alert("검색어를 입력하여 주십시오.");
		theForm.value1.focus();
		return false;
	}

	return true;
}


	$("#scr_z1").click(function() {
		zoomIn();
		return false;
	});
	$("#scr_z2").click(function() {
		zoomOut();

		return false;
	});
	$("#scr_z3").click(function() {
		resetZoom();
		return false;
	});
});
//]]>
</script>

<script type="text/javascript" src="/script/zoom.js" charset="euc-kr"></script>


<!-- <script type="text/javascript" src="/voicemonds/voicemonDS.js"></script> -->


<!-- <META NAME="GOOGLEBOT" CONTENT="NOINDEX,NOFOLLOW">
 -->

</head>
<body>

	<input type="hidden"
		value="<sec:authentication var="memberId" property="principal.username"/>" />

	<!-- 헤더들어가는 곳 -->
	<jsp:include page="/WEB-INF/views/inc/top.jsp" />
	<!-- 헤더들어가는 곳 -->

	<div id="skipNavi">

		<a href="#detail_con">본문 바로가기</a>

	</div>

	<script type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>



	<script type="text/javascript">
$(document).ready(function(){
	$(".allsch").on('click', function( e ) {
		  $("#topsearch").attr('class','smartsearchover');
		
	});
	$(".closesch").on('click', function( e ) {
		  $("#topsearch").attr('class','smartsearch');
	});
 
 });
</script>


	<div id="sub_visual" class="sub_img07">
		<div class="fix-layout"></div>
	</div>


	<section class="fix-layout">

		<div id="nav-left">
			<!-- left menu s -->

			<div id="side">
				<nav class="sub_menu">
					<h2 class="sub_title" style="height: 100px;">
						마이 페이지<span>USER COMMUNITY</span>
					</h2>

					<ul class="sm_2th">
						<li><a href="/book/libRequest/bookRequestResult"><span>내 희망도서 신청정보</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
						<li class="on"><a href="/book/member/myView?id=${memberId}"><span>내 정보</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
						<li><a href="/book/member/memberInfoUpdate"><span>정보 수정</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
						<!-- <li><a href="" ><span>Q&A</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li> -->
					</ul>
				</nav>
			</div>

			<!-- left menu e -->
		</div>

		<div id="con">

			<div id="detail_con">
				<!-- content s -->
				<!-- location1 -->

				<!-- /location1 -->


				<script src='/js/func.js'></script>

				<sec:authorize access="isAnonymous()">
		 		잘못들어왔어
			</sec:authorize>

				<sec:authorize access="isAuthenticated()">
					<input type="hidden" id="memberId"
						value="<sec:authentication property="principal.username"/>">
					<br>

					<h2>마이 페이지</h2>

					<hr>

					<table>
						<tr>
							<td>아이디 :</td>
							<td>${memberVO.memberId}</td>
						</tr>

						<tr>
							<td>이름 :</td>
							<td>${memberVO.name}</td>
						</tr>

						<tr>
							<td>성별 :</td>
							<td>${memberVO.gender}</td>
						</tr>

						<tr>
							<td>이메일 :</td>
							<td>${memberVO.email}</td>
						</tr>

						<tr>
							<td>휴대전화 :</td>
							<td>${memberVO.tel}</td>
						</tr>
						<tr>
							<td>가입 날짜 :</td>
							<td>${memberVO.regDate}</td>
						</tr>



					</table>

				

				</sec:authorize>
				
				<br>
				
				<form action="/book/member/memberInfoUpdate">
					<input class="submit" type="submit" value="수정하기">
				</form>
	</section>

	<!-- 푸터들어가는 곳 -->
	<footer>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp" />
	</footer>
	<!-- 푸터들어가는 곳 -->


	<script type="text/javascript"> 
           
	$(document).ready(function() {
		var offset = 300;   // 수직으로 어느정도 움직여야 버튼이 나올까?
		var duration = 500;   // top으로 이동할때까지의 animate 시간 (밀리세컨드, default는 400. 예제의 기본은 500)
		$(window).scroll(function() {
			if ($(this).scrollTop() > offset) {
				$('.top_btn').fadeIn(duration);
			} else {
				$('.top_btn').fadeOut(duration);
			}
		});
		
		$('.top_btn').click(function(event) {
			event.preventDefault();
			$('html, body').animate({scrollTop: 0}, duration);
			return false;
		})
	});


</script>

</body>
</html>
<!-- bottom e -->