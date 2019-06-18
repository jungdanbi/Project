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
        <title>희망과 꿈이 있는 부전도서관</title>

	    <meta http-equiv="X-UA-Compatible" content="IE=edge" />   
		<meta name="viewport" content="width=device-width, initial-scale=1" />

		<link href="/book/resources/css/sub/base.css" rel="stylesheet" type="text/css" />
		<link href="/book/resources/css/sub/layout.css" rel="stylesheet" type="text/css" />
        <link href="/book/resources/css/sub/board.css" rel="stylesheet" type="text/css" />
		<link href="/book/resources/css/sub/btn.css" rel="stylesheet" type="text/css" /> 		
		<link href="/book/resources/css/sub/ui.css" rel="stylesheet" type="text/css" />

		<link href="/book/resources/css/sub/sub.css" rel="stylesheet" type="text/css" /> 

		<link href="<c:url value="/resources/css/freeBoard.css"/>" rel="stylesheet" type="text/css">

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
	<div class="fix-layout">
		
	</div>
</div>


<section class="fix-layout">
	
	<div id="nav-left">
		<!-- left menu s -->
		
 <div id="side">
	<nav class="sub_menu">
		<h2 class="sub_title" style="height: 100px;">열린마당<span>USER COMMUNITY</span></h2>

		<ul class="sm_2th">
			 <li ><a href=""><span>공지사항</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
			 <li ><a href="/book/questions"><span>자주하는질문</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
			 <li class="on"><a href="/book/board/filelist" ><span>자유게시판</span><span class="more"><span class="state">에 대한 2차메뉴 닫힘</span><em class="ver"></em><em class="hor"></em></span></a></li>
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
<ul id="location">
	<li>홈</li>
	<li>열린마당</li>
	<li>자유게시판</li>
</ul>
<!-- /location1 -->

<h2>자유게시판</h2>

<div class="basic_box type1">
	<div class="inner">
		<span class="icon icon12"></span>
		<b>자유게시판</b>
		<p>상업적인 광고성 글이나 불건전한 내용, 정치·종교적인 내용, 일방적인 비방이나 욕설 등은 예고없이 삭제되며, 건전한 게시판 문화와 홈페이지 운영을 위해 실명제로 운영되고 있음을 알려드립니다. <br />
		- 간단한 문의사항은 "자주하는 질문" 을 먼저 확인해주시기 바랍니다.  <br />
- <span class="red">본문 또는 첨부파일 내에 개인정보(주민등록번호, 성명, 연락처 등)가 포함 된 게시글은 예고없이 삭제되니 유의하시기 바랍니다.</span>  <br />
- <span class="red">개인정보를 포함하여 게시하는 경우에는 불특정 다수에게 개인정보가 노출되어 악용될 수 있으며, 특히 타인의 개인정보가 노출되는 경우에는 개인정보보호법에 따라 처벌받을 수 있음을 알려드립니다.</span> <br />
- 비밀번호 입력시 개인정보와 관련된 번호(주민번호, 휴대폰, 전화번호 등) 사용을 자제해주세요. </p>
	</div>
</div>

 



		  
<script src='/js/func.js'></script>
<script>
function CA(){
	var frm = document.search;
	var trk=0;
	for (var i=0;i<frm.elements.length;i++){
		var e = frm.elements[i];
		if ((e.name != 'allbox') && (e.type=='checkbox')){
			trk++;
			e.checked = frm.allbox.checked;
		}
	}
}

function PrintList(form){
	// submit 버튼 Click 시... 체크박스 갯수 확인...
	var check_len = 0;   //체크박스 갯수
	var onchecknum = 0; //onChecked 된 체크박스 갯수
	var i, insu ; //i:looping 변수, insu:배열화된 체크박스의 index 번호
	var check_value = "";

	for(i=0; i< form.elements.length; i++){  
		 //form(form name)에 존재하는 모든 element들을 확인하면서 
		 //원하는name을 갖은(taxId)의 체크박스의 모든 갯수를 찾는다... 
		chkbox = form.elements[i];               
		if (chkbox.name == "bbs_idx[]")              
			check_len++;                                                                        
	}
	if (check_len>1) {//체크박스가 2개이상 존재시...
		for (insu=0; insu < check_len; insu++) {
			if (form.elements["bbs_idx[]"][insu].checked){  //체크박스만 돌면서 checked된것만 갯수 +
				onchecknum++;
				check_value+="var_bbs_idx[]="+form.elements["bbs_idx[]"][insu].value+"&";
			}
		}
	}
	else if (check_len == 1) {//체크박스가 딱 한개 존재시
		if (form.elements["bbs_idx[]"].checked){ 
			onchecknum++;
			check_value+="var_bbs_idx[]="+form.elements["bbs_idx[]"].value+"&";
		}
	} else { // 하나도 존재 하지 않을때
  
	} 
 // 체크박스가 딱 한개 존재하면.. 배열화가 안되므로 2개 이상일때의 
 // form.taxId[insu].checked 처럼 [insu]로 쓸수가 없습니다.
	if (onchecknum < 1) { // checked된 체크박스가 하나도 없을때... Error!!
				alert("하나도 선택하지 않으셨습니다. 확인하세요");
				return;
  }
	else { // 하나 이상 체크된것이 있으면.... 정상 처리...
		//alert(check_value);
		var url = "/lms_bbs2/board.print.php?bbsid=6200&"+check_value;
		var wname = "_print";
		window.open(url,wname,"width=800,height=700,left=1,top=1,scrollbars=yes");
	}
}
</script>

