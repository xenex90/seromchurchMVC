<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<title>새롬교회에 오신것을 환영합니다</title>
    <link href="../css/reset5.css" rel="stylesheet" type="text/css">
   
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Droid+Sans' rel='stylesheet' type='text/css'>
	  <link href="../css/join.css" rel="stylesheet" type="text/css">
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
		
		
	

</script></head>
<body>
	<div id="wrap">
	  
		<jsp:include page="../include/header.jsp"></jsp:include>        
			
   
  		<h1 id="community"><div>community</div></h1>
  		
			<div class="clear"></div>		
			
			
  		


  		<aside>
  			<h3><div>예배정보</div></h3>
  			<ul>
  				<li><a href="#">본 예배</a></li>
  				<li><a href="#">청년부 예배</a></li>
  				<li><a href="#">주일 학교 </a></li>
  				<li><a href="#">금요부흥회 </a></li>
  			</ul>
  			<nav></nav>
  		</aside>
<h1>Join Us</h1>
<form name="aaa" id="join" action="joingopro.jsp" method="post" onsubmit="return checka();">
<label> 아이디</label><input name="id" type="text" class="id" id="id">
					<input name="idcheck" type="button" value="ID 중복확인" class="dup" onclick="winOpen();"><span id="id-message"></span><br>
<label> 비밀번호</label><input name="passwd" type="password" class="pass"><br>
<label>비밀번호 재입력</label><input name="passwd2" type="password" class="passwd"><br>
<label>이름</label><input name="name" type="text" class="nick"><br>
<label>이메일</label><input name="email" type="email" class="email"><br>
<label>이메일 재입력</label><input name="reemail" type="email" class="email"><br>
추가입력사항
<label>주소</label><input name="address" type="text" class="address"><br>
<label>전화번호</label><input name="tel" type="tel" class="phone"><br>
<label>모바일전화번호</label><input name="mtel" type="tel" class="mobile"><br>



<div style="user-select: auto;width: 100%;text-align: center;" id="buttons">
<input type="submit" id="submit" value="회원가입" class="submit" style="float:right">
<input name="cancel" id="cancel" type="button" value="취소" class="cancel" style="float:right" onclick="location.href='../main/index.jsp'">
</div>
</form>

        <div class="clear"></div>
        <footer>
        	      <jsp:include page="../include/footer.jsp"/>  
        </footer>
	</div>


    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="../scripts/jquery.fancybox.pack.js"></script>
    <script type="text/javascript" src="../scripts/prettify.packed.js"></script>
  
  	
 <script>
  		$('#id').keyup(function () {
  		var id = $(this).val();
  			console.log(id);
  			
  		
  		$.ajax({
  			url:'joinDupcheckjson.jsp',
  			data:{id: id},
  			success:function(data){
  				console.log(typeof data);
  				console.log(data);
  				
  				idDupMessage(data);
  			}
  		});
  		});	
  		
  		 function idDupMessage(isIdDup) {
  			if (isIdDup) { // 중복 true
  				$('span#id-message').html('중복된 아이디입니다.').css('color', 'red');
  			} else { // 중복아님 false
  				$('span#id-message').html('사용가능한 아이디입니다.').css('color', 'green');
  			}
  		} 
  		</script>
</body>
</html>