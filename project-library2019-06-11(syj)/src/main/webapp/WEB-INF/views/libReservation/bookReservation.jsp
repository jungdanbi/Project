<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/book/resources/script/jquery-3.3.1.min.js"></script>
<script type="text/javascript">


$(document).ready(function(){

	 $('#btnSubmit').click(function(){
		
		 
		 if($('input[name=searchKeywordA]').val() ==null || $('input[name=searchKeywordA]').val() ==''){
			 alert('검색어를 입력하세요.')
			 return false;
		 }
		$('#searchForm').submit();
		
	 });

});

</script>

</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="/WEB-INF/views/inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<article>
<h1>Notice [검색단어를 포함한 권수: ${pageInfoMap.allRowCount}]</h1>
<div id="table_search">
<form action="<c:url value="/bookSearch/booklistSearch"/>" method="get" id="searchForm">

<!-- 검색 A -->
<select name="searchTypeA" >
	<option value="title">제목</option>
	<option value="author">저자</option>
	<option value="publisher">출판사</option>
</select>
<input type="text" name="searchKeywordA" class="input_box">
<select name="searchJoinA" >
	<option value="AND">AND</option>
	<option value="OR">OR</option>
	<option value="NOT">NOT</option>
</select>
<br>

<!-- 검색 B -->
<select name="searchTypeB" >
	<option value="title">제목</option>
	<option value="author" selected="selected">저자</option>
	<option value="publisher">출판사</option>
</select>
<input type="text" name="searchKeywordB" class="input_box">
<select name="searchJoinB" >
	<option value="AND">AND</option>
	<option value="OR">OR</option>
	<option value="NOT">NOT</option>
</select>
<br>

<!-- 검색 C -->
<select name="searchTypeC" >
	<option value="title">제목</option>
	<option value="author">저자</option>
	<option value="publisher" selected="selected">출판사</option>
</select>
<input type="text" name="searchKeywordC" class="input_box">
<br>

<input type="button" value="검색" class="btn" id="btnSubmit">
</form>
</div>
<table id="notice" border = "1" style='width:95%'>
<tr><th class="tno">no.</th>
    <th class="ttitle">제목</th>
    <th class="twrite">저자</th>
    <th class="twrite">출판사</th>
    <th class="tdate">발행년도</th>
    <th class="isbn">ISBN</th>
    <th class="isbn">카테고리</th>
    <th class="isbn">책상태</th></tr>
    
<c:choose>
<c:when test="${not empty list}"><%-- pageInfoMap.allRowCount gt 0 --%>
   <%-- 
      *forEach 반복할때마다 pageScope 영역객체에 저장
      pageContext.setAttribute("board", list 요소 한개); 
   --%>
   <c:forEach var="book" items="${list}">
      <tr >
         <td>${book.bookNo}</td>
         <td class="left">
            ${book.title}
         </td>
         <td>${book.author}</td>
         <td>${book.publisher}</td>
         <td>${book.pubYear}</td>
         <td>${book.isbn}</td>
         <td>${book.isbnSubCode}</td>
         <td>${book.bookReservationVO.bookStatus }</td>
      </tr>
   </c:forEach>
</c:when>
<c:otherwise>
   <tr><td colspan="5">해당 책 없음</td></tr>
</c:otherwise>
</c:choose>
</table>

<!-- 세션에 id값이 있으면 글쓰기 버튼이 보이게 설정 -->
<%-- <c:if test="${sessionScope.member_id ne null}"> --%>
<!--    <div id="table_search"> -->
<!--    <input type="button" value="글쓰기" class="btn" onclick="location.href = '/book/board/write';"> -->
<!--    </div> -->
<%-- </c:if> --%>


<div class="clear"></div>
<div id="page_control">
<c:if test="${pageInfoMap.allRowCount gt 0}">

   <!-- 이전 블록이 존재하는지 확인 -->
   <c:if test="${pageInfoMap.startPage gt pageInfoMap.pageBlockSize}">
      <a href="/book/bookSearch/booklistSearch?pageNum=${pageInfoMap.startPage - pageInfoMap.pageBlockSize}&searchTypeA=${bookSearchDTO.searchTypeA}&searchKeywordA=${bookSearchDTO.searchKeywordA}&searchJoinA=${bookSearchDTO.searchJoinA}&searchTypeB=${bookSearchDTO.searchTypeB}&searchKeywordB=${bookSearchDTO.searchKeywordB}&searchJoinB=${bookSearchDTO.searchJoinB}&searchTypeC=${bookSearchDTO.searchTypeC}&searchKeywordC=${bookSearchDTO.searchKeywordC}">[이전]</a>
   </c:if>
   
   <c:forEach var="i" begin="${pageInfoMap.startPage}" end="${pageInfoMap.endPage}" step="1">
      <c:choose>
      <c:when test="${i eq pageInfoMap.pageNum}">
         <a href="/book/bookSearch/booklistSearch?pageNum=${ i }&searchTypeA=${bookSearchDTO.searchTypeA}&searchKeywordA=${bookSearchDTO.searchKeywordA}&searchJoinA=${bookSearchDTO.searchJoinA}&searchTypeB=${bookSearchDTO.searchTypeB}&searchKeywordB=${bookSearchDTO.searchKeywordB}&searchJoinB=${bookSearchDTO.searchJoinB}&searchTypeC=${bookSearchDTO.searchTypeC}&searchKeywordC=${bookSearchDTO.searchKeywordC}"><span style="color: blue; font-weight: bold;">[${ i }]</span></a>
      </c:when>
      <c:otherwise>
         <a href="/book/bookSearch/booklistSearch?pageNum=${ i }&searchTypeA=${bookSearchDTO.searchTypeA}&searchKeywordA=${bookSearchDTO.searchKeywordA}&searchJoinA=${bookSearchDTO.searchJoinA}&searchTypeB=${bookSearchDTO.searchTypeB}&searchKeywordB=${bookSearchDTO.searchKeywordB}&searchJoinB=${bookSearchDTO.searchJoinB}&searchTypeC=${bookSearchDTO.searchTypeC}&searchKeywordC=${bookSearchDTO.searchKeywordC}">[${ i }]</a>
         
      </c:otherwise>
      </c:choose>
   </c:forEach>
   
   <!-- 다음 블록이 존재하는지 확인 -->
   <c:if test="${pageInfoMap.endPage lt pageInfoMap.maxPage}">
      <a href="/book/bookSearch/booklistSearch?pageNum=${pageInfoMap.startPage + pageInfoMap.pageBlockSize}&searchTypeA=${bookSearchDTO.searchTypeA}&searchKeywordA=${bookSearchDTO.searchKeywordA}&searchJoinA=${bookSearchDTO.searchJoinA}&searchTypeB=${bookSearchDTO.searchTypeB}&searchKeywordB=${bookSearchDTO.searchKeywordB}&searchJoinB=${bookSearchDTO.searchJoinB}&searchTypeC=${bookSearchDTO.searchTypeC}&searchKeywordC=${bookSearchDTO.searchKeywordC}">[다음]</a>
   </c:if>
</c:if>

</div>
</article>


<!-- 푸터들어가는 곳 -->
<jsp:include page="/WEB-INF/views/inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</body>
</html>