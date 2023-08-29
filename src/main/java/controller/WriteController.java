package controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.WriteDao;
import model.Bbs;
import model.FromTo;

@Controller
public class WriteController {
	@Autowired
	private WriteDao writeDao;
	
	@RequestMapping(value="/write/bbsModify.html")
	public ModelAndView bbsModify(Integer SEQNO, String CONTENT, String BTN,
			String TITLE) {
		ModelAndView mav = new ModelAndView("home/template");
		if(BTN.equals("삭제")) {
			this.writeDao.deleteBBS(SEQNO);
		}else if(BTN.equals("수정")) {
			Bbs bbs = new Bbs();
			bbs.setSeqno(SEQNO); bbs.setTitle(TITLE); bbs.setContent(CONTENT);
			this.writeDao.updateBBS(bbs);
		}
		mav.addObject("BODY","bbsModifyResult.jsp?R=OK");
		return mav;
	}
	
	@RequestMapping(value="/write/bbsDetail.html")
	public ModelAndView bbsDetail(Integer SEQNO, HttpSession session) {
		ModelAndView mav = new ModelAndView("home/template");
		String id = (String)session.getAttribute("USER");
		Bbs bbs = this.writeDao.readDetail(SEQNO);
		mav.addObject("BBS",bbs);
		if(id == null || ! id.equals(bbs.getId())) {
			//작성자와 계정이 다른 경우(1.로그인을 한 경우, 2. 로그인을 안 한 경우)
			mav.addObject("BODY","bbsRead.jsp");
		}else {//작성자와 계정이 같은 경우
			mav.addObject("BODY","bbsReadOwner.jsp");
		}
		return mav;
	}
	
	@RequestMapping(value="/write/bbsWrite.html")
	public ModelAndView bbsWrite(@Valid Bbs bbs, BindingResult br, HttpSession session) {
		ModelAndView mav = new ModelAndView("home/template");
		if(br.hasErrors()) {
			mav.addObject("BODY","bbsInput.jsp");
			mav.getModel().putAll(br.getModel());
			return mav;
		}
		String id = (String)session.getAttribute("USER");
		bbs.setId(id);//작성자 설정
		int seqno = this.writeDao.getMaxSeqno() + 1;
		bbs.setSeqno(seqno);//글번호 설정
		this.writeDao.putBBS(bbs);//DB에 삽입
		return new ModelAndView("redirect:/write/bbsRead.html");
	}
	@RequestMapping(value="/write/bbsRead.html")
	public ModelAndView bbsRead(Integer PAGE_NO) {
		FromTo ft = new FromTo(); 
		int currentPage = 1;
		if(PAGE_NO != null) currentPage = PAGE_NO;
		int startRow = (currentPage - 1) * 5;
		int endRow = ((currentPage - 1) * 5) + 6;
		ft.setFrom(startRow); ft.setTo(endRow);
		List<Bbs> bbsList = this.writeDao.readBBS(ft);
		ModelAndView mav = new ModelAndView("home/template");
		int totalCount = this.writeDao.getBBSCount();//전체 게시글의 갯수
		int pageCount = totalCount / 5;
		if(totalCount % 5 > 0) pageCount++;
		mav.addObject("PAGES",pageCount);//전체 페이지 수
		mav.addObject("STARTROW",startRow+1);
		if((endRow - 1) > totalCount) endRow = totalCount+1;
		mav.addObject("ENDROW",endRow-1);
		mav.addObject("TOTAL",totalCount);//전체 게시글의 갯수
		mav.addObject("BBSLIST",bbsList);
		mav.addObject("BODY","bbsList.jsp");
		return mav;
	}
	
	@RequestMapping(value="/write/bbsInput.html")
	public ModelAndView bbsInput() {
		ModelAndView mav = new ModelAndView("home/template");
		mav.addObject(new Bbs());
		mav.addObject("BODY","bbsInput.jsp");
		return mav;
	}
}











