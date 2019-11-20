<%@page import="com.exam.vo.MemberVO"%>
<%@page import="com.exam.dao.MemberDao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="memberVO" class="com.exam.vo.MemberVO"/>

<jsp:setProperty property="*" name="memberVO"/>

<% memberVO.setRegDate(new Timestamp(System.currentTimeMillis()));%>

<%MemberDao memberDao = MemberDao.getInstance();%>
<%String id =(String)session.getAttribute("id"); %>
<%memberDao.insertMember(memberVO); %>
		<%MemberVO joinMemberVO= MemberDao.getMember(memberVO.getId()); %>
<%session.setAttribute("joinMemberVO", joinMemberVO); %>
<script>
<!--alert('회원가입 되었습니다. \n로그인 페이지로 이동합니다.');-->
location.href = '../mail/emailsend.jsp';
</script>