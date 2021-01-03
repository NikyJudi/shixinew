package com.nk.config;

import com.nk.interceptor.FileTypeInterceptor;
import com.nk.interceptor.LogInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@SpringBootConfiguration // 声明此类为 springboot 配置文件类
public class SpringbootConf implements WebMvcConfigurer {
	@Autowired
	private LogInterceptor logInterceptor;
	@Autowired
	private FileTypeInterceptor fileTypeInterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(logInterceptor).addPathPatterns("/user/login");
		registry.addInterceptor(fileTypeInterceptor).addPathPatterns("/file/personalPhoto_upload");
	}

}
