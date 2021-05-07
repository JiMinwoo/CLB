package com.itbank.clb.DAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itbank.clb.DTO.MemberDTO;

@Repository("memberdao")
public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate myBatis;
	
	// 회원등록
	public void join(MemberDTO mDto) {
		myBatis.insert("memSQL.join", mDto);
	}
	
	// 아이디 확인
	public int idCheck(String id){
		return myBatis.selectOne("memSQL.idCheck", id);
	}	

	// 비밀번호 확인
	public String pwCheck(String id){
		return myBatis.selectOne("memSQL.pwCheck", id);
	}
	
	// 회원정보가져오기
	public MemberDTO memberInfo(String id){
		return myBatis.selectOne("memSQL.memberInfo",id);
	}
}