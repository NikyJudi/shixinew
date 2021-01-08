import com.alibaba.fastjson.JSONObject;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.nk.util.CodeUtil;
import com.nk.util.Msg;
import com.nk.util.SmsTool;
import com.zhenzi.sms.ZhenziSmsClient;
import org.junit.Test;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

public class PhoneTest {
    @Test
    public void getCode(){
        String phone = "19528288297";
        Map<String,Object> map = new HashMap<>();
        // 验证码（指定长度的随机数）
        String code = CodeUtil.generateVerifyCode(6);
        String TemplateParam = "{\"code\":\""+code+"\"}";
        // 短信模板id
        String TemplateCode = "SMS_152440521";
        SendSmsResponse response = null;
        try {
            response = SmsTool.sendSms(phone,TemplateParam,TemplateCode);
        } catch (ClientException e) {
            e.printStackTrace();
        }
        map.put("verifyCode",code);
        map.put("phone",phone);
//        request.getSession().setAttribute("CodePhone",map);
        if( response.getCode().equals("OK")) {
            map.put("isOk","OK");
        }
        System.out.println(Msg.success().add("code", map));
    }
}
