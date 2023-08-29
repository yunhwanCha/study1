package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.UserDao;
import model.User;

@Controller
public class EntryController {
	@Autowired
	private UserDao userDao;
	
	@RequestMapping(value="/entry/entry.html")
	public ModelAndView entry(User user) {
		ModelAndView mav = new ModelAndView("home/template");
		this.userDao.create(user);//DB에 삽입
		mav.addObject("BODY","userEntryResult.jsp?R=OK");
		return mav;
	}
	
	@RequestMapping(value="/entry/idcheck.html")
	public ModelAndView idcheck(String ID) {
		ModelAndView mav = new ModelAndView("home/idCheck");
		String id = this.userDao.getId(ID);
		if(id != null) {//동일한 계정이 존재하는 경우
			mav.addObject("DUP","YES");
		}else {//동일한 계정이 존재하지 않는 경우
			mav.addObject("DUP","NO");
		}
		mav.addObject("ID",ID);
		return mav;
	}
	
	@RequestMapping(value="/entry/userEntry.html")
	public ModelAndView entry() {
		ModelAndView mav = new ModelAndView("home/template");
		mav.addObject(new User());
		mav.addObject("BODY","userEntry.jsp");
		return mav;
	}
}







