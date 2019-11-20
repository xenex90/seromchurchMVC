package com.exam.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exam.controller.Action;
import com.exam.controller.ActionForward;

public class HistoryAction implements Action{

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response)throws Exception{
		
		ActionForward forward = new ActionForward();
		forward.setPath("company/history");
		forward.setRedirect(false);
		return forward;
	
	}
	
	
}
