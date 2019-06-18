<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html lang="ko">
    <head>
	    <meta charset="euc-kr">
        <title>시설 현황 페이지</title>

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


<section class="fix-layout">
	
	<div id="nav-left">


<!-- 사이드 메뉴바 -->
<div id="side">
	<nav class="sub_menu">
		<h2 class="sub_title" style="height: 100px;">도서관소개<span>LIBRARY INTRODUCTION</span></h2>

		<ul class="sm_2th">

		 <li><a href="<c:url value="/greeting"/>"><span>인사말</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li ><a href="<c:url value="/history"/>"><span>연혁</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li><a href="<c:url value="/organizationalStatus"/>" ><span>조직현황</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
         <li ><a href="<c:url value="/assignedTask"/>"><span>담당업무안내</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li class="on"><a href="<c:url value="/facilityStatus"/>"><span>시설현황</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li><a href="<c:url value="/collectiveData"/>" ><span>소장자료현황</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 <li ><a href="<c:url value="/directions"/>"><span>오시는길</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		
		 </ul>
	</nav>
</div>


	</div>

	<div id="con">
		
		<div id="detail_con">	
				<ul id="location">
					<li>홈</li>
					<li>도서관소개</li>
					<li>시설현황</li>
				</ul>
					
<h2>시설현황</h2>	
<div class="facilities_top bg_img1">
	<div>
		대지 및 건물
		<span>
			<ul>
				<li class="fs15 mg_b5">대지면적&nbsp;&nbsp;: 4,112.1 (1,243.9) ㎡(평)</li>
				<li class="fs15 mg_b5">건축연면적 : 2,704 (818) ㎡(평)</li>
				<li class="fs15 mg_b5">건물내역
				
					<ul>
						<li class="fs13">- 지하층 : 271.8 (82.2)</li>
						<li class="fs13">- 1층 : 1,216.1(367.9)</li>
						<li class="fs13">- 2층 : 1,216.1 (367.9)</li>
					</ul>
					
				</li>
			</ul>
		</span>
	</div>
	
</div>

 
<h3>층별배치도</h3>
<div class="box2 type2 margin_t_20">
  <div class="point_line"><div class="line"></div></div>
  <div class="inner_box c">	
	<div class="img_original">
	  <img src="/book/resources/images/map_01.jpg" alt="1층 평면도" />
	  <a href="/book/resources/images/map_01.jpg"><i></i>원본 이미지 보기</a>
	</div>
  </div>
</div>

<div class="box2 type2 margin_t_20">
  <div class="point_line"><div class="line"></div></div>
  <div class="inner_box c">	
	<div class="img_original">
	  <img src="/book/resources/images/map_02.jpg"  alt="2층 평면도" />
	  <a href="/book/resources/images/map_02.jpg"><i></i>원본 이미지 보기</a>
	</div>
  </div>
</div>


<div class="mb_scroll">
	<table class="tbl_basic">

  <caption>실별현황</caption>
  <thead>
  <tr>
    <th colspan="2">구분</th>
    <th>실별</th>
    <th>면적(㎡)</th>
    <th>좌석수</th>
    <th>용도</th>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td rowspan="8">자료실<br />및<br />기타</td>
    <td rowspan="3">1층</td>
    <td>종합자료실</td>
    <td>463.8</td>
    <td>45</td>
    <td align="left">전주제의 일반도서 및 참고자료 </td>
  </tr>
  <tr>
    <td>어린이실</td>
    <td>151.2</td>
    <td>32</td>
    <td align="left">아동도서, 백과사전, 아동잡지, 신문 등 </td>
  </tr>
  <tr>
    <td>보존서고(1)(2)</td>
    <td>243</td>
    <td>&nbsp;</td>
    <td align="left">보존문서 및 자료 </td>
  </tr>
  <tr>
    <td rowspan="5">2층</td>
    <td>연속간행물실/<br />
금융정보자료실</td>
    <td>194.4</td>
    <td>72</td>
    <td align="left">신문, 잡지, 법령집, 금융정보자료 </td>
  </tr>
  <tr>
    <td>디지털자료실</td>
    <td>229.2</td>
    <td>35</td>
    <td align="left">인터넷, 국회원문, cd-rom, dvd 등 각종<br>
      전자자료</td>
  </tr>
  <tr>
    <td>문화교실</td>
    <td>49.7</td>
    <td>42</td>
    <td align="left">교양강좌, 평생교육 </td>
  </tr>
  <tr>
    <td>회의실</td>
    <td>30.8</td>
    <td>25</td>
    <td align="left">독서회, 간담회 등 회의공간 </td>
  </tr>
  <tr>
    <td>보존서고(3)</td>
    <td>24.7</td>
    <td>&nbsp;</td>
    <td align="left">논문자료 서고 </td>
  </tr>
  <tr>
    <td>열람실</td>
    <td>2층</td>
    <td>열람실</td>
    <td>218.7</td>
    <td>194</td>
    <td align="left">자율학습공간</td>
  </tr>
  <tr>
    <td colspan="3">합 계</td>
    <td>1605.5</td>
    <td>445</td>
    <td align="left">&nbsp;</td>
  </tr>
  </tbody>
</table>

		</div>
	</div>
	<p class="clr"></p>
</section>
	
				<!-- <h3 class="abt">바로가기 배너</h3>
				<div class="sub_bn">
					<ul>
					<li class="f_left h_93 p_b_10"><a href="/content/?m1=03&m2=05"><img src="/images/sub/bn_01.gif" alt="나의 대출정보" width="190" height="93" border="0"></a></li>
					<li class="f_left h_50"><a href="/content/?m1=03&m2=06"><img src="/images/sub/bn_02.gif" alt="희망자료신청" width="190" height="50" border="0"></a></li>
					<li class="f_left h_50"><a href="/content/5100.php"><img src="/images/sub/bn_03.gif" alt="평생강좌온라인신청" width="190" height="50" border="0"></a></li>
					<li class="f_left h_50"><a href="/content/?m1=08&m2=03&m3=01"><img src="/images/sub/bn_04.gif" alt="인터넷정보공개" width="190" height="50" border="0"></a></li>
					<li class="f_left h_50"><a href="/content/?m1=07&m2=07"><img src="/images/sub/bn_05.gif" alt="자원봉사신청" width="190" height="50" border="0"></a></li>
					<li class="f_left h_50"><a href="/content/6700.php"><img src="/images/sub/bn_06.gif" alt="On-line 참고봉사" width="190" height="50" border="0"></a></li>
					</ul>
				</div>	
				<hr>
<h3 class="abt">서브 상단이미지</h3>
<div class="f_left w_790">
	<ul>
		<li class="f_left w_790"><img src="/images/sub/img_sub01.jpg" alt="서브상단이미지" width="790" height="150" /></li>
	</ul>
</div>  -->

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