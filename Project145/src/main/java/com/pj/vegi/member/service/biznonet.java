package com.pj.vegi.member.service;

import java.net.URLDecoder;
import java.util.HashMap;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;


public class biznonet {


	// WebDriver
	
	// Properties
	public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
	public static final String WEB_DRIVER_PATH = "chromedriver";

	public static HashMap<String, String> checkBiz(String data) {
		HashMap<String, String> map = new HashMap<String, String>();
		String bizname;
		String bizaddress;
		WebElement element=null;
		// WebDriver 경로 설정
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
		
		// WebDriver 옵션 설정
		ChromeOptions options = new ChromeOptions();
		options.setCapability("ignoreProtectedModeSettings", true); //보안 설정 무시
		options.addArguments("--start-maximized"); // 전체 화면으로 실행
		options.addArguments("--disable-popup-blocking"); // 팝업 무시
		options.addArguments("--disable-default-apps"); // 기본앱 사용 안함

		// WebDriver 객체 생성
		ChromeDriver driver = new ChromeDriver(options);
		JavascriptExecutor js = (JavascriptExecutor) driver;
	
		try {
			//랜딩 페이지 열기
			driver.get("https://bizno.net/article/"+data);
			System.out.println("등록된 사용자번호 상세 페이지 열기");
			element = driver.findElement(By.xpath("//*[@class='titles']/a"));
			bizname = URLDecoder.decode(element.getText(),"UTF-8");
			map.put("bizname", bizname);
			
			System.out.println(bizname);
			
			
			try {

				element = driver.findElement(By.xpath("//*[@class='table_guide01']/tbody/tr[22]/td"));
				bizaddress = URLDecoder.decode(element.getText(),"UTF-8");
				map.put("bizaddress",bizaddress);
				System.out.println(bizaddress);
				
				
			}catch(Exception e) {
				System.out.println("등록된 사용자지만, 주소가 없습니다.");
				driver.close();
			}
			
		}catch(Exception e) {
			System.out.println("등록되지않은 사업자 번호");
			driver.close();
		}
		
		driver.close();
		return map;
		
	

		
}
}