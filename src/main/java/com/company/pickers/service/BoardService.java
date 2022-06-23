package com.company.pickers.service;

import com.company.pickers.model.Board;
import com.company.pickers.model.Comment;

import java.util.List;

public interface BoardService {
	int insertCrawlingBoard(List<Board> boards);
	Board latestBoard(String type);
	int alreadyCheck(String url);
	List<Board> getBoardList(Board board);
	List<Board> getBoardList(int seq);
	void dupBoardDel();
	void addPv(int seq);
	void cmUp(Comment comment);
	void cmDown(Comment comment);
	List<Comment> getCommentList(int seq);
	void insertComment(Comment comment);
}
