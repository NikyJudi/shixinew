//package com.nk.controller;
//
//import com.alibaba.fastjson.JSONObject;
//import com.zhenzi.sms.ZhenziSmsClient;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import javax.servlet.http.HttpSession;
//import java.util.Random;
///**
// * author: ningkun
// * date: 2021/01/05
// * 手机验证码
// */
//@Controller
//public class PhoneController {
//    //短信平台相关参数
//    //这个不用改
//    private String apiUrl = "https://sms_developer.zhenzikj.com";
//    //榛子云系统上获取
//    private String appId = "107728";
//    private String appSecret = "bf974c28-ddf7-400c-94e2-74cdd930826b";
//
//    @ResponseBody
//    @GetMapping("/fitness/code")
//    public boolean getCode(@RequestParam("memPhone") String memPhone, HttpSession httpSession){
//        try {
//            JSONObject json = null;
//            //随机生成验证码
//            String code = String.valueOf(new Random().nextInt(999999));
//            //将验证码通过榛子云接口发送至手机
//            ZhenziSmsClient client = new ZhenziSmsClient(apiUrl, appId, appSecret);
//            String result = client.send(memPhone, "您的验证码为:" + code + "，该码有效期为5分钟，该码只能使用一次!");
//
//            json = JSONObject.parseObject(result);
//            if (json.getIntValue("code")!=0){//发送短信失败
//                return  false;
//            }
//            //将验证码存到session中,同时存入创建时间
//            //以json存放，这里使用的是阿里的fastjson
//            json = new JSONObject();
//            json.put("memPhone",memPhone);
//            json.put("code",code);
//            json.put("createTime",System.currentTimeMillis());
//            // 将认证码存入SESSION
//            httpSession.setAttribute("code",json);
//            return true;
//        } catch (Exception e) {
//            e.printStackTrace();
//            return false;
//        }
//    }
//}