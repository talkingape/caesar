package edu.sdut.util;

import java.util.Date;
import java.util.Random;

public class CommonUtil {
	
	private static StringBuilder sb;
	
	public static String randomStr(int length){
		String baseCh="0123456789-=qwertyuiop[]asdfghjkl;'zxcvbnm,./`~!@#$%^&*()_+";
		Random r=new Random();
		StringBuffer sb=new StringBuffer();
		for (int i = 0; i < length; i++) {
			sb.append(baseCh.charAt(r.nextInt(baseCh.length())));
		}
		return sb.toString();
	}
	
	public static String genProCode(int groupId,int createUserID){
		sb=new StringBuilder();
		sb.append("Pro");
		sb.append("_Gro"+groupId);
		sb.append("_U"+createUserID);
		String curTime = String.valueOf(new Date().getTime());
		sb.append("_T"+curTime.substring(curTime.length()-4, curTime.length()));
		return sb.toString();
	}
	
	public static String genTaskCode(int projectId,int createUserID){
		sb=new StringBuilder();
		sb.append("Task");
		sb.append("_Pro"+projectId);
		sb.append("_U"+createUserID);
		String curTime = String.valueOf(new Date().getTime());
		sb.append("_T"+curTime.substring(curTime.length()-4, curTime.length()));
		return sb.toString();
	}
	
}