<form name="search" method="get" action="/content/index.php" style="margin:0px">
<input type=hidden name="pagetype" value="">
<input type=hidden name="pageno" value="1">
<input type=hidden name="bbsid" value="6200">
<input type=hidden name="cafeid" value="">
<input type=hidden name="ref_code" value="">
<input type=hidden name="qstr" value="&m1=07&m2=04&m3=&bbsid=6200&cafeid=&ref_code=">
<input type=hidden name="m1" value="07">
<input type=hidden name="m2" value="04">	
 	
		<div>
					<div id="total">
						<span>Total : ${pageInfoMap.allRowCount}</span>
					</div>

					<div class="table_search">
						<form action="/book/board/filelist" method="get">
							<input type="text" name="search" class="input_box"
								value="${search}" placeholder="검색어를 입력하세요."> <input
								type="submit" value="검색" class="btn">
						</form>
					</div>
				</div>

 
<table id="notice">
					<tr>
						<th class="tno">번호</th>
						<th class="ttitle">제목</th>
						<th class="twrite">글쓴이</th>
						<th class="tdate">날짜</th>
						<th class="tread">조회수</th>
					</tr>

					<c:choose>
						<c:when test="${not empty list}">
							<%-- pageInfoMap.allRowCount gt 0 --%>
							<%-- 
		*forEach 반복할때마다 pageScope 영역객체에 저장
		pageContext.setAttribute("board", list 요소 한개); 
	--%>
							<c:forEach var="board" items="${list}">
								<tr>
									<td>${board.num}</td>
									<td class="left"
										onclick="location.href='/book/board/fileDetail?num=${board.num}&pageNum=${pageInfoMap.pageNum}'"
										id="subject" style="cursor: pointer"><c:if
											test="${board.reLev gt 0}">
											<!-- 답글일때 -->
											<c:set var="wid" value="${board.reLev * 10}" />
											<%-- 답글 들여쓰기 레벨 값 저장용 --%>
											<img src="/images/center/level.gif"
												style="width: ${wid}px; height: 13px;">
											<img src="/images/center/re.gif">
										</c:if> ${board.subject}</td>
									<td class="twrite">${board.name}</td>
									<td class="tdate"><fmt:formatDate value="${board.regDate}"
											pattern="yyyy.MM.dd" /></td>
									<td class="tread">${board.readcount}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5">게시판 글 없음</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
				<div class=table_search>
					<form>
						<sec:authorize access="isAuthenticated()">
							<input type="button" value="글쓰기" class="btn"
								onclick="location.href = '/book/board/fileWrite';">
						</sec:authorize>
					</form>
				</div>
			</div>
			<!-- 세션에 id값이 있으면 글쓰기 버튼이 보이게 설정 -->

			<div class="clear"></div>
			<div id="page_control">
				<c:if test="${pageInfoMap.allRowCount gt 0}">
					<!-- 이전 블록이 존재하는지 확인 -->
					<c:if test="${pageInfoMap.startPage gt pageInfoMap.pageBlockSize}">
						<a
							href="/book/board/filelist?pageNum=${pageInfoMap.startPage - pageInfoMap.pageBlockSize}&search=${search}">이전</a>
					</c:if>

					<c:forEach var="i" begin="${pageInfoMap.startPage}"
						end="${pageInfoMap.endPage}" step="1">
						<c:choose>
							<c:when test="${i eq pageInfoMap.pageNum}">
								<a href="/book/board/filelist?pageNum=${ i }&search=${search}"><span
									style="color: red; font-weight: bold;">${ i }</span></a>
							</c:when>
							<c:otherwise>
								<a href="/book/board/filelist?pageNum=${ i }&search=${search}">${ i }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<!-- 다음 블록이 존재하는지 확인 -->
					<c:if test="${pageInfoMap.endPage lt pageInfoMap.maxPage}">
						<a
							href="/book/board/filelist?pageNum=${pageInfoMap.startPage + pageInfoMap.pageBlockSize}&search=${search}">다음</a>
					</c:if>
				</c:if>
			</div>
		</div>
	</section>
	
<script language=javascript>
/*
function bbsWrite(){
	var url = "/content/index.php?pagetype=&pagekind=w&pageno=1&bbsid=6200&cafeid=&ref_code=&keyword=&keyfield=&category=&qstr=&m1=07&m2=04&m3=&bbsid=6200&cafeid=&ref_code=&gopage=/content/?m1=07|*m2=04";
	location.href = url;
}*/
function bbsWrite(){
	
	// 201105230913 cucis g-pin으로 수정함
	//var url = "/member/realname.php?targetpage=/content/index.php?pagetype=|*pagekind=w|*pageno=1|*bbsid=6200|*cafeid=|*ref_code=|*keyword=|*keyfield=|*category=|*qstr=|*m1=07|*m2=04|*m3=|*bbsid=6200|*cafeid=|*ref_code=&gopage=/content/?m1=07|*m2=04";
	//window.open(url,"_login","width=400,height=400,scrollbars=no");



	//var url = "/G-PIN/sil.html?targetpage=/content/index.php?pagetype=|*pagekind=w|*pageno=1|*bbsid=6200|*cafeid=|*ref_code=|*keyword=|*keyfield=|*category=|*qstr=|*m1=07|*m2=04|*m3=|*bbsid=6200|*cafeid=|*ref_code=&gopage=/content/?m1=07|*m2=04";
	//location.href = url;
	var url = "/content/index.php?pagetype=&pagekind=w&pageno=1&bbsid=6200&cafeid=&ref_code=&keyword=&keyfield=&category=&qstr=&m1=07&m2=04&m3=&bbsid=6200&cafeid=&ref_code=&gopage=/content/?m1=07|*m2=04";
	location.href = url;

	//var url = "/content/index.php?pagetype=&pagekind=w&pageno=1&bbsid=6200&cafeid=&ref_code=&keyword=&keyfield=&category=&qstr=&m1=07&m2=04&m3=&bbsid=6200&cafeid=&ref_code=&gopage=/content/?m1=07|*m2=04";
	//location.href = url;
}

function bbsReadLogin(targetpage) {
	var url = "/member/realname.php?targetpage="+targetpage;
	window.open(url,"_login","width=400,height=400,scrollbars=no");
}

function bbsScrap(form){
	// submit 버튼 Click 시... 체크박스 갯수 확인...
	var check_len = 0;   //체크박스 갯수
	var onchecknum = 0; //onChecked 된 체크박스 갯수
	var i, insu ; //i:looping 변수, insu:배열화된 체크박스의 index 번호
	var check_value = "";

	for(i=0; i< form.elements.length; i++){  
		 //form(form name)에 존재하는 모든 element들을 확인하면서 
		 //원하는name을 갖은(taxId)의 체크박스의 모든 갯수를 찾는다... 
		chkbox = form.elements[i];               
		if (chkbox.name == "bbs_idx[]")              
			check_len++;                                                                        
	}
	if (check_len>1) {//체크박스가 2개이상 존재시...
		for (insu=0; insu < check_len; insu++) {
			if (form.elements["bbs_idx[]"][insu].checked){  //체크박스만 돌면서 checked된것만 갯수 +
				onchecknum++;
				check_value+="var_bbs_idx[]="+form.elements["bbs_idx[]"][insu].value+"&";
			}
		}
	}
	else if (check_len == 1) {//체크박스가 딱 한개 존재시
		if (form.elements["bbs_idx[]"].checked){ 
			onchecknum++;
			check_value+="var_bbs_idx[]="+form.elements["bbs_idx[]"].value+"&";
		}
	} else { // 하나도 존재 하지 않을때
  
	} 
 // 체크박스가 딱 한개 존재하면.. 배열화가 안되므로 2개 이상일때의 
 // form.taxId[insu].checked 처럼 [insu]로 쓸수가 없습니다.
	if (onchecknum < 1) { // checked된 체크박스가 하나도 없을때... Error!!
				alert("하나도 선택하지 않으셨습니다. 확인하세요");
				return;
  }
	else { // 하나 이상 체크된것이 있으면.... 정상 처리...
		//alert(check_value);
		var url = "/lms_bbs2/board.scrap.php?bbsid=6200&"+check_value;
		var wname = "_scrap";
		window.open(url,wname,"width=400,height=400,left=1,top=1,scrollbars=no");
	}
}
</script>
 
<script language="javascript">
function SaveExcel(){
	var form = document.excelform;
	form.submit();
}
</script>
 
<!-- excel save -->
<form method="post" name="excelform" action="/lms_bbs2/board.exceldownload.php" target="excelformframe">
<input type="hidden" name="filename" value="exceldb">
<textarea name="sql" id="sql" style="display:none" title="프로그램처리용box">
</textarea>
</form>
<iframe width="0" height="0" name="excelformframe" id="excelformframe" title="프로그램처리용프래임"></iframe>
<!-- excel save -->     

 
			<!-- content e -->
		</div>
	</div>
	<p class="clr"></p>
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
</html><!-- bottom e -->