package controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.ImageDao;
import model.FromTo;
import model.ImageBBS;

@Controller
public class ImageController {
	@Autowired
	private ImageDao imageDao;
	
	@RequestMapping(value="/image/update.html")
	public ModelAndView updateForm(Integer id) {
		ModelAndView mav = new ModelAndView("home/template");
		ImageBBS bbs = this.imageDao.getImageDetail(id);//글번호로 게시글 조회
		mav.addObject(bbs);//객체 주입
		mav.addObject("BODY","imageUpdateForm.jsp");
		return mav;
	}
	
	@RequestMapping(value="/image/deleteDo.html")
	public ModelAndView deleteDo(ImageBBS imageBBS) {
		ModelAndView mav = new ModelAndView("home/template");
		ImageBBS old = this.imageDao.getImageDetail(imageBBS.getW_id());//글번호로 게시글 조회
		if(old.getPassword().equals(imageBBS.getPassword())) {//암호가 같은 경우
			this.imageDao.deleteImageBBS(imageBBS.getW_id());
			mav.addObject("BODY","imageDeleteResult.jsp");
		}else {//암호가 다른 경우
			mav.addObject("BODY","imageDeleteResult.jsp?id="+imageBBS.getW_id());
		}
		return mav;
	}
	
	@RequestMapping(value="/image/delete.html")
	public ModelAndView deleteForm(Integer id) {
		ModelAndView mav = new ModelAndView("home/template");
		ImageBBS bbs = this.imageDao.getImageDetail(id);//글번호로 검색
		mav.addObject("BODY","imageDeleteForm.jsp");
		mav.addObject("imageBBS",bbs);
		return mav;
	}
	
	@RequestMapping(value="/image/detail.html")
	public ModelAndView detail(Integer W_ID, HttpSession session) {
		ModelAndView mav = new ModelAndView("home/template");
		ImageBBS bbs = this.imageDao.getImageDetail(W_ID);
		String id = (String)session.getAttribute("USER");
		if(id == null) //로그인을 안 한 경우
			mav.addObject("BODY","imageDetail.jsp");
		else if(id.equals(bbs.getId()))// 로그인한 계정과 작성자가 동일한 경우
			mav.addObject("BODY","imageDetailOwner.jsp");
		else //작성자와 계정이 다른 경우
			mav.addObject("BODY","imageDetailReply.jsp");
		mav.addObject("BBS",bbs);
		return mav;
	}
	
	@RequestMapping(value="/image/updateDo.html")
	public ModelAndView updateDo(ImageBBS imageBBS, HttpSession session,
			HttpServletRequest request) throws Exception{
		ServletContext ctx = session.getServletContext();
		String filePath = ctx.getRealPath("/upload");//upload폴더의 절대 경로 획득
		String encType = "euc-kr";//언어코드
		int maxSize = 1024 * 5 * 1024;//업로드 최대 크기
		MultipartRequest multipart = new MultipartRequest(request, filePath, maxSize,
				encType, new DefaultFileRenamePolicy());
		String image_name = null;
		ImageBBS old = this.imageDao.getImageDetail(
				Integer.parseInt(multipart.getParameter("w_id")));//글번호로 조회
		ModelAndView mav = new ModelAndView("home/template");
		if(old.getPassword().equals(multipart.getParameter("password"))) {//암호가 일치하는 경우
			image_name = multipart.getFilesystemName("image_name");//업로드 실행
			if(image_name == null) {//파일이름이 없는 경우, 즉 이미지 변경을 안하는 경우
				imageBBS.setImage_name(old.getImage_name());//기존의 이미지 이름으로 설정
			}else {//파일이름이 있는 경우, 즉 이미지를 변경하는 경우
				imageBBS.setImage_name(image_name);//새 이미지 이름으로 설정
			}
			imageBBS.setW_id(Integer.parseInt(multipart.getParameter("w_id")));//글번호 설정
			imageBBS.setTitle(multipart.getParameter("title"));//제목 설정
			imageBBS.setContent(multipart.getParameter("content"));//내용 설정
			imageBBS.setId(old.getId());//작성자 설정
			this.imageDao.updateImageBBS(imageBBS);//DB에서 update 실행
			mav.addObject("BODY","imageUpdateResult.jsp");
		}else {//암호가 일치하지 않는 경우
			mav.addObject("BODY","imageUpdateResult.jsp?id="+multipart.getParameter("w_id"));
		}
		return mav;
	}
	
