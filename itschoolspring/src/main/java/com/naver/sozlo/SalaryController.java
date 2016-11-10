package com.naver.sozlo;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.Local;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.sozlo.entities.Board;
import com.naver.sozlo.entities.BoardPaging;
import com.naver.sozlo.entities.Member;
import com.naver.sozlo.entities.Salary;
import com.naver.sozlo.entities.SalaryRoll;
import com.naver.sozlo.entities.SalaryRollup;
import com.naver.sozlo.service.BoardDao;
import com.naver.sozlo.service.MemberDao;
import com.naver.sozlo.service.SalaryDao;

@Controller
public class SalaryController {
	
	
	
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private Salary salary;
	
	@Autowired
	private SalaryRoll salaryroll;
	
	@RequestMapping(value = "/Salary", method = RequestMethod.GET)
	public String SalaryList() {
		
//		SalaryDao dao = sqlSession.getMapper(SalaryDao.class);
//		ModelAndView mav = new ModelAndView("board/board_list");
//		
//		ArrayList<Salary> boards = dao.selectAll();	
		return "salary/salary_list";
			
	}

	
	@RequestMapping(value = "/salaryCreate", method = RequestMethod.POST)
	public ModelAndView salaryCreate(@RequestParam String yyyy,String mm) {
		
		ModelAndView mav = new ModelAndView("salary/salary_list");	
		SalaryDao dao = sqlSession.getMapper(SalaryDao.class);	
		System.out.println("yyyymm : "+yyyy+mm);
		dao.deleteRollRow(yyyy+mm);
		ArrayList<Salary> salarys = dao.selectAll();
		List<SalaryRoll> salaryrolls = new ArrayList<SalaryRoll>();
		
		for(Salary salary : salarys) {
			System.out.println(salary.getNo());
			salaryroll = new SalaryRoll();
			salaryroll.setYyyymm(yyyy+mm);
			salaryroll.setNo(salary.getNo());
			salaryroll.setAmount(salary.getBase()+salary.getExtrapay1()+salary.getExtrapay2());
			salaryroll.setAmount12(salaryroll.getAmount() * 12);
			
			int incometax = 0;
			if( salaryroll.getAmount12() < 5000001 ) {
				
				incometax = (int) (salaryroll.getAmount12() * 0.7);
				
			} else if(( salaryroll.getAmount12() > 5000000 ) && ( salaryroll.getAmount12() < 15000001 )){
				
				incometax = (int) (3500000 + ((salaryroll.getAmount12() - 5000000)) * 0.4); 		
				
			} else if(( salaryroll.getAmount12() > 15000000 ) && ( salaryroll.getAmount12() < 45000001 )) {
				
				incometax = (int) (7500000 + ((salaryroll.getAmount12() - 15000000)) * 0.15); 		
				
			} else if(( salaryroll.getAmount12() > 45000000 ) && ( salaryroll.getAmount12() < 100000001 )) {
				
				incometax = (int) (12000000 + ((salaryroll.getAmount12() - 45000000)) * 0.05); 		
				
			} else {
				incometax = (int) (14750000 + ((salaryroll.getAmount12() - 100000000)) * 0.02); 
			}
			
			salaryroll.setIncometax(incometax);
			
			salaryroll.setIncome(salaryroll.getAmount12() - incometax);
			
			int temp = (int) (salaryroll.getAmount()*0.001);
				temp = temp * 1000;
				
	
			temp = (int) Math.floor((temp * 0.045) * 0.1)*10;	
			temp = temp * 12;
			
			salaryroll.setInsurance(temp);
			
			int dependent = salary.getPartner()+salary.getDependent20()+salary.getDependent60();
			temp = dependent * 1500000;
			salaryroll.setHumandeduct(temp);
			
			int addtemp = (int) ((4000000 - salaryroll.getAmount12())* 0.04);
			
			temp = 0;
			
			if(( salaryroll.getAmount12() < 30000001) &&(dependent ==1)){
				
				temp = (int) (3100000 + (salaryroll.getAmount12() * 0.04)); 
			}
			
			if(( salaryroll.getAmount12() < 30000001) &&(dependent ==2)){
				
				temp = (int) (3600000 + (salaryroll.getAmount12() * 0.04)); 
			}
			
			if(( salaryroll.getAmount12() < 30000001) &&(dependent > 2)){
				
				temp = (int) (5000000 + (salaryroll.getAmount12() * 0.07)) + addtemp; 
			}
			
			if( (salaryroll.getAmount12() > 30000000 && salaryroll.getAmount12() < 45000001) && (dependent ==1)){
				
				temp = (int) ((3100000 + (salaryroll.getAmount12() * 0.04)) - ((salaryroll.getAmount12() - 30000000) * 0.05)); 
			}
			
			if( (salaryroll.getAmount12() > 30000000 && salaryroll.getAmount12() < 45000001) && (dependent ==2)){
				
				temp = (int) ((3600000 + (salaryroll.getAmount12() * 0.04)) - ((salaryroll.getAmount12() - 30000000) * 0.05)); 
			}
			
			if( (salaryroll.getAmount12() > 30000000 && salaryroll.getAmount12() < 45000001) && (dependent > 2)){
				
				temp = (int) ((5000000 + (salaryroll.getAmount12() * 0.07)) - ((salaryroll.getAmount12() - 30000000) * 0.05) +addtemp ); 
			}
			
			if( (salaryroll.getAmount12() > 45000000 && salaryroll.getAmount12() < 70000001) && (dependent ==1)){
				
				temp = (int) ((3100000 + (salaryroll.getAmount12() * 0.015))); 
			}
			
			if( (salaryroll.getAmount12() > 45000000 && salaryroll.getAmount12() < 70000001) && (dependent ==2)){
				
				temp = (int) ((3600000 + (salaryroll.getAmount12() * 0.02))); 
			}
			
			if( (salaryroll.getAmount12() > 45000000 && salaryroll.getAmount12() < 70000001) && (dependent > 2)){
				
				temp = (int) ((5000000 + (salaryroll.getAmount12() * 0.05)) + addtemp); 
			}
			
			if( (salaryroll.getAmount12() > 70000000 && salaryroll.getAmount12() < 120000001) && (dependent == 1)){
				
				temp = (int) ((3100000 + (salaryroll.getAmount12() * 0.005))); 
			}
			
			if( (salaryroll.getAmount12() > 70000000 && salaryroll.getAmount12() < 120000001) && (dependent == 2)){
				
				temp = (int) ((3100000 + (salaryroll.getAmount12() * 0.01))); 
			}
			
			if( (salaryroll.getAmount12() > 70000000 && salaryroll.getAmount12() < 120000001) && (dependent > 2)){
				
				temp = (int) ((5000000 + (salaryroll.getAmount12() * 0.03))+ addtemp ); 
			}
			
			
			salaryroll.setSpecial(temp);			
			
			temp = salaryroll.getIncome() - (salaryroll.getHumandeduct() + salaryroll.getInsurance() + salaryroll.getSpecial());
			salaryroll.setStandard(temp);
			
			if (salaryroll.getStandard() < 12000001 ){
				temp = (int) (salaryroll.getStandard() * 0.06);
			}else if(salaryroll.getStandard() > 12000001 && salaryroll.getStandard() < 46000001 )  {
				temp = (int) (720000 + ( (12000000 - salaryroll.getStandard()) * 0.15));
				
			}else if(salaryroll.getStandard() > 46000001 && salaryroll.getStandard() < 46000001 ) {
				temp = (int) (5800000 + ( (46000000 - salaryroll.getStandard()) * 0.24));
			}else if(salaryroll.getStandard() > 88000001 && salaryroll.getStandard() < 150000001) {
				temp = (int) (15900000 + ( (88000000 - salaryroll.getStandard()) * 0.35));
			}else  {
				temp = (int) (37600000 + ( (150000000 - salaryroll.getStandard()) * 0.38));
			}
			
			
			salaryroll.setCalculatetax(temp);
			
			if ( salaryroll.getCalculatetax() < 500001 ){
				
				temp = (int) (salaryroll.getCalculatetax() * 0.55);
			}else {
				temp = (int) (275000 + ((500000 - salaryroll.getCalculatetax()) * 0.3));
			}
			
			int tempincometax = temp;
			
			if( tempincometax  > 660000 && salaryroll.getAmount12() < 55000001 ) {
				tempincometax = 660000;
			}
			
			if( tempincometax  > 630000 && salaryroll.getAmount12() > 55000001 && salaryroll.getAmount12() <70000001  ) {
				tempincometax = 630000;
			}
			
			if( tempincometax  > 500000 && salaryroll.getAmount12() > 70000000)  {
				tempincometax = 630000;
			}
			
			
			salaryroll.setIncometaxdeduct(temp);
			
			salaryroll.setDecisiontax12(salaryroll.getCalculatetax() - salaryroll.getIncometaxdeduct());
			
			temp = salaryroll.getDecisiontax12() / 12;
			
			temp = (int) Math.floor(temp * 0.1)*10;
			
			salaryroll.setDecisiontax(temp);
		
			salaryrolls.add(salaryroll);
			
		}
		
		dao.insertRollRow(salaryrolls);
		return mav;
			
	}
	
	
	@RequestMapping(value = "/salaryRollup", method = RequestMethod.POST)
	public ModelAndView salaryRollup(@RequestParam String yyyy, String mm) {
		
		
		SalaryDao dao = sqlSession.getMapper(SalaryDao.class);	
		ModelAndView mav = new ModelAndView("salary/salary_rolluplist");
		ArrayList<SalaryRollup> rollups =dao.salaryRollup(yyyy+mm);
		System.out.println(rollups.size());
		mav.addObject("rollups",rollups);
		return mav;
			
	}
	
	
	@RequestMapping(value = "/salaryRollupForm", method = RequestMethod.GET)

