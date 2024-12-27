package com.raju.medium.timely_greetings.scheduler;

import com.raju.medium.timely_greetings.config.BirthdayConfig;
import com.raju.medium.timely_greetings.entity.Customer;
import com.raju.medium.timely_greetings.repository.CustomerRepository;
import com.raju.medium.timely_greetings.service.BirthdayEmailService;
import jakarta.mail.MessagingException;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.PageRequest;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.stereotype.Component;

import java.time.*;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ScheduledFuture;

@Component
@RequiredArgsConstructor
public class BirthdayScheduler {

    private static final Logger logger = LoggerFactory.getLogger(BirthdayScheduler.class);

    private final CustomerRepository customerRepository;
    private final BirthdayEmailService emailService;
    private final ThreadPoolTaskScheduler taskScheduler;
    private final BirthdayConfig birthdayConfig;

    // Store dynamically scheduled tasks to avoid duplicates
    private final ConcurrentHashMap<String, ScheduledFuture<?>> scheduledTasksMap = new ConcurrentHashMap<>();

    /**
     * Scheduler that runs hourly to check if any time zone is approaching 12:00 AM.
     * If so, schedules a task to send emails exactly at 12:00 AM for that time zone.
     */
    @Scheduled(cron = "${birthday.cron-job}")
    public void processTimeZonesForScheduling() {
        logger.info("Processing time zones for dynamic email scheduling...");

        List<String> timeZones = birthdayConfig.getTimeZones();

        timeZones.forEach(zoneId -> {
            try {
                ZoneId zone = ZoneId.of(zoneId);
                ZonedDateTime nowInZone = ZonedDateTime.now(zone);
                ZonedDateTime midnightInZone = nowInZone.plusDays(1).toLocalDate().atStartOfDay(zone);
                Duration timeUntilMidnight = Duration.between(nowInZone, midnightInZone);

                logger.debug("Time until midnight for zone {}: {} minutes", zoneId, timeUntilMidnight.toMinutes());

                if (!timeUntilMidnight.isNegative() && timeUntilMidnight.toMinutes() <= 60) {
                    logger.info("Scheduling email task for time zone: {} at {}", zoneId, midnightInZone);

                    if (!scheduledTasksMap.containsKey(zoneId)) {
                        ScheduledFuture<?> task = taskScheduler.schedule(() -> {
                            try {
                                logger.debug("Executing scheduled task for time zone: {}", zoneId);
                                sendEmailsForTimeZone(zoneId);
                            } finally {
                                logger.debug("Removing task for time zone: {}", zoneId);
                                scheduledTasksMap.remove(zoneId);
                            }
                        }, midnightInZone.toInstant());

                        scheduledTasksMap.put(zoneId, task);
                    } else {
                        logger.debug("Task for time zone {} is already scheduled.", zoneId);
                    }
                }
            } catch (Exception e) {
                logger.error("Error processing time zone {}: {}", zoneId, e.getMessage(), e);
            }
        });
    }

    /**
     * Sends birthday emails to customers in the specified time zone.
     *
     * @param timeZone The time zone to process
     */
    private void sendEmailsForTimeZone(String timeZone) {
        logger.info("Executing scheduled email task for time zone: {}", timeZone);

        try {
            LocalDate tomorrow = LocalDate.now(ZoneId.of(timeZone)).plusDays(1);
            logger.debug("Fetching customers with birthdays on {} in time zone: {}", tomorrow, timeZone);

            int page = 0;
            int pageSize = 100;

            while (true) {
                var pageable = PageRequest.of(page, pageSize);
                var customerPage = customerRepository.findByDateOfBirthAndTimeZone(tomorrow, timeZone, pageable);
                logger.debug("Fetched page {} with {} customers", page, customerPage.getSize());

                if (customerPage.isEmpty()) {
                    logger.warn("No customers found for time zone: {}", timeZone);
                    break;
                }

                logger.info("Found {} customers in time zone: {}", customerPage.getSize(), timeZone);

                customerPage.forEach(customer -> {
                    logger.info("Sending birthday email to customer: {}, email: {}", customer.getName(), customer.getEmail());
                    try {
                        emailService.sendBirthdayEmail(customer.getEmail(), customer.getName());
                    } catch (MessagingException e) {
                        logger.error("Failed to send email to customer: {}, email: {}", customer.getName(), customer.getEmail(), e);
                    }
                });

                page++;
            }
        } catch (Exception e) {
            logger.error("Error executing email task for time zone {}: {}", timeZone, e.getMessage(), e);
        }
    }
}