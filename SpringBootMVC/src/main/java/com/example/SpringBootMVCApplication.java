package com.example;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("com.qa.controllers")
public class SpringBootMVCApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootMVCApplication.class, args);
	}
}
