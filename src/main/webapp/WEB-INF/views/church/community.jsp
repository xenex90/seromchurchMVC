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
  		<article>
  			<h2>포토갤러리</h2>
  			<article id="gallery">
				<figure><a class="fancybox" data-fancybox-group="gallery" href="../imgs/photos/pic1.jpg" title="벗꽃과 직박구리"><img src="imgs/photos/pic1.jpg"> <figcaption>벗꽃과 직박구리 </figcaption></a></figure>
				<figure><a class="fancybox" data-fancybox-group="gallery" href="../imgs/photos/pic2.jpg" title="아름다움이란"><img src="imgs/photos/pic2.jpg"> <figcaption>아름다움이란 </figcaption></a></figure>
				<figure><a class="fancybox" data-fancybox-group="gallery" href="../imgs/photos/pic3.jpg"><img src="imgs/photos/pic3.jpg"> <figcaption>민들레</figcaption></a></figure>
				<figure><a class="fancybox" data-fancybox-group="gallery" href="../imgs/photos/pic4.jpg"><img src="imgs/photos/pic4.jpg"> <figcaption>민들레 2</figcaption></a></figure>
				<figure><a class="fancybox" data-fancybox-group="gallery" href="../imgs/photos/pic5.jpg"><img src="imgs/photos/pic5.jpg"> <figcaption>비가 내린 후</figcaption></a></figure>
				<figure><a class="fancybox" data-fancybox-group="gallery" href="../imgs/photos/pic6.jpg"><img src="imgs/photos/pic6.jpg"> <figcaption>노란 잡초</figcaption></a></figure>
				<figure><a class="fancybox" data-fancybox-group="gallery" href="../imgs/photos/pic7.jpg"><img src="imgs/photos/pic7.jpg"> <figcaption>은은한</figcaption></a></figure>
				<figure><a class="fancybox" data-fancybox-group="gallery" href="../imgs/photos/pic8.jpg"><img src="imgs/photos/pic8.jpg"> <figcaption>벗꽃의 계절</figcaption></a></figure>
				<figure><a class="fancybox" data-fancybox-group="gallery" href="../imgs/photos/pic9.jpg"><img src="imgs/photos/pic9.jpg"> <figcaption>아름다움 </figcaption></a></figure>			
			</article>
			<div class="clear"></div>		
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
			<div class="btn"><a href="../photo_upload.html">사진 업로드</a></div>
  		</article>


  		<aside>
  		<h3><div>예배정보</div></h3>
  			<ul>
  				<li><a href="#">본 예배</a></li>
  				<li><a href="#">청년부 예배</a></li>
  				<li><a href="#">주일 학교 </a></li>
  				<li><a href="#">금요부흥회 </a></li>
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