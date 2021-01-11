package com.nk.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.http.HttpStatus;

import java.io.Serializable;

/**
 * author: ningkun
 * date: 2021/01/05
 * 全局API接口
 */
@Data
@ApiModel(description = "全局API接口")
public class ResponseModel<T> implements Serializable {

    @ApiModelProperty(value = "状态码,成功为2000", example = "2000")
    private Integer code;

    private String message;

    @ApiModelProperty(value = "返回数据")
    private T data;

    @ApiModelProperty(value = "时间戳", example = "1853558969352")
    private long timestamp;

    public ResponseModel(Integer status, String message){
        this.code = status;
        this.message = message;
    }

    public ResponseModel(T t) {
        this.code = 200;
        this.message = t.getClass().toString();
        this.data = t;
    }

}
