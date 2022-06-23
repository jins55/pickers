package com.company.pickers;

import com.company.pickers.model.Board;
import com.company.pickers.service.BoardService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	@Resource(name = "boardService")
	private BoardService boardService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = {"/home.do", ""}, method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Board board = new Board();

		board.setType("01");
		board.setLimStr(0);
		board.setLimEnd(5);

		List<Board> funBoards = boardService.getBoardList(board);
		board.setType("03");
		List<Board> backBoards = boardService.getBoardList(board);
		board.setType("00");
		List<Board> devBoards = boardService.getBoardList(board);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);
		model.addAttribute("funBoards", funBoards);
		model.addAttribute("backBoards", backBoards);
		model.addAttribute("devBoards", devBoards);

		return "home";
	}




}
