<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html lang="ko">
    <head>
	    <meta charset="euc-kr">
        <title>관외 대출, 열람 페이지</title>

	    <meta http-equiv="X-UA-Compatible" content="IE=edge" />   
		<meta name="viewport" content="width=device-width, initial-scale=1" />

		<link href="/book/resources/css/sub/base.css" rel="stylesheet" type="text/css" />
		<link href="/book/resources/css/sub/layout.css" rel="stylesheet" type="text/css" />
        <link href="/book/resources/css/sub/board.css" rel="stylesheet" type="text/css" />
		<link href="/book/resources/css/sub/btn.css" rel="stylesheet" type="text/css" /> 		
		<link href="/book/resources/css/sub/ui.css" rel="stylesheet" type="text/css" />

		<link href="/book/resources/css/sub/sub.css" rel="stylesheet" type="text/css" /> 

		<script src="/book/resources/script/jquery-3.3.1.min.js"></script>

		<link rel="stylesheet" type="text/css" href="/book/resources/css/sub/demos.css" title="style" />

		
<!-- 사이드 메뉴 - 주석 제거X-->
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

<!-- 기본 레이아웃-->

<!-- Top S -->


<!-- 헤더들어가는 곳 -->
<jsp:include page="/WEB-INF/views/inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->


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



 
  






<!-- Top E -->


<div id="sub_visual" class="sub_img02">
	<div class="fix-layout">
		<h2><img src="" alt="" /></h2>
		
	</div>
</div>


<section class="fix-layout">
	
	<div id="nav-left">
		<!-- left menu s -->
		
 <div id="side">
	<nav class="sub_menu">
		<h2 class="sub_title" style="height: 100px;">도서관이용<span>LIBRARY USE GUIDE</span></h2>

				<ul class="sm_2th">
		 <li><a href="/hoursOfUse" ><span>이용시간</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		

		 <li><a href="/referenceLibrary"><span>자료실소개</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a>

		 </li>
		 <li><a href="/bookMembership" ><span>도서회원가입</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		 

		 <li class="on"><a href="/useOfData" ><span>자료이용안내</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a>
		   <ul  class="sm_3th ">
		   <li class="on"><a href="<c:url value="/outsideLoan"/>">관외대출</a></li>
		   <li><a href="<c:url value="/outsideReading"/>">관내열람</a></li>
		   </ul>

		 </li>

		 
		 <li ><a href="/content/?m1=02&m2=06&m3=01"><span>열람실 신청</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
		<!-- <li ><a href="/content/?m1=02&m2=10"><span>오시는길</span> <span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
 -->


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
	<li>도서관이용</li>
	<li>자료이용안내</li>
	<li>관외대출</li>
</ul>
<!-- /location1 -->

<h2>관외대출</h2>

<div class="basic_box type1">
	<div class="inner">
		<span class="icon icon11"></span>
		<b>관외대출</b>
		<p>도서관자료를 관외로 대출하려면 책이음회원에 가입해야 합니다.<br />단, 책이음회원에 가입하더라도 대출되지 않는 자료가 있습니다.<br />관외대출 제한자료:어학사전, 백과사전, 법령, 도감 등의 참고도서 , 연속간행물, 비도서자료, 금융정보자료실 자료</p>
	</div>
</div>

<h3>자료대출은 책이음이용증으로 가능하며, 회원가입은 도서관을 직접방문하셔야 합니다.</h3>
<div class="mb_scroll">
	<table class="tbl_basic">
	<caption>관외대출</caption>
		<thead>
		<tr>
			<th>구분</th>
			<th>대상</th>
			<th>가입장소</th>
		</tr>
		</thead>
		<tbody>
		 <tr>
			<td>대출권수</td>
			<td>5책, 2주간 </td>
			<td rowspan="8">종합자료실,<br/>어린이실</td>
		  </tr>
		  <tr>
			<td> 대출/반납</td>
			<td>대출은 회원본인이 회원증을 지참하여 무인도서대출반납기를 이용, <br />
			  직접 처리 합니다. (단, 반납은 회원증이 필요없으며, 대리반납도 가능합니다.)<br />
			  자료실 이용시간에는 대출한 자료실로 반납하고, 이용시간 이후나 휴관일인 경우 무인반납함을 이용합니다.</td>
		  </tr>
		  <tr>
			<td > 재대출</td>
			<td>동일한 도서는 반납 3일 경과 후에 재대출할 수 있습니다.</td>
		  </tr>
		  <tr>
			<td  > 재발급</td>
			<td>책이음 회원증 분실 또는   훼손 등의 사유로 재발급 신청하는 경우 신청일로부터 7일 경과 후 발급됩니다.<br />
			  (발급 전 신분증으로 대출 가능) </td>
		  </tr>
		  <tr>
			<td  > 부록자료</td>
			<td>CD-ROM, 카세트테이프 등 부록자료는 대출자료와 함께 대출할 수 있습니다. </td>
		  </tr>
		  <tr>
			<td  > 연장</td>
			<td>대출기간은 2주간으로   연장할 수 없습니다.</td>
		  </tr>
		  <tr>
			<td  > 연체</td>
			<td>1권이라도 늦은 경우   연체일수만큼 책을 빌릴 수 없습니다. </td>
		  </tr>
		  <tr>
			<td  > 분실 및 훼손</td>
			<td>동일도서로 현물변상 또는   시가에 상당하는 금액으로 변상해야 합니다.</td>
		  </tr>
		</tbody>
</table>
		 <p class="sbul"> 직장문고대출은 종합실 담당자와 별도 협의하여 조정(100권이내, 2개월) </p>
		 

</div>

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