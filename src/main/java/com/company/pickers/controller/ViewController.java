package com.company.pickers.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * Handles requests for the application home page.
 */
@Controller
@Component
public class ViewController {

	private static final Logger logger = LoggerFactory.getLogger(ViewController.class);

	/*@Autowired
	@Resource(name = "lottoService")
	private LottoService lottoService;*/

	/**
	 * 로그인 페이지
	 */
	@RequestMapping(value = "/login/login.do", method = RequestMethod.GET)
	public String login(HttpServletRequest request, HttpSession session) {
		logger.debug(session.getAttribute("user_id") + "세션 아이디입니다.");
		System.out.println(session.getAttribute("user_id") + "세션 아이디입니다.");

		return "login/login";
	}




}
