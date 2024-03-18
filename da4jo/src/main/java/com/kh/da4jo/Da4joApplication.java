package com.kh.da4jo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
public class Da4joApplication {

	public static void main(String[] args) {
		SpringApplication.run(Da4joApplication.class, args);
	}

}
