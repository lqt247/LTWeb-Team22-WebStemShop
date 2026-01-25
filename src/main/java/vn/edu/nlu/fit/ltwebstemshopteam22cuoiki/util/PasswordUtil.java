package vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.util;

import java.security.MessageDigest;

public class PasswordUtil {
    // giải thuật MD5
    public static String md5(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] bytes = md.digest(password.getBytes("UTF-8"));

            StringBuilder sb = new StringBuilder();
            for (byte b : bytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // kiểm tra mật khẩu khi đăng ký
    public static boolean isValidPassword(String password) {
        String regex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@#$%^&*!]).{8,}$";
        return password.matches(regex);
    }

    public static boolean isValidPhone(String phone) {
        return phone != null &&
                phone.matches("^(0|\\+84)(3|5|7|8|9)[0-9]{8}$");
    }
}
