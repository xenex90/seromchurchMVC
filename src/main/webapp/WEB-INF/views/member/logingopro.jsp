<%@page import="com.exam.vo.MemberVO"%>
<%@page import="com.exam.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%
String id=request.getParameter("id");
String passwd =request.getParameter("passwd");
String rememberMe= request.getParameter("rememberMe");

MemberDao memberDao = MemberDao.getInstance();

int check = memberDao.userCheck(id,passwd);


if(check==1){

session.setAttribute("id",id);
String name = memberDao.getMember(id).getName();
System.out.println(name);
session.setAttribute("name",name);


if (rememberMe != null && rememberMe.equals("true")) {
	Cookie cookie = new Cookie("id", id);
	Cookie cookie1 =new Cookie("name",name);
	cookie.setMaxAge(60*10); // 초단위
	cookie.setPath("/");
	cookie1.setMaxAge(60*10);// 경로설정
	cookie1.setPath("/");
	response.addCookie(cookie);
	response.addCookie(cookie1);// 응답객체에 추가
}


response.sendRedirect("../main/index.jsp");
}else if (check ==0){
%>
<script>
	alert('패스워드가 틀립니다.');
	history.back();
</script>
<%
} else {
%>
<script>
	alert('아이디 없습니다');
	history.back();
</script>
<%
}%>


