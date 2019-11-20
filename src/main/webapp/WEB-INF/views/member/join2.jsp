<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->


<!--[if IE 6]>
 <script src="../script/DD_belatedPNG.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#sub_img');   
   DD_belatedPNG.fix('#sub_img_center'); 
   DD_belatedPNG.fix('#sub_img_member'); 

 </script>
 <![endif]--> 
 <jsp:include page="../include/header.jsp"/>
 <jsp:include page="../include/nav_center.jsp" />
<script>

function checka() {
	if(aaa.id.value.length < 4) {
	alert('ID는 네글자 이상 사용가능합니다.');
	aaa.id.select();
	return false;
	}
	if(aaa.passwd.value.length==0){
	alert('password는 필수 입력 항목입니다.');
	aaa.passwd.focus();
	return false;
	}
	if(aaa.name.value.length==0){
		alert('name은 필수 입력 항목입니다.');
		aaa.name.focus();
		return false;
	}
	if(aaa.email.value.length==0){
		alert('email은 필수 입력항목입니다.');
		aaa.email.focus();
		return false;
	}
	if (document.aaa.passwd.value != document.frm.passwd2.value) {
		alert('password 입력값이 서로 다릅니다.');
		document.aaa.passwd.select();
		return false;
	}
	if (aaa.email.value != frm.email2.value) {
		alert('email 입력값이 서로 다릅니다.');
		document.aaa.email.select();
		return false;
	}
	return true;
}

function winOpen() {
	var inputId=document.aaa.id.value;
	if(inputId==''){
		alert('ID를 입력하세요');
		document.aaa.id.focus();
		return;}
	
	var childWindow = window.open('iddup.jsp?userid='+inputId, '','width=400,height=200');
}
		
		
	

</script>
</head>
<body>
<h1>Join Us</h1>
<form name="aaa" id="join" action="joingopro.jsp" method="post" onsubmit="return checka();">
<label> 아이디</label><input name="id" type="text" class="id">
					<input name="idcheck" type="button" value="ID 중복확인" class="dup" onclick="winOpen();"><br>
<label> 비밀번호</label><input name="passwd" type="password" class="pass"><br>
<label>비밀번호 재입력</label><input name="passwd2" type="password" class="passwd"><br>
<label>이름</label><input name="name" type="text" class="nick"><br>
<label>이메일</label><input name="email" type="email" class="email"><br>
<label>이메일 재입력</label><input name="reemail" type="email" class="email"><br>
추가입력사항
<label>주소</label><input name="address" type="text" class="address"><br>
<label>전화번호</label><input name="tel" type="tel" class="phone"><br>
<label>모바일전화번호</label><input name="mtel" type="tel" class="mobile"><br>


<div class="clear"></div>
<div id="buttons">
<input type="submit" value="회원가입" class="submit">
<input name="cancel1" type="button" value="Cancel" class="cancel">
</div>
</form>

</body>
</html>