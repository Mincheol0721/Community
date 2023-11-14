package com.spring.community.trade.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.community.trade.vo.TradeVO;
import com.spring.community.tradeComment.vo.TradeCommentVO;

public interface TradeBoardController {
	//거래 게시판 게시글 전부 조회해서 가져오는 메소드
	ModelAndView listTradeBoards(String pageNum, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//거래 게시판에서 게시글을 클릭했을 때 게시글을 조회해오는 메소드
	public ModelAndView viewTradeDetail(int no, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//거래 게시판에서 등록 또는 수정 폼을 요청하는 메소드
	public ModelAndView Form(HttpServletRequest request, HttpServletResponse response) throws Exception;

	//거래 게시판에서 글작성을 클릭했을 때 글을 등록하는메소드
	public ModelAndView regTradeBoard(List<MultipartFile> files, MultipartHttpServletRequest request, HttpServletResponse response) throws Exception;

	//게시판 조회 시 사진들을 내려받아 띄워주는 메소드
	void download(String imageFileName, int no, HttpServletRequest request, HttpServletResponse response) throws Exception;

	//게시판 리스트에 사진을 내려받아 띄워주는 메소드
	void thumbnail(int no, HttpServletRequest request, HttpServletResponse response) throws Exception;

	//거래 게시판에서 글 수정을 클릭했을 때 글을 수정하는 메소드
	public ModelAndView modTradeBoard(List<MultipartFile> files, MultipartHttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//거래 게시판 글 삭제 시 호출할 메소드
	public ModelAndView delTradeBoard(int no, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//거래 게시글의 좋아요를 눌렀을 때 DB에 저장해주는 메소드
	public ModelAndView likeTrade(String nickname, int no, HttpServletRequest request, HttpServletResponse response) throws Exception;

	//댓글을 삭제하는 메소드
	public ModelAndView delComment(int no, int boardNo, HttpServletRequest request, HttpServletResponse response) throws Exception;

	//댓글을 수정하는 메소드
	public String modComment(TradeCommentVO commentVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}