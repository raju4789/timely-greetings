package com.raju.medium.timely_greetings.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;

/**
 * Configuration class for setting up a ThreadPoolTaskScheduler.
 * This scheduler is used to manage and execute scheduled tasks in the application.
 */
@Configuration
public class SchedulerConfig {

    private static final Logger logger = LoggerFactory.getLogger(SchedulerConfig.class);

    // Configurable thread pool size from application properties
    @Value("${scheduler.pool-size:50}") // Default pool size is 50 if not specified
    private int poolSize;

    @Bean
    public ThreadPoolTaskScheduler taskScheduler() {
        logger.info("Initializing ThreadPoolTaskScheduler with pool size: {}", poolSize);

        ThreadPoolTaskScheduler taskScheduler = new ThreadPoolTaskScheduler();
        taskScheduler.setPoolSize(poolSize); // Set the thread pool size
        taskScheduler.setThreadNamePrefix("BirthdayScheduler-"); // Set thread name prefix

        // Set an error handler for uncaught exceptions in scheduled tasks
        taskScheduler.setErrorHandler(throwable -> {
            logger.error("Error occurred in scheduled task: {}", throwable.getMessage(), throwable);
        });

        // Set a default rejected execution handler (optional)
        taskScheduler.setRejectedExecutionHandler((runnable, executor) -> {
            logger.warn("Task rejected due to thread pool exhaustion. Consider increasing the pool size.");
        });

        return taskScheduler;
    }
}