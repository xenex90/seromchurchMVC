<%@page import="com.exam.vo.MemberVO"%>
<%@page import="com.exam.dao.MemberDao"%>
<%@page import="org.apache.commons.mail.EmailException"%>
<%@page import="org.apache.commons.mail.SimpleEmail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- 액션태그 userBean 자바빈 객체생성 --%>
<jsp:useBean id="memberVO" class="com.exam.vo.MemberVO" />

<%-- 액션태그 setProperty 폼 -> 자바빈 필드에 저장 --%>
<jsp:setProperty property="*" name="memberVO" />
<%
	request.setCharacterEncoding("utf-8");

	//String id = (String)session.getAttribute("joinMemberVO");
	//MemberDao memberDao = MemberDao.getInstance();
	MemberVO member = (MemberVO) session.getAttribute("emailMemberVO");
%>
<%
	System.out.println(member.getEmail());
%>
<%
	//simpleemail 객체 생성
	Long beginTime = System.currentTimeMillis();

	SimpleEmail email = new SimpleEmail();
	//sMtp 서버 연결 설정
	email.setHostName("smtp.naver.com");
	email.setSmtpPort(587);
	email.setAuthentication("xenexes", "kingdom2258");
	//SMTP SSL, TLs 설정
	System.out.println(member.getEmail());
	email.setSSL(true);
	email.setTLS(true);

	String result = "fail";

	try {
		//보내는 사람 설정
		email.setFrom("xenexes@naver.com", "관리자", "utf-8");
		//받는 사람 설정
		email.addTo(member.getEmail(), "관리자", "utf-8");
		//email.addTo("xenex90@gmail.com","김영주","utf-8");
		//email.addTo("xenexes@nate.com","김영주","utf-8");
		//받는사람(참조인) 설정
		//email.addCc("xenexes@naver.com","김영주","utf-8");
		//받는 사람(숨은 참조인) 설정
		//email.addBcc("xenexes@naver.com","김영주","utf-8");

		//제목 설정
		email.setSubject(member.getId() + "의 비밀번호를 안내 드립니다.");
		//본문 설정
		email.setMsg(member.getId() + " 님의 비밀 번호는 /n" + member.getPasswd() + "/n 입니다.");

		//메일 전송
		result = email.send();
	} catch (EmailException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	long endTime = System.currentTimeMillis();
	long execTime = endTime - beginTime;//이메일 전송에 걸린 시간

	System.out.println("execTime : " + execTime + "밀리초");

	System.out.println("result : " + result);
%>

<script>
	alert('이메일이 발송 되었습니다. 로그인 화면으로 돌아갑니다.');
	location.href = '../member/login.jsp';
</script>