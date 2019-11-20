<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<title>새롬교회에 오신 것을 환영합니다.</title>
    <link href="../css/reset5.css" rel="stylesheet" type="text/css">
    <link href="../css/jquery.fancybox.css" rel="stylesheet" type="text/css"> 
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Droid+Sans' rel='stylesheet' type='text/css'>

</head>
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

	<h1>비밀번호 이메일로 요청하기</h1>ID

	<form action="pwemailpro.jsp" method="post" id="ggg">                  <!-- html코드안에 java코드 넣어도 된다 -->
		아이디: <input type="text" name="id" id="id" /><br><!-- 커서가 안가짐 읽기만 --><!-- disabled -->
		가입한 email: <input type="text" name="email" id="email" value="유효한 이메일을 입력하세요"/><br>
		<button type="submit">이메일 요청하기</button> 
	</form>
	<br>
	<a href="../main/index.jsp">메인으로 가기</a>

        <div class="clear"></div>
        <footer>
        <jsp:include page="../include/footer.jsp"/>  
        </footer>
	</div>
</body>
</html>