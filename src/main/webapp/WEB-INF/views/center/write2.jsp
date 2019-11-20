<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>새롬교회에 오신것을 환영합니다</title>

<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->


<!--[if IE 6]>
 <script src="../script/DD_belatedPNG.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#sub_img');   
   DD_belatedPNG.fix('#sub_img_center'); 
   DD_belatedPNG.fix('#sub_img_member'); 

 </script>
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

<body>
		
	
<%-- 세션값 가져오기 --%>
<% String id = (String) session.getAttribute("id"); %>

<article>
    
<h1>Notice Write</h1>

<form action="writeProcess.jsp" method="post" name="frm">    
<table id="cbbs">
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
			<input type="text" name="subject"/>
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
	<input type="submit" value="글쓰기" class="btn"/>
	<input type="reset" value="다시작성" class="btn" />
	<input type="button" value="목록보기" class="btn" onclick="location.href='notice.jsp';" />
</div>
</form>
</article>
	
</body>
</html>   