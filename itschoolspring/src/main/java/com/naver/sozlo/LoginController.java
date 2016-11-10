package com.naver.sozlo;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.naver.sozlo.entities.Login;
import com.naver.sozlo.entities.Member;
import com.naver.sozlo.service.MemberDao;

@Controller
public class LoginController {

	@Autowired
	private SqlSession sqlSession;
	

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request) {
		return "login/login";
			
	}
	
	@RequestMapping(value = "/loginfail", method = RequestMethod.GET)
	public String loginfail(HttpServletRequest request) {
		return "login/loginfail";
			
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		// 위에 코드가 세션을 끊어주는거.
		
		return "redirect:/index";
			
	}
	
	
	
	@RequestMapping(value = "/loginup", method = RequestMethod.POST)
	public String loginup(@ModelAttribute("member") Member member,HttpSession session) {
		
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		Member data = dao.selectLogin(member);
		
		if(data == null) {
			return "redirect:/loginfail";
		}else{
			session.setAttribute("sessionid", data.getId());
			session.setAttribute("sessionpass", data.getPassword());
			session.setAttribute("sessionname", data.getName());
			session.setAttribute("sessionemail", data.getEmail());
			return "redirect:/index";
		}
		
	}
	
	
}
