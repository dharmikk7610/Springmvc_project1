package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class Mailservice {

    @Autowired
    private JavaMailSender mailsender;

    public void mailSend(String otp, String username, String email) {
        SimpleMailMessage m1 = new SimpleMailMessage();
        m1.setTo(email);
        m1.setSubject("Your OTP Code:");
        m1.setText(username + ", your OTP is: " + otp + " for password change.");
        mailsender.send(m1);
    }
}
