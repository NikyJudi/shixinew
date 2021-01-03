package com.nk.util;

import java.util.UUID;

public class Rename_String {
	public static String rename(String origin) {
		StringBuffer sb = new StringBuffer(origin);
		// 反转
		String reverseStr = sb.reverse().toString();
		int indexOf = reverseStr.indexOf(".");
		String subString = reverseStr.substring(0, indexOf + 1);
		String str2 = new StringBuffer(subString).reverse().toString();
		UUID uuid = UUID.randomUUID();
		String str = uuid.toString();
		System.out.println(str + "    =========");
		String newStr = str.replace("-", "");
		return newStr.concat(str2);
	}

}
