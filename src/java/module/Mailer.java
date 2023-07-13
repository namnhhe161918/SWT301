/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package module;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import static java.nio.charset.StandardCharsets.UTF_8;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author dell
 */
public class Mailer {

    public static void send(String to, String sub,String msg) {
        String user = "toptech8868@gmail.com";
        String pass = "sjxyriefmnrchwzs";
//            private final String MAIL = "namnhhe161918@fpt.edu.vn";
//    private final String PASSWORD = "ngohuunam1102002";
//        String user = "quizpracticesystemk16@gmail.com";
//        String pass = "abcd@1234";
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        });
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(sub);
            message.setContent(msg, "text/html");
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
    
    
   private static final int LINK_EXPIRATION_MINUTES = 1;

    public static String generateLink(String destinationUrl) throws UnsupportedEncodingException {
        LocalDateTime expirationTime = LocalDateTime.now().plus(LINK_EXPIRATION_MINUTES, ChronoUnit.MINUTES);
        String encodedExpirationTime = URLEncoder.encode(expirationTime.toString(), UTF_8.toString());
        String link = destinationUrl + "&expiration=" + encodedExpirationTime;

        return link;
    }

    public static boolean isValidLink(String link) throws UnsupportedEncodingException{
        if (link != null) {
            String encodedExpirationTime = link;
            String expirationTime = URLDecoder.decode(encodedExpirationTime, UTF_8.toString());

            LocalDateTime expirationDateTime = LocalDateTime.parse(expirationTime);
            if (expirationDateTime.isAfter(LocalDateTime.now())) {
                return true;
            }
        }
        return false;
    }

}
