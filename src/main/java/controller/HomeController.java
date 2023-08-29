package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	@RequestMapping(value="/home/intro.html")
	public ModelAndView intro(String BODY) {
		ModelAndView mav = new ModelAndView("home/template");
		mav.addObject("BODY",BODY);
		return mav;
	}
	
	@RequestMapping(value="/home/template.html")
	public ModelAndView template() {
		ModelAndView mav = new ModelAndView("home/template");
		return mav;
	}
}
