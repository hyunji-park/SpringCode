package com.spring.test;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	//RequestMapping : 주소와 메소드를 연결
	//특정 주소를 받아 연결, value에 /말고 다른 것으로 바꿀 수도 있음. ex) /a -> 주소:포트/test/a
	@RequestMapping(value = "/", method = RequestMethod.GET) //주소:포트/test/
	//문자열 반환 시 특정 설정이 없는 경우 view의 경로로 인식한다.
	//model : data를 view에 전달
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate ); //model에 데이터 추가
		
		return "home";
	} //"/" 주소가 넘어왔을 때 홈을 찾아서 시간~ 을 home에 전달?
	
}