	public ModelAndView salaryRollup() {
		
		SimpleDateFormat simple = new SimpleDateFormat("yyyy,MM.dd HH:mm:ss",Locale.KOREA);
		Date currentdate = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy");
		String yyyy = df.format(currentdate);
		ModelAndView mav = new ModelAndView("salary/salaryroll_up");
		mav.addObject("yyyy",yyyy);
		
	
		return mav;
			
	}
	
	
	
	
	
	@RequestMapping(value = "/salaryCreateForm", method = RequestMethod.GET)
	public ModelAndView salaryCreateForm() {
		
		SimpleDateFormat simple = new SimpleDateFormat("yyyy,MM.dd HH:mm:ss",Locale.KOREA);
		Date currentdate = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy");
		String yyyy = df.format(currentdate);
		ModelAndView mav = new ModelAndView("salary/salary_create");
		mav.addObject("yyyy",yyyy);
		
	
		return mav;
			
	}
	
	
	@RequestMapping(value = "/noconfirm", method = RequestMethod.POST)
	@ResponseBody
	public int idconfirm(@RequestParam String no ) {
		
		System.out.println("---->"+no);
		int count = 0;
		int find = 0;
		try {
			SalaryDao dao= sqlSession.getMapper(SalaryDao.class);
			// dao에 있는 메소드를 갖다 쓰는데 그메소드가 쿼리 xml이랑 연결되있고 db랑 연결되있는 
			// sqlSession.getMapper(MemberDao.class);를 가져다 사용한다.
			count =  dao.selectCount(no);
			
			
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
	
	
	
	
	@RequestMapping(value = "/SalaryInsertForm", method = RequestMethod.GET)
	public String login(HttpServletRequest request) {
		HttpSession session = request.getSession();
	
		if( session.getAttribute("sessionid")==null) {
			return "board/board_login_request";			 
		}else{
			return "salary/salary_insert";
		}
			
	}
	
	@RequestMapping(value = "/salaryInsert", method = RequestMethod.POST)
	public ModelAndView salaryInsert(@ModelAttribute("salary") Salary salary) {
			
			System.out.println("Partner초아 :"+salary.getPartner());
			System.out.println("부서명 : "+ salary.getDept());
			System.out.println("select박스값20 :" + salary.getDependent20());
			System.out.println("select박스값60 :" + salary.getDependent60());
			ModelAndView mav = new ModelAndView("salary/salary_result");
			SalaryDao dao = sqlSession.getMapper(SalaryDao.class);
//			try {
//				member.setPhoto(member.getImgfile().getBytes());
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
			
			String msg = "";

			int result = dao.insertRow(salary);
			
			if(result == 1) {
				msg = "success! Insert your Info.";
			}else{
				msg = "failed! your Info.";
			}
			

			
			mav.addObject("msg",msg);
			mav.addObject("result","ok");
			mav.addObject("content","member/member_result");
			
			System.out.println("result:" + result);
			return mav;
	
	}
	
	
	@RequestMapping(value = "/salaryList", method = RequestMethod.GET)
	public ModelAndView salaryList(Locale locale, Model model,@ModelAttribute("board") BoardPaging boardpaging ) {
		
		
//		if(this.selectbox == null) {
//			this.selectbox="b_title";
//		}
//		this.find="";
		
//		boardpaging.setSelectbox(this.selectbox);
		SalaryDao dao = sqlSession.getMapper(SalaryDao.class);
//		int rowcount = dao.selectCountAll();
		
//		int pageSize = 10;
//		int absPage = 1;
//		int pageCount = rowcount / pageSize + absPage;
//		int pages [] = new int[pageCount];
//		
//		for(int i = 0 ; i <pageCount ; i++){
//			pages[i] = i+1;			
//		}
	
		ModelAndView mav = new ModelAndView("salary/salary_list");
		
		ArrayList<Salary> salarys = dao.selectAll();
		System.out.println("셀렉트보드");
		
		
//		mav.addObject("boardpaging",boardpaging);
		mav.addObject("salarys",salarys);
//		mav.addObject("pages",pages);
		return mav;
			
	}
	
	@RequestMapping(value = "/salaryDetail", method = RequestMethod.GET)
	public ModelAndView salaryDetail(@RequestParam String no, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		SalaryDao dao = sqlSession.getMapper(SalaryDao.class);
//		dao.updateHit(b_seq);
		Salary salary= dao.selectOne(no);
		ModelAndView mav = new ModelAndView("salary/salary_detail");
		mav.addObject("salary",salary);
//		System.out.println("b_seq:"+board.getB_seq());
		
		return mav;
			
	}
	
	@RequestMapping(value = "/salaryUpdate", method = RequestMethod.POST)
	public ModelAndView salaryUpdate(@ModelAttribute("salary") Salary salary ,HttpServletRequest request) {
		
		System.out.println("salary배우자:"+salary.getPartner());
		System.out.println("salary배우자:"+salary.getName());
		System.out.println("salary배우자:"+salary.getDept());
		System.out.println("salary배우자:"+salary.getExtrapay1());
		System.out.println("salary배우자:"+salary.getName());
		System.out.println("salary배우자:"+salary.getNo());
		ModelAndView mav = new ModelAndView("salary/salary_result");
		SalaryDao dao = sqlSession.getMapper(SalaryDao.class);
		String b_ip = request.getRemoteAddr();
		
		System.out.println("ip : "+b_ip);
		SimpleDateFormat simple = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss", Locale.KOREA);
		Date currentdate = new Date();
		String b_date = simple.format(currentdate);
		
		
//		board.setB_ip(b_ip);
//		board.setB_date(b_date);
		
//		System.out.println("b_seq----?:"+board.getB_seq());
		
		String msg = "";
		int result = dao.updateRow(salary);
		if(result > 0) {
			msg = "Sucess!! Update";
		}else{
			msg ="Failed! your article";
		}
		
		mav.addObject("msg",msg);
		return mav;
		
	}
	
	
	@RequestMapping(value = "/SalarySelectedDelete", method = RequestMethod.GET)
	public String memberSelectedDelete(@RequestParam String no[]) {
		SalaryDao dao = sqlSession.getMapper(SalaryDao.class);
		ModelAndView mav = new ModelAndView("salary/salary_result");
		
		for( String nos : no){
			dao.deleteRow(nos);
		}
			
		
		return "redirect:/salaryList";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

}
