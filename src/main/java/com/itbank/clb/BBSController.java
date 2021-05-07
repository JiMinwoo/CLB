package com.itbank.clb;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itbank.clb.DAO.BBSDAO;
import com.itbank.clb.DAO.BBSReplyDAO;
import com.itbank.clb.DTO.BBSDTO;
import com.itbank.clb.DTO.BBSLikeDTO;
import com.itbank.clb.DTO.BBSReplyDTO;
import com.itbank.clb.DTO.SearchDTO;

import net.sf.json.JSONArray;

@Controller
public class BBSController {
	
	@Autowired
	BBSDAO bbsDao;
	
	@Autowired
	BBSReplyDAO brDao;
		
	// 글쓰기 폼으로 이동
	@RequestMapping(value = "/bbsInsertForm")
	public String bbsInsertForm(HttpServletRequest request,
								Model model){
		
		String pagenum = request.getParameter("pagenum");
		
		model.addAttribute("pagenum",pagenum);
		
		return "bbsInsertForm";
	}
	
	// 글쓰기
	@RequestMapping(value = "/bbsInsert")
	public String bbsInsert(HttpServletRequest request,
							HttpSession session,
							String editor,
							BBSDTO bDto){

		String gg = editor;
		
		String loginID = (String)session.getAttribute("loginID");
		
		bDto.setFwriter(loginID);
		bDto.setFcontent(gg);
		
		bbsDao.bbsInsert(bDto);
		
		return "redirect:bbsList?pagenum=1";
	}
	
	// 글수정 폼으로 이동
	@RequestMapping(value = "/bbsUpdateForm")
	public String bbsUpdateForm(HttpServletRequest request,
								Model model){
		
		String fnum = request.getParameter("fnum");
		
		BBSDTO bbsOne = bbsDao.bbsView(fnum);
		
		model.addAttribute("bbsOne",bbsOne);
		
		return "bbsUpdateForm";
	}
	
	// 글수정
	@RequestMapping(value = "/bbsUpdate")
	public String bbsUpdate(HttpServletRequest request,
							BBSDTO bDto,
							String editor){
		
		String gg = editor;
		
		bDto.setFcontent(gg);
		
		bbsDao.bbsUpdate(bDto);
		
		return "redirect:bbsList?pagenum=1";
	}
	
	// 글삭제
	@RequestMapping(value = "/bbsDelete")
	public String bbsDelete(HttpServletRequest request){
		
		String fnum = request.getParameter("fnum");
		
		bbsDao.bbsDelete(fnum);
		
		return "redirect:bbsList?pagenum=1";
	}
	
	// 게시판 글 자세히보기
	@RequestMapping(value = "/bbsView")
	public String bbsView(HttpServletRequest request,
					      HttpSession session,
						  Model model){
		
		String fnum = request.getParameter("fnum");
		String pagenum = request.getParameter("pagenum");
		
		// 조회수 가져오기
		int hit = bbsDao.bbsHit(fnum);
		
		BBSDTO bDto = new BBSDTO();
		bDto.setFnum(Integer.parseInt(fnum));
		bDto.setFhit(hit);
		
		// 조회수 올리기
		bbsDao.bbsHitUp(bDto);
		
		// 글 정보 가져오기
		BBSDTO bbsOne = bbsDao.bbsView(fnum);
		
		// 좋아요
		BBSLikeDTO blDTO = new BBSLikeDTO();
		blDTO.setId((String)session.getAttribute("loginID"));
		blDTO.setFnum(fnum);
		
		int result = bbsDao.bbsLikeCheck(blDTO);
		
		if(result == 1){
			model.addAttribute("likeCheck",1);
		}
		
		else{
			model.addAttribute("likeCheck",0);
		}
		
		List<BBSReplyDTO> brList = brDao.brList(fnum);
		
		int bbsLike = bbsDao.bbsLike(fnum);
		
		model.addAttribute("loginID",session.getAttribute("loginID"));
		model.addAttribute("bbsLike",bbsLike);
		model.addAttribute("brList",brList);
		model.addAttribute("bbsOne",bbsOne);
		model.addAttribute("pagenum",pagenum);
		
		return "bbsView";
	}
	
	// 좋아요 올리기
	@RequestMapping(value = "/bbsLikeUp")
	public String bbsLike(HttpServletRequest request,
						HttpServletResponse response,
						Model model,
						HttpSession session,
						BBSLikeDTO blDTO) throws IOException{
		
		String loginID = (String)session.getAttribute("loginID");
		String fnum = request.getParameter("fnum");
		String pagenum = request.getParameter("pagenum");
		
		blDTO.setId(loginID);
		
		bbsDao.bbsLikeUp(blDTO);
		
		return "redirect:bbsView?fnum="+fnum+"&pagenum="+pagenum;
	}
	
	// 게시판 리스트
	@RequestMapping(value = "/bbsList", method = RequestMethod.GET)
	public String bbsList(HttpServletRequest request,
						  Model model) {
		
		int pagenum = Integer.parseInt(request.getParameter("pagenum"));
		
		int bbscnt = bbsDao.bbsCount(); // 전체 글 수
		int listcount = 10;
		int totalpage = bbscnt / listcount; // 전체 페이지 수

		if(bbscnt % listcount > 0){
			totalpage++;
		}
		
		int paging = (pagenum+9) / 10; // 현재 페이지 
		
		int FirstPage = paging*10-9;
		int LastPage = paging*10;
		
		if(totalpage < LastPage) LastPage = totalpage;
		
		List<BBSDTO> AllbbsList = bbsDao.AllbbsList();
		
		for(int i=0;i<AllbbsList.size();i++){
			int like = bbsDao.bbsLike(Integer.toString(AllbbsList.get(i).getFnum()));
			BBSDTO bDto = new BBSDTO();
			bDto.setFnum(AllbbsList.get(i).getFnum());
			bDto.setFlike(like);
			bbsDao.bbsLikeInsert(bDto);
		}
		
		List<BBSDTO> bbsList = bbsDao.bbsList(pagenum);
		
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("bbsList",bbsList);
		model.addAttribute("pagenum",pagenum);
		model.addAttribute("FirstPage",FirstPage);
		model.addAttribute("LastPage",LastPage);
		
		return "bbsList";
	}
	
	// ajax 실시간 게시판 페이징
	@RequestMapping(value = "/paging")
	public void bbsPage(HttpServletRequest request,
					    HttpServletResponse response) throws IOException{
		
		int pagenum = Integer.parseInt(request.getParameter("pagenum"));
		
		List<BBSDTO> bbsList = bbsDao.bbsList(pagenum);
		
		// ArrayList를 JSONArry형태로 변환
		JSONArray result = JSONArray.fromObject(bbsList);
		
		// result
		response.setContentType("text/html;charset=UTF-8"); 
		response.getWriter().write(result + "");
	}
	
	// 게시판 검색 결과
	@RequestMapping(value = "/bbsSearch")
	public String bbsSearchList(HttpServletRequest request,
						  	    HttpServletResponse response,
						  	    Model model) throws IOException{
		
		int pagenum = Integer.parseInt(request.getParameter("pagenum"));
		String sc = request.getParameter("sc");
		
		int bbscnt = bbsDao.bbsSearchCount(sc); // 전체 글 수
		int listcount = 10;
		int totalpage = bbscnt / listcount; // 전체 페이지 수

		if(bbscnt % listcount > 0){
			totalpage++;
		}
		
		int paging = (pagenum+9) / 10; // 현재 페이지 
		
		int FirstPage = paging*10-9;
		int LastPage = paging*10;
		
		if(totalpage < LastPage) LastPage = totalpage;
		
		List<BBSDTO> AllbbsSearchList = bbsDao.AllbbsSearchList(sc);
		
		for(int i=0;i<AllbbsSearchList.size();i++){
			int like = bbsDao.bbsLike(Integer.toString(AllbbsSearchList.get(i).getFnum()));
			BBSDTO bDto = new BBSDTO();
			bDto.setFnum(AllbbsSearchList.get(i).getFnum());
			bDto.setFlike(like);
			bbsDao.bbsLikeInsert(bDto);
		}
		
		SearchDTO sDto = new SearchDTO();
		sDto.setPagenum(pagenum);
		sDto.setSc(sc);
		
		List<BBSDTO> bbsList = bbsDao.bbsSearchList(sDto);
		
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("bbsList",bbsList);
		model.addAttribute("pagenum",pagenum);
		model.addAttribute("FirstPage",FirstPage);
		model.addAttribute("LastPage",LastPage);
		model.addAttribute("sc",sc);
		
		return "bbsSearchList";
	}
	
	// 검색 결과 : ajax 실시간 게시판 페이징
	@RequestMapping(value = "/searchPaging")
	public void bbsSearchPage(HttpServletRequest request,
					    	  HttpServletResponse response,
					    	  Model model) throws IOException{
		
		int pagenum = Integer.parseInt(request.getParameter("pagenum"));
		String sc = request.getParameter("sc");
		
		SearchDTO sDto = new SearchDTO();
		sDto.setPagenum(pagenum);
		sDto.setSc(sc);
		
		List<BBSDTO> bbsList = bbsDao.bbsSearchList(sDto);
		
		// ArrayList를 JSONArry형태로 변환
		JSONArray data = JSONArray.fromObject(bbsList);
		 
		response.setContentType("text/html;charset=UTF-8"); 
		response.getWriter().write(data + "");
	}
}
