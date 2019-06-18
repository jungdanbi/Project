<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value="/resources/script/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript">
function bookSearchWindow() {
	
	// 현재 창 기준으로 새 창 열기
	var childWindow = window.open('/book/libRequest/bookRequestSearch', '', 'width=1200,height=700');
}
</script>
<style type="text/css">
	/* 버튼 부트스트랩 */
button{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:35px;
  font-size:20px;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
  display: inline-block;
  margin-bottom: 25px;
}
button:hover{
  background:#fff;
  color:#1AAB8A;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}
/* 여기까지 */
#reqTable {
	  width: 70%;
	  color: #212529;
	  margin: auto;
}

#reqTable th {
	  color: #495057;
	  background-color: #e9ecef;
	  border-color: #dee2e6;
	  vertical-align: bottom;
	  border-bottom: 2px solid #dee2e6;
}

#reqTable th,
#reqTable td {
	  padding: 0.75rem;
	  vertical-align: top;
	  border-top: 1px solid #dee2e6;
}


h3{
display: inline-block;
margin-right: 30px;
}

#headerDiv{
width: 70%;
margin: auto;
text-align: center;
}
#footerDiv{ 
width: 70%;
margin: auto;
text-align: right;
}
.roDiv{
	border: none;
	cursor: default;
	width: 100%;
	height: 100%;
}
#cause{
	width: 100%;
	height: 100%;
	border-color: #e9ecef;
}
</style>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="/WEB-INF/views/inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->


<div id="container">
<div id="headerDiv">
<h3>도서 검색을 먼저 하세요</h3>
<button type="button" onclick="bookSearchWindow()">도서 검색</button>
</div>
<form action="<c:url value="/libRequest/bookRequest"/>" name="frm" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<input type="hidden" name="memberId" value="<sec:authentication property="principal.username"/>">
<table id="reqTable">
<tr><th scope="row">제목</th><td><input type="text" name="bookTitle" class="roDiv" readonly></td></tr>
<tr><th scope="row">저자</th><td><input type="text" name="bookAuthor" class="roDiv" readonly></td></tr>
<tr><th scope="row">출판사</th><td><input type="text" name="bookPublisher" class="roDiv" readonly></td></tr>
<tr><th scope="row">발행년도</th><td><input type="text" name="date" class="roDiv" readonly></td></tr>
<tr><th scope="row">ISBN</th><td><input type="text" name="isbn" class="roDiv" readonly></td></tr>
<tr><th scope="row">사유</th><td><input type="text" name="wishCause" id="cause"></td></tr>
</table>
<div id="footerDiv">
<button type="submit">신청</button>
</div>
</form>
</div>

<!-- 푸터들어가는 곳 -->
<jsp:include page="/WEB-INF/views/inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</body>
</html>