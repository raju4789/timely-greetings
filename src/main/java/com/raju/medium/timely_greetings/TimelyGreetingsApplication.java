package com.raju.medium.timely_greetings;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class TimelyGreetingsApplication {

	public static void main(String[] args) {
		SpringApplication.run(TimelyGreetingsApplication.class, args);
	}

}