	@RequestMapping(value="/image/write.html")
	public ModelAndView write(ImageBBS imageBBS, HttpSession session,
			HttpServletRequest request) throws Exception{
		ServletContext ctx = session.getServletContext();
		String filePath = ctx.getRealPath("/upload");//upload폴더의 절대 경로 획득
		String encType = "euc-kr";//언어코드
		int maxSize = 1024 * 5 * 1024;//업로드 최대 크기
		MultipartRequest multipart = new MultipartRequest(request, filePath, maxSize,
				encType, new DefaultFileRenamePolicy());
		String image_name = multipart.getFilesystemName("image_name");//업로드 실행
		int wid = this.imageDao.getMaxId()+1;
		imageBBS.setW_id(wid);//글번호 설정
		String id = (String)session.getAttribute("USER");//계정
		if(multipart.getParameter("parent_id") == null) {//원글인 경우
			imageBBS.setParent_id(0);
			imageBBS.setOrder_no(0);
			imageBBS.setGroup_id(wid);
		}else {//답글인 경우
			imageBBS.setParent_id(Integer.parseInt(multipart.getParameter("parent_id")));
			imageBBS.setGroup_id(Integer.parseInt(multipart.getParameter("group_id")));
			imageBBS.setOrder_no(Integer.parseInt(multipart.getParameter("order_no")));
			this.imageDao.updateOrderNo(imageBBS);
		}
		imageBBS.setImage_name(image_name);//파일이름 설정
		imageBBS.setId(id);//계정 설정
		imageBBS.setPassword(multipart.getParameter("password"));//암호 설정
		imageBBS.setTitle(multipart.getParameter("title"));//제목 설정
		imageBBS.setContent(multipart.getParameter("content"));//내용 설정
		this.imageDao.create(imageBBS);//DB에 삽입
		return new ModelAndView("redirect:/image/imageList.html");
	}
	@RequestMapping(value="/image/imageList.html")
	public ModelAndView imageList(Integer PAGE_NUM) {
		if(PAGE_NUM == null) PAGE_NUM = 1;
		int currentPage = PAGE_NUM;//현재 페이지
		int count = this.imageDao.getImageCount();//게시글의 갯수
		int totalPageCount = 0; int startRow = 0; int endRow = 0;
		if(count > 0) {//게시글이 존재하는 경우
			totalPageCount = count / 5;
			if(count % 5 > 0) totalPageCount++;
			startRow = (currentPage - 1) * 5 + 1;
			endRow = currentPage * 5;
			if(endRow > count) endRow = count;
		}
		FromTo ft = new FromTo();
		int from = (currentPage - 1) * 5;
		int to = ((currentPage - 1) * 5 ) + 6;
		if(to > count) to = count + 1;
		ft.setFrom(from); ft.setTo(to);
		List<ImageBBS> imageList = this.imageDao.getImages(ft);
		ModelAndView mav = new ModelAndView("home/template");
		mav.addObject("BODY","imageList.jsp");
		mav.addObject("startRow",startRow);
		mav.addObject("endRow",endRow);
		mav.addObject("total",count);
		mav.addObject("IMAGES",imageList);
		mav.addObject("currentPage",currentPage);
		mav.addObject("pageCount",totalPageCount);
		return mav;
	}
	
	@RequestMapping(value="/image/writeReplyForm.html")
	public ModelAndView replyForm(Integer id, Integer parentid, Integer groupid) {
		ModelAndView mav = new ModelAndView("home/template");
		ImageBBS bbs = this.imageDao.getImageDetail(id);//글번호로 원글 조회
		bbs.setContent(null);//글내용을 지운다.
		bbs.setPassword(null);//암호를 지운다.
		bbs.setImage_name(null);//이미지이름을 지운다.
		bbs.setGroup_id(groupid);//그룹번호 설정
		bbs.setParent_id(parentid);//부모글 번호 설정
		mav.addObject("title","RE]"+bbs.getTitle());//RE]원글 제목 설정
		mav.addObject(bbs);//원글 객체 주입
		mav.addObject("BODY","imageWriteForm.jsp");
		return mav;
	}
	
	@RequestMapping(value="/image/writeForm.html")
	public ModelAndView writeForm() {
		ModelAndView mav = new ModelAndView("home/template");
		mav.addObject(new ImageBBS());
		mav.addObject("BODY","imageWriteForm.jsp");
		return mav;
	}
}








