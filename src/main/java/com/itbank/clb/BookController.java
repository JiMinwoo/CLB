package com.itbank.clb;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.clb.DAO.BookDAO;
import com.itbank.clb.DTO.BookDTO;

import net.sf.json.JSONArray;

@Controller
public class BookController {
	
	@Autowired
	BookDAO bDao;
	
	// 도서 찾기
	@RequestMapping("bookSearch")
	public void bookSearch(HttpServletRequest request,
						   HttpServletResponse response) throws IOException{
		
		String bname = request.getParameter("bname");
		
		try {
			List<BookDTO> blist = bDao.bookList(bname);
			JSONArray result = JSONArray.fromObject(blist);
			response.setContentType("text/html;charset=UTF-8"); 
			response.getWriter().write(result + ""); 
		} catch (Exception e) {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write(0 + "");
		}
	}
	
	// 도서 정보
	@RequestMapping("bookView")
	public String bookView(HttpServletRequest request,
			   			   Model model) throws IOException{
		
		String bnum = request.getParameter("bnum");
		
		BookDTO bDto = bDao.bookView(bnum);
		
		model.addAttribute("bDto",bDto);
		
		return "bookView";
	}
}
