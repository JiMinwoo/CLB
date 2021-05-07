package com.itbank.clb;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.clb.DAO.LibDAO;
import com.itbank.clb.DTO.LibDTO;

import net.sf.json.JSONArray;

@Controller
public class LibController {
	
	@Autowired
	LibDAO lDao;
	
	@RequestMapping("library")
	public String libraryForm(){
		
		return "library";
	}
	
	// 도서관 찾기
	@RequestMapping("libList")
	public void libList(HttpServletRequest request,
						   HttpServletResponse response) throws IOException{
		
		String lname = request.getParameter("lname");
		
		try {
			List<LibDTO> libList = lDao.libList(lname);
			JSONArray result = JSONArray.fromObject(libList);
			response.setContentType("text/html;charset=UTF-8"); 
			response.getWriter().write(result + ""); 
		} catch (Exception e) {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write(0 + "");
		}
	}
	
	// 도서관 정보
	@RequestMapping("libInfo")
	public void libInfo(HttpServletRequest request,
				  	    HttpServletResponse response) throws IOException{
		
		String ln = request.getParameter("ln");
		
		try {
			LibDTO libInfo = lDao.libInfo(ln);
			JSONArray result = JSONArray.fromObject(libInfo);
			response.setContentType("text/html;charset=UTF-8"); 
			response.getWriter().write(result + ""); 
		} catch (Exception e) {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write(0 + "");
		}
	}
}