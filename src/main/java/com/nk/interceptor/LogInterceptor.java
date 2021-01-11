package com.nk.interceptor;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * author: ningkun
 * date: 2021/01/05
 */
@Component // 不知道属于哪一层时使用
public class LogInterceptor extends HandlerInterceptorAdapter {
    private static final Logger LOG = Logger.getLogger(LogInterceptor.class);

    //	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//		String IP = request.getRemoteAddr();
//		SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd'T'HH:mm:ss.SSSZ");
//		String time = sdf.format(new Date());
//		LOG.info("IP地址为：" + IP + "的用户在" + time + "登录了系统");
//		return super.preHandle(request, response, handler);
//	}
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession(false);//获取session，如果没有，返回null
        if (session != null) {
            Object user = session.getAttribute("user");
            if (user != null) {
                return true;
            }
        }
        response.sendRedirect("/login.jsp");
        return false;
    }
}
