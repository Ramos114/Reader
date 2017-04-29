package cn.reader.core.utils;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Encoder;


/**
 *
 * @author jerry-HJY
 * @time 2016年11月23日-下午12:05:16
 */
public class MD5Utils {
	public static String byte2hex(byte[] b) {
        String hs = "";
        String stmp = "";

        for (int n = 0; n < b.length; n++) {
            stmp = (java.lang.Integer.toHexString(b[n] & 0XFF));
            if (stmp.length() == 1) {
                hs = hs + "0" + stmp;
            } else {
                hs = hs + stmp;
            }
        }
        return hs.toUpperCase();
    }
	
	public static String encryption(String str) {
		String encryptionStr = null;
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			BASE64Encoder base64Encoder = new BASE64Encoder();
			encryptionStr = base64Encoder.encode(md5.digest(str.getBytes(Constants.DEFAULT_CHARSET)));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return encryptionStr;
	}
}
