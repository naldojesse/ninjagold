package com.naldojesse.ninjagold;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.support.SessionStatus;
//import javax.servlet.http.HttpSession;

import java.util.ArrayList;

import java.util.Hashtable;
import java.util.TimeZone;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Random;


@SessionAttributes({"user_gold", "log"})
@Controller
@SpringBootApplication
public class NinjagoldApplication {

	public static void main(String[] args) {

		SpringApplication.run(NinjagoldApplication.class, args);
	}

	@ModelAttribute("user_gold")
	public int setUpUserGold() {
		return 0;
	}

	@ModelAttribute("log")
	public ArrayList<Hashtable> setUpLog() {
		return new ArrayList<>();
	}

	@RequestMapping("/")
	public String index() {
		return "index.jsp";
	}

	@RequestMapping(value="/process_gold", method=RequestMethod.POST)
	public String process_gold(@ModelAttribute("user_gold") Integer user_gold, @ModelAttribute("log") ArrayList<Hashtable> log, @RequestParam(value="place") String place , ModelMap model) {

//		if (!model.containsAttribute("user_gold")) {
//			model.addAttribute("user_gold", 0);
//		}
//		if (!model.containsAttribute("log")) {
//			ArrayList<Hashtable> log = new ArrayList<>();
//			model.addAttribute("log", log);
//		}

		Hashtable<String, String> log_event = new Hashtable<>();

		TimeZone tz = TimeZone.getDefault();
		SimpleDateFormat formatter = new SimpleDateFormat("MMM d y h:m a");
		formatter.setTimeZone(tz);
		Date cDate = new Date();
		String dateFormatted = formatter.format(cDate);
		log_event.put("timestamp", dateFormatted);

		Random rand = new Random();
		int n = 0;
		if (place.equals("farm")) {
			n = rand.nextInt(10) + 10;
		} else if (place.equals("cave")) {
			n = rand.nextInt(5) + 5;
		} else if (place.equals("house")) {
			n = rand.nextInt(3) + 2;
		} else if (place.equals("casino")) {
			n = rand.nextInt(100) + -50;
		}

		log_event.put("place", place);
		log_event.put("gold_result", Integer.toString(n));

        user_gold += n;
		model.addAttribute("user_gold", user_gold);
		log.add(log_event);

		return "redirect:/";


	}

	@RequestMapping(value="/reset")
    public String reset(SessionStatus status) {
	    status.setComplete();
	    return "index.jsp";

    }




}
