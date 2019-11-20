<%@page import="com.exam.dao.BoardDao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- post 파라미터값 한글처리 --%>
<% request.setCharacterEncoding("utf-8"); %>

<%-- 액션태그로 자바빈 객체 생성 --%>
<jsp:useBean id="boardVO" class="com.exam.vo.BoardVO"/>

<%-- 액션태그로 파라미터값을 자바빈에 저장 --%>
<%-- re로 시작하는 파라미터값(reRef, reLev, reSeq)은 답글정보가 아니라 
	 답글을 다는 대상글(원글)에 대한 정보임!!!!!
--%>
<jsp:setProperty property="*" name="boardVO"/>

<%-- 글 등록날짜, IP주소 값을 저장 -> DB작업 없이 생성할 수 있는 부분--%>
<%
boardVO.setRegDate(new Timestamp(System.currentTimeMillis()));
boardVO.setIp(request.getRemoteAddr());
%>

<%-- BoardDao 객체 준비 --%>
<%BoardDao boardDao = BoardDao.getInstance();%>

<%
//게시글 번호생성하는 메소드 호출
int num = boardDao.nextBoardNum();
//생성된 번호를 자바빈 글번호 필드에 설정
boardVO.setNum(Integer.toString(num));
boardVO.setReadcount(0); // 조회수 0

// 답글쓰기 메소드 호출
boardDao.reInsertBoard(boardVO);

// 이동 notice.jsp
response.sendRedirect("notice.jsp");
%>
