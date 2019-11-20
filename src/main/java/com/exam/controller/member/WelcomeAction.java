package com.exam.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exam.controller.Action;
import com.exam.controller.ActionForward;

public class WelcomeAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse resoponse) throws Exception {
		// TODO Auto-generated method stub
		
		ActionForward forward = new ActionForward();
		forward.setPath("company/welcome");
		forward.setRedirect(false);
		return forward;
	}

}
