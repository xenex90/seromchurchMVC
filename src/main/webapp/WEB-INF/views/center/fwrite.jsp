<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<title>YNG에 오신 여러분을 환영합니다.</title>
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
        <footer>
        	      <jsp:include page="../include/footer.jsp"/>  
        </footer>
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