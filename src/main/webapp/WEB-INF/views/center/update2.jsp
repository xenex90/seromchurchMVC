<%@page import="com.exam.vo.BoardVO"%>
<%@page import="com.exam.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>

<%
// 파라미터값 가져오기  num, pageNum
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");

// DAO 객체 준비
BoardDao boardDao = BoardDao.getInstance();
// 수정할 글 가져오기
BoardVO boardVO = boardDao.getBoard(num);
%>

<%-- 세션값 가져오기 --%>
<% String id = (String) session.getAttribute("id"); %>
<%!
	public boolean hasNotAuth(String id, BoardVO boardVO) {
		Boolean result = 
			   id == null && boardVO.getPasswd() == null
			|| id != null && boardVO.getPasswd() != null
			|| id != null && !id.equals(boardVO.getUsername());
		return result;
	}
%>

<%
// *비로그인 사용자가 로그인한 사용자 글을 수정하는 경우 1
// *로그인 사용자가 로그인 안한 사용자 글을 수정하는 경우 2
// *로그인 사용자의 경우, 세션값 id가 게시글 작성자명과 다른 경우 3
// "수정권한없음" 알림 후 글목록 페이지로 강제이동
if (id == null && boardVO.getPasswd() == null // AND로 묶인 문장이 한문장이라고 생각하면 된다.
// if (hasNotAuth(id, boardVO)) { 위에 if문 대신에 이렇게 써도 된다.
	|| id != null && boardVO.getPasswd() != null // OR은 별개로 생각 (AND가 OR보다 우선순위 높다)
	|| id != null && !id.equals(boardVO.getUsername())) { // 로그인한 회원의 유저네임을 가지고 와서 비교
	//response.sendRedirect("notice.jsp?pageNum=" + pageNum);
	
	%>
	<script>
		alert('수정 권한이 없습니다.');
		//location.href = 'content.jsp?num=<%=num%>&pageNum=<%=pageNum %>';
		history.back();
	</script>
	<%
	return;
}
%>
<head>

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
<meta charset="utf-8">

<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->

</head>

<body>
<div id="wrap">
	<!-- 헤더 영역 -->
	<jsp:include page="../include/header.jsp" />

	<div class="clear"></div>
	<div id="sub_img_center"></div>
	
	<div class="clear"></div>
	<%-- nav 영역 --%>
	<jsp:include page="../include/nav_center.jsp" />

<article>
    
<h1>Notice Update</h1>

<form action="updateProcess.jsp" method="post" name="frm" onsubmit="return check();"> <%-- onsubmit="함수()" 리턴되는 값을 전달 --%>
<%-- 수정할 글번호는 눈에 안보이는 hidden 타입 입력요소 사용 --%>
<input type="hidden" name="pageNum" value="<%=pageNum %>"> <%-- key, value 쌍이다 --%>
<input type="hidden" name="num" value="<%=num %>">

<table id="cbbs">
<%
if (id == null) { // 로그인 안했을때
	%>
	<tr>
		<th class="twrite">이름</th>
		<td class="left" width="300">
			<input type="text" name="username" value="<%=boardVO.getUsername()%>" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th class="twrite">패스워드</th>
		<td class="left">
			<input type="password" name="passwd" placeholder="본인확인 패스워드 입력">
		</td>
	</tr>
	<%
} else { // id != null  로그인 했을때
	%>
	<tr>
		<th class="twrite">아이디</th>
		<td class="left" width="300">
			<input type="text" name="username" value="<%=id %>" readonly>
		</td>
	</tr>
	<%
}
%>
	<tr>
		<th class="twrite">제목</th>
		<td class="left">
			<input type="text" name="subject" value="<%=boardVO.getSubject() %>">
		</td>
	</tr>
	<tr>
		<th class="twrite">내용</th>
		<td class="left">
			<textarea name="content" rows="13" cols="40"><%=boardVO.getContent() %></textarea>
		</td>
	</tr>
</table>

	<div id="table_search">
		<input type="submit" value="글수정" class="btn">
		<input type="reset" value="다시작성" class="btn">
		<input type="button" value="목록보기" class="btn" onclick="location.href='notice.jsp?pageNum=<%=pageNum %>';">
	</div>
</form>

</article>
<div class="clear"></div>
	   
	<!-- 푸터 영역 -->
	<jsp:include page="../include/footer.jsp" />
</div>

<script>
function check() {
	// 로그인 안한 사용자일 경우 패스워드 입력여부 확인
	var objPasswd = document.frm.passwd;
	if (objPasswd != null) {
		if (objPasswd.value.length == 0) {
			alert('게시글 패스워드는 필수 입력사항입니다.');
			objPasswd.focus();
			return false;
		}
	}
	
	// 글 수정 의도 확인
	var result = confirm('<%=num %>번 글을 정말로 수정하실?');
	if (result == false){
		return false;
	}
}
</script>
</body>
</html>