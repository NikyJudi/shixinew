package com.nk.entity;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Data
public class User implements Serializable {
    @Override
    public String toString() {
        return "Users [userid=" + userid + ", username=" + username + ", password=" + password + ", sex=" + sex + "]";
    }

    private static final long serialVersionUID = 1L;

    private Integer userid;
    private String no;
    private String username;
    private String password;
    private String sex;
    private String phone;
    private String email;
    private String birth;
    private String date;
    private String department;
    private Integer status;


}
