package com.company.pickers.controller;

import com.company.pickers.model.Board;
import com.company.pickers.model.Comment;
import com.company.pickers.model.ServiceParam;
import com.company.pickers.service.BoardService;
import com.company.pickers.vm.ResultVM;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;

/**
 * Handles requests for the application home page.
 */
@Controller
@Component
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	@Resource(name = "boardService")
	private BoardService boardService;

	/**
	 * 게시판 리스트 페이지
	 */
	@RequestMapping(value = "/board/list.do")
	public String boardList(HttpServletRequest request, HttpSession session, Model model) {
		System.out.println(request.getParameter("type"));
		try {
			Board board = new Board();

			board.setCurrent_page(1);
			board.setPost_num_base_cnt(20);
			board.setStart_row_num(1);

			board.setType(request.getParameter("type"));

			board.setLimStr( ((board.getCurrent_page()-1) * board.getPost_num_base_cnt()));
			board.setLimEnd(board.getLimStr() + board.getPost_num_base_cnt() );

			List<Board> boards = boardService.getBoardList(board);

			int totalCnt = boards.get(0).getTotalCnt();


			model.addAttribute("strType",boardType(board.getType()));
			model.addAttribute("boardList", boards);
			model.addAttribute("totlaCnt", totalCnt);
			model.addAttribute("totlaPage", (totalCnt/board.getPost_num_base_cnt() + 1));
		}catch (Exception e){
			e.printStackTrace();
		}



		return "/board/list";
	}

	/**
	 * 게시판 리스트 페이지
	 */
	@RequestMapping(value = "/board/list.do", method = RequestMethod.POST)
	public String boardList(HttpServletRequest request, HttpSession session, @RequestBody ServiceParam<Board> param, Model model) {
		System.out.println("페이징");
		try {
			Board board = new Board();
			if(param == null){
				board.setCurrent_page(1);
				board.setPost_num_base_cnt(10);
				board.setStart_row_num(1);
			}else{
				board = param.getData();
			}

			board.setType("01");
			board.setLimStr( (board.getCurrent_page() * board.getPost_num_base_cnt()) +1 );
			board.setLimStr(board.getLimStr() + board.getPost_num_base_cnt() );

			List<Board> boards = boardService.getBoardList(board);

			int totalCnt = boards.get(0).getTotalCnt();

			model.addAttribute("strType",boardType(board.getType()));
			model.addAttribute("boardList", boards);
			model.addAttribute("totlaCnt", totalCnt);
			model.addAttribute("totlaPage", (totalCnt/board.getPost_num_base_cnt() + 1));
		}catch (Exception e){
			e.printStackTrace();
		}

		return "board/list";
	}


	@RequestMapping(value = "/board/detail.do", method = RequestMethod.GET)
	public String boardRead(HttpServletRequest request, HttpSession session, Model model) {
		System.out.println("디테일");
		int seq = Integer.parseInt(request.getParameter("seq"));
		try {
			Board board = new Board();
			board.setType("01");

			if(session.getAttribute("bbs"+seq) == null){
				session.setAttribute("bbs"+seq, "1");
				session.setMaxInactiveInterval(60 * 10);
				boardService.addPv(seq);

			}

			List<Board> boards = boardService.getBoardList(seq);
			List<Comment> comments = boardService.getCommentList(seq);

			model.addAttribute("strType",boardType(board.getType()));
			model.addAttribute("mainBbs", boards.get(1));
			model.addAttribute("beforeBbs", boards.get(0));
			model.addAttribute("afterBbs", boards.size() < 3 ? null : boards.get(2));
			model.addAttribute("comments", comments);
		}catch (Exception e){
			e.printStackTrace();
		}

		return "board/detail";
	}



	@RequestMapping(value = "/board/writeComment.do", method = RequestMethod.POST)
	public Object writeComment(HttpServletRequest request, HttpSession session, Model model, @RequestBody Comment dto) {
		System.out.println("댓글 입력");
		try {
			InetAddress local = InetAddress.getLocalHost();
			if( local != null ) dto.setIp(local.getHostAddress());

			boardService.insertComment(dto);
			boardService.cmUp(dto);
		}catch (Exception e){
			e.printStackTrace();
		}

		return new ResponseEntity<>(new ResultVM<>(), HttpStatus.OK);
	}

	private String boardType(String type){
		String strType = "";
		switch (type){
			case "00":
				strType = "개발자 포럼";
				break;
			case "01":
				strType = "인기/유머";
				break;
			case "02":
				strType = "후방주의";
				break;
			default:
				strType = "연예인 모음";
				break;
		}

		return strType;
	}

}
