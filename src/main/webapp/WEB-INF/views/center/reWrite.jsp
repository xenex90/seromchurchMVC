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
	<div id="wrap">
	  
		<jsp:include page="../include/header.jsp"></jsp:include>        
			
   
  		<h1 id="community"><div>community</div></h1>
  		
			<div class="clear"></div>		
			<%-- 세션값 가져오기 --%>
	<% String id = (String) session.getAttribute("id"); %>
	
	<%-- 파라미터값 가져오기 --%>
	<%
	String reRef = request.getParameter("reRef");
	String reLev = request.getParameter("reLev");
	String reSeq = request.getParameter("reSeq");
	String subject = request.getParameter("Subject");
	%>
			
  		


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
    
<h1>Notice ReWrite</h1>

<form action="reWriteProcess.jsp" method="post" name="frm">
<input type="hidden" name="reRef" value="<%=reRef %>">
<input type="hidden" name="reLev" value="<%=reLev %>">
<input type="hidden" name="reSeq" value="<%=reSeq %>">

<table id="notice">
<%
if (id == null) { // 로그인 안했을때
	%>
	<tr>
		<th class="twrite">이름</th>
		<td class="left" width: 300px;>
			<input type="text" name="username"/>
		</td>
	</tr>
	<tr>
		<th class="twrite">패스워드</th>
		<td class="left" >
			<input type="password" name="passwd"/>
		</td>
	</tr>
	<%
} else { // id != null
	%>
	<tr>
		<th class="twrite">아이디</th>
		<td class="left" width: 300px;>
			<input type="text" name="username" value="<%=id %>" readonly="readonly"/>
		</td>
	</tr>
	<%
}
%>
	<tr>
		<th class="twrite">제목</th>
		<td class="left" >
			<input type="text" name="subject" value="[답글] <%=subject %>">
		</td>
	</tr>
	<tr>
		<th class="twrite">내용</th>
		<td class="left" >
			<textarea name="content" rows="13" cols="40"></textarea>
		</td>
	</tr>
</table>

<div id="table_search">	 <%-- 세션이 있을때만 글쓰기 버튼 노출 --%>
	<input type="submit" value="답글쓰기" class="btn"/>
	<input type="reset" value="다시작성" class="btn" />
	<input type="button" value="목록보기" class="btn" onclick="location.href='notice.jsp';" />
</div>
</form>
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
</body>
</html>