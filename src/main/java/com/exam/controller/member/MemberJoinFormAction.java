package com.exam.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exam.controller.Action;
import com.exam.controller.ActionForward;

public class MemberJoinFormAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse resoponse) throws Exception {
		System.out.println("MemberJoinFormAction");
		
		ActionForward forward = new ActionForward();
		forward.setPath("member/join");
		forward.setRedirect(false);
		// TODO Auto-generated method stub
		return forward;
	}

}
