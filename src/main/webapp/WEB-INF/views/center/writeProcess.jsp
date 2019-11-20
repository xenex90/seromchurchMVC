<%@page import="com.exam.dao.MemberDao"%>
<%@page import="com.exam.vo.MemberVO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.exam.dao.BoardDao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- post 파라미터값 한글처리 --%>
<% request.setCharacterEncoding("utf-8"); %>	

<%-- 액션태그로 자바빈 객체 생성 --%>
<jsp:useBean id="boardVO" class="com.exam.vo.BoardVO"/>

<%-- 액션태그로 파라미터값을 자바빈에 저장 --%>
<jsp:setProperty property="*" name="boardVO"/>

<%
boardVO.setRegDate(new Timestamp(System.currentTimeMillis()));
boardVO.setIp(request.getRemoteAddr());
%>
MemberVO membervo =MemberVO
<%-- BoardDao 객체 준비 --%>
<%BoardDao boardDao = BoardDao.getInstance();%>

<%
//게시글 번호생성하는 메소드 호출
int num = boardDao.nextBoardNum();
// 생성된 번호를 자바빈 글번호 필드에 설정
boardVO.setNum(Integer.toString(num));
boardVO.setReadcount(0); // 조회수 0

// 주글일 경우
		String id = (String)session.getAttribute("id");
		MemberDao memberDao = MemberDao.getInstance();
		MemberVO member = MemberDao.getMember(id);
		boardVO.setPasswd(member.getPasswd());
boardVO.setReRef(num); // 주글 쓰기에서 [글그룹 번호]는 글번호와 동일함
boardVO.setReLev(0); // [들여쓰기 레벨] 0
boardVO.setReSeq(0); // [글그룹 안에서의 순서] 0
%>

<%-- 게시글 한개 등록하는 메소드 호출 insertBoard(boardVO) --%>
<% boardDao.insertBoard(boardVO); %>

<%-- 이동 notice.jsp --%>
<% response.sendRedirect("notice.jsp"); %>





