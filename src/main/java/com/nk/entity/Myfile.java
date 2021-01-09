package com.nk.entity;

import lombok.Data;

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

}