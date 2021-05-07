package com.itbank.clb;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.clb.DAO.BBSReplyDAO;
import com.itbank.clb.DTO.BBSReplyDTO;

import net.sf.json.JSONArray;

@Controller
public class BBSReplyController {
	
	@Autowired
	BBSReplyDAO brDao;
	
	// 댓글 등록
	@RequestMapping(value = "/brInsert")
	public void brList(HttpServletResponse response,
					   HttpSession session,
					   BBSReplyDTO brDto) throws IOException{
		
		String loginID = (String)session.getAttribute("loginID");
		
		brDto.setId(loginID);
		
		// 댓글 등록
		brDao.brInsert(brDto);
		
		// 등록 후 리스트 가져오기
		List<BBSReplyDTO> brList = brDao.brList(Integer.toString((brDto.getFnum())));
		
		// ArrayList를 JSONArry형태로 변환
		JSONArray result = JSONArray.fromObject(brList);
		
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(result + "");

	}
}