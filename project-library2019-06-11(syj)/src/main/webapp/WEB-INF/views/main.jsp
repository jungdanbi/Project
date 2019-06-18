<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
    <head>
	    <meta charset="euc-kr">
        <title>도서관이랍니다~</title>

	    <meta http-equiv="X-UA-Compatible" content="IE=edge" />   
		<meta name="viewport" content="width=device-width, initial-scale=1" />

		<link href="/book/resources/css/sub/base.css" rel="stylesheet" type="text/css" />
		<link href="/book/resources/css/sub/layout.css" rel="stylesheet" type="text/css" />
        <link href="/book/resources/css/sub/board.css" rel="stylesheet" type="text/css" />
		<link href="/book/resources/css/sub/btn.css" rel="stylesheet" type="text/css" /> 		
		<link href="/book/resources/css/sub/ui.css" rel="stylesheet" type="text/css" />

		<link href="/book/resources/css/main.css" rel="stylesheet" type="text/css" /> 

		<link href="/book/resources/css/sub/sub01.css" rel="stylesheet" type="text/css" /> 
		<link href="/book/resources/css/sub/sub.css" rel="stylesheet" type="text/css" /> 

		<script src="/book/resources/script/jquery-3.3.1.min.js"></script>

		<!-- <link rel="stylesheet" type="text/css" href="//www.bjl.go.kr/script/themes/base/ui.all.css" title="style" />
		<link rel="stylesheet" type="text/css" href="//www.bjl.go.kr/script/ui/demos.css" title="style" />
    	<link rel="shortcut icon" href="http://www.bjl.go.kr/img/bjl.ico" type="image/x-icon" /> -->



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

	<div id="skipNavi">

		<a href="#container">본문 바로가기</a>

	</div>

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


<script src="/n_js/cm.tower.ui.js"></script>
<script src="/n_js/ui.common.js"></script>


<script type="text/javascript" src="/jquery.cycle.all.js" charset="utf-8"></script> 
<script type="text/javascript" src="/bannerget.js" charset="utf-8"></script> 

<script>

	setInterval(function(){
		$('#contentsFull').find(' > div:visible').find('.conNext').trigger('click');
	},100000);
</script>

<script>

var csrfHeaderName = '${_csrf.headerName}';
var csrfTokenValue = '${_csrf.token}';

	function bookRank() {
		$.ajax({
			url : '/book/bookSearch/bookRank',
			type : 'post',
	 		beforeSend : function (xhr) {
		            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		         }, 
			success : function(data){
			
			console.log("data 확인" + data);
			
			var temp = '<tr style="border-bottom: 1px solid #aba6a6;"><th>순위</th><th style="padding-left:20px;">제목</th><th>대여횟수</th></tr>';
			
				$.each(data, function(index, book){
					temp += '<tr><td style="text-align: center; padding: 6px; border-bottom : 1px solid #dde0e2">'+(index+1)+'</td>';
					temp += '<td style="padding-left:20px; border-bottom : 1px solid #dde0e2">'+book.title+'</td>';
					/* temp += '<td>'+book.author+'</td>';
					temp += '<td>'+book.publisher+'</td>'; */
					temp += '<td style="text-align: center; border-bottom : 1px solid #dde0e2">'+book.rentalCount+'</td></tr>';
				});
				$("#bookRank").html(temp);
			}
		});
	}
	
	/*<th>저자</th><th>출판사</th> */
	
	$(document).ready(function(){
		bookRank();	
	});
</script>


<!-- 메인영역 끝  -->
<!-- container -->
<div id="container" class="container">
<div class="dv_wrap">
	
</div>

<br/>

<div class="contentsFull" id="contentsFull">
	
	<!-- 1번페이지 -->
	<div class="contentsFull0">


<div class="smartsearch1"  >
				
		<div class="smartsearch1Box">
		<a href="/book/bookSearch/booklistSearch" target="_blank" title="새창" class="fl" style="margin-right:10px;"> <img src="/book/resources/images/main/total_sea_icon.png" alt="통합 웹서비스 자료찾기" /></a>
			
			<!--<div class="search_wrapbox">
				<form method="post" name="frmSearch" onSubmit="return fnSearchBook(this)" action="/content/?m1=03&amp;m2=02&act=SearchResult.List">	
						<input type="hidden" name="search_field" value="IAL" title="검색에사용" >
						<label for="SEARCH"><input type="text" name="search_text" id="SEARCH" title="검색어" class="input_keyword" value="" autofocus placeholder="검색어를 입력하세요"  style="outline:none"; /></label>
						<input type="image"  src="/img/sub/btn_searchsubmit.png" id="smtsubmit" alt="검색" />
						
				 </form>
			</div>-->
			
			<p class="clr"></p>
		</div>
	
	
</div>
 

		<div class="group">
			
			

							
			<div class="t02">
 				<div class="holiday box1_1">				
					<h2>이용시간 및 휴관일</h2>
 					<div class="c">
						<img src="/book/resources/images/main/time_main.png" alt="열람실 : 월~일 07:00 ~23:00 종합실 : 화~금 09:00 ~ 22:00 월,토 09:00 ~18:00 어린이실 : 월,토 09:00~18:00, 화~금09:00~20:00 일요일 09:00~17:00"  />

						<div class="fl">
						<a href="/book/directions"><img src="/book/resources/images/main/main_icon01.gif" alt="오시는길" /></a>
						<a href="/book/facilityStatus"><img src="/book/resources/images/main/main_icon02.gif" alt="시설안내" /></a>
						</div>
						<div class="holiday_day">
							<!-- <p class="tit_day">매월 3·4주 월요일, 국경일 휴관입니다.</p> -->
							<p class="h_day">이번달 휴관일 <br />06,17,24일</p>
						</div>
						<p class="clr"></p>
					</div>
 					  	<div class="data_event box1_1">
<br/>
<div class="option">
<a href="?&amp;year=2017&amp;month=5" class="prev">이전</a>
<strong>2019/<span>6</span></strong>
<a href="?&amp;year=2017&amp;month=7" class="next">다음</a>
</div>
<div class="day"><a href="http://www.bjl.go.kr/content/?m1=04&m2=01&m3=03"><table class='closecal_tbl'>
<colgroup><col span='7'></colgroup>
<thead>
	<tr>
		<th scope='col' class='c_rd'>SUN</th>
		<th scope='col'>MON</th>
		<th scope='col'>TUE</th>
		<th scope='col'>WED</th>
		<th scope='col'>THU</th>
		<th scope='col'>FRI</th>
		<th scope='col' class='c_bl'>SAT</th>
	</tr><br/>
</thead>
<tbody>
						 <td> &nbsp; </td>
										 <td> &nbsp; </td>
										 <td> &nbsp; </td>
										 <td> &nbsp; </td>
										 <td> &nbsp; </td>
										 <td> &nbsp; </td>
															 <td class='c_bl'><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >1</a></td>
									   </tr>
									   <tr>
															 <td class='c_rd '><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >2</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >3</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >4</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >5</a></td>
															 <td><a onclick="javascript:alert('◎현충일');return false;" title="◎현충일" style='color:red; font-weight:bold;'>6</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >7</a></td>
															 <td class='c_bl'><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >8</a></td>
									   </tr>
									   <tr>
															 <td class='c_rd '><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >9</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >10</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >11</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >12</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >13</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >14</a></td>
															 <td class='c_bl'><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >15</a></td>
									   </tr>
									   <tr>
															 <td class='c_rd '><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >16</a></td>
															 <td><a onclick="javascript:alert('◎휴관일');return false;" title="◎휴관일" style='color:red; font-weight:bold;'>17</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >18</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >19</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >20</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >21</a></td>
															 <td class='c_bl'><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >22</a></td>
									   </tr>
									   <tr>
															 <td class='c_rd '><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >23</a></td>
															 <td><a onclick="javascript:alert('◎휴관일');return false;" title="◎휴관일" style='color:red; font-weight:bold;'>24</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >25</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >26</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >27</a></td>
															 <td><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >28</a></td>
															 <td class='c_bl'><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >29</a></td>
									   </tr>
									   <tr>
															 <td class='c_rd '><a onclick="javascript:alert('등록된 일정이 없습니다.');return false;" title="등록된 일정이 없습니다." >30</a></td>
										 <td>&nbsp;</td>
												 <td>&nbsp;</td>
												 <td>&nbsp;</td>
												 <td>&nbsp;</td>
												 <td>&nbsp;</td>
												 <td>&nbsp;</td>
						
	
</tbody>

<!-- 
<ul>
	<li class="d1"><em></em>오늘</li>
	<li class="d2"><em></em>휴관일</li>
	<li class="d3"><em></em>행사일</li>
</ul> 
-->

</table>
</a>
		
	
</div>
</div>

			</div>

						

			</div>

			<div class="holiday_day_mod">
				<!-- <p class="tit_day">매월 3·4주 월요일, 국경일 휴관입니다.</p> -->
				<p class="h_day">이번달 휴관일 : 06,17,24일</p>
			</div>

			<div class="t02_1">
				<div class="iconm box1_1">
					<ul>
 
						<li><a href="/book"  title="새창으로 열림" target="_blank" class="con_i01">나의 대출정보</a></li>
						<li><a href="/book/libRequest/bookRequest" class="con_i02">비치희망자료신청</a></li>
 
						<li><a href="/book/member/join" title="새창으로 열림" target="_blank" class="con_i05">도서회원가입</a></li>
						<li><a href="/book" class="con_i06">???</a></li>
						
						
						</li>
					</ul>
					
				</div>

				                                

				<div class="clr popupzone box1_1" id="c1m1"  style="background-color: white; padding: 25px;">
					<h3 style="color: #555;">인기 도서</h3>
					
					<table id="bookRank" style="font-size: 14px;">
						<hr>
					</table>
				</div>

				
			</div>
			<div class="t02_2">
				<div class="notice box1_1">
					<div class="m_notice">
					
				<ul class="m_tab02">
				   <li class="on" id="t_notice1">
				   <a href="#notice1_more" onclick="changemTab02(1);return false;" onfocus="changemTab02(1);"  class="tab_txt">공지사항</a>
					   <ul class="list" id="v_notice1">
					
					<span id="notice1_more" style="display:block;"><a href="/content/?m1=07&m2=01" class="mnoti_more">
					<img src="/book/resources/images/main/btn_more.gif" alt="공지사항 더보기" />
					</a></span>
				   </li>
				<!-- <li class="off" id="t_notice2">
				   <a href="/content/0714.php" onclick="changemTab02(2);return false;" onfocus="changemTab02(2);"  class="tab_txt">희망자료</a>
				  </li>	 -->	
				
		</ul>
	</div>
</div>				

			</div>

		</div>

	</div>
	<!-- 1번페이지 끝-->
	
	<!-- 2번페이지 -->
	<div class="contentsFull1">
		<h2 class="offscreen">현재 선택된 컨텐츠는 프로그램 입니다.</h2>
		
	</div>
	<!-- 2번페이지 끝-->
	
</div>

	

<div class="contents0"></div>
<div class="contents1"></div>

</div>
		
<script type="text/javascript" language="javascript" src="/n_js/jquery.carouFredSel-6.2.1-packed.js"></script>
<script type="text/javascript">
$(document).ready(function(){
function adPlay(){
	$(".banner_wrap ul").carouFredSel({
			align       : "left",
			
			//width		: 1110, //전체 너비
			height	: 40, //전체 높이
			items		: {
				visible : 7 //보여질 갯수
				},
			scroll      : {
				items		:1, //스크롤링할 갯수
				duration        : 500, //시간
				pauseOnHover	: true //마우스오버시 일시정지기능 마우스 아웃시 자동재생됨
				},
			prev:{
				button : '.banner_prev',
				wipe : true, //로테이션 허용(리스트 처음에서 클릭시 마지막요소로 이동)
				pauseOnHover:false
			},
			next: {
				button :'.banner_next',
				wipe : true,
				pauseOnHover:false
			},
			direction	: "left"
	}).parent().css("margin", "auto");
}
$(".banner_wrap ul img").each(function(index) {
	$(this).load(function(){
		$(this).width($(this).width())
	})
});

// Create new image
//var img = new Image();
//var imageSrc = $(".banner_wrap ul img:last").attr('src');
//img.onload = function() {
	adPlay();
//};

//img.src = imageSrc;

//재생버튼
$(".banner_ctrl play").click(function() {
	$(".banner_wrap ul").trigger("play");
	return false;
});
$('.banner_ctrl').click(function() {
	$(".banner_wrap ul").trigger("pause", true);
	return false;
})

 
	
});
</script>
               
<br><br><br><br><br>
<br><br><br><br><br>
<br><br><br><br><br>
<br><br><br><br><br>


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
