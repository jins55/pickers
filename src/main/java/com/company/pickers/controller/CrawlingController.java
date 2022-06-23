package com.company.pickers.controller;

import com.company.pickers.common.HtmlCrawling;
import com.company.pickers.model.Board;
import com.company.pickers.service.BoardService;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Handles requests for the application home page.
 */
@Controller
@Component
public class CrawlingController {

	private static final Logger logger = LoggerFactory.getLogger(CrawlingController.class);

	@Autowired
	@Resource(name = "boardService")
	private BoardService boardService;

	/**
	 * 담다월드 배치
	 */
	@RequestMapping(value = "/batch/damdaCrawling.do", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Object> placeStore() {
		System.out.println("board Crawling insert Start...");


		/*start*/
		List<Board> boards = new ArrayList<>();
		try {
			String type = "01"; // 기본(유머,자유)
			String url = "https://damdaworld.com/";

			HtmlCrawling hc = new HtmlCrawling();

			Document doc = (Document) hc.getHtml(url);

			String damdaDomain = "https://damdaworld.com";

			//인기/유머 게시글 최신 글 5개 가져오기
			for (int i = 4; i > -1; i--) {
				Board board = new Board();

				String thumbnail = "";

				Elements mElementDatas = doc.select(".app-widget-content-main").eq(0).select("li").eq(i).select("a"); //최신글 1~5개 ele
				String bUrl = mElementDatas.attr("href");
				Document bDoc = (Document) hc.getHtml(bUrl); //게시글 url
				Elements bElement = bDoc.select(".app-card.app-board-section"); //게시글 컨텐츠

				if(boardService.alreadyCheck(bUrl) < 1) {

					thumbnail =  mElementDatas.eq(0).select(".app-thumbnail").select("img").attr("src");

					board.setOrigin_url(bUrl);
					board.setThumbnail(thumbnail.contains("http") || thumbnail.isEmpty() ? thumbnail : damdaDomain + thumbnail);
					board.setContent(bElement.select("#article_1").eq(0).toString().replaceAll("src=\"/files","src=\""+damdaDomain+"/files"));
					board.setTitle(bElement.eq(0).select("h1").text());
					board.setType(type);
					board.setPv(rendomPv());

					boards.add(boards.size(), board);
				}
			}
			if(boards.size() > 0) {
				boardService.insertCrawlingBoard(boards);
				System.out.println("board(01) Crawling insert Success.");
			}
			/* end */

			/*start*/
			boards = new ArrayList<>();
			type = "02"; // 후방

			for (int i = 4; i > -1; i--) {
				Board board = new Board();

				String thumbnail = "";

				Elements mElementDatas = doc.select(".app-widget-content-main").eq(2).select("li").eq(i).select("a"); //최신글 1~5개 ele
				String bUrl = mElementDatas.attr("href");
				Document bDoc = (Document) hc.getHtml(bUrl); //게시글 url
				Elements bElement = bDoc.select(".app-card.app-board-section"); //게시글 컨텐츠


				if (boardService.alreadyCheck(bUrl) < 1) {


					thumbnail =  mElementDatas.eq(0).select(".app-thumbnail").select("img").attr("src");

					board.setOrigin_url(bUrl);
					board.setThumbnail(thumbnail.contains("http") || thumbnail.isEmpty() ? thumbnail : damdaDomain + thumbnail);
					board.setContent(bElement.select("#article_1").eq(0).toString().replaceAll("src=\"/files","src=\""+damdaDomain+"/files"));
					board.setTitle(bElement.eq(0).select("h1").text());
					board.setType(type);
					board.setPv(rendomPv());

					boards.add(boards.size(), board);
				}
			}
			if(boards.size() > 0) {
				boardService.insertCrawlingBoard(boards);
				System.out.println("board(02) Crawling insert Success.");
			}
			/* end */

			/*start*/
			boards = new ArrayList<>();
			type = "03"; // 연예인

			for (int i = 4; i > -1; i--) {
				Board board = new Board();

				String thumbnail = "";

				Elements mElementDatas = doc.select(".app-widget-content-main").eq(1).select("li").eq(i).select("a"); //최신글 1~5개 ele
				String bUrl = mElementDatas.attr("href");
				Document bDoc = (Document) hc.getHtml(bUrl); //게시글 url
				Elements bElement = bDoc.select(".app-card.app-board-section"); //게시글 컨텐츠

				if (boardService.alreadyCheck(bUrl) < 1) {
					thumbnail = mElementDatas.eq(0).select(".app-thumbnail").select("img").attr("src");

					board.setOrigin_url(bUrl);
					board.setThumbnail(thumbnail.contains("http") || thumbnail.isEmpty() ? thumbnail : damdaDomain + thumbnail);
					board.setContent(bElement.select("#article_1").eq(0).toString().replaceAll("src=\"/files", "src=\"" + damdaDomain + "/files"));
					board.setTitle(bElement.eq(0).select("h1").text());
					board.setType(type);
					board.setPv(rendomPv());

					boards.add(boards.size(), board);
				}
			}

			if(boards.size() > 0) {
				boardService.insertCrawlingBoard(boards);
				System.out.println("board(03) Crawling insert Success.");
			}

			/* end */



		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>("Fail", HttpStatus.OK);
		}
		return new ResponseEntity<>("Success", HttpStatus.OK);
	}


	public String rendomPv(){
		int min = 50;
		int max = 800;
		int random = (int) ((Math.random() * (max - min)) + min);
		return random+"";
	}


}
