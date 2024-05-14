package com.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Cipher {
	public static String GenerateMD5(String data){
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(data.getBytes());
            BigInteger no = new BigInteger(1, messageDigest);
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            } 
            return hashtext;
        } catch (NoSuchAlgorithmException ex) {
            System.out.println("Sai tên giải thuật");
        }
        return null;
    }
}
