<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.exam.vo.BoardVO"%>
<%@page import="com.exam.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<title>새롬교회에 오신것을 환영합니다</title>
    <link href="../css/reset5.css" rel="stylesheet" type="text/css">
    <link href="../css/jquery.fancybox.css" rel="stylesheet" type="text/css"> 
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Droid+Sans' rel='stylesheet' type='text/css'>
</head>
<body>
<%
// 페이지번호 pageNum 파라미터값 가져오기
String pageNum = request.getParameter("pageNum");

// 글번호 num 파라미터값 가져오기
int num = Integer.parseInt(request.getParameter("num")); // 매개변수는 반드시 와야된다

// DAO 객체준비
BoardDao boardDao = BoardDao.getInstance();

// 조회수 1증가시키는 메소드 호출
boardDao.updateReadcount(num);

// 글번호에 해당하는 레코드 한개 가져오기
BoardVO boardVO = boardDao.getBoard(num);

// 글작성날짜 형식 "yyyy년MM월dd일 hh시mm분ss초"
SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일 hh시mm분ss초");
%>
	<div id="wrap">
	  
		<jsp:include page="../include/header.jsp"></jsp:include>        
			
   
  		<h1 id="community"><div>community</div></h1>
  		
			<div class="clear"></div>		
			
			
  		


  		<aside>
  			<h3><div>예배정보</div></h3>
  			<ul>
  				<li><a href="#">본 예배</a></li>
  				<li><a href="#">청년부 예배</a></li>
  				<li><a href="#">주일 학교 </a></li>
  				<li><a href="#">금요부흥회 </a></li>
  			</ul>
  			<nav></nav>
  		</aside>
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
		<th class="twrite">글내용</th>
		<td class="left" colspan="3"><pre><%=boardVO.getContent() %></pre></td>
	</tr>
</table>

<div id="table_search">
	<input type="button" value="글수정" class="btn" onclick="location.href='update.jsp?num=<%=boardVO.getNum() %>&pageNum=<%=pageNum %>';">
	<%-- 업데이트할 글번호 미리 준비, 페이지넘도 돌아가야할 목록임 --%>
	<input type="button" value="글삭제" class="btn" onclick="checkDelete()">
	<input type="button" value="답글쓰기" class="btn" onclick="location.href='reWrite.jsp?reRef=<%=boardVO.getReRef() %>&reLev=<%=boardVO.getReLev() %>&reSeq=<%=boardVO.getReSeq() %>&Subject=<%=boardVO.getSubject() %>';">
	<input type="button" value="목록보기" class="btn" onclick="location.href='notice.jsp?pageNum=<%=pageNum %>';">
</div>
<%-- 수정(UPDATE)이나 삭제(DELETE)는 현재 보고 있는 글내용에 대한거지만 답글쓰기는 현재보고 있는글을 바꾸는 것이 아니라 현재글에 대한 답글임 --%>
<%-- 답글 쓰는 것은 새로운 INSERT, 수정 삭제는 현재글의 번호가 넘어가야되지만 답글은 현재 글번호 넘어갈 필요없다--%>
<%-- 현재글이 가지고 있는 RE_* 3가지 값 --%>
</article>

        <div class="clear"></div>
        <footer>
        	      <jsp:include page="../include/footer.jsp"/>  
        </footer>
	</div>


    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="../scripts/jquery.fancybox.pack.js"></script>
    <script type="text/javascript" src="../scripts/prettify.packed.js"></script>
  	<script type="text/javascript">
  		$(document).ready(function() {
			$(".fancybox").fancybox({
				openEffect	: 'none',
				closeEffect	: 'none'
			});
		});
  	</script>
  	<script>
	function checkDelete() {
		var result = confirm('<%=boardVO.getNum() %>번 글을 정말로 삭제하실???');
		if (result == true) {
			location.href='delete.jsp?num=<%=boardVO.getNum() %>&pageNum=<%=pageNum %>';
		}
	}
</script>
</body>
</html>