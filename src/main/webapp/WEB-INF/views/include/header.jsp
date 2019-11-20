<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
	<div id="logo"><a href="../"><img src="../images/logo.jpg" width="265" height="62" alt="예수님"></a></div>
			<div id="hlink">
			<ul>
<%

String id = null;
String name= null;
Cookie[] cookies = request.getCookies();
if (cookies != null) {
	for (Cookie cookie : cookies){
		if (cookie.getName().equals("id")) {
			id = cookie.getValue();
			// 세션에 쿠키값을 저장
			session.setAttribute("id", id);
		}}
	for(Cookie cookie1 : cookies){
		if(cookie1.getName().equals("name")){
			name= cookie1.getValue();
			session.setAttribute("name", name);
		}
	
}}
%>
<%
	id=(String)session.getAttribute("id");
	name =(String) session.getAttribute("name");
	 %>
	
		<div id="login">
		<%
		if(id == null){
		%>
			<li><a href="../member/login.jsp">로그인</a></li>
     		<li><a href="../member/join.jsp">회원가입</a></li>
		<%
			}else if(id.equals("admin")){
				%>
				<%=name %>님 환영함
				<a href="../member/infoUpdate.jsp">정보수정</a>
				<a href="../member/allinfo.jsp">회원관리</a>
				<a href="../member/logout.jsp">logout</a>
				<%}
		else{
			%>
			<%=name %>님 환영함
			<a href="../member/logout.jsp">logout</a>
			<a href="../member/infoUpdate.jsp">정보수정</a>
			<a href="../member/delete.jsp">회원탈퇴</a>
			<%}
			
			%></ul>
		</div>
	
			<nav>
				<ul>
					<li class="n1"><a href="../church/church.jsp">목사님말씀</a></li>
					<li class="n2"><a href="../church/product.jsp">예배정보</a></li>
					<li class="n3"><a href="../church/community.jsp">갤러리</a></li>
					<li class="n4"><a href="../center/notice.jsp">커뮤니티</a></li>
				</ul>
			</nav>
		</header>
   