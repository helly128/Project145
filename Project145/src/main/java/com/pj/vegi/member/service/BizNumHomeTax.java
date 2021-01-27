package com.pj.vegi.member.service;

import java.net.URLDecoder;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class BizNumHomeTax {


	// WebDriver
	
	// Properties
	public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
	public static final String WEB_DRIVER_PATH = "d:/selenium/chromedriver_win32/chromedriver.exe";

	public static String checkBiz(String data) {
		
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
			driver.get("https://www.hometax.go.kr/ui/pp/yrs_index.html?isCdn=Y");
			System.out.println("랜딩페이지 열기");
		
			driver.manage().timeouts().implicitlyWait(3, TimeUnit.SECONDS);//5초 기다림
			WebElement element = driver.findElement(By.xpath("//*[@id='TH4BOX']/a"));
			System.out.println("첫번째 링크 찾기");
			// 방금 패스 요소 클릭 (버튼일 경우 element.click()로 가능.)
			js.executeScript("arguments[0].click();", element);	
			
			while (true) {
				try {
					
					driver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);//5초 기다림
					System.out.println("두번째 링크 찾기");
					element = driver.findElement(By.xpath("//*[@id='menu_1_0108010000']/a"));
					js.executeScript("arguments[0].click();", element); //클릭
					System.out.println(element);
					driver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
					//아이프레임 들어가기
					driver.switchTo().frame(driver.findElement(By.id("txppIframe")));
					System.out.println("아이프레임 들어감");
					
					
					Thread.sleep(2000); //2초 재움
					element = driver.findElement(By.id("bsno"));
					String biznum =data; //여기다가 파라미터 넣어주기
			        element.sendKeys(biznum);
			        System.out.println("사업자 번호 타이핑 완료");
					//System.out.println("세션프레임2 코드 보기" + driver.getPageSource());
					
			        
					//제출 혹은 닫기 버튼
					element = driver.findElement(By.id("trigger5"));
					js.executeScript("arguments[0].click();", element);
					System.out.println("아이프레임에서 제출 버튼");
					driver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS); //5초 재움
					
					while (true) {
					try {
						
					
						
						//
						element = driver.findElement(By.xpath("//*[@id='grid2_cell_0_1']/nobr"));
						
						data = URLDecoder.decode(element.getText(),"UTF-8");
						System.out.println(data + "결과1");
						
						//driver.switchTo().defaultContent();
						//System.out.println("디폴트로 돌아옴");
						
						break;
					
					}catch (Throwable e) { 
						e.printStackTrace();
						System.out.println("아이프레임 못들어감");
						element = driver.findElement(By.xpath("//*[@id='grid2_cell_0_1']/nobr"));
						
						data = URLDecoder.decode(element.getText(),"UTF-8");
						System.out.println(data);
						
				       	System.out.println("입력 실패");
						e.printStackTrace();
						break;
						}
					}
					
					break;
					
				} catch (Throwable e) {
					
					System.out.println("두번째 링크 넘어가기 실패");
					e.printStackTrace();
					break;
				} 					
			}
			}
		catch (Throwable e) {
			System.out.println("첫번째 링크 넘어가기 실패");
			e.printStackTrace();
			// TODO: handle exception
		}finally {
//		 결과가 면세 사업자 이면 > 머머머 담기 .. 
			
			System.out.println("끝 10초 뒤 종료합니다.");
			driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
			driver.close();
			
			
		}
		
		if(data.equals("국세청에 등록되지 않은 사업자등록번호입니다.	")) {
			data="NonRegBiz";
		}else if(data.equals("부가가치세 일반과세자 입니다.")) {
			data="RegBiz";
		}else if(data.equals("부가가치세 면세사업자 입니다.")) {
			data="RegBiz";
		}else {
			data="closedBiz";
		}
		
				return data;

	}
	
}