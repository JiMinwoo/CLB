package com.itbank.clb.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itbank.clb.DTO.BBSReplyDTO;

@Repository("bbsreplydao")
public class BBSReplyDAO {
	
	@Autowired
	SqlSessionTemplate myBatis;
	
	// 댓글 등록
	public void brInsert(BBSReplyDTO brdto) {
		myBatis.insert("brSQL.brInsert",brdto);
	}
	
	// 댓글 리스트
	public List<BBSReplyDTO> brList(String fnum) {
		return myBatis.selectList("brSQL.brList",fnum);
	}
}
