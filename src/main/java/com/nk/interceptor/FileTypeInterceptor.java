/**
 * 
 */
package com.nk.interceptor;

import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 作者：杜丹东 日期：2020年6月9日上午11:54:28
 */
@Component
public class FileTypeInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (request instanceof MultipartHttpServletRequest) {
			MultipartHttpServletRequest mreq = (MultipartHttpServletRequest) request;
			Map<String, MultipartFile> fileMap = mreq.getFileMap();// 文件列表
			Iterator<String> it = fileMap.keySet().iterator();// 键的迭代器
			while (it.hasNext()) {
				MultipartFile file = fileMap.get(it.next());// it.next()--键，通过键获得文件对象
				String filename = file.getOriginalFilename();// 获得文件对象的原始名称
				if (filename.endsWith(".jpg") || filename.endsWith(".jpeg")) {
					return true;
				} else {
					request.setCharacterEncoding("UTF-8");
					response.setCharacterEncoding("UTF-8");
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					// ajax请求特有的请求头---XMLHttpRequest
					String ajaxHeader = request.getHeader("X-Requested-With");
					System.out.println("ajax请求头:" + ajaxHeader);
					if (ajaxHeader != null) {
						out.append("上传类型不正确,只能是jpg/jpeg式的文件_ajax");
					} else {
						request.setAttribute("upload_error", "上传类型不正确,只能是jpg/jpeg式的文件_普通");
						request.getRequestDispatcher("../showAllUsers.jsp").forward(request, response);
					}
					return false;
				}
			}
		}
		return false;
	}

}
