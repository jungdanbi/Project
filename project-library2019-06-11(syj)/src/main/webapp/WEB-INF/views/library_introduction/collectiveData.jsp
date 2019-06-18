<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>

<html lang="ko">
    <head>
	    <meta charset="euc-kr">
        <title>소장 자료 현황 페이지</title>

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

		<!-- <link rel="stylesheet" type="text/css" href="//www.bjl.go.kr/script/themes/base/ui.all.css" title="style" />
		<link rel="stylesheet" type="text/css" href="//www.bjl.go.kr/script/ui/demos.css" title="style" />
    	<link rel="shortcut icon" href="http://www.bjl.go.kr/img/bjl.ico" type="image/x-icon" /> -->


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

<script type="text/javascript" src="/book/resources/js/zoom.js" charset="euc-kr"></script>

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

<!-- 사이드 메뉴바 -->
<section class="fix-layout">
	
	<div id="nav-left">

 <div id="side">
	<nav class="sub_menu">
		<h2 class="sub_title" style="height: 100px;">도서관소개<span>LIBRARY INTRODUCTION</span></h2>


		<ul class="sm_2th">

		 <li><a href="<c:url value="/greeting"/>"><span>인사말</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li ><a href="<c:url value="/history"/>"><span>연혁</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li><a href="<c:url value="/organizationalStatus"/>" ><span>조직현황</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
         <li ><a href="<c:url value="/assignedTask"/>"><span>담당업무안내</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li ><a href="<c:url value="/facilityStatus"/>"><span>시설현황</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li class="on"><a href="<c:url value="/collectiveData"/>" ><span>소장자료현황</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li ><a href="<c:url value="/directions"/>"><span>오시는길</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		
		 </ul>
	</nav>
</div>


	</div>

	<div id="con">
		
		<div id="detail_con">	
			<ul id="location">
				<li>홈</li>
				<li>도서관이용</li>
				<li>소장자료현황</li>
			</ul>

<h2>소장자료현황</h2>
<h3>도서</h3>

<p>2019년 4월 1일 현재</p>

<div class="mb_scroll">
<table class="tbl_basic">
	<caption>도서 총장서수(2019년 4월 1일 현재)안내</caption>
	<thead>
		<tr>
			<th scope="col">구분</th>
			<th scope="col">총류</th>
			<th scope="col">철학</th>
			<th scope="col">종교</th>
			<th scope="col">사회과학</th>
			<th scope="col">자연과학</th>
			<th scope="col">기술과학</th>
			<th scope="col">예술</th>
			<th scope="col">언어</th>
			<th scope="col">문학</th>
			<th scope="col">역사</th>
			<th scope="col">계</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>자료수</td>
			<td>13,102</td>
			<td>15,556</td>
			<td>9,828</td>
			<td>57,231</td>
			<td>12,224</td>
			<td>23,487</td>
			<td>14,498</td>
			<td>11,617</td>
			<td>98,454</td>
			<td>25,996</td>
			<td>281,993</td>
		</tr>
	</tbody>
</table>
</div>

<h3>비도서</h3>

<p>2019년 4월 1일 현재</p>

<div class="mb_scroll">
<table class="tbl_basic">
	<caption>비도서 총장서수(2019년 4월 1일 현재)안내</caption>
	<thead>
		<tr>
			<th scope="col">구분</th>
			<th scope="col">총류</th>
			<th scope="col">철학</th>
			<th scope="col">종교</th>
			<th scope="col">사회과학</th>
			<th scope="col">자연과학</th>
			<th scope="col">기술과학</th>
			<th scope="col">예술</th>
			<th scope="col">언어</th>
			<th scope="col">문학</th>
			<th scope="col">역사</th>
			<th scope="col">계</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>자료수</td>
			<td>253</td>
			<td>97</td>
			<td>70</td>
			<td>774</td>
			<td>366</td>
			<td>481</td>
			<td>7,591</td>
			<td>378</td>
			<td>416</td>
			<td>593</td>
			<td>11,019</td>
		</tr>
	</tbody>
</table>
</div>

<h3>작은도서관</h3>

<p>2019년 4월 1일 현재</p>

<div class="mb_scroll">
<table class="tbl_basic">
	<caption>작은도서관 총장서수(2019년 4월 1일 현재)안내</caption>
	<thead>
		<tr>
			<th scope="col">구분</th>
			<th scope="col">총류</th>
			<th scope="col">철학</th>
			<th scope="col">종교</th>
			<th scope="col">사회과학</th>
			<th scope="col">자연과학</th>
			<th scope="col">기술과학</th>
			<th scope="col">예술</th>
			<th scope="col">언어</th>
			<th scope="col">문학</th>
			<th scope="col">역사</th>
			<th scope="col">계</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>자료수</td>
			<td>397</td>
			<td>816</td>
			<td>333</td>
			<td>1,740</td>
			<td>1,104</td>
			<td>988</td>
			<td>435</td>
			<td>259</td>
			<td>7,911</td>
			<td>1,400</td>
			<td>15,383</td>
		</tr>
	</tbody>
</table>
</div>
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
</html>