package com.nk.util;

import java.util.UUID;
/**
 * author: ningkun
 * date: 2021/01/05
 */
public class Rename_String {

	public static String type(String origin) {
		StringBuffer sb = new StringBuffer(origin);
		// 反转
		String reverseStr = sb.reverse().toString();
		int indexOf = reverseStr.indexOf(".");
		String subString = reverseStr.substring(0, indexOf);
		return new StringBuffer(subString).reverse().toString();
	}

}
