package com.itbank.clb.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itbank.clb.DTO.LibDTO;

@Repository("libdao")
public class LibDAO {
	
	@Autowired
	SqlSessionTemplate myBatis;
	
	// 도서관 리스트
	public List<LibDTO> libList(String lname){
		return myBatis.selectList("LibSQL.libList", lname);
	}
	
	// 도서관 정보
	public LibDTO libInfo(String ln){
		return myBatis.selectOne("LibSQL.libInfo", ln);
	}

}