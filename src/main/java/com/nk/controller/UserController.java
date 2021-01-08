package com.nk.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nk.entity.User;
import com.nk.service.impl.UserServiceImpl;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user") // 通过user字符串找到UserController这个类
public class UserController {


	private static final Logger LOG = Logger.getLogger(UserController.class);

	@Autowired // 依赖注入
	private UserServiceImpl userService;

	@RequestMapping("/test")
	@ResponseBody
	public String test() {
		System.out.println("test...");
		return "test";
	}

	@RequestMapping("/regist_page")
	public String regist_page() {
		return "regist";
	}

	@RequestMapping("/login_page")
	public String login_page() {
		return "login";
	}

	@RequestMapping("/regist")
	public String regist(User user, Map<String, Object> map) {
		if (user.getUserid() == null && user.getPassword() == null){
			return "login";
		}
		LOG.info(user);
		// 调用业务逻辑
		Integer num = userService.regist(user);
		if (num > 0) {
			return "login";
		}
		map.put("registDefeat", "注册失败，用户已存在");
		return "regist";
	}

	@RequestMapping("/login")
	public String login(User user, Map<String, Object> map, HttpSession session) {
		if (user.getUserid() == null && user.getPassword() == null){
			return "login";
		}
		// 调用业务逻辑
		user = userService.login(user);
		if (user != null && user.getUserid() > 0) {
			session.setAttribute("user", user);
			PageHelper.startPage(1, 3);
			List<User> userList = userService.getAllUsers(1, 3);
			PageInfo<User> pageInfo = new PageInfo<>(userList);
			map.put("pageInfo", pageInfo);
			map.put("userList", userList);
			return "showAllUsers";
		}
		map.put("loginDefeat", "登录失败，用户名称或密码不正确");
		return "login";
	}

	@RequestMapping("/modify")
	@ResponseBody
	public Integer modify(User user, Map<String, Object> map, HttpSession session) {
		// LOG.info(user);

		Integer num = userService.modifyUserinfoById(user);
		return num;
	}

	@RequestMapping("getAllUsers")
	public String getAllUsers(Integer pageNum, Integer maxPage, Map<String, Object> map, HttpSession session) {

		List<User> userList = userService.getAllUsers(pageNum, maxPage);
		PageInfo<User> pageInfo = new PageInfo<>(userList);
		map.put("pageInfo", pageInfo);
		map.put("userList", userList);
		return "showAllUsers";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login";
	}

	@DeleteMapping("/delete")
	@ResponseBody
	public Integer deleteById(@RequestParam("userid") Integer userid){
		int num = userService.deleteById(userid);
		return num;
	}


}
