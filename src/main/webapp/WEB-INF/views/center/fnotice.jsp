<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.exam.vo.BoardVO"%>
<%@page import="java.util.List"%>
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
</head>
<%
// 파라미터값 pageNum 가져오기
String search = request.getParameter("search"); // 검색어
if (search == null) {
	search = "";
}
String strPageNum = request.getParameter("pageNum");
if (strPageNum == null) {
	strPageNum = "1";
}
// 페이지 번호
int pageNum = Integer.parseInt(strPageNum);
// DAO 객체 준비
BoardDao boardDao = BoardDao.getInstance();
// 한페이지(화면)에 보여줄 글의 갯수
int pageSize = 10;
// 시작행 번호 구하기
int startRow = (pageNum -1) * pageSize +1;
// board 테이블 글개수 가져오기 메소드 호출
int count = boardDao.getBoardCount(search);
// 글목록 가져오기 메소드 호출
List<BoardVO> boardList = boardDao.getBoards(startRow, pageSize, search);
// 날짜 포맷 준비 SimpleDateFormat
SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
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
<article>
    
<h1> FILE Notice [전체글개수 : <%=count %>]</h1>
    
<table id="cbbs">
  <tr>
    <th scope="col" class="tno">no.</th>
    <th scope="col" class="ttitle">title</th>
    <th scope="col" class="twrite">writer</th>
    <th scope="col" class="tdate">date</th>
    <th scope="col" class="tread">read</th>
  </tr>
  
  <%
  if (count > 0) {
	  for (BoardVO boardVO : boardList) {
		  %>
		   <tr onclick="location.href='fcontent.jsp?num=<%=boardVO.getNum()%>&pageNum=<%=pageNum %>';">
		  	<td><%=boardVO.getNum() %></td>
		  	<td class="left">
		  	<% 
		  	if (boardVO.getReLev() > 0 ) { // 답글
		  		int level = boardVO.getReLev() * 10;
		        %>
		        <img src="../images/center/level.gif" width="<%=level %>" height="13">
		        <img src="../images/center/icon_re.gif">
		        <%
		  	}
		  	%>
		  	<%=boardVO.getSubject() %></td>
		  	<td><%=boardVO.getUsername() %></td>
		  	<td><%=sdf.format(boardVO.getRegDate()) %></td>
		  	<td><%=boardVO.getReadcount() %></td>
		  </tr>
		  <%
	  }
  } else { // count == 0
		  %>
		  <tr>
		  	<td colspan="5">게시판 글이 없습니다.</td>
		  </tr>
		  <%
  }
  %>
                 
</table>
<div id="table_search">
	<input type="button" value="글쓰기" class="btn" onclick="location.href='fwrite.jsp';" />
</div>
<form action="notice.jsp" method="get">
<div id="table_search">
	<input type="text" name="search" value="<%=search %>" class="input_box">  
	<input type="button" value="제목검색" class="btn">
</div>
</form>
 <div class="clear"></div>
 
<div id="page_control">
<%
if (count > 0) {
	// 총 페이지 개수 구하기
	// 전체 글개수 / 한페이지당 글개수 (+1 : 나머지 있을 때)
	int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1 );
	// 페이지 블록 수 설정
	int pageBlock = 4;
	// 시작페이지번호 구하기
	// pageNum값이 1~5사이면 -> 시작페이지는 항상 1이 나와야 함.
	// ((1-1)/5) * 5 + 1 -> 1
	// ((2-1)/5) * 5 + 1 -> 1
	// ((3-1)/5) * 5 + 1 -> 1
	// ((4-1)/5) * 5 + 1 -> 1
	// ((5-1)/5) * 5 + 1 -> 1
	int startPage = ((pageNum -1) / pageBlock) * pageBlock +1;
	// 끝페이지번호 endPage 구하기
	int endPage = startPage + pageBlock -1;
	if (endPage > pageCount) {
		endPage = pageCount;
	}
	// [이전] 출력
	if (startPage > pageBlock) {
		%>
		<a href="notice.jsp?pageNum=<%=startPage-pageBlock %>&search=<%=search %>">[이전]</a> 
		<%
	}
	// 페이지블록  페이지5개 출력
	for (int i=startPage; i<=endPage; i++) {
		%>
		<a href="notice.jsp?pageNum=<%=i %>&search=<%=search %>">
		<%
		if (i == pageNum) {
			%><span style="font-weight: bold;">[<%=i %>]</span><%
		} else {
			%><%=i %><%
		}
		%>
		</a> 
		<%
	} 
	// [다음] 출력
	if (endPage < pageCount) {
		%>
		<a href="notice.jsp?pageNum=<%=startPage+pageBlock %>&search=<%=search %>">[다음]</a> 
		<%
	}
} // if
%>
</div>
</article>
    
     <div class="clear"></div>
   	 <jsp:include page="../include/footer.jsp" />
</div>

</body>
</html>   