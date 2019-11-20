<%@page import="java.util.List"%>
<%@page import="com.exam.vo.AttachVO"%>
<%@page import="com.exam.dao.AttachDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.exam.vo.BoardVO"%>
<%@page import="com.exam.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>새롬교회에 오신것을 환영합니다</title>
<link href="../css/reset5.css" rel="stylesheet" type="text/css">
    <link href="../css/jquery.fancybox.css" rel="stylesheet" type="text/css"> 
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Droid+Sans' rel='stylesheet' type='text/css'>
<style>

table#cbbs {
		width: 680px;
		border-top: 1px solid #363636;
		border-bottom: 1px solid #ccc;
	}
	table#cbbs th, table#cbbs td {
		padding:9px;
		text-align: center;
	}
	table#cbbs th {
		border-bottom: 1px solid #363636;
		font-size: 1.1em;
		text-shadow: 1px 1px 1px #fff;
		background: #f2f6f8; 
		background: -moz-linear-gradient(top,  #f2f6f8 0%, #d8e1e7 50%, #b5c6d0 51%, #e0eff9 100%); 
		background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#f2f6f8), color-stop(50%,#d8e1e7), color-stop(51%,#b5c6d0), color-stop(100%,#e0eff9)); 
		background: -webkit-linear-gradient(top,  #f2f6f8 0%,#d8e1e7 50%,#b5c6d0 51%,#e0eff9 100%); 
		background: -o-linear-gradient(top,  #f2f6f8 0%,#d8e1e7 50%,#b5c6d0 51%,#e0eff9 100%); 
		background: -ms-linear-gradient(top,  #f2f6f8 0%,#d8e1e7 50%,#b5c6d0 51%,#e0eff9 100%); 
		background: linear-gradient(to bottom,  #f2f6f8 0%,#d8e1e7 50%,#b5c6d0 51%,#e0eff9 100%); 
		filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f2f6f8', endColorstr='#e0eff9',GradientType=0 ); 
	}	
	table#cbbs th:nth-child(2){letter-spacing: 5em;}
	table#cbbs td{border-bottom: 1px dotted #ccc;	}
	table#cbbs tr:nth-child(even){background-color: rgba(245,245,245,0.9);}
	table#cbbs td:nth-child(2){	text-align: left;width: 60%;}
}</style>
</head>
<%
// 페이지번호 pageNum 파라미터값 가져오기
String pageNum = request.getParameter("pageNum");
// 글번호 num 파라미터값 가져오기
int num = Integer.parseInt(request.getParameter("num"));
// DAO 객체준비
BoardDao boardDao = BoardDao.getInstance();
// 조회수 1증가시키는 메소드 호출
boardDao.updateReadcount(num); 
// 글번호에 해당하는 레코드 한개 가져오기
BoardVO boardVO = boardDao.getBoard(num); 
// 글작성날짜 형식 "yyyy년MM월dd일 hh시mm분ss초"
SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일 hh시mm분ss초");
AttachDao attachDao = AttachDao.getInstance();
// 글번호에 해당하는 첨부파일 정보 가져오기
List<AttachVO> attachList = attachDao.getAttaches(num); 
%>
<body>
<div id="wrap">
  <!--  헤더 영역 -->
	<jsp:include page="../include/header.jsp" />	
  <div class="clear"></div>
<div id="sub_img_center"></div>
<div class="clear"></div>
   <!--  nav 영역 -->
	<jsp:include page="../include/nav_center.jsp" />
<% String id = (String) session.getAttribute("id"); %>		
<article>
    
<h1>Notice Content</h1>
<table id="cbbs">
	<tr>
  		<th class="twrite">글번호</th>
    	<td class="left" width="200"><%=boardVO.getNum()%></td>
    	<th class="twrite">조회수</th>
    	<td class="left" width="200"><%=boardVO.getReadcount() %></td>
	</tr> 
	<tr>
  		<th class="twrite">작성자명</th>
    	<td class="left"><%=boardVO.getUsername() %></td>
    	<th class="twrite">작성일자</th>
    	<td class="left"><%=sdf.format(boardVO.getRegDate()) %></td>
	</tr> 
	<tr>
  		<th class="twrite">글제목</th>
    	<td class="left" colspan="3"><%=boardVO.getSubject() %></td>
	</tr> 
	<tr>
  		<th class="twrite">파일</th>
    	<td class="left" colspan="3">
    	<%
    	for (AttachVO attachVO : attachList) {
    		if (attachVO.getFiletype().equals("I")) { // 이미지 타입
    			%>
	    		<a href="upload/<%=attachVO.getFilename() %>" download>
	    		<img src="upload/<%=attachVO.getFilename() %>" width="50" height="50">
    			</a><br>
    		<%
    			} else {
    			%>
    			<a href="upload/<%=attachVO.getFilename() %>" download>
    			<%=attachVO.getFilename() %>
    			</a><br>
    			<%
    		}
    	}
    	%></td>
	</tr>   
	<tr>
  		<th class="twrite">글내용</th>
    	<td class="left" colspan="3"><pre><%=boardVO.getContent() %></pre></td>
	</tr> 
</table>
<div id="table_search">
	<input type="button" value="글수정" class="btn" onclick="location.href='update.jsp?num=<%=boardVO.getNum() %>&pageNum=<%=pageNum %>';"/>
	<input type="button" value="글삭제" class="btn" onclick="checkDelete();"/>
	<input type="button" value="답글쓰기" class="btn" onclick="location.href='reWrite.jsp?reRef=<%=boardVO.getReRef() %>&reLev=<%=boardVO.getReLev() %>&reSeq=<%=boardVO.getReSeq() %>';"/>
	<input type="button" value="목록보기" class="btn" onclick="location.href='fnotice.jsp?pageNum=<%=pageNum %>';"/>
</div>
</article>  
     <div class="clear"></div>
   <jsp:include page="../include/footer.jsp" />
</div>
<script>
	function checkDelete() {
		var result = confirm('<%=boardVO.getNum() %>번 글을 정말로 삭제하시겠소?');
		if (result == true) {
		location.href = 'fdelete.jsp?num=<%=boardVO.getNum() %>&pageNum=<%=pageNum %>';			
		}
	}
</script>
</body>
</html> 