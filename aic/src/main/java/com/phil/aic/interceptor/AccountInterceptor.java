package com.phil.aic.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class AccountInterceptor implements HandlerInterceptor {
	private final String ACCOUNT = "account";

	// ����ǰ����
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
		Object sessionObj = request.getSession().getAttribute(ACCOUNT);
		if (sessionObj != null) {
			return true;
		}
		response.sendRedirect("account/login");
		return false;
	}

	// ���غ���
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object obj, ModelAndView mav)
			throws Exception {
	}

	// ȫ����ɺ���
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object obj, Exception e)
			throws Exception {
	}
}
