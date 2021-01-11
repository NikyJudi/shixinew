package com.nk.entity;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.Email;
import javax.validation.constraints.Pattern;
import java.util.Date;
/**
 * author: ningkun
 * date: 2021/01/05
 * 用户实体类
 */
@Data
public class Functionary {
    private Integer jobId;
    @Pattern(regexp = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,20})",message="请输入姓名（姓名格式：大于2位的汉字或者6~18位的字符）")
    private String name;

    private String sex;
    @Email
    private String email;
    @Pattern(regexp="^1[0-9]{10}$",message="无效的手机号码")
    private String phoneNum;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date birth;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date entryTime;

    private Integer departmentId;
    
    private Department depart;

    private Integer status;

    private Integer usagee;

    private String password;

    {
        status = 1;
        usagee = 1;
    }

    @Override
    public String toString() {
        return "Functionary{" +
                "jobId=" + jobId +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", email='" + email + '\'' +
                ", phoneNum='" + phoneNum + '\'' +
                ", birth=" + birth +
                ", entryTime=" + entryTime +
                ", departmentId=" + departmentId +
                ", depart=" + depart +
                ", status=" + status +
                ", usagee=" + usagee +
                ", password='" + password + '\'' +
                '}';
    }
}