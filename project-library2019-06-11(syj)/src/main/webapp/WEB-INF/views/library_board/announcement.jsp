<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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


</head>
<script src="/resources/script/jquery-3.3.1.min.js"></script>
<script>
	function doSubmit(form){
		if (document.bbsForm.chk_privacy.checked){
		}else{
			alert('개인정보 수집 및 이용 동의 확인해 주십시요.');
			return false;
		}
		
		if(document.bbsForm.subject.value == ""){
			alert('제목 입력해 주십시요.');
			document.bbsForm.subject.focus();
			return false;
		}
		
		if (document.bbsForm.pass.value == ""){
			alert('비밀번호 입력해 주십시요.');
			document.bbsForm.pass.focus();
			return false;
		}else{
			if(document.bbsForm.pass.value.length < 4){
				alert('비밀번호 4자 이상 입력해주세요.');
				document.bbsForm.pass.focus();
				return false;
			}
		}
	
		document.bbsForm.submit();
	}
	
	
	$(document).ready(function () {
	/* 	$('button#btn').on('click', function () {
			$('div#newUploadFiles').append('<input type="file" name="newFiles" multiple="multiple"><br>');
		});  */
		
		$('span#del').on('click', function () {
			var $li = $(this).closest('li');
			
			$li.children('input[type="hidden"]').attr('name', 'delFiles');
//			$td.children('td#deltd').remove();
			$li.children('div.attach-item').remove();
			
//	 		var a = $li.children('input[type="hidden"]').data('del');
//	 		alert(a);
		});
		
		$('form#bbsForm').on('submit', function (e) {
			e.preventDefault();
			
			$('input[name="oldFiles"]').each(index, function() {
				
			});
		});
		
	});
</script>
<body>
	<!-- 헤더들어가는 곳 -->
	<jsp:include page="/WEB-INF/views/inc/top.jsp" />

	<!-- 헤더들어가는 곳 -->
	
	
	<div id="sub_visual" class="sub_img07">
		<div class="fix-layout">
			
		</div>
	</div>
	<!-- 본문들어가는 곳 -->
	<section class="fix-layout">
		<!-- 메인이미지 -->
		<!-- 메인이미지 -->
		<div id="nav_left">
			<!-- 왼쪽메뉴 -->
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
			<!-- side -->
			<!-- 왼쪽메뉴 -->
		</div>
		<!-- nav_left -->
		<!-- 게시판 -->
		<div id="wrap">
			<div id="detail_wrap">
				<h1>
					자유게시판
					<%-- [전체글개수: ${pageInfoMap.allRowCount}] --%>
				</h1>

				<div class="basic_box">
					<div class="inner">
						<span class="icon"></span> <b>자유게시판</b>
						<p>
							상업적인 광고성 글이나 불건전한 내용, 정치·종교적인 내용, 일방적인 비방이나 욕설 등은 예고없이 삭제되며, 건전한
							게시판 문화와 홈페이지 운영을 위해 실명제로 운영되고 있음을 알려드립니다. <br> - 간단한 문의사항은
							"자주하는 질문" 을 먼저 확인해주시기 바랍니다. <br> -<span class="red">본문
								또는 첨부파일 내에 개인정보(주민등록번호, 성명, 연락처 등)가 포함 된 게시글은 예고없이 삭제되니 유의하시기
								바랍니다.</span> <br> - <span class="red"> 개인정보를 포함하여 게시하는 경우에는
								불특정 다수에게 개인정보가 노출되어 악용될 수 있으며, 특히 타인의 개인정보가 노출되는 경우에는 개인정보보호법에
								따라 처벌받을 수 있음을 알려드립니다.</span> <br> - 비밀번호 입력시 개인정보와 관련된 번호(주민번호,
							휴대폰, 전화번호 등) 사용을 자제해주세요.
						</p>
					</div>


				<div>
					<div id="total">
						<span>Total : ${pageInfoMap.allRowCount}</span>
					</div>

					<div class="table_search">
						<form action="/book/board/list" method="get">
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
										onclick="location.href='/book/board/detail?num=${board.num}&pageNum=${pageInfoMap.pageNum}'"
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
								onclick="location.href = '/book/board/write';">
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
							href="/book/board/list?pageNum=${pageInfoMap.startPage - pageInfoMap.pageBlockSize}&search=${search}">이전</a>
					</c:if>

					<c:forEach var="i" begin="${pageInfoMap.startPage}"
						end="${pageInfoMap.endPage}" step="1">
						<c:choose>
							<c:when test="${i eq pageInfoMap.pageNum}">
								<a href="/book/board/list?pageNum=${ i }&search=${search}"><span
									style="color: red; font-weight: bold;">${ i }</span></a>
							</c:when>
							<c:otherwise>
								<a href="/book/board/list?pageNum=${ i }&search=${search}">${ i }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<!-- 다음 블록이 존재하는지 확인 -->
					<c:if test="${pageInfoMap.endPage lt pageInfoMap.maxPage}">
						<a
							href="/book/board/list?pageNum=${pageInfoMap.startPage + pageInfoMap.pageBlockSize}&search=${search}">다음</a>
					</c:if>
				</c:if>
			</div>
		</div>
	</section>
	<!-- 게시판 -->
	<!-- 본문들어가는 곳 -->
	<!-- 푸터들어가는 곳 -->
	<footer>
		<jsp:include page="/WEB-INF/views/inc/bottom.jsp" />
	</footer>
	<!-- 푸터들어가는 곳 -->
</body>


</html>