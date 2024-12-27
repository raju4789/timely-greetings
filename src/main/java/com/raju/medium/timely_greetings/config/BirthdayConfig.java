package com.raju.medium.timely_greetings.config;

import jakarta.annotation.PostConstruct;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.List;

@ConfigurationProperties(prefix = "birthday")
@Component
public class BirthdayConfig {
    private static final Logger logger = LoggerFactory.getLogger(BirthdayConfig.class);

    private List<String> timeZones;

    public List<String> getTimeZones() {
        return timeZones;
    }

    public void setTimeZones(List<String> timeZones) {
        this.timeZones = timeZones;
    }

    /**
     * This method will be called after the properties are loaded.
     * Logs the list of time zones for verification.
     */
    @PostConstruct
    public void logTimeZones() {
        logger.info("Loaded time zones: {}", timeZones);
    }
}
