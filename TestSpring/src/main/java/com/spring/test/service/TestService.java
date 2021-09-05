package com.spring.test.service;

import org.springframework.stereotype.Service;

//@Service : 기능들을 모아놓은 클래스
@Service
public class TestService implements ITestService {

	@Override
	public void test() {
		System.out.println("서비스 메소드 호출됨");
	}
	
	@Override
	public String getGugu(String dan) {
		String gugu = "";
		
		for(int i = 1; i < 10; i++) {
			gugu += dan + "*" + i + "=" + (Integer.parseInt(dan) * i) + "<br/>";

		}
		return gugu;
	}
}
