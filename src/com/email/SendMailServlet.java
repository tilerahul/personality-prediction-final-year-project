package com.email;

import java.io.IOException;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/SendMailServlet")
public class SendMailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String SENDER_EMAIL = "tilerahul6@gmail.com";
    private static final String SENDER_PASSWORD = "frue hjdp rujv ecxs";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. Get recipient email from session
        HttpSession session = request.getSession();
        String recipient = (String) session.getAttribute("email");

        // 2. Get trait and description from form
        String trait = request.getParameter("trait");
        String description = (String) session.getAttribute("description");

        // 3. Subject is fixed
        String subject = "Your Personality Trait Report";

        // 4. Create the HTML message
        String htmlMessage = 
            "<div style='font-family:Arial,sans-serif;padding:20px'>" +
                "<h2 style='color:#000;'>Result: <span style='color:#2c7a8c;'>" + trait + "</span></h2>" +
                "<h3 style='color:#333;'>Description About Your Trait :</h3>" +
                "<p style='font-size:16px;line-height:1.6;color:#444; text-align:justify;'>" + description + "</p>" +
            "</div>";

        // 5. Send Email
        boolean success = sendHtmlEmail(recipient, subject, htmlMessage);

        // 6. Response with SweetAlert
        response.setContentType("text/html");
        response.getWriter().println("<html><head><script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script></head><body>");
        if (success) {
            response.getWriter().println("<script>Swal.fire({icon:'success',title:'Email Sent!',text:'Personality result sent successfully.'}).then(()=>{ window.location='ResultPage.jsp'; });</script>");
        } else {
            response.getWriter().println("<script>Swal.fire({icon:'error',title:'Failed!',text:'Something went wrong while sending the email.'}).then(()=>{ window.location='ResultPage.jsp'; });</script>");
        }
        response.getWriter().println("</body></html>");
    }

    private boolean sendHtmlEmail(String to, String subject, String htmlContent) {
        try {
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");

            Session session = Session.getInstance(props, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(SENDER_EMAIL, SENDER_PASSWORD);
                }
            });

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SENDER_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setContent(htmlContent, "text/html; charset=UTF-8");

            Transport.send(message);
            return true;

        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }
}
