<%@page import="com.exam.vo.MemberVO"%>
<%@page import="com.exam.dao.MemberDao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// post 파라미터값 한글처리
	request.setCharacterEncoding("utf-8");
%>

<%-- 액션태그 userBean 자바빈 객체생성 --%>
<jsp:useBean id="memberVO" class="com.exam.vo.MemberVO"/>

<%-- 액션태그 setProperty 폼 -> 자바빈 필드에 저장 --%>
<jsp:setProperty property="*" name="memberVO"/>

<%
// DB 객체 준비
MemberDao memberDao = MemberDao.getInstance();
//MemberVO memberVO=MemberDao.getMember(id)
// 사용자 패스워드 확인해서 본인확인함. check값 1이면 성공
String id=request.getParameter("id");
String email=request.getParameter("email");
int check = MemberDao.userCheck2(id, email);
//check 값 패스워드 일치 1. 불일치 0
if (check == 1) {
	memberVO.setRegDate(new Timestamp(System.currentTimeMillis()));
	System.out.println(id);
	System.out.println(email);
	
	// DB에서 수정된 회원정보 레코드 가져오기
	MemberVO updateMemberVO = MemberDao.getMember(id);
	updateMemberVO.setRegDate(new Timestamp(System.currentTimeMillis()));
	// 세션값 회원정보를 업데이트된 memberVO로 수정
	session.setAttribute("emailMemberVO", updateMemberVO);
	
	%>
	<script>
		<!--alert('수정이 완료되었습니다');-->
		location.href="emailsend2.jsp"
	</script>
	<%	
} else {
	%>
	<script>
		alert('사용자 정보가 일치 하지 않습니다.');
		history.back();
	</script>
	<%
}
%>