<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서관 도서 대여</title>
<script type="text/javascript"
	src="<c:url value="/resources/script/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript">
var csrfHeaderName = '${_csrf.headerName}';
var csrfTokenValue = '${_csrf.token}';
$(function () {
	getAllReservationList();
	
	$('input[name=memberId]').on('keyup', function (event) {
		var memberId = $(this).val();
// 		console.log('memberId 변수 타입: ' + typeof memberId);
// 		console.log('memberId: ' + memberId);
		
		$.ajax({
			url: '/book/admin/adminBookRentalIdSearch',
			data: {memberId : memberId},  // userid=id입력값
			success: function (result) {
				
				var str = "";
				
				$.each(result, function(index, item) { // index: 순번 , item: result를 풀어서 담아둔것.
					str+= "<li onclick='memberIdSearch(&#39;"+item.memberId+"&#39; &#44; &#39;"+item.name+"&#39;)' >"+item.memberId+" ("+item.name+")"+"</li>";
				});
				
				$('#memberIdSearchResult').html(str);
			}
		});

	});
	
	$('input[name=bookCode]').on('keyup', function (event) {
		var bookCode = $(this).val();
		
		$.ajax({
			url: '/book/admin/adminBookRentalCodeSearch',
			data: {bookCode : bookCode},  // userid=id입력값
			success: function (result) {
				
				var str = "";
				
				$.each(result, function(index, item) { // index: 순번 , item: result를 풀어서 담아둔것.
					str+= "<li onclick='bookCodeSearch(&#39;"+item.bookNo+"&#39; &#44; &#39;"+item.title+"&#39;)'>("+item.bookNo+") "+item.title+"</li>";
				});
				
				$('#bookCodeSearchResult').html(str);
			}
		});
		
	});
});
	
function memberIdSearch(id,name){

	var memberId= id;
	var result = id+" ("+name+")";
	$('input[name=memberId]').val(memberId);
	$('#memberIdSearchResult').html(result);

}
function bookCodeSearch(bookNo,title){
	var bookCode= bookNo;
	var result = bookNo+" ("+title+")";
	$('input[name=bookCode]').val(bookCode);
	$('#bookCodeSearchResult').html(result);
}

function bookRentalProcess(){
	var memberId = $('input[name=memberId]').val();
	var bookCode = $('input[name=bookCode]').val();
	if (memberId =='' || bookCode =='' || memberId ==null || bookCode ==null ){
		alert('값을 입력하세요.');
		return false;
	}
	
	$.ajax({
		url: '/book/admin/adminBookRentalIdSearch',
		data: {memberId : memberId},  // userid=id입력값
		success: function (result) {
			var str = "";
			$.each(result, function(index, item) { // index: 순번 , item: result를 풀어서 담아둔것.
// 				console.log('item.bookOverdue: '+item.bookOverdue);
// 				console.log('item.memberId: '+item.memberId);
				if(item.bookOverdue>=1){
// 					console.log('bookOverdue: 1이상일때.');
					alert(item.memberId+' 님은 연체 상태입니다. 연체도서를 먼저 반납 후 대여하세요.');
					return false;
				} 
// 					console.log('bookOverdue: 0 정상일때.');
					bookRentalAction(item.memberId);
			});
		}
	});
}

function bookRentalAction(memberId) {
	var bookCode = $('input[name=bookCode]').val();
// 	console.log('bookRentalAction: ' + memberId + bookCode);
	$.ajax({
		url: '/book/admin/adminBookRentalResult',
		data: {memberId : memberId,
			   bookCode : bookCode},
		type: 'post',
		beforeSend : function (xhr) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		success: function (result) {
			if (result ==1){
				alert('대여 완료.');
				getAllReservationList();
			} else {
				alert('시스템 오류.');
			}
		}
	});
}
function getAllReservationList(){
	$.ajax({
		url: '/book/admin/adminBookReservationGetAllList',
		type: 'post',
		beforeSend : function (xhr) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		success: function (result) {
// 			console.log('result: '+result);
			var str = "<tr><th>도서코드</th><th>사용자 아이디</th><th>반납일</th></tr>";
			$.each(result, function(index, item) { // index: 순번 , item: result를 풀어서 담아둔것.
				str += "<tr><td>"+item.bookCode+"</td>";
				str += "<td>"+item.memberId+"</td>";
				str += "<td>"+item.resTimeVO.endTime+"</td></tr>";
			});
			$('#bookRentalResult').html(str);
		}
	});
	
}

</script>
<style type="text/css">
#bodyContainerDiv{
	display: table;
	width:100%;
}
#bookRentalDiv{
	display: table-cell;
		font-size: 15px;
		margin: auto;
}
#bookRentalResultDiv{
	display: table-cell;
		margin: auto;
}
#bookRentalTable{
	 margin: auto;
}

#bookRentalTable ul{
	height: 300px;
	overflow: auto;
}

#bookCodeSearchResult{

	width: 500px;
}

#rentalBtn{
	margin-left: 100px;
}
#inputBookCode{
 margin-left: 40px;
}
#inputMemberId{
	margin-left: 70px;
}

#inputBookCodeTh{
 margin-left: 150px;
}
#inputMemberIdTh{
	margin-left: 150px;
}

</style>
</head>

<body>
	<!-- 헤더들어가는 곳 -->
	<jsp:include page="/WEB-INF/views/inc/top.jsp" />
	<!-- 헤더들어가는 곳 -->
	
	<div id = "bodyContainerDiv">
		<div id = "bookRentalDiv">
			<table id="bookRentalTable">
		
				<tr>
					<th id = "inputMemberIdTh">사용자 아이디</th>
					<th id = "inputBookCodeTh" >도서 번호</th>
				</tr>
				<tr>
					<td><input type="text" id = "inputMemberId" name = "memberId"/>&nbsp;&nbsp;</td>
					<td><input type="text" id = "inputBookCode" name = "bookCode"/><input id = "rentalBtn" type = "button" value ="대여" onclick="bookRentalProcess()"/></td>
					
				</tr>
				<tr>
					<td>
						<ul id="memberIdSearchResult"></ul>
					</td>
					<td>
						<ul  id="bookCodeSearchResult"></ul>
					</td>
				</tr>
		
			</table>
		
		</div>
		<div id = "bookRentalResultDiv">
			<table border="1" id="bookRentalResult">
			</table>
		</div>
	
	</div>
	<!-- 푸터들어가는 곳 -->
	<jsp:include page="/WEB-INF/views/inc/bottom.jsp" />
	<!-- 푸터들어가는 곳 -->
</body>
</html>