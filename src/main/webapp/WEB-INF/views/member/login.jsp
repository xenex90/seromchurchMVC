<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<title>새롬교회에 오신것을 환영합니다</title>
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
  		</aside>

<article>
	<h1>login</h1>
	<form action="logingopro.jsp" method="post" id="join">
		<legend>Login info</legend>
		<label>User ID</label>
		<input type="text" name="id"><br>
		<label>Password</label>
		<input type="password" name="passwd"><br>
		<label>Remember Me</label>
		<input type="checkbox" name="rememberMe" value="true"><br>		


	<div class="clear"></div>
	<div id="buttons">
		<input type="submit" value="로그인" class="submit">
		<input type="reset" value="초기화" class="cancel">
	</div>
	</form>	<button type="button" onclick="location.href='../mail/pwemail.jsp'">비밀번호 이메일로요청하기</button>
</article>
<div class="clear"></div>

        <div class="clear"></div>
        <footer>
        	      <jsp:include page="../include/footer.jsp"/>  
        </footer>
	</div>


    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="../scripts/jquery.fancybox.pack.js"></script>
    <script type="text/javascript" src="../scripts/prettify.packed.js"></script>
  	<script type="text/javascript">
  	
  	</script>
</body>
</html>