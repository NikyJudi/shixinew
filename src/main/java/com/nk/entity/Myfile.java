package com.nk.entity;

import lombok.Data;
/**
 * author: ningkun
 * date: 2021/01/05
 */
@Data
public class Myfile {
    private Long id;

    private String fname;

    private String url;

    private String cdate;

    private Long fsize;

    private String ftype;

    private Integer funid;

    private Functionary functionary;

    /**
     * 删除状态
     */
    private Integer deletestatus;
}