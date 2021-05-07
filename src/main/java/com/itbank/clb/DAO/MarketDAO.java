package com.itbank.clb.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itbank.clb.DTO.MarketDTO;

@Repository("mkDao")
public class MarketDAO {

	@Autowired
	SqlSessionTemplate myBatis;
	
	// 글 등록
	public void marketInsert(MarketDTO mkDto) {
		myBatis.insert("marketSQL.marketInsert",mkDto);
	}

	// 글 삭제
	public void marketDelete(String mnum){
		myBatis.delete("marketSQL.marketDelete",mnum);
	}
	
	// 글 수정
	public void marketUpdate(MarketDTO mkDto){
		myBatis.update("marketSQL.marketUpdate",mkDto);
	}
	
	// 마켓 리스트
	public List<MarketDTO> marketList(int pagenum) {
		return myBatis.selectList("marketSQL.marketList",pagenum);
	}
	
	// 마켓 글 수 구하기
	public int marketCount() {
		return myBatis.selectOne("marketSQL.marketCount");
	}
	
	// 마켓 글 자세히 보기
	public MarketDTO marketView(String mnum){
		return myBatis.selectOne("marketSQL.marketView",mnum);
	}
	
	// 마켓 조회수 가져오기
	public int marketHit(String mnum) {
		return myBatis.selectOne("marketSQL.marketHit",mnum);
	}
	
	// 마켓 조회수 올리기
	public void marketHitUp(MarketDTO mkDto){
		myBatis.update("marketSQL.marketHitUp",mkDto);
	}
	
}