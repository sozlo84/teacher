package com.naver.sozlo;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.tiles.request.ApplicationContext;
import org.apache.tiles.request.ApplicationContextAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.naver.sozlo.entities.Board;

import com.naver.sozlo.entities.BoardPaging;
import com.naver.sozlo.entities.Member;
import com.naver.sozlo.service.BoardDao;
import com.naver.sozlo.service.MemberDao;

@Controller
public class BoardController implements ApplicationContextAware {

	@Autowired
	private SqlSession sqlSession;
	
	private WebApplicationContext context = null;
	private int selectedPage;
	public static String selectbox;
	public static String find;
	
	
	@RequestMapping(value = "/boardInsertForm", method = RequestMethod.GET)
	public String login(HttpServletRequest request) {
		HttpSession session = request.getSession();
		System.out.println("------->>"+session.getAttribute("sessionid"));
		System.out.println("static : "+ this.selectbox);
		System.out.println("find : "+ this.find);
		if( session.getAttribute("sessionid")==null) {
			return "board/board_login_request";			 
		}else{
			return "board/board_insert";
		}
			
	}
	
	@RequestMapping(value = "/boardReply", method = RequestMethod.GET)
	public ModelAndView boardReply(@RequestParam int b_seq) {
		
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		dao.updateHit(b_seq);
		Board board =dao.selectOne(b_seq);
		
		ModelAndView mav = new ModelAndView("board/board_reply");
		mav.addObject("board",board);
		return mav;
	}
	
	
	@RequestMapping(value = "/boardInsert", method = RequestMethod.POST)
	public ModelAndView boardInsert(@ModelAttribute("board") Board board ,HttpServletRequest request,@RequestParam CommonsMultipartFile file) {
		
		System.out.println("갑 나오나~~:" +board.getB_title());
		String path="D:/springstssource/itschoolspring/src/main/webapp/resources/upload/";
		String filename = file.getOriginalFilename();
		
		try {
			byte barr[] = file.getBytes();
			
			BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(path+filename));
			bout.write(barr);
			bout.flush();
			bout.close();
			
		} catch (Exception e){
			System.out.println(e);
		} 
		
		ModelAndView mav = new ModelAndView("board/board_result");
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		String b_ip = request.getRemoteAddr();
		
		System.out.println("ip : "+b_ip);
		SimpleDateFormat simple = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss", Locale.KOREA);
		Date currentdate = new Date();
		String b_date = simple.format(currentdate);
		
		
		if(filename.equals("")){
			board.setB_attach("");
		}else{
			board.setB_attach(path+filename);
		}
		
		board.setB_ip(b_ip);
		board.setB_date(b_date);
		board.setB_step(0);
		board.setB_hit(0);
		board.setB_level(0);
		board.setB_attach(filename);
		
		String msg = "";
		int result = dao.insertRow(board);
		if(result > 0) {
			msg = "Sucess!! inserted";
		}else{
			msg ="Failed! your article";
		}
		
		mav.addObject("msg",msg);
		return mav;
		
	}
	
	
	@RequestMapping(value = "/boardPageSelect", method = RequestMethod.GET)
	public ModelAndView boardPageSelect(@RequestParam int page,@ModelAttribute("boardpaging") BoardPaging boardpaging ) {
		
		System.out.println("page:"+page);
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		System.out.println("selectbox:"+this.selectbox);
		
		boardpaging.setSelectbox(this.selectbox);
		boardpaging.setFind(this.find);
		int rowcount = dao.selectCount(boardpaging);
		int pageSize = 10;
		int pageCount = 0;
		int absPage = 0;
		
		int startrow = (page - 1) * pageSize;
		int endrow = startrow + 10;
		boardpaging.setStartrow(startrow);
		boardpaging.setEndrow(endrow);
		
		
		ArrayList<Board> boards = dao.selectPagelist(boardpaging);
		
		if(rowcount > 0 && rowcount%pageSize != 0){
			absPage = 1;
		}
		
		pageCount = rowcount / pageSize + absPage;
		
		int pages [] = new int[pageCount];
		
		for(int i = 0 ; i <pageCount ; i++){
			pages[i] = i+1;
			
		}
		
		System.out.println("count:"+ rowcount);
		ModelAndView mav = new ModelAndView("board/board_list");
		mav.addObject("boardpaging",boardpaging);
		mav.addObject("boards",boards);
		mav.addObject("pages",pages);
		
		return mav;
	}
	
	
	
	
	@RequestMapping(value = "/boardReplySave", method = RequestMethod.POST)
	public ModelAndView boardReplySave(@ModelAttribute("board") Board board ,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("board/board_result");
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		String b_ip = request.getRemoteAddr();
		
		System.out.println("ip : "+b_ip);
		SimpleDateFormat simple = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss", Locale.KOREA);
		Date currentdate = new Date();
		String b_date = simple.format(currentdate);
		
		board.setB_ip(b_ip);
		board.setB_date(b_date);
		board.setB_hit(0);
		board.setB_level(0);
//		board.setB_step(0);
		
		// 함보기.
		
		String msg = "";
		int result = dao.insertReply(board);
		if(result > 0) {
			msg = "Sucess!! inserted you reply";
		}else{
			msg ="Failed! your reply";
		}
		
		mav.addObject("msg",msg);
		return mav;
		
	}
	
	
	@RequestMapping(value = "/boardDetail", method = RequestMethod.GET)
	public ModelAndView boardDetail(@RequestParam int b_seq, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		dao.updateHit(b_seq);
		Board board =dao.selectOne(b_seq);
		ModelAndView mav = new ModelAndView("board/board_detail");
		mav.addObject("board",board);
		System.out.println("b_seq:"+board.getB_seq());
		
		return mav;
			
	}
	
	@RequestMapping(value = "/boardDelete", method = RequestMethod.POST)
	public ModelAndView boardDelete(@RequestParam int b_seq) {
		
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		ModelAndView mav = new ModelAndView("board/board_result");
		System.out.println("b_seq값~~:"+b_seq);
		int result = dao.deleteRow(b_seq);
		String msg = "";
		if(result>0){
			msg="success delete";
		}else{
			msg="failed";
		}
		mav.addObject("msg",msg);
		return mav;
			
	}
	
	
	@RequestMapping(value = "/boardUpdate", method = RequestMethod.POST)
	public ModelAndView boardUpdate(@ModelAttribute("board") Board board ,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("board/board_result");
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		String b_ip = request.getRemoteAddr();
		
		System.out.println("ip : "+b_ip);
		SimpleDateFormat simple = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss", Locale.KOREA);
		Date currentdate = new Date();
		String b_date = simple.format(currentdate);
		
		
		board.setB_ip(b_ip);
		board.setB_date(b_date);
		
		System.out.println("b_seq----?:"+board.getB_seq());
		
		String msg = "";
		int result = dao.updateRow(board);
		if(result > 0) {
			msg = "Sucess!! Update";
		}else{
			msg ="Failed! your article";
		}
		
		mav.addObject("msg",msg);
		return mav;
		
	}
	
	@RequestMapping(value = "/boardDeleteYN", method = RequestMethod.GET)
	public ModelAndView boardDeleteYN(@RequestParam int b_seq) {
		System.out.println("타나 지금쓴거");
		ModelAndView mav = new ModelAndView("board/board_delete_yn");
		mav.addObject("b_seq",b_seq);
		return mav;
			
	}
	
	
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public ModelAndView boardList(Locale locale, Model model,@ModelAttribute("board") BoardPaging boardpaging ) {
		
		
		if(this.selectbox == null) {
			this.selectbox="b_title";
		}
		this.find="";
		
		boardpaging.setSelectbox(this.selectbox);
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		int rowcount = dao.selectCountAll();
		System.out.println("셀렉트카운터");
		int pageSize = 10;
		int absPage = 1;
		int pageCount = rowcount / pageSize + absPage;
		int pages [] = new int[pageCount];
		
		for(int i = 0 ; i <pageCount ; i++){
			pages[i] = i+1;			
		}
		
		ModelAndView mav = new ModelAndView("board/board_list");
		
		ArrayList<Board> boards = dao.selectAll();
		System.out.println("셀렉트보드");

		mav.addObject("boardpaging",boardpaging);
		mav.addObject("boards",boards);
		mav.addObject("pages",pages);
		return mav;
			
	}
	
	
	
	
	
	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	public ModelAndView upload(@RequestParam CommonsMultipartFile file,HttpSession ssion) {
//			String path=ssion.getServletContext().getRealPath("/");
		String path="D:/springstssource/itschoolspring/src/main/webapp/resources/upload/";
		String filename = file.getOriginalFilename();
		
		try {
			byte barr[] = file.getBytes();
			
			BufferedOutputStream bout = new BufferedOutputStream(new FileOutputStream(path+filename));
			bout.write(barr);
			bout.flush();
			bout.close();
			
		} catch (Exception e){
			System.out.println(e);
		} 
			return new ModelAndView("board/board_result");
	}

	
	@RequestMapping(value="/boardDownload",method = RequestMethod.GET)
	public ModelAndView download(@RequestParam("b_attach") String b_attach ){
		String path="D:/springstssource/itschoolspring/src/main/webapp/resources/upload/";
		String result = path+"/"+b_attach;
		File file = new File(result);
		return new ModelAndView("download","downloadFile",file);
	}
	

	@RequestMapping(value = "/boardPageList", method = RequestMethod.POST)
	public ModelAndView boardPageList(@ModelAttribute("boardpaging") BoardPaging boardpaging) {
		
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		ModelAndView mav = new ModelAndView("board/board_list");
//		ArrayList<Board> boards =dao.selectAll();
		
		this.selectbox = boardpaging.getSelectbox();
		this.find = boardpaging.getFind();
		
		int rowcount = dao.selectCount(boardpaging);
		System.out.println("안타나~~~~");
		int pageSize = 10;
		int pageCount = 0;
		int absPage = 0;
		
		if( selectedPage ==0 ) {
			selectedPage = 1;
		}
		
		int startrow = (selectedPage - 1) * pageSize;
		int endrow = startrow + 10;
		boardpaging.setStartrow(startrow);
		boardpaging.setEndrow(endrow);
		
		System.out.println("selectedPage"+selectedPage);
		
		ArrayList<Board> boards = dao.selectPagelist(boardpaging);
		

		if(rowcount > 0 && rowcount%pageSize != 0){
			absPage = 1;
		}
		
		pageCount = rowcount / pageSize + absPage;
		
		int pages [] = new int[pageCount];
		
		for(int i = 0 ; i <pageCount ; i++){
			pages[i] = i+1;
			
		}
		
		mav.addObject("boardpaging",boardpaging);
		mav.addObject("boards",boards);
		mav.addObject("pages",pages);
		return mav;
	}
	
	
	
	@Override
	public void setApplicationContext(ApplicationContext arg0) {
		
		this.context = (WebApplicationContext)arg0;
		
	}
	
	
			
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		

