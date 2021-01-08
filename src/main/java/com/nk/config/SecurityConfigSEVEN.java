//package com.nk.config;
//
//import org.springframework.boot.SpringBootConfiguration;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//
//@SpringBootConfiguration
//public class SecurityConfigSEVEN extends WebSecurityConfigurerAdapter {
//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//        //super.configure(http);
//        //配置不需要登陆验证
//        http.authorizeRequests().anyRequest().permitAll().and().logout().permitAll();
//    }
//
//}
