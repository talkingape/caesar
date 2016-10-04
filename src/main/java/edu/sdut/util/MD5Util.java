package edu.sdut.util;

import java.security.MessageDigest;
import java.util.Scanner;

import org.junit.Test;

public class MD5Util {
	
    public final static String MD5(String s) {
        char hexDigits[]={'1','a','2','b','3','c','4','d','5','e','~','!','-','/','.','#'};       

        try {
            byte[] btInput = s.getBytes();
            // 获得MD5摘要算法的 MessageDigest 对象
            MessageDigest mdInst = MessageDigest.getInstance("MD5");
            // 使用指定的字节更新摘要
            mdInst.update(btInput);
            // 获得密文
            byte[] md = mdInst.digest();
            // 把密文转换成十六进制的字符串形式
            int j = md.length;
            char str[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    
    @Test
    public void testMd5(){
    	Scanner sc=new Scanner(System.in);
    	String str = sc.next();
    	System.out.println(MD5Util.MD5(str));
    	sc.close();
    }
}