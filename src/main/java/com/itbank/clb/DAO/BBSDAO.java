package com.itbank.clb.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itbank.clb.DTO.BBSDTO;
import com.itbank.clb.DTO.BBSLikeDTO;
import com.itbank.clb.DTO.SearchDTO;

@Repository("bbsdao")
public class BBSDAO {

	@Autowired
	SqlSessionTemplate myBatis;
	
	// 글 등록
	public void bbsInsert(BBSDTO bDto) {
		myBatis.insert("bbsSQL.bbsInsert",bDto);
	}

	// 글 삭제
	public void bbsDelete(String fnum){
		myBatis.delete("bbsSQL.bbsDelete",fnum);
	}
	
	// 글 수정
	public void bbsUpdate(BBSDTO bDto){
		myBatis.update("bbsSQL.bbsUpdate",bDto);
	}
	
	// 글 자세히 보기
	public BBSDTO bbsView(String fnum){
		return myBatis.selectOne("bbsSQL.bbsView",fnum);
	}
	
	// 게시판 리스트
	public List<BBSDTO> bbsList(int pagenum) {
		return myBatis.selectList("bbsSQL.bbsList",pagenum);
	}
	
	// 전체 게시판 리스트
	public List<BBSDTO> AllbbsList() {
		return myBatis.selectList("bbsSQL.AllbbsList");
	}
	
	// 게시글 수 구하기
	public int bbsCount() {
		return myBatis.selectOne("bbsSQL.bbsCount");
	}
	
	// 조회수 가져오기
	public int bbsHit(String fnum) {
		return myBatis.selectOne("bbsSQL.bbsHit",fnum);
	}
	
	// 조회수 올리기
	public void bbsHitUp(BBSDTO bDto){
		myBatis.update("bbsSQL.bbsHitUp",bDto);
	}
	
	// 게시판 전체 좋아요 입력
	public void bbsLikeInsert(BBSDTO bDto){
		myBatis.update("bbsSQL.bbsLikeInsert",bDto);
	}
	
	// 좋아요 올리기
	public void bbsLikeUp(BBSLikeDTO blDTO){
		myBatis.update("bbsSQL.bbsLikeUp",blDTO);
	}
	
	// 좋아요 수 가져오기  
	public int bbsLike(String fnum) {
		return myBatis.selectOne("bbsSQL.bbsLike",fnum);
	}
	
	// 좋아요 여부 체크
	public int bbsLikeCheck(BBSLikeDTO blDto) {
		return myBatis.selectOne("bbsSQL.bbsLikeCheck", blDto);
	}
	
	// 게시판 검색 글 수 구하기
	public int bbsSearchCount(String sc) {
		return myBatis.selectOne("bbsSQL.bbsSearchCount",sc);
	}
	
	// 게시판 검색 리스트
	public List<BBSDTO> bbsSearchList(SearchDTO scDto) {
		return myBatis.selectList("bbsSQL.bbsSearchList",scDto);
	}
	
	// 게시판 검색 전체 리스트
	public List<BBSDTO> AllbbsSearchList(String sc) {
		return myBatis.selectList("bbsSQL.AllbbsSearchList",sc);
	}
	
}
