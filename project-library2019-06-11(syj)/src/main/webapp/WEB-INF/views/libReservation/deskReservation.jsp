<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value="/resources/script/jquery-3.3.1.min.js"/>"></script>

<style type="text/css">
#gridDiv{
	width: 100%;
	display: grid;
	grid-template-columns: repeat(10, 1fr);
	height: 800px;
}
.desk{
	background-color: #D8D8D8;
	border: solid 1px;
	border-color: black;
	border-radius: 0.5em;
	margin-right: 15px;
	margin-left: 15px;
	margin-bottom: 10px;
	margin-top: 10px;
	text-align: center;
	cursor: pointer;
}

.desk.green{
	background-color: #58FA58;
}

h2{
	cursor: pointer;
}
</style>
<script type="text/javascript">
var id = '<sec:authentication property="principal.username"/>';
var csrfHeaderName = '${_csrf.headerName}';
var csrfTokenValue = '${_csrf.token}';


function deskResrv(){ 
	var deskNo = $('.green').find('input[name=deskNo]').val();
	console.log(deskNo);
 	$.ajax({
		url: '/book/libReservation/deskReservation',
		data: {
				memberId: id,
				deskNo: deskNo
				},
		type: 'post',
		beforeSend : function (xhr) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		success: function(result){
			console.log(result);
			if(result==false){
				alert('좌석 신청이 실패하셨습니다.');
				return false;
			}
			alert(id+'님 '+deskNo+'번 좌석을 신청하셨습니다.');
			//commentFunction(id);
			
		}
	}); 
	
	
}

	$(document).ready(function(){
		
	 	$('.desk').click(function(){
	 		
	 		$('#gridDiv').find('.green').removeClass('green');
	 		$(this).toggleClass("green");
	 		
	 		
	/* 		$(this).toggle(function(){
		 		$(this).css({"background-color" : "#ffa500"});
		 	}, 
		 	function(){
		 		$(this).css({"background-color" : "#7cfc00"});
		 	}); 
		 	 */
		}); 
		
	});
</script>
</head>

<body<%-- onselectstart="return false" oncontextmenu='return false' --%> >
<div id="gridDiv">
	<c:forEach begin="1" end="100" var="i"> 
		<div class="desk">
		<input type="hidden" name="deskNo" value="${i }">
		<h3>${i}번</h3>
		</div>
	</c:forEach>
</div>
<div>
<button  onclick="deskResrv()">선택</button>
</div>
</body>
</html>