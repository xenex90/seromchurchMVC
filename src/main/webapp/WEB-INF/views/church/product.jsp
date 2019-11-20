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
		<jsp:include page="../include/header.jsp"/>
   
  		<h1 id="product"><div>교회 예배당</div></h1>
  		<article>
  			<h2>예배당 </h2>
			<article class="phone">
				<figure class="pimg"><img src="../images/111.jpg"></figure>
				<section>
					<h4> St Mark's in Englefield, Berkshire</h4>
					<ul>
						<li>웅장한 Englefield의 버크셔 교회 </li>
						<li>너무 외관이 멋져서 나도 다니고 싶네요</li>
						<
					</ul>
				</section>				
			</article>
			<article class="phone">
				<figure class="pimg"><img src="../images/2222.jpg"></figure>
				<section>
					<h4>Saint-Hippolyte church in Rivière-au-Tonnerre</h4>
					<ul>
						<li>교회 내부가 너무 멋지네요 </li>
						<li> Rivière-au-Tonnerre의 Saint-Hippolyte church 입니다</li>
						
					</ul>
				</section>				
			</article>
			<article class="phone">
				<figure class="pimg"><img src="../images/333.jpg"></figure>
				<section>
				<h4>Apple iPhone 5</h4>
					<ul>
						<li>얇고 세련된 디자인에 뛰어난 성능 - 완전히 새로운 디자인</li>
						<li>더 커진 디스플레이로 더 많은 볼거리를 - 4형 Retina 디스플레이</li>
						<li>진정한 LTE - 초고속 무선 네트워크 </li>
						<li>더 빠른 CPU 성능,더 빠른 그래픽,  더 향상된 배터리 사용시간 -  A6 칩 </li>
						<li>어떤 귀에도 최적화된 획기적인 경험 - 완전히 새로운 EarPods</li>
					</ul>	
				</section>			
			</article>	
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
        <jsp:include page="../include/footer.jsp"/>
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