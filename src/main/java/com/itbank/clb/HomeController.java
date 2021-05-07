package com.itbank.clb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itbank.clb.DAO.MemberDAO;

@Controller
public class HomeController {

	@Autowired
	MemberDAO mDao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		
		return "index";
		
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String main2() {
		
		return "index";
		
	}
	
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String join() {
		
		return "joinForm";
		
	}
	
	@RequestMapping(value = "/bookSearchForm", method = RequestMethod.GET)
	public String bookSearchForm() {
		
		return "bookSearch";
		
	}
	
	@RequestMapping(value = "/elements", method = RequestMethod.GET)
	public String findForm() {
		
		return "elements";
		
	}
	
}