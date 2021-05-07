package com.itbank.clb;

import java.io.IOException;
import java.sql.SQLException;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.clb.DAO.MemberDAO;
import com.itbank.clb.DTO.MemberDTO;
import com.itbank.clb.util.MailUtil;

@Controller
public class MemberController {

	@Autowired
	MemberDAO mDao;
	
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	// 로그인
	@RequestMapping(value = "/login")
	public void Login(HttpServletRequest request,
					  HttpServletResponse response,
					  HttpSession session,MemberDTO mDto) throws IOException{
		
		// 아이디 유무 확인후
		int idcheck = mDao.idCheck(mDto.getId());
		String pwcheck = mDao.pwCheck(mDto.getId());
		
		// 회원이 아닌 경우 : result = 0
		if(idcheck == 0){
			response.getWriter().write(0 + "");
		}
		
		else{
			// 비밀번호 불일치 : result = 1
			if(!pwEncoder.matches(mDto.getPw(), pwcheck)){
				response.getWriter().write(1 + "");
			}
			
			//로그인 : result = 2
			else{
				session.setAttribute("loginID", mDto.getId());
				response.getWriter().write(2 + "");
			}
		}
		
	}
	
	// 회원 정보 수정 폼으로 이동
	@RequestMapping(value = "/mbUpdateForm")
	public String mbUpdateForm(HttpServletRequest request,
							   Model model){
		
		String id = request.getParameter("id");
		
		MemberDTO mDto = mDao.memberInfo(id);
		
		model.addAttribute("mDto",mDto);
		
		return "mbUpdateForm";

	}
	
	// 회원 정보 수정
	@RequestMapping(value = "/memberInfoUpdate")
	public String memberInfoUpdate(MemberDTO mDto){
		
		//mDao.memberInfoUpdate(mDto);
		
		return "redirect:memberInfo?id=" + mDto.getId();
	}

	// 아이디 중복체크
	@RequestMapping(value = "/idCheck")
	public void idCheck(HttpServletRequest request,
						HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {
		
		String id = request.getParameter("userID");
		
		int result = mDao.idCheck(id);
		
		response.getWriter().write(result + "");
	}
	
	// 이메일 인증
	@RequestMapping(value = "/sendCode")
	public void sendCode(HttpServletRequest request,
						 HttpServletResponse response,
						 MailUtil mailutil) throws MessagingException, IOException{
		
		String email = request.getParameter("email");
		
		StringBuffer code = mailutil.numSend(email);
		
		response.getWriter().write(code + "");
	}
	
	// 회원 정보
	@RequestMapping(value = "/memberInfo")
	public String memberInfo(HttpServletRequest request,
							 HttpSession session,
							 Model model){
		
		String id = (String)session.getAttribute("loginID");
		
		MemberDTO mDto = mDao.memberInfo(id);
		
		model.addAttribute("mDto",mDto);
		
		return "memberInfo";
	}
	
	// 회원 가입
	@RequestMapping(value = "/join")
	public String join(MemberDTO mDto,
					   HttpServletRequest request){
		
		String encryptPW = pwEncoder.encode(mDto.getPw()); 
		
		String domain = request.getParameter("domain");
		String email = mDto.getEmail() + "@" + domain;
		String tel = request.getParameter("tel1") + request.getParameter("tel2") + request.getParameter("tel3");
		
		mDto.setEmail(email);
		mDto.setTel(tel);
		mDto.setPw(encryptPW);
		
		mDao.join(mDto);
		
		return "index";
	}
}
