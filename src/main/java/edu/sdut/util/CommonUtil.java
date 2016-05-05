package edu.sdut.util;

import java.util.Random;

public class CommonUtil {
	
	public static String randomStr(int length){
		String baseCh="0123456789-=qwertyuiop[]asdfghjkl;'zxcvbnm,./`~!@#$%^&*()_+";
		Random r=new Random();
		StringBuffer sb=new StringBuffer();
		for (int i = 0; i < length; i++) {
			sb.append(baseCh.charAt(r.nextInt(baseCh.length())));
		}
		return sb.toString();
	}
	
}
