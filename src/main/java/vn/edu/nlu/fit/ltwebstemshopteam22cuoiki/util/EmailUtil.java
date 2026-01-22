package vn.edu.nlu.fit.ltwebstemshopteam22cuoiki.util;

import jakarta.mail.*;
import jakarta.mail.internet.*;

import java.util.Properties;

public class EmailUtil {

    public static void sendVerifyEmail(String toEmail, String verifyLink) {

        final String fromEmail = "nhoktizike@gmail.com";
        final String password = "ibym uosw rize kbjh"; // mật khẩu ứng dụng

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
                    }
                });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail)
            );
            message.setSubject("Xác thực tài khoản StemShop");
            message.setText("Click vào link sau để xác thực tài khoản:\n" + verifyLink);

            Transport.send(message);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

