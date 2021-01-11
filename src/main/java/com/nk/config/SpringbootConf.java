package com.nk.config;

import com.nk.interceptor.LogInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * author: ningkun
 * date: 2021/01/05
 */
@SpringBootConfiguration // 声明此类为 springboot 配置文件类
public class SpringbootConf implements WebMvcConfigurer {
	@Autowired
	private LogInterceptor logInterceptor;
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(logInterceptor)
				.excludePathPatterns("/")
				.excludePathPatterns("/homepage.html")
				.excludePathPatterns("/login.jsp")
				.excludePathPatterns("/login")
				.excludePathPatterns("/css/**")
				.excludePathPatterns("/js/**")
				.excludePathPatterns("/fonts/**")
				.excludePathPatterns("/images/**")
				.excludePathPatterns("/static/**")
		;
	}

}
