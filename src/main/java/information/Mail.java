/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package information;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeUtility;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

/**
 *
 * @author Admin
 */
public class Mail {
    private static final String from = "haduchauprj@gmail.com";
    private static final String password = "fvjfirqppoygeckl";
    
    
    public static void sendEmail(String to, String subject, String content) 
                        throws UnsupportedEncodingException {
        // Cấu hình các thuộc tính của email
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // Tạo phiên làm việc với thông tin đăng nhập
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        try {
            // Create MimeMessage
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            
            // Set subject
            message.setSubject(MimeUtility.encodeText(subject, "UTF-8", "B"));
            
            // Set content
            message.setContent(content, "text/html; charset=UTF-8");

            // Send mail
            Transport.send(message);

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
    
    public static String sendMailSuccess(){
        String html = """
            <!DOCTYPE html>
            <html lang="en">
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Email</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
                        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                crossorigin="anonymous"></script>
            </head>
            <body style="font-family: sans-serif;" class="m-3">
                <h1>Thông báo</h1>
                <p>CV của bạn gửi đến nhà tuyển dụng đã được <strong class="text-success">thông qua</strong>.</p>
                <p>Hãy chuẩn bị kiến thức và kĩ năng cho buổi phỏng vấn sắp tới nhé!</p>
                <p>Thời gian cụ thể sẽ được thông báo sau.</p><br>
                <p class="m-0">Trân trọng,</p>
                <strong>JobsVn</strong>
            </body>
            </html>
                      """;
        return html;
    }
    
    public static String sendMailFail(){
        String html = """
            <!DOCTYPE html>
            <html lang="en">
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Email</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
                        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                crossorigin="anonymous"></script>
            </head>
            <body style="font-family: sans-serif;" class="m-3">
                <h1>Thông báo</h1>
                <p>CV của bạn gửi đến nhà tuyển dụng <strong class="text-danger">không được thông qua</strong>.</p>
                <p>Hãy cố gắng vào lần tới nhé!</p>
                <br>
                <p class="m-0">Trân trọng,</p>
                <strong>JobsVn</strong>
            </body>
            </html>
                      """;
        return html;
    }
    
    public static void main(String[] args) throws UnsupportedEncodingException {
        sendEmail("anhphhe172226@fpt.edu.vn", "Success", sendMailSuccess());
    }
}
