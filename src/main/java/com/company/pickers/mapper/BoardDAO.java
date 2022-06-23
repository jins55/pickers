package com.company.pickers.mapper;

import com.company.pickers.model.Board;
import com.company.pickers.model.Comment;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
     * 크롤링 게시글 올리기
     * @param boards Insert 할 게시글
     * @return
     */
    public int insertCrawlingBoard(List<Board> boards) {
    	return sqlSession.update("board.insertCrawlingBoard", boards);
	}

	/**
	 * 마지막 게시글 가져오기
	 * @param type
	 * @return
	 */
	public Board latestBoard(String type) {
		return sqlSession.selectOne("board.latestBoard", type);
	}

	/**
	 * 게시물 유무(중복) 확인
	 * @param url
	 * @return
	 */
	public int alreadyCheck(String url) {
		return sqlSession.selectOne("board.alreadyCheck", url);
	}


	/**
	 * 게시판 리스트 가져오기
	 * @param board
	 * @return
	 */
	public List<Board> getBoardList(Board board) {
		return sqlSession.selectList("board.getBoardList", board);
	}

	/**
	 * 게시판 리스트 가져오기
	 * @param seq
	 * @return
	 */
	public List<Board> getBoardList(int seq) {
		return sqlSession.selectList("board.getBoardList3", seq);
	}

	/**
	 * 중복 게시글 제거
	 * @return
	 */
	public void dupBoardDel() {
		sqlSession.delete("board.dupBoardDel");
	}

	/**
	 * 조회수 증가
	 */
	public void addPv(int seq) {
		sqlSession.update("board.addPv", seq);
	}

	/**
	 * 게시글 댓글
	 */
	public List<Comment> getCommentList(int seq) {
		return sqlSession.selectList("board.getCommentList", seq);
	}

	/**
	 * 댓글 입력
	 */
	public void insertComment(Comment dto) {
		sqlSession.update("board.insertComment", dto);
	}

	/**
	 * 총 댓글 갯수 증가
	 */
	public void cmUp(Comment dto) {
		sqlSession.update("board.cmUp", dto);
	}

	/**
	 * 총 댓글 갯수 감소
	 */
	public void cmDown(Comment dto) {
		sqlSession.update("board.cmDown", dto);
	}
}
