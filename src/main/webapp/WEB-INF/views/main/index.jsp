<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<title>새롬교회에 오신것을 환영합니다</title>
    <link href="../css/reset5.css" rel="stylesheet" type="text/css">
    <link href="../css/front.css" rel="stylesheet" type="text/css">
    <link  href="../css/themes/default/default.css" rel="stylesheet" type="text/css">
    <link href="../css/nivo-slider.css" rel="stylesheet" type="text/css">
    <link href="../css/bjqs.css" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Droid+Sans' rel='stylesheet' type='text/css'>
	
</head>
<body>
	<div id="wrap">
		<header>
			<jsp:include page="../include/header.jsp"/>
		</header>
        <div class="slider-wrapper theme-default">
            <div id="slider" class="nivoSlider">
                <img src="../images/1.jpg" width="943" height="401"> 
                <img src="../images/2.jpg" width="943" height="401"> 
                <img src="../images/3.jpg" width="943" height="401"> 
                <img src="../images/4.jpg" width="943" height="401"> 
            </div>
        </div>    
        <div class="clear"></div>
        <div id="justar">
        	<h3>just arrived</h3>
        	<figure id="slide">
        	<ul class="bjqs">
        		<li><img src="../images/말씀배경화면.jpg" width="161" height="125"></li>
        		<li><img src="../images/말씀2.jpg" width="161" height="125"></li>
        		<li><img src="../images/말씀3.jpg" width="161" height="125"></li>
        		<li><img src="../images/말씀4.jpg" width="161" height="125"></li>
        	</ul> 
        	</figure>	
        </div>
        <div id="notinews">
        	<div class="container">
            <ul class="tabs">
                <li><a href="#tab1">Notice</a></li>
                <li><a href="#tab2">News</a></li>        
            </ul>
            	<div class="tab_container">
                    <div id="tab1" class="tab_content">
                        <ul>
                            <li><a href="#">요한복음 3장 16절</a></li>
                            <li><a href="#">요일 4:7-9</a></li>
                            <li><a href="#">벧후 1:21</a></li>
                            <li><a href="#">벧후 1:19</a></li>
                            <li><a href="#">잠 1:7</a></li>                        
                        </ul>
            
                    </div>
                    <div id="tab2" class="tab_content">
                         <ul>
                            <li><a href="#">저희 성전이 재건축 심사 중에 있습니다.</a></li>
                            <li><a href="#">김미영 성도 신사업 오픈</a></li>
                            <li><a href="#">김재신 집사 득남</a></li>
                            <li><a href="#">박해영 장로 장녀 결혼</a></li>
                            <li><a href="#">이신앙 집사 이사</a></li>                        
                        </ul>
                    </div>        
            	</div>
       		</div>
        </div>
        
		<div id="social">
        <h3>social network</h3>
            <ul>
                <li><a href="#"><img src="../images/icon1.png" width="33" height="32"></a></li>
                <li><a href="#"><img src="../images/icon2.png" width="33" height="32"></a></li>
                <li><a href="#"><img src="../images/icon3.png" width="33" height="32"></a></li>
                <li><a href="#"><img src="../images/icon4.png" width="33" height="32"></a></li>
                <li><a href="#"><img src="../images/icon5.png" width="33" height="32"></a></li>
                <li><a href="#"><img src="../images/icon6.png" width="33" height="32"></a></li>
                <li><a href="#"><img src="../images/icon7.png" width="33" height="32"></a></li>
                <li><a href="#"><img src="../images/icon8.png" width="33" height="32"></a></li>
                <li><a href="#"><img src="../images/icon9.png" width="33" height="32"></a></li>
                <li><a href="#"><img src="../images/icon10.png" width="33" height="32"></a></li>
                <li><a href="#"><img src="../images/icon11.png" width="33" height="32"></a></li>
                <li><a href="#"><img src="../images/icon12.png" width="33" height="32"></a></li>
            </ul>
        </div>    
        <div class="clear"></div>
        <footer>
        	<jsp:include page="../include/footer.jsp"/>
        </footer>
</div>


    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="../scripts/jquery.nivo.slider.js"></script>
    <script type="text/javascript" src="../scripts/bjqs-1.3.min.js"></script>
    <script type="text/javascript">
   $(window).load(function() {
        $('#slider').nivoSlider();
    });
	// 아래는 tab 메뉴 
	$(document).ready(function() {
	//Default Action
		$(".tab_content").hide(); //Hide all content
		$("ul.tabs li:first").addClass("active").show(); //Activate first tab
		$(".tab_content:first").show(); //Show first tab content	
		//On Click Event
		$("ul.tabs li").click(function() {
			$("ul.tabs li").removeClass("active"); //Remove any "active" class
			$(this).addClass("active"); //Add "active" class to selected tab
			$(".tab_content").hide(); //Hide all tab content
			var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
			$(activeTab).fadeIn(); //Fade in the active content
			return false;
		});
	});
	//
      $(document).ready(function() {
        
        $('#slide').bjqs({
          'animtype' : 'slide',
          showcontrols : false,
          showmarkers : false,
          'width' : 165,
          'height' : 130
        });
        
      });
	

    </script>
</body>
</html>