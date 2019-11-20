<%@page import="com.exam.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원삭제</title>

</head>
<header>
			<jsp:include page="../include/header.jsp"/>
		</header>
<body>

<%
		request.setCharacterEncoding("utf-8");
	
		// 쿠키값 가져오기
		Cookie[] cookies = request.getCookies();

		//세션값 없으면 loginForm.jsp 이동
		if (cookies == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		
		String aaa =(String)session.getAttribute("id");
	%>	
	
	<h1>회원정보수정</h1>ID

	<form action="deletegopro.jsp" method="post" id="idupdate">                  <!-- html코드안에 java코드 넣어도 된다 -->
		아이디: <input type="text" name="id" value="<%=aaa%>" readonly /><br><!-- 커서가 안가짐 읽기만 --><!-- disabled -->
		패스워드 <input type="password" name="passwd"/><br>
		<button type="submit">삭제하기</button> 
	</form>
	<br>
	<a href="../main/index.jsp">메인ㄱㄱ</a>
</body>
</html>