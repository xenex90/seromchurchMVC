<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>Welcome to Fun Web</title>
<link href="../css/default.css" rel="stylesheet" type="text/css" media="all">
<link href="../css/subpage.css" rel="stylesheet" type="text/css"  media="all">
<link href="../css/print.css" rel="stylesheet" type="text/css"  media="print">
<link href="../css/iphone.css" rel="stylesheet" type="text/css" media="screen">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
</head>

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
    
<h1>Notice Write</h1>
<form action="fwriteProcess.jsp" method="post" name="frm" enctype="multipart/form-data">
<table id="notice">
<%
if (id == null) { // 로그인 안했을 때
	%>
	<tr>
		<th class="twrite">NAME</th>
	<td class="left" width="300">
	<input type="text" name="username">
	</td>
	</tr>
	<tr>
  		<th class="twrite">PASSWORD</th>
    	<td class="left">
    	<input type="password" name="passwd">
    	</td>
	</tr> 
	<%
} else { // id != null 로그인 했을 때는 행 하나만 나오게
	%>
	<tr>
		<th class="twrite">ID</th>
	<td class="left" width="300">
	<input type="text" name="username" value="<%=id %>" readonly>
	</td>
	</tr>
	<%
}
%>  
	<tr>
  		<th class="twrite">TITLE</th>
    	<td class="left">
    	<input type="text" name="subject">
    	</td>
	</tr> 
	<tr>
  		<th class="twrite">FILE</th>
    	<td class="left">
    		<div id="file_container">
   			 	<input type="file" name="filename">
    		</div>
    		<button type="button" onclick="addFileElement(); ">파일 추가</button>
    	</td>
	</tr> 
	<tr>
  		<th class="twrite">TEXT</th>
    	<td class="left">
    		<textarea name="content" rows="13" cols="40"></textarea>
    	</td>
	</tr>  
</table>
<div id="table_search">
	<input type="submit" value="글쓰기" class="btn" />
	<input type="reset" value="다시작성" class="btn" />
	<input type="button" value="목록보기" class="btn" onclick="location.href='fnotice.jsp'"/>
</div>
</form> 
</article>  
     <div class="clear"></div>
   <jsp:include page="../include/footer.jsp" />
</div>
<script>
var num = 2; // 초기값 2
function addFileElement() {
	if (num > 5) { // 파일업로드 최대 5개까지만 허용할 때
		alert('최대 5개까지만 업로드 가능합니다.');
		return;
	}
	// div요소에 file타입 input요소를 추가하기
	var input = '<br><input type="file" name="filename'+num+'">';
	num++; // 다음번 추가를 위해 값을 1 증가
	// id속성값이 file_container인 div요소의 참조 구하기
	var fileContainer = document.getElementById('file_container');
	fileContainer.innerHTML += input;
}
</script>
</body>
</html> 