package com.nk.handler;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nk.controller.UserController;
import com.nk.entity.Functionary;
import com.nk.entity.LoginEntity;
import com.nk.service.FunctionaryService;
import com.nk.util.ChineseCharToEn;
import com.nk.util.Msg;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class FunctionaryHandler {

	private static final Logger LOG = Logger.getLogger(UserController.class);

	@Autowired
	private FunctionaryService functionaryService;
	@ResponseBody
	@RequestMapping("/login")
	public Msg findFun(LoginEntity loginEntity, HttpSession session) {
		Functionary functionary = functionaryService.login(loginEntity.getJobId(), loginEntity.getPassword());
		if (functionary == null){
			return Msg.fail().add("message","账号或密码错误");
		}
		session.setAttribute("functionary",functionary);
		LOG.info(functionary);
		return Msg.success().add("message","登陆成功");
	}
	
	
	@ResponseBody
	@RequestMapping(value="/func/{jobIds}",method=RequestMethod.DELETE)
	public Msg deleteFun(@PathVariable("jobIds") String ids) {
		if(ids.contains(",")) {
			String[] strIds = ids.split(",");
			List<Integer> funIds = new ArrayList<>();
			for(String s:strIds) {
				funIds.add(Integer.parseInt(s));
			}
			functionaryService.deleteFunctionaryBatch(funIds);
		}
		else {
			Integer id=Integer.parseInt(ids);
			functionaryService.deleteFunctionary(id);
		}
		return Msg.success();
	}
	
	@ResponseBody
	@GetMapping(value="/funs/{jobId}")
	public Msg getFun(@PathVariable("jobId") Integer id) {
		Functionary functionary=functionaryService.getFunctionary(id);
		return Msg.success().add("functionary", functionary);
	}
	
	@ResponseBody
	@RequestMapping("/checkName")
	public Msg checkName(@RequestParam("funName") String name) {
		boolean flag = functionaryService.validateName(name);
		return flag==true?Msg.success():Msg.fail();
	}
	
	@ResponseBody
	@RequestMapping(value="/funccc/{jobId}",method=RequestMethod.PUT)
	public Msg update(@Valid Functionary functionary,BindingResult result) {
		System.out.println(functionary);
		if(result.getErrorCount()>0) {
			Map<String,Object> errors=new HashMap<String, Object>();
			for(FieldError error:result.getFieldErrors()) {
				System.out.println(error.getField()+":"+error.getDefaultMessage());
				errors.put(error.getField(), error.getDefaultMessage());
			}
			return Msg.fail().add("errors", errors);
		}
		try {
			functionaryService.updateFunctionary(functionary);
			return Msg.success();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return Msg.fail().add("errors", e.getMessage());
		}
	}

	/**
	 *
	 * @param functionary
	 * @return
	 */
	@ResponseBody
	@PostMapping("/func")
	public Msg save(@Valid @RequestBody Functionary functionary) {
		System.out.println(functionary);
		try {
			functionaryService.saveFunctionary(functionary);
			return Msg.success();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return Msg.fail().add("errors", e.getStackTrace());
		}
	}
//	@InitBinder
//	public void initBinder(WebDataBinder binder) {
//		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//		dateFormat.setLenient(false);
//		binder.registerCustomEditor(Date.class,new CustomDateEditor(dateFormat, true));
//	}
	@ResponseBody
	@RequestMapping("/funcs")
	public Msg getfuncWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pageNum) {
		PageHelper.startPage(pageNum, 8);
		List<Functionary> functionary = functionaryService.getAll();
		PageInfo<Functionary> pageInfo = new PageInfo<Functionary>(functionary, 5);
		return Msg.success().add("page", pageInfo);
	}

}