package com.nk.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nk.entity.User;
import com.nk.model.ResponseModel;
import com.nk.service.impl.UserServiceImpl;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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
	public ResponseModel regist(User user, Map<String, Object> map) {
		if (user.getUserid() == null && user.getPassword() == null){
			return new ResponseModel(HttpStatus.BAD_REQUEST.value(), "请先登录");
		}
		LOG.info(user);
		// 调用业务逻辑
		Integer num = userService.regist(user);
		if (num > 0) {
			return new ResponseModel(HttpStatus.BAD_REQUEST.value(), "注册失败，用户已存在");
		}
//		map.put("registDefeat", "注册失败，用户已存在");
		return new ResponseModel(HttpStatus.OK.value(), "注册成功");
	}

	@RequestMapping("/login")
	public ResponseModel<PageInfo<User>> login(User user, Map<String, Object> map, HttpSession session) {
		if (user.getUserid() == null && user.getPassword() == null){
			return new ResponseModel(HttpStatus.BAD_REQUEST.value(), "请先登录");
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
			return new ResponseModel<>(pageInfo);
		}
		return new ResponseModel<>(HttpStatus.BAD_REQUEST.value(),"登录失败，用户名称或密码不正确");
	}

	@RequestMapping("/modify")
	@ResponseBody
	public ResponseModel modify(User user, Map<String, Object> map, HttpSession session) {
		// LOG.info(user);

		Integer num = userService.modifyUserinfoById(user);
		if (num > 0){
			return new ResponseModel(HttpStatus.OK.value(),"修改成功");
		}
		return new ResponseModel(HttpStatus.BAD_REQUEST.value(), "该账户存在异常，请联系管理员");
//		return num;
	}

	@RequestMapping("getAllUsers")
	@ResponseBody
	public ResponseModel<PageInfo<User>> getAllUsers(Integer pageNum, Integer maxPage, Map<String, Object> map, HttpSession session) {

		List<User> userList = userService.getAllUsers(pageNum, maxPage);
		PageInfo<User> pageInfo = new PageInfo<>(userList);
		map.put("pageInfo", pageInfo);
		map.put("userList", userList);
		return new ResponseModel<>(pageInfo);
//		return "showAllUsers";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login";
	}

	@DeleteMapping("/delete")
	@ResponseBody
	public ResponseModel deleteById(@RequestParam("userid") Integer userid){
		int num = userService.deleteById(userid);
		if (num > 0){
			return new ResponseModel(HttpStatus.OK.value(), "删除成功！");
		}
		return new ResponseModel(HttpStatus.BAD_REQUEST.value(), "该账户异常,请联系管理员！");
	}

}
