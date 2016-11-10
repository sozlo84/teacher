package com.naver.sozlo;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.sozlo.entities.Member;
import com.naver.sozlo.service.MemberDao;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private Member member;
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String root(Locale locale, Model model) {		
		return "redirect:/home";
//		return "board/uploadfile";
	}
	
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public String upload() {
		return "board/uploadfile";
			
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home() {
		return "home";
			
	}
	
	
	
	
	
	
	@RequestMapping(value = "/tiles", method = RequestMethod.GET)
	public String tileshome() {
		return "default";
			
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "index";
			
	}
	
	
	
	
//	@RequestMapping(value = "/index", method = RequestMethod.GET)
//	public ModelAndView index() {
//		ModelAndView mvc = new ModelAndView("index");
//		return mvc;
//			
//	}
	
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String tilesMember() {
		System.out.println("타긴타나?");
		return "insert";
			
	}
	
	@RequestMapping(value = "/memberDeleteYn", method = RequestMethod.GET)
	public ModelAndView memberDeleteYn(@RequestParam("id") String id) {
		System.out.println("id값  memberDeleteYn: "+ id);
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		ModelAndView mav = new ModelAndView("member/member_result_yn");	
		mav.addObject("id", id);

		return mav;	
	}
	
	

	@RequestMapping(value = "/memberDelete", method = RequestMethod.POST)
	public ModelAndView memberDelete(@RequestParam("id") String id) {
		System.out.println("id값 딜리트: "+ id);
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		ModelAndView mav = new ModelAndView("member/member_result");
		mav.addObject("member",member);
		int result= dao.deleteRow(id);
		String msg = "";
		
		if(result == 1) {
			msg = "success! Insert your Info.";
		}else{
			msg = "failed! your Info.";
		}
	
		mav.addObject("msg",msg);

		return mav;	
	}
	
	
	@RequestMapping(value = "/memberSelectedDelete", method = RequestMethod.GET)
	public String memberSelectedDelete(@RequestParam String saveids[]) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		ModelAndView mav = new ModelAndView("member/member_result");
		
		for( String ids : saveids){
			dao.deleteRow(ids);
		}
			
		
		return "redirect:/memberList";
	}
		

	
//	@RequestMapping(value = "/memberInsertForm", method = RequestMethod.GET)
//	public String memberInsertForm() {
//		return "member/member_insert";	
//	}
	
	@RequestMapping(value = "/memberbody", method = RequestMethod.GET)
	public String memberbody() {
		return "member/member_insert";	
	}
	
	@RequestMapping(value = "/boardContent", method = RequestMethod.GET)
	public String boardContent() {
		return "board/board_insert";
		
		
	}
	
	
	@RequestMapping(value = "/memberInsert", method = RequestMethod.POST)
	public ModelAndView memberInsert(@ModelAttribute("member") Member member) {
			
			System.out.println("phone1 :"+member.getPhone1());
			ModelAndView mav = new ModelAndView("member/member_result");
			MemberDao dao = sqlSession.getMapper(MemberDao.class);
			try {
				member.setPhoto(member.getImgfile().getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			String msg = "";

			int result = dao.insertRow(member);
			
			if(result == 1) {
				msg = "success! Insert your Info.";
			}else{
				msg = "failed! your Info.";
			}
			

			
			mav.addObject("msg",msg);
			mav.addObject("result","ok");
//			mav.addObject("content","member/member_result");
			
			System.out.println("result:" + result);
			return mav;
	
	}
	
	
	
	@RequestMapping(value = "/result_submit", method = RequestMethod.POST)
	public String result(Locale locale, Model model) {
		return "member/result_submit";
		
		
	}
	
	@RequestMapping(value = "/memberSearch", method = RequestMethod.GET)
	public String memberSearch(Locale locale, Model model) {
		return "member/member_search";
		
		
	}
	
	@RequestMapping(value = "/memberList", method = RequestMethod.GET)
	public ModelAndView memberlist(Locale locale, Model model) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		ArrayList<Member> members = dao.selectAll();
		System.out.println("size :" + members.size());
		ModelAndView mav = new ModelAndView("member/member_list");
		mav.addObject("members",members);
		System.out.println("리다이렉트다 타냐?");
		return mav;
			
	}
	
	@RequestMapping(value = "/memberResult", method = RequestMethod.GET)
	public String memberResult(Locale locale, Model model) {
		return "member/member_result";
		
		
	}
	
//	@RequestMapping(value = "/idconfirm", method = RequestMethod.POST)
//	public  @ResponseBody int json(@RequestParam("id") String id ,
//			HttpServletResponse response) throws Exception {
//		
//		System.out.println("--------->"+ id);
//		response.setContentType("application/json");
//		response.setContentType("text/xml;charset=utf-8");
//		response.setHeader("Cache-Control", "no-cache");
//		return 0;
//			
//	}
	
	@RequestMapping(value = "/idconfirm", method = RequestMethod.POST)
	@ResponseBody
	public int idconfirm(@RequestParam String id ) {
		
		System.out.println("---->"+id);
		int count = 0;
		int find = 0;
		try {
			MemberDao dao = sqlSession.getMapper(MemberDao.class);
			// dao에 있는 메소드를 갖다 쓰는데 그메소드가 쿼리 xml이랑 연결되있고 db랑 연결되있는 
			// sqlSession.getMapper(MemberDao.class);를 가져다 사용한다.
			count =  dao.selectCount(id);
			
			
		} catch (Exception e) {
			
			System.out.println("error :" + e.getMessage());
		}
		if(count > 0){
			find = 1;
		}else{
			find = 0;
		}
		return find;
		
	}
	
	
	
	@RequestMapping(value = "/memberUpdateForm", method = RequestMethod.GET)
	public ModelAndView memberUpdate(@RequestParam String id , HttpServletResponse response,HttpServletRequest request ) throws Exception {
		MemberDao dao =sqlSession.getMapper(MemberDao.class);
		Member member = dao.selectOne(id);
		System.out.println("id :"+member.getId());
		String path = request.getContextPath();
		System.out.println("path:값 :"+path);
		
		
		byte[] bytes = member.getPhoto();
		
//		if( bytes.length > 0 ) {
//			InputStream in = new ByteArrayInputStream(bytes);
//			BufferedImage bimg = ImageIO.read(in);
//			in.close();
//			ServletOutputStream sos = response.getOutputStream();
//			ImageIO.write(bimg, "png", sos);
//		}
		
		ModelAndView mav = new ModelAndView("member/member_update_form");
		mav.addObject("member",member);
		return mav;
	}

	
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
	public ModelAndView memberUpdate(@ModelAttribute("member") Member member) {
			
			ModelAndView mav = new ModelAndView("member/member_result");
			MemberDao dao = sqlSession.getMapper(MemberDao.class);
//			try {
//				member.setPhoto(member.getImgfile().getBytes());
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
			
			String msg = "";

			int result = dao.updateData(member);
			
			if(result == 1) {
				msg = "success! updated your Info.";
			}else{
				msg = "failed! your Info.";
			}
			


			mav.addObject("msg",msg);
			mav.addObject("result","ok");
//			mav.addObject("content","member/member_result");
			
			System.out.println("result:" + result);
			return mav;
	
	}
	
	@RequestMapping(value = "/memberUpdatedata", method = RequestMethod.POST)
	public ModelAndView memberUpdatedata(@ModelAttribute("member") Member member) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		int result = dao.updateData(member);
		System.out.println("리설트값 : " + result);
		ModelAndView mav = new ModelAndView("index");
		
		
		return mav;
	}
	
	

	
}
