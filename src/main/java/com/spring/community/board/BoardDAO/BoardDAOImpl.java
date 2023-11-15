package com.spring.community.board.BoardDAO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionException;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.community.board.BoardVO.BoardCommentVO;
import com.spring.community.board.BoardVO.BoardVO;
import com.spring.community.board.Utils.PagerVO;
import com.spring.community.board.Utils.PagingVO;

@Repository("boardDAO")
public class BoardDAOImpl extends HttpServlet implements BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selcetAllBoard() {

		List<BoardVO> boardlist = sqlSession.selectList("mapper.board.selectAllboardlist");
	
		return boardlist;
	}

	@Override
	public int countBoard() {
		
		int countBoard = sqlSession.selectOne("mapper.board.countBoard");
		
		return countBoard;
	}

	@Override
	public List<BoardVO> selcetBoard(PagingVO pvo) {
		
		List<BoardVO> selectBoard = sqlSession.selectList("mapper.board.selectBoard", pvo);
		
		return selectBoard;
	}

	@Override
	public Long totalCount(PagerVO pager) {
		
		Long getTotalCount = sqlSession.selectOne("mapper.board.getTotalCount", pager);
		
		return getTotalCount;
	}

	@Override
	public List<BoardVO> getBoardList(PagerVO pager) {
		
		List<BoardVO> getBoardList = sqlSession.selectList("mapper.board.getBoardList", pager);
		
		return getBoardList;
	}

	@Override
	public BoardVO boardInfo(String no, String name) {
		
		BoardVO vo = new BoardVO();
		
		System.out.println("선택된 닉네임 : " + name);
		
		vo = sqlSession.selectOne("mapper.board.getBoardInfo", no);
		
		System.out.println("vo 에서 가져온 닉네임 : " + vo.getNickName());
		
		if(name.equals(vo.getNickName())) {
			System.out.println("조회수 증가 안됌");
			return vo;
		} else {
			System.out.println("조회수 증가 후 반환");
	        sqlSession.update("mapper.board.addCount", no);
	        
	        vo = sqlSession.selectOne("mapper.board.getBoardInfo", no);
	        
	        
			return vo;
		}
		
		
	}

	@Override
	public void insertboard(BoardVO boardVO) {
//		System.out.println("다오" + boardVO.getContent());
//		System.out.println("다오" + boardVO.getTitle());
//		System.out.println("다오" + boardVO.getNickName());
//		System.out.println(boardVO.getNickName().length());
		
		sqlSession.insert("mapper.board.addBoard", boardVO);


	}

	@Override
	public Map<String, String> nextTitle(String no) {
		
		BoardVO vo = new BoardVO();
		
		Map<String, String> nextTitle = new HashMap<String, String>();
		
		String next = "";
		String before = "";
		
		next = sqlSession.selectOne("mapper.board.nextTitle", no);
		
		if(next == null) {
			nextTitle.put("next", "없음");
		} else {
			nextTitle.put("next", next);
		}
		
		before = sqlSession.selectOne("mapper.board.beforeTitle", no);
		
		if(before == null) {
			nextTitle.put("before", "없음");
		} else {
			nextTitle.put("before", before);
		}
		
		System.out.println("다음 글 " + nextTitle.get("next"));
		System.out.println("이전 글 " + nextTitle.get("before"));
		
		return nextTitle;
	}

	@Override
	public List<BoardCommentVO> commentList(BoardCommentVO cVo) {
		
		List<BoardCommentVO> commentList = new ArrayList<BoardCommentVO>();
		
		commentList = sqlSession.selectList("mapper.boardcomment.commentList", cVo);
		
		System.out.println("댓글 다오 안쪽 : " + commentList);
		
		return commentList;
	}

	@Override
	public void addComment(BoardCommentVO cVo) {
		
		System.out.println("다오 내용" + cVo.getContent());
		System.out.println("다오 주 글 번호" + cVo.getBoardNo());
		System.out.println("다오 댓글작성 유저" + cVo.getNickName());
		
		
		sqlSession.insert("mapper.boardcomment.addComment", cVo);
		
		
	}

	@Override
	public void delComment(String no) {
		sqlSession.update("mapper.boardcomment.delComment", no);
//		sqlSession.commit();
		 
	}

	@Override
	public void editComment(BoardCommentVO cVo) {
		
		sqlSession.update("mapper.boardcomment.editComment", cVo);
//		sqlSession.commit();
		
	}

	@Override
	public BoardVO editForm(String no) {
		
		return sqlSession.selectOne("mapper.board.getBoardInfo", no);
	}

	@Override
	public void editboard(BoardVO vo) {
		sqlSession.update("mapper.board.editboard", vo);
//		sqlSession.commit();
	}

	@Override
	public void delBoard(String no) {
		sqlSession.update("mapper.board.delComment", no);
		System.out.println("댓글삭제완료");
		sqlSession.update("mapper.board.delBoard", no);
		System.out.println("글삭제완료");
		
//		sqlSession.commit();
	}






}
