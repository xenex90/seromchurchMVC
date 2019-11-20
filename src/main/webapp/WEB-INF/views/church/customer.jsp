<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
		<header>
			<jsp:include page="../include/header.jsp"></jsp:include> 
			<nav>
				<ul>
					<li class="n1"><a href="company.html">회사소개</a></li>
					<li class="n2"><a href="product.html">제품정보</a></li>
					<li class="n3"><a href="community.html">커뮤니티</a></li>
					<li class="n4"><a href="customer.html">고객지원</a></li>
				</ul>
			</nav>
		</header>
   
  		<h1 id="customer"><div>customer center</div></h1>
  		<article>
  			<h2>고객상담게시판</h2>
      <table id="cbbs">
      	<tr>
      		<th>번호</th>
      		<th>제목</th>
      		<th>게시일</th>
      		<th>게시자</th>
      		<th>조회수</th>
      	</tr>
      	<tr>
      		<td>100</td>
      		<td>고객 상담 게시판입니다.</td>
      		<td>2013.05.16</td>
      		<td>홍길동</td>
      		<td>125</td>
      	</tr>
  				<tr>
  					<td>100</td>
  					<td>고객 상담 게시판입니다. 내용이 들어갑니다.</td>
  					<td>2013.05.16</td>
  					<td>홍길동</td>
  					<td>125</td>
  				</tr>
  				<tr>
  					<td>100</td>
  					<td>고객 상담 게시판입니다. 내용은 게시자가 정합니다.</td>
  					<td>2013.05.16</td>
  					<td>홍길동</td>
  					<td>125</td>
  				</tr>
  				<tr>
  					<td>100</td>
  					<td>고객 상담 게시판입니다.</td>
  					<td>2013.05.16</td>
  					<td>홍길동</td>
  					<td>125</td>
  				</tr>
  				<tr>
  					<td>100</td>
  					<td>고객 상담 게시판입니다.</td>
  					<td>2013.05.16</td>
  					<td>홍길동</td>
  					<td>125</td>
  				</tr>
  				<tr>
  					<td>100</td>
  					<td>고객 상담 게시판입니다.</td>
  					<td>2013.05.16</td>
  					<td>홍길동</td>
  					<td>125</td>
  				</tr>
  				<tr>
  					<td>100</td>
  					<td>고객 상담 게시판입니다.</td>
  					<td>2013.05.16</td>
  					<td>홍길동</td>
  					<td>125</td>
  				</tr>
  				<tr>
  					<td>100</td>
  					<td>고객 상담 게시판입니다.</td>
  					<td>2013.05.16</td>
  					<td>홍길동</td>
  					<td>125</td>
  				</tr>
  				<tr>
  					<td>100</td>
  					<td>고객 상담 게시판입니다.</td>
  					<td>2013.05.16</td>
  					<td>홍길동</td>
  					<td>125</td>
  				</tr>
  				<tr>
  					<td>100</td>
  					<td>고객 상담 게시판입니다.</td>
  					<td>2013.05.16</td>
  					<td>홍길동</td>
  					<td>125</td>
  				</tr>
        </table>	
        <div id="page">
        	<ul class="paging">
        		<li><a href="#">1</a></li>
        		<li><a href="#">2</a></li>
        		<li><a href="#">3</a></li>	
        		<li><a href="#">4</a></li>
        		<li><a href="#">5</a></li>
        		<li><a href="#">6</a></li>
        	</ul>		
        </div>		
        <div class="clear"></div>
        <form id="searchbbs">
        	<input type="search"> <input type="submit" value="검색"> 
        </form>
        <div class="btn"><a href="#">문의하기</a></div>
    		</article>


  		<aside>
  			<h3><div>고객지원센터</div></h3>
  			<ul>
  				<li><a href="#">고객상담게시판</a></li>
  				<li><a href="#">공지사항</a></li>
  				<li><a href="#">새로운 뉴스 </a></li>
  			</ul>
  		</aside>


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