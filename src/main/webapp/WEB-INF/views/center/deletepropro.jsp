<%@page import="com.exam.dao.BoardDao"%>
<%@page import="com.exam.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
//세션값 가져오기
// 배열로 해야한다.
String[] boardid =  request.getParameterValues("delid");

// 항상 이런식으로  sysout해봐서 되는 습관을 가져야 한다. console 창에 뜨면 잘넘어오는거
//for(int i =0 ;i<boardid.length;i++) {
   //System.out.println(boardid[i]);   
//}

BoardDao boardDao = BoardDao.getInstance();

boardDao.MdeleteBoards(boardid);

%>
<script>
   alert('삭제되었습니다');
   location.href = 'notice.jsp';
</script>