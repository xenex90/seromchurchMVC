
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.exam.vo.MemberVO"%>

<%@page import="com.exam.dao.MemberDao"%>
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
	<link href="../css/admin_list.css" rel="stylesheet" type="text/css">
<script>
</script>

</head>
<body>
<%-- 액션태그 userBean 자바빈 객체생성 --%>
<jsp:useBean id="memberVO" class="com.exam.vo.MemberVO"/>

<%-- 액션태그 setProperty 폼 -> 자바빈 필드에 저장 --%>
<jsp:setProperty property="*" name="memberVO"/>
<%MemberDao memberDao = MemberDao.getInstance(); %>
	<div id="wrap">
	  		<jsp:include page="../include/header.jsp"></jsp:include>        
			<h1 id="community"><div>community</div></h1>
  			<div class="clear"></div>		
			<jsp:include page="../include/nav_admin.jsp"></jsp:include>
  		<h2>회원관리</h2>			
<table id="admin_list">
		<tr>
			<th>아이디</th>
			<th>회원명</th>
			<th>이메일</th>
			<th>가입날짜</th>
			<th>폰번호</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>

	<%
	List<MemberVO> list =MemberDao.getMemberAll();

		for(MemberVO dto : list){

	%>

			<tr>
				<td><%=dto.getId() %></td>
				<td><%=dto.getName() %></td>
				<td><%=dto.getEmail() %></td>
				<td><%=dto.getRegDate() %></td>
				<td><%=dto.getMtel() %></a></td>
				<td><a href="infoinfoupdate.jsp?id=<%=dto.getId()%>">수정 </a></td>
				<td><a href="infodelete.jsp?id=<%=dto.getId()%>">삭제</a></td>
			</tr>

	<%

		}

	%>

	</table>	
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