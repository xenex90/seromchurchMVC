<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="wrap">
	<jsp:include page="../include/header.jsp"/>
	<div class="clear"></div>
	<div id="sub_img_member"></div>
	<div class="clear"></div>
</div>
<jsp:include page="../include/nav_center.jsp" />
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
	</form>	

</article>
<div class="clear"></div>

<jsp:include page="../include/footer.jsp"/>
</body>
</html>