package com.itbank.clb;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itbank.clb.DAO.MarketDAO;
import com.itbank.clb.DTO.MarketDTO;
import com.itbank.clb.util.UploadFile;

@Controller
public class MarketController {
	
	@Autowired
	MarketDAO mkDao;
	
	// 책등록 폼으로 이동
	@RequestMapping(value = "/mkInsertForm")
	public String marketInsertForm(HttpServletRequest request,
								Model model){
		
		
		String pagenum = request.getParameter("pagenum");
		
		model.addAttribute("pagenum",pagenum);
		
		return "mkInsertForm";
	}
	
	// 책등록
	@RequestMapping(value = "/mkInsert")
	public String marketInsert(HttpServletRequest request,
							   HttpSession session,
							   MultipartHttpServletRequest multi,
							   Model model,
							   MarketDTO mkDto){
		
		String mwriter = (String)session.getAttribute("loginID");
		
		List<Map<String,String>> fMapList = null;
		UploadFile upload = new UploadFile();
		
		fMapList = upload.fileUp(multi);
		
		mkDto.setMimg((fMapList.get(0).get("STORED_FILE_NAME")));
		mkDto.setMwriter(mwriter);
		
		mkDao.marketInsert(mkDto);
		
		return "redirect:marketList?pagenum=1";
	}
	
	// 중고책 글 삭제
	@RequestMapping(value = "/marketDelete")
	public String marketDelete(HttpServletRequest request,
							   Model model){

		String mnum = request.getParameter("mnum");
		
		mkDao.marketDelete(mnum);
		
		return "redirect:marketList?pagenum=1";
	}
	
	// 중고책 자세히 보기
	@RequestMapping(value = "/marketView")
	public String marketView(HttpServletRequest request,
							 Model model){
		
		String mnum = request.getParameter("mnum");
		String pagenum = request.getParameter("pagenum");
		
		// 조회수 가져오기
		int hit = mkDao.marketHit(mnum);
		
		MarketDTO mkDto = new MarketDTO();
		mkDto.setMnum(Integer.parseInt(mnum));
		mkDto.setMhit(hit);
		
		// 조회수 올리기
		mkDao.marketHitUp(mkDto);
		
		// 글 정보 가져오기
		MarketDTO mkOne = mkDao.marketView(mnum);
		
		model.addAttribute("mkOne",mkOne);
		model.addAttribute("pagenum",pagenum);
		
		return "mkView";
	}
	
	// 마켓 리스트
	@RequestMapping(value = "/marketList", method = RequestMethod.GET)
	public String marketList(HttpServletRequest request,
			 				 Model model) {
		
		int pagenum = Integer.parseInt(request.getParameter("pagenum"));
		
		int marketcnt = mkDao.marketCount(); // 전체 글 수
		int listcount = 8;
		int totalpage = marketcnt / listcount; // 전체 페이지 수

		if(marketcnt % listcount > 0){
			totalpage++;
		}
		
		int paging = (pagenum+9) / 10; // 현재 페이지 
		
		int FirstPage = paging*10-9;
		int LastPage = paging*10;
		
		if(totalpage < LastPage) LastPage = totalpage;
		
		List<MarketDTO> marketList = mkDao.marketList(pagenum);
		
		model.addAttribute("totalpage",totalpage); 
		model.addAttribute("marketList",marketList);
		model.addAttribute("pagenum",pagenum);
		model.addAttribute("FirstPage",FirstPage);
		model.addAttribute("LastPage",LastPage);
		
		return "mkList";
	}
	
}