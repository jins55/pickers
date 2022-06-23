package com.company.pickers.service;

import com.company.pickers.mapper.BoardDAO;
import com.company.pickers.model.Board;
import com.company.pickers.model.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("boardService")
public class BoardServiceImpl implements com.company.pickers.service.BoardService {

	@Autowired
	private BoardDAO boardDAO;

	@Override
	public int insertCrawlingBoard(List<Board> boards) { return boardDAO.insertCrawlingBoard(boards); }

	@Override
	public Board latestBoard(String type) { return boardDAO.latestBoard(type); }

	@Override
	public int alreadyCheck(String url) { return boardDAO.alreadyCheck(url); }

	@Override
	public List<Board> getBoardList(Board board) { return boardDAO.getBoardList(board); }

	@Override
	public List<Board> getBoardList(int seq) { return boardDAO.getBoardList(seq); }

	@Override
	public void dupBoardDel() { boardDAO.dupBoardDel(); }

	@Override
	public void addPv(int seq) { boardDAO.addPv(seq); }

	@Override
	public List<Comment> getCommentList(int seq) { return boardDAO.getCommentList(seq); }

	@Override
	public void insertComment(Comment dto) { boardDAO.insertComment(dto); }

	@Override
	public void cmUp(Comment dto) { boardDAO.cmUp(dto); }

	@Override
	public void cmDown(Comment dto) { boardDAO.cmDown(dto); }
}
