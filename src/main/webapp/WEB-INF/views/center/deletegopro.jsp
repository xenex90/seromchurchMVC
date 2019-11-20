<%@page import="com.exam.vo.BoardVO"%>
<%@page import="com.exam.dao.BoardDao"%>
<%@page import="com.exam.dao.MemberDao"%>
<%@page import="com.exam.vo.MemberVO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String id = (String) session.getAttribute("id"); %>
<%
// post 파라미터값 한글처리
request.setCharacterEncoding("utf-8");
// 파라미터 값 가져오기
String pagenum = request.getParameter("pagenum");


int num = Integer.parseInt(request.getParameter("num"));
// passwd 파라미터값은 로그인 사용자일 경우는 null
String passwd = request.getParameter("passwd"); 
// DAO 객체준비
BoardDao boardDao = BoardDao.getInstance();
// 로그인 안한 사용자는 입력한 패스워드와 글패스워드를 비교해서
// 같을때는 삭제처리 
// 다를때는 "글패스워드 다름" 뒤로가기  
if (id == null) {
	if (!boardDao.isPasswdEqual(num, passwd)) {
		%>
		<script>
			alert('글 패스워드가 다릅니다.');
			history.back();
		</script>
		<%
		return;
	}
}
// 게시글 삭제하기 메소드 호출
//   [로그인한 사용자] 또는 [로그인 안한 사용자]인데 패스워드 일치한 자
boardDao.deleteBoard(num);         
%> 
	<script>
		alert('글을 삭제 하였습니다.');
	 	location.href = 'notice.jsp?pageNum=<%=pagenum %>';
	</script>

