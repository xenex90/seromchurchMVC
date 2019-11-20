<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
	<div id="logo"><a href="../"><img src="../imgs/logo.jpg" width="265" height="62" alt="모아나"></a></div>
	<div id="hlink">
		<ul>
			<%
		String id="";
		id = (String) session.getAttribute("id");
%>
 
    
    	<%
     	if (id == null) { // 세션값없음
     		%>
     		<li><a href="../member/login.jsp">로그인</a></li>
     		<li><a href="../member/join.jsp">회원가입</a></li>
     		<%
     	} else { // id != null   세션값있음
     		%>
     		<%=id %>님 
     		<a style= "color:blue;" href="../member/logout.jsp">logout</a>
     		<a style= "color:blue;" href="../member/infoUpdate.jsp">회원수정</a>
     		<a style= "color:blue;" href="../member/delete.jsp">회원탈퇴</a>
     		<%
     	}
    	%>
		</ul>
	</div>
         
  <nav>
		<ul>
			<li class="n1"><a href="../company/company.jsp">Ani소개</a></li>
			<li class="n2"><a href="../product/product.jsp">Ani정보</a></li>
			<li class="n3"><a href="../community/community.jsp">커뮤니티</a></li>
			<li class="n4"><a href="../customer/customer.jsp">고객지원</a></li>
		</ul>
	</nav>
</header>