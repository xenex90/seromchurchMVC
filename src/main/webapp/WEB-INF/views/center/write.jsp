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

	<div id="wrap">
	  
		<jsp:include page="../include/header.jsp"></jsp:include>        
			
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
    
<h1>Notice Write</h1>

<form action="writeProcess.jsp" method="post" name="frm">    
<table id="cbbs">
	<tr>
		<th class="twrite">아이디</th>
		<td class="left" width: 300px;>
			<input type="text" name="username" value="<%=id %>" readonly="readonly"/>
		</td>
	</tr>
	
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
	

        <div class="clear"></div>
        <footer>
        	      <jsp:include page="../include/footer.jsp"/>  
        </footer>
	</div>


    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="../scripts/jquery.fancybox.pack.js"></script>
    <script type="text/javascript" src="../scripts/prettify.packed.js"></script>
  
  	
 
</body>
</html>