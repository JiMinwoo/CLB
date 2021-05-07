package com.itbank.clb.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itbank.clb.DTO.BookDTO;

@Repository("bookdao")
public class BookDAO {
	
	@Autowired
	SqlSessionTemplate myBatis;
	
	// 도서명 입력 테스트
	public void titleInsert(String title) {
		myBatis.insert("bookSQL.titleInsert", title);
	}
	
	// 도서 정보 입력
	public void infoInsert(BookDTO bDto) {
		myBatis.insert("bookSQL.infoInsert", bDto);
	}
	
	// 도서 검색 리스트
	public List<BookDTO> bookList(String bname){
		return myBatis.selectList("bookSQL.bookList", bname);
	}
	
	// 도서 정보
	public BookDTO bookView(String bnum){
		return myBatis.selectOne("bookSQL.bookView", bnum);
	}
}