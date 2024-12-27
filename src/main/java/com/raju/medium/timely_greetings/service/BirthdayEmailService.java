package com.raju.medium.timely_greetings.service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.retry.annotation.Backoff;
import org.springframework.retry.annotation.Retryable;
import org.springframework.stereotype.Service;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring6.SpringTemplateEngine;

@Service
@RequiredArgsConstructor
public class BirthdayEmailService {

    private static final Logger logger = LoggerFactory.getLogger(BirthdayEmailService.class);

    private final JavaMailSender mailSender;
    private final SpringTemplateEngine templateEngine;

    @Value("${birthday.email-subject}")
    private String emailSubject;

    @Retryable(
            value = { MailException.class }, // Retry for all mail-related exceptions
            maxAttempts = 5,                // Retry up to 5 times
            backoff = @Backoff(
                    delay = 2000,               // Initial delay of 2 seconds
                    multiplier = 2.0            // Exponential backoff multiplier
            )
    )
    public void sendBirthdayEmail(String to, String name) throws MessagingException {
        logger.debug("Preparing to send birthday email to: {}, name: {}", to, name);
        try {
            // Prepare the email content using Thymeleaf
            Context context = new Context();
            context.setVariable("customerName", name);

            String htmlContent = templateEngine.process("birthday-template", context);
            logger.debug("Generated email content for: {}", to);

            // Create the email message
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setTo(to);
            helper.setSubject(emailSubject);
            helper.setText(htmlContent, true); // true = HTML content

            // Send the email
            mailSender.send(message);
            logger.info("Successfully sent birthday email to {}", to);
        } catch (MessagingException | MailException e) {
            logger.error("Failed to send email to {}: {}", to, e.getMessage());
            throw e; // Rethrow the exception to trigger retry
        }
    }
}