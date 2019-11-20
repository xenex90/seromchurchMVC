package com.exam.controller.member;

import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam.controller.Action;
import com.exam.controller.ActionForward;

public class MemberLogoutAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse resoponse) throws Exception {
		System.out.println("MemberLogoutAction");
		
		//세션값 초기화
		HttpSession session = request.getSession();
		session.invalidate();
		
		//로그인 상태유지용 쿠키 삭제하기
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("id")) {
					cookie.setMaxAge(0);
					cookie.setPath("/");
					resoponse.addCookie(cookie);
					
				}
			}
		}
		
		resoponse.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resoponse.getWriter();
		out.println("<script>");
		out.println("alert('로그아웃 되었습니다')");
		out.println("location.href = 'main.do';");
		out.println("</script>");
		out.close();
		
		return null;
	}

}
