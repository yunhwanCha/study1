package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.UserDao;
import model.Customer;

@Controller
public class LoginController {
	@Autowired
	private UserDao userDao;
	
	@RequestMapping(value="/login/logindo.html",method=RequestMethod.POST)
	public ModelAndView login(@Valid Customer customer, BindingResult br,
			HttpSession session) {
		ModelAndView mav = new ModelAndView("home/template");
		if(br.hasErrors()) {
			mav.getModel().putAll(br.getModel());
			return mav;
		}
		String passwd = this.userDao.getPassword(customer.getId());//DB에서 조회
		if(passwd == null) {//검색결과가 존재하지 않는 경우, 즉 계정이 존재하지 않음
			//로그인 실패
		}else {//검색결과가 존재하는 경우, 즉 계정이 존재함
			if(passwd.equals(customer.getPwd())) {//입력한 암호와 일치하는 경우
				//로그인 성공
				if(customer.getId().equals("manager")) {//관리자 계정이 경우
					session.setAttribute("ADMIN", customer.getId());
				}else {//일반 계정인 경우
					session.setAttribute("USER", customer.getId());
				}
			}else {//입력한 암호와 일치하지 않는 경우
				//로그인 실패
			}
		}
		mav.addObject("BODY","loginResult.jsp");
		return mav;
	}

	@RequestMapping(value="/login/login.html")
	public ModelAndView loginForm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("home/login");
		request.setAttribute("customer", new Customer());
		return mav;
	}
}








