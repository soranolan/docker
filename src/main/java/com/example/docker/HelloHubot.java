package com.example.docker;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloHubot {
	
	@GetMapping("/hello")
	public String helloHubot() {
		return "Hello Hubot!";
	}
	
	@GetMapping("/world")
	public String helloWorld() {
		return "Hello World!";
	}
	
}
