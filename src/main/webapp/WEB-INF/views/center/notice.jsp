<%@page import="com.exam.dao.MemberDao"%>
<%@page import="com.exam.vo.MemberVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.exam.vo.BoardVO"%>
<%@page import="java.util.*"%>
<%@page import="com.exam.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>Welcome to Fun Web</title>
<script src="https://ajax.googleapis.com/ajax/libs/d3js/5.12.0/d3.min.js"></script>
<link href="../css/reset5.css" rel="stylesheet" type="text/css">
    <link href="../css/jquery.fancpageybox.css" rel="stylesheet" type="text/css"> 
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Droid+Sans' rel='stylesheet' type='text/css'>
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
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
<jsp:useBean id="memberVO" class="com.exam.vo.MemberVO"/>

<jsp:setProperty property="*" name="memberVO"/>
</head>
<%

String id = (String)session.getAttribute("id");
MemberDao memberDao = MemberDao.getInstance();
MemberVO member = MemberDao.getMember(id);
// 파라미터값 pageNum 가져오기
String search = request.getParameter("search"); // 검색어
if (search == null) { // null 자체가 쿼리스트링으로 받아진다.
	search = "";
}
String strPageNum = request.getParameter("pageNum");
if (strPageNum == null) {
	strPageNum = "1";
}

// 페이지 번호
int pageNum = Integer.parseInt(strPageNum);

// DAO 객체준비
BoardDao boardDao = BoardDao.getInstance();

// 한 페이지(화면)에 보여줄 글 개수
int pageSize = 10;

// 시작행번호 구하기
int startRow = (pageNum - 1) * pageSize + 1; // -1 을 안하면 

// board 테이블 전체 글개수 가져오기 메소드 호출
int count = boardDao.getBoardCount(search);

// 글목록 가져오기 메소드 호출
List<BoardVO> boardList = boardDao.getBoards(startRow, pageSize, search);

// 날짜 포맷 준비 SimpleDateFormat
SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
%>
<body>
<div id="wrap">
	<!-- 헤더 영역 -->
	<jsp:include page="../include/header.jsp"/>
	
	<div class="clear"></div>
	<div id="sub_img_center"></div>
	<div class="clear"></div>
	
	<%-- nav 영역 --%> 
	<jsp:include page="../include/nav_center.jsp"/>
  
<article>
    
<h1>Notice [전체글 개수 : <%=count %>]</h1>
    <form action="notice.jsp" method="post">
<table id="cbbs">
  <tr>
  	<%if(member.getId().equals("admin")){%><th scope="col" class="tdel" id="tdel" style="visibility:visible; width=50px">삭제</th><%} %>
    <th scope="col" class="tno">번호</th>
    <th scope="col" class="ttitle">제목</th>
    <th scope="col" class="twrite">작성자</th>
    <th scope="col" class="tdate">날짜</th>
    <th scope="col" class="tread">조회수</th>
  </tr>
  <%
  if (count > 0) { // 게시글이 있다
	 for (BoardVO boardVO : boardList) {
		 %> 
		 <tr onclick="location.href='content.jsp?num=<%= boardVO.getNum() %>&pageNum=<%=pageNum %>';">
		 	<%if(member.getId().equals("admin")){%><td id="ttdel">
		 	<input type="checkbox" name="delid" value=<%=boardVO.getNum()%> id="delid"  onclick="event.cancelBubble = true;" ><%} %>
		 	</td>
		 	<td style=width:50px><%=boardVO.getNum() %></td>
		 	<td class="left">
			 	<%
			 	if (boardVO.getReLev() > 0) {
			 		int level = boardVO.getReLev() * 10;
			 		%>
			 		<img src="../images/center/level.gif" height="13" width="<%=level %>">
			 		<img src="../images/center/re.gif"/>
				 	<%
			 	}
			 	%>
			 	<%=boardVO.getSubject() %>
			</td>
		 	<td><%=boardVO.getUsername() %></td>
		 	<td><%=sdf.format(boardVO.getRegDate()) %></td>
		 	<td><%=boardVO.getReadcount() %></td>
		 </tr>
		 <%
	 }
  } else { // count == 0 게시판에 글이 없을때
	  %>
	 <tr>
	 	<td colspan="5">게시판 글이 없습니다.</td>
	 </tr>
	  <%
  }
  %>

</table>

<div id="table_search">	 <%-- 세션이 있을때만 글쓰기 버튼 노출 --%>
		<input type="button" value="글쓰기" class="btn" onclick="location.href='write.jsp';"/>
</div>


	<div id="table_search">
		
		<input type="text" name="search" value="<%=search %>" class="input_box"><input type="submit" value="제목검색" class="btn" >
		
		<%if(member.getId().equals("admin")){%><input type=submit formaction="deletepropro.jsp" name="del" value="삭제" style="float: right" /><%}%>
		<%System.out.println(member.getId());%>
		
	</div>
</form>
<div class="clear"></div>

<div id="page_control">
<%
if (count > 0) {
	// 총 페이지 개수 구하기
	// 전체 글 개수 / 한페이지당 보여줄 글 개수 (나머지가 있을때는 +1)
	int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1); // 나머지 0이면 안더하고, 0 아니면 1을 더함
	
	// 페이지블록 수 설정
	int pageBlock = 5;
	
	// 시작페이지 번호 startPage 구하기
	// pageNum 값이 1~5 사이면 시작페이지는 항상 1이 나와야함
	
	// (1 / 5) * 5 + 1 -> 1
	// (2 / 5) * 5 + 1 -> 1
	// (3 / 5) * 5 + 1 -> 1
	// (4 / 5) * 5 + 1 -> 1
	// ((5 / 5)-1) * 5 + 1 -> 1
	// pageBlock의 배수가 될때는 1을 빼줘야 된다.
	
	// (6 - 1 / 5) * 5 + 1 -> 6
	// (7 - 1 / 5) * 5 + 1 -> 6
	// (8 - 1 / 5) * 5 + 1 -> 6
	// (9 - 1 / 5) * 5 + 1 -> 6
	// (10 - 1 / 5) * 5 + 1 -> 6 
	int startPage = ((pageNum - 1) / pageBlock) * pageBlock + 1;
	
	// 끝페이지 번호 endPage
	int endPage = startPage + pageBlock - 1;
	if (pageCount < endPage) {
		endPage = pageCount;
	}
	
	// [이전]
	if (startPage>pageBlock) {
		%>
		<a href="notice.jsp?pageNum=<%=startPage - pageBlock + 4 %>&search=<%=search %>">[이전]</a>
		<%
	}
	
	// 페이지블록 페이지 5개 출력
	for (int i = startPage; i <= endPage; i++) {
			%>
			<a href="notice.jsp?pageNum=<%=i %>&search=<%=search %>"><%= pageNum == i ? "[<b style=\"color: blue;\">" + i + "</b>]" : i %></a>
			<%
	} // for
	
	// [다음]
		if (endPage < pageCount) {
		%>
		<a href="notice.jsp?pageNum=<%=startPage + pageBlock %>&search=<%=search %>">[다음]</a>
		<%
		}
} // if
%></div>

</article>

<div class="clear"></div>
	<!-- footer 영역 -->
	<jsp:include page="../include/footer.jsp"/>
</div>
<script>


function visible(){

  var a=document.getElementById("tdel");

  a.style.visibility="visible";

  var b=document.getElementById("ttdel");

  b.style.visibility="visible";
}

</script>

</body>
</html>   