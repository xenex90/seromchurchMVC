<%@page import="com.exam.vo.MemberVO"%>
<%@page import="com.exam.dao.MemberDao"%>
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
  			<nav></nav>
  		</aside>

<%
		request.setCharacterEncoding("utf-8");
	
		// 쿠키값 가져오기
		Cookie[] cookies = request.getCookies();

		//세션값 없으면 loginForm.jsp 이동
		if (cookies == null) {
			response.sendRedirect("login.jsp");
			return;   
		}
		
		String id = (String)session.getAttribute("id");
		MemberDao memberDao = MemberDao.getInstance();
		MemberVO member = MemberDao.getMember(id);
		%>	
	
	<h1>회원정보수정</h1>ID

	<form action="infoUpdateProcess.jsp" method="post" id="loginMember">                 
		아이디: <input type="text" name="id" value="<%=member.getId()%>" readonly/><br>
		패스워드 <input type="password" name="passwd"/><br>
		이름: <input type="text" name="name" value="<%=member.getName()%>"/><br>
		이메일: <input type="email" name="email" value="<%=(member.getEmail()==null) ? "" : member.getEmail() %>"/><br>
		주소: <input type="text" name="address" /><br>
		전화번호: <input type="text" name="tel" /><br>
		폰번호: <input type="text" name="mtel" /><br>
		<button type="submit">수정하기</button> 
	</form>
	<br>
	<a href="../main/index.jsp">메인으로 가기</a>

        <div class="clear"></div>
        <footer>
        	      <jsp:include page="../include/footer.jsp"/>  
        </footer>
	</div>


    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="../scripts/jquery.fancybox.pack.js"></script>
    <script type="text/javascript" src="../scripts/prettify.packed.js"></script>
  	<script type="text/javascript">
  		$(document).ready(function() {
			$(".fancybox").fancybox({
				openEffect	: 'none',
				closeEffect	: 'none'
			});
		});
  	</script>
</body>
</html>