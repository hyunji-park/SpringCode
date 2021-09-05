package com.spring.test.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.test.service.ITestService;

/**
 * commit test
 * @author phj61
 *
 */
@Controller
public class TestController {
	
	//@Autowired : 아래 선언된 인터페이스를 참조하고 있는 객체를 자동으로 주입받는다.
	@Autowired
	public ITestService iTestService; //인터페이스만 부름
	
	
	@RequestMapping(value = "/test")
	//주소는 주소고 뷰는 뷰다.
	// ModelAndView : 데이터와 뷰 정보를 담고 있다
	public ModelAndView test(ModelAndView mav) {
		//ViewResolver => "WEB_INF/views/" + "test/test" + "jsp"
		//			   => "WEB_INF/views/test/test.jsp"
		mav.setViewName("test/test");
		// addObject(키, 값) : ModelAndView에 데이터를 추가한다.
		mav.addObject("a", "aaa");
		return mav;
	}
	
	@RequestMapping(value = "/testRec")
	public ModelAndView testRec(
			HttpServletRequest req, //request 객체 변수 선언
			//RequestParam 에서 required = false는 필수항목이 아님을 설정하는 것
			//required = false는 값이 없어도 주소를 직접 입력해서 접속 가능, 있으면 받고 없으면 null로 채움
			@RequestParam(required = false) String msg, //넘어오는 데이터 중 변수명과 동일한 키 값을 가진 데이터를 넣어준다.
			@RequestParam(value = "msg", required = false) String a, //넘어오는 데이터 중 값과 키가 일치하는 데이터를 변수에 넣는다. 
			@RequestParam(required = false) HashMap<String, String> params, //넘어오는 데이터들을 Map에 담는다.
			@RequestParam int c,
			@RequestParam(value = "c") ArrayList<Integer> cList,
			//msg에 넘어오는 값을 a에 넣겠다.
			ModelAndView mav) {
		// getParameter(키) : 넘어오는 데이터 중 키에 해당하는 값을 가져온다. 
		System.out.println(req.getParameter("msg"));
		System.out.println(msg);
		System.out.println(a);
		System.out.println(params.get("msg"));
		System.out.println(c);
		System.out.println(params.get("c"));
		System.out.println(cList);
		//setViewName(값) : view의 위치 값을 저장
		mav.setViewName("test/test2");
		return mav;
	}
	
	@RequestMapping(value = "test3")
	public ModelAndView test3(ModelAndView mav) {
		//리퀘스트 파람은 10개면 10번 써야하지만 해쉬맵은 한 번에 10개 가능
		List<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
		
		for(int i =10; i > 0; i--) {
			HashMap<String, String> data = new HashMap<String, String>();
			data.put("no", Integer.toString(i));
			data.put("title", "test" + i);
			list.add(data);
		}
		mav.addObject("list", list);
		mav.setViewName("test/test3");
		
		return mav;
	}
	
	@RequestMapping(value = "/test3Dtl")
	public ModelAndView test3Dtl(
								@RequestParam int no,
								ModelAndView mav) {
		iTestService.test();
		
		HashMap<String, String> data = new HashMap<String, String>();
		data.put("no", Integer.toString(no));
		data.put("title", "test" + no);
		data.put("writer", "tester" + no);
		data.put("con", "conconcon" + no);
		
		mav.addObject("data", data);
		mav.setViewName("test/test3Dtl");
		
		return mav;
	}
	@RequestMapping(value = "/testGugu")
	public ModelAndView testGugu(ModelAndView mav) {
		
		mav.setViewName("test/testGugu");
		return mav;
	}
	
	@RequestMapping(value = "/testGuguRes")
	public ModelAndView testGuguRes(
			@RequestParam(required = false) String dan,
			ModelAndView mav) {
		if(dan != null) {
			String gugu = iTestService.getGugu(dan);
			//mav.addObject("gugu", gugu);

			mav.setViewName("test/testGugu");
		} else {
			//setViewName의 redirect옵션 : 해당 주소의 다른 메소드로 이동
			//redirect옵션 사용 시 추가데이터는 Get방식으로 넘어간다.
			mav.setViewName("redirect:testGugu");
		}
		return mav;
	}
}
