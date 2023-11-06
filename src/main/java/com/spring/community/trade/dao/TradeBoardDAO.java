package com.spring.community.trade.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.community.member.VO.MemberVO;
import com.spring.community.trade.vo.TradeVO;

public interface TradeBoardDAO {
	//거래 게시판 게시글 전부 조회해서 가져오는 메소드
	public List selectAllTrades(Map map2) throws DataAccessException;
	
	//거래 게시판의 모든 레코드 행의 갯수를 반환하는 메소드
	public int getTradeCount(Map map2) throws DataAccessException;

	//거래 게시판에 글 작성을 하는 메소드
	public int regTradeBoard(Map map) throws DataAccessException;
	
	//거래 게시판의 글 하나를 조회하는 메소드
	public TradeVO selectTradeDetail(int no) throws DataAccessException;
	
	//거래 게시판의 글 하나를 지우는 메소드
	public void delTradeBoard(int no) throws DataAccessException;
	
	//거래 게시판의 글 하나를 수정하는 메소드
	public void modTradeBoard(Map map) throws DataAccessException;




}
