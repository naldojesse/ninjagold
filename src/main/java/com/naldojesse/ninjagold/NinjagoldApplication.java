package com.naldojesse.ninjagold;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@SpringBootApplication
public class NinjagoldApplication {

	public static void main(String[] args) {

		SpringApplication.run(NinjagoldApplication.class, args);
	}

	@RequestMapping("/")
	public String index() {
		return "index.jsp";
	}


}
