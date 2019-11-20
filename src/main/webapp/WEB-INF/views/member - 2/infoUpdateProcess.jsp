<%@page import="com.exam.vo.MemberVO"%>
<%@page import="com.exam.dao.MemberDao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// session값 가져오기
	String loginMember = (String)session.getAttribute("id");
	
	//세션값 없으면 loginForm.jsp 이동
	if (loginMember == null) {
		response.sendRedirect("login.jsp");
		return;
}
%>

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

// 사용자 패스워드 확인해서 본인확인함. check값 1이면 성공
int check = memberDao.userCheck(memberVO.getId(), memberVO.getPasswd());
//check 값 패스워드 일치 1. 불일치 0
if (check == 1) {
	memberVO.setRegDate(new Timestamp(System.currentTimeMillis()));
	memberDao.updateMemberVO(memberVO); // DB회원정보 수정하기
	
	// DB에서 수정된 회원정보 레코드 가져오기
	MemberVO updateMemberVO = MemberDao.getMember(memberVO.getId());
	// 세션값 회원정보를 업데이트된 memberVO로 수정
	session.setAttribute("loginMember", updateMemberVO);
	
	%>
	<script>
		alert('수정이 완료되었습니다');
		location.href="../main/index.jsp"
	</script>
	<%	
} else {
	%>
	<script>
		alert('비번다름');
		history.back();
	</script>
	<%
}
%>