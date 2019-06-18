<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html lang="ko">
    <head>
	    <meta charset="euc-kr">
        <title>담당 업무 안내 페이지</title>

	    <meta http-equiv="X-UA-Compatible" content="IE=edge" />   
		<meta name="viewport" content="width=device-width, initial-scale=1" />

		<link href="/book/resources/css/sub/base.css" rel="stylesheet" type="text/css" />
		<link href="/book/resources/css/sub/layout.css" rel="stylesheet" type="text/css" />
        <link href="/book/resources/css/sub/board.css" rel="stylesheet" type="text/css" />
		<link href="/book/resources/css/sub/btn.css" rel="stylesheet" type="text/css" /> 		
		<link href="/book/resources/css/sub/ui.css" rel="stylesheet" type="text/css" />
		
		<link href="/book/resources/css/sub/sub01.css" rel="stylesheet" type="text/css" /> 
		<link href="/book/resources/css/sub/sub.css" rel="stylesheet" type="text/css" /> 
		
		<script src="/book/resources/script/jquery-3.3.1.min.js"></script>

		<script type="text/javascript">
		<!--
		$(function() {
			$("#side .sm_2th > li > a").on("focusin mouseenter", function() {
				var $moreState = $(this).children(".more").children(".state");
				
				if(!$(this).parent("li").hasClass("on")) {
					$moreState.text($moreState.text().replace("닫힘", "열림"));
					$(this).next(".sm_3th").stop().slideDown(400);
				}
			})
				
			$("#side .sm_2th > li").on("mouseleave", function() {
				var $moreState = $(this).find("> a .more .state");
				
				if(!$(this).hasClass("on")) {
					$moreState.text($moreState.text().replace("열림", "닫힘"));
					$(this).children(".sm_3th").stop().slideUp(400);
				}
			});

			$("#side .sm_2th li .sm_3th li:last-child a").on("focusout", function() {
				var $moreState = $(this).parents("li").eq(1).find("> a .more .state");

				if(!$(this).parents("li").eq(1).hasClass("on")) {
					$moreState.text($moreState.text().replace("열림", "닫힘"));
					$(this).parents(".sm_3th").stop().slideUp(400);
				}
			});
		});
		$(function(){  
		  $(".sub_menu ul.sm_3th.on").parent("li").addClass("on");

		  var side2Depth = $(".sm_3th").siblings("a").removeClass("link"),//link  
			side3Depth = $(".sm_3th");
		    side2Depth.on("click",function(){
			var side2DepthLink = $(this).attr("href"),
			linkArr = side2DepthLink.split("="),
			moveLink = linkArr[1];
 		  
			  event.preventDefault();
			//  alert(moveLink);
			  if($(this).hasClass("on") === true){
			   
				return false;
			  }else{
				$(this).addClass("open").siblings(side3Depth).addClass("open").parent().addClass("open");
				$(this).next(side3Depth).slideDown(200);
				$(this).parent().siblings(".open").find(side3Depth).slideUp(200);
				$(this).parent().siblings().removeClass("open").children().removeClass("open");
			  }
 		  });
		});

		//-->
		</script>


		<script type="text/javascript">
		//<![CDATA[
		$(function(){
			
			var gg = navigator.userAgent.toLowerCase();
			//iphone
			//android
			$("body a").click(function() {
				var check_tel = $(this).attr("href");

				if(check_tel.indexOf("tel") != "-1"){
					if(gg.indexOf("android") != "-1" || gg.indexOf("iphone") != "-1") {
						return true;
					} else {
						return false;
					}
				}

			});
		});
		 //]]>

		</script>



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



<script  type="text/javascript">
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

$(document).ready(function() {

	$("#m1").click(function() {
		$("#a1").show();
		$("#a2").hide();
		$("#a3").hide();
		$("#murl1").attr("href","/content/6100.php");
		$("#m1").attr("src","/images/main/tab_01_on.gif");
		$("#m2").attr("src","/images/main/tab_02.gif");
		$("#m3").attr("src","/images/main/tab_03.gif");
		return false;
	});

	$("#m2").click(function() {
		$("#a2").show();
		$("#a1").hide();
		$("#a3").hide();
		$("#murl1").attr("href","/content/?m1=03&m2=04");
		$("#m1").attr("src","/images/main/tab_01.gif");
		$("#m2").attr("src","/images/main/tab_02_on.gif");
		$("#m3").attr("src","/images/main/tab_03.gif");
		return false;
	});

	$("#m3").click(function() {
		$("#a3").show();
		$("#a2").hide();
		$("#a1").hide();
		$("#murl1").attr("href","/content/6101.php");
		$("#m1").attr("src","/images/main/tab_01.gif");
		$("#m2").attr("src","/images/main/tab_02.gif");
		$("#m3").attr("src","/images/main/tab_03_on.gif");
		return false;
	});

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
<script type="text/javascript">
//<![CDATA[
	function fnSearchBook() {
		var theForm = eval("document.frmSearch");

		var str = alltrim(theForm.value1.value);
		if (str.length == 0) {
			alert("검색어를 입력하여 주십시오.");
			theForm.value1.focus();
			return false;
		} else {
			if(theForm.gubun[0].checked == true) {
				theForm.action = "/content/?m1=03&m2=02";
				theForm.smode.value="search";
			} else {
				frmSearch.search_flag.value="6";
				frmSearch.contents.value="3";
				theForm.smode.value="search2";
				theForm.action = "/content/?m1=03&m2=02";
			}
		}

		return true;
	}
//]]>
</script>
</head>
<body>

<!-- 헤더들어가는 곳 -->
<jsp:include page="/WEB-INF/views/inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<div id="skipNavi">
	
	
				<a href="#detail_con">본문 바로가기</a>

	
</div>



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




<div id="sub_visual" class="sub_img01">
	<div class="fix-layout">
		
	</div>
</div>


<section class="fix-layout">
	
	<div id="nav-left">


 <div id="side">
	<nav class="sub_menu">
		<h2 class="sub_title" style="height: 100px;">도서관소개<span>LIBRARY INTRODUCTION</span></h2>

		<ul class="sm_2th">

		 <li><a href="<c:url value="/greeting"/>"><span>인사말</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li ><a href="<c:url value="/history"/>"><span>연혁</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li><a href="<c:url value="/organizationalStatus"/>" ><span>조직현황</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
         <li class="on"><a href="<c:url value="/assignedTask"/>"><span>담당업무안내</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li ><a href="<c:url value="/facilityStatus"/>"><span>시설현황</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li><a href="<c:url value="/collectiveData"/>" ><span>소장자료현황</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li><a href="<c:url value="/directions"/>"><span>오시는길</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		
		 </ul>
	</nav>
</div>


		<!-- left menu e -->
	</div>

	<div id="con">
		
		<div id="detail_con">	
			<!-- content s -->
			<!-- location1 -->
<ul id="location">
	<li>홈</li>
	<li>도서관소개</li>
	<li>담당업무안내</li>
</ul>
<!-- /location1 -->

<h2>담당업무안내</h2>
<div class="basic_box type1">
<div class="inner"><strong>부전도서관 담당자업무안내</strong>부전도서관의 담당업무 및 연락처를 안내해 드립니다.</div>
</div>

<ul>
	<li>관장(<a href="tel:051-802-6017">802-6017</a>)

	<ul>
		<li>한경옥 관장</li>
	</ul>
	</li>
	<li>총무과(<a href="tel:051-802-5901">802-5901</a>)
	<div class="mb_scroll">
	<table class="tbl_basic">
		<caption>담당자 담당업무 내선번호로 구분하여 총무과 담당업무안내</caption>
		<thead>
			<tr>
				<th scope="col">담당자</th>
				<th scope="col">담당업무</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>안중걸&nbsp;총무과장</td>
				<td>총무과 업무</td>
			</tr>
			<tr>
				<td>김지영</td>
				<td>총무과 기획업무</td>
			</tr>
			<tr>
				<td>손나리</td>
				<td>예&middot;결산 및 일상경비 지출</td>
			</tr>
			<tr>
				<td>문영모</td>
				<td>급여 및 인사업무</td>
			</tr>
			<tr>
				<td>허원철</td>
				<td>청사시설관리 및 방호(안내실근무)</td>
			</tr>
		</tbody>
	</table>
	</div>
	</li>
	<li>자료봉사과(<a href="tel:051-802-3096">802-3096</a>)
	<div class="mb_scroll">
	<table class="tbl_basic">
		<caption>과명 각실명 담당자 당당업무 내선번호 자료봉사과</caption>
		<thead>
			<tr>
				<th scope="col">각 실명</th>
				<th scope="col">담당자</th>
				<th scope="col">담당업무</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="2">양미경&nbsp;자료봉사과장</td>
				<td>자료봉사과 업무</td>
			</tr>
			<tr>
				<td rowspan="2">자료봉사과사무실</td>
				<td>박경숙</td>
				<td>자료봉사과 기획업무</td>
			</tr>
			<tr>
				<td>유초희</td>
				<td>평생교육, 작은도서관, 전포북카페 운영지원</td>
			</tr>
			<tr>
				<td rowspan="4">종합자료실</td>
				<td>김경옥</td>
				<td>종합자료실 업무</td>
			</tr>
			<tr>
				<td>김조현</td>
				<td>독서회원 관리 및 자료열람 봉사</td>
			</tr>
			<tr>
				<td>이예림</td>
				<td>일반,직장토론회 운영 및 관리</td>
			</tr>
			<tr>
				<td>박경숙</td>
				<td>소외계층 관련 업무, 직장문고운영및관리</td>
			</tr>
			<tr>
				<td rowspan="3">디지털실<br />
				금융정보자료실<br />
				연속간행물실</td>
				<td>김수미</td>
				<td>디지털실 업무</td>
			</tr>
			<tr>
				<td>김희경</td>
				<td>금융정보자료실 운영</td>
			</tr>
			<tr>
				<td>안민정</td>
				<td>연속간행물 운영</td>
			</tr>
			<tr>
				<td rowspan="2">어린이실</td>
				<td>최은화</td>
				<td>어린이실 업무</td>
			</tr>
			<tr>
				<td>박수진</td>
				<td>독서교실, 초등독서회 운영 및 관리</td>
			</tr>
			<tr>
				<td rowspan="3">사서계</td>
				<td>이진옥</td>
				<td>사서계 기획업무, 도서관 장서개발</td>
			</tr>
			<tr>
				<td>이소정</td>
				<td>자료의 선정&middot;수집&middot;정리&middot;분석, 신간자료 및 희망자료</td>
			</tr>
			<tr>
				<td>이경숙</td>
				<td>기증자료 수집&middot;정리 D/B 입력, 작은도서관 자료지원</td>
			</tr>
		</tbody>
	</table>
	</div>
	</li>
</ul>
			<!-- content e -->
		</div>
	</div>
	<p class="clr"></p>
</section>

<!-- 푸터들어가는 곳 -->
<jsp:include page="/WEB-INF/views/inc/bottom.jsp"/>
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
</html><!-- bottom e -->