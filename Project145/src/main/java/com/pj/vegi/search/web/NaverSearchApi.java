package com.pj.vegi.search.web;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.pj.vegi.search.service.NaverSearchService;
import com.pj.vegi.vo.NaverSearchVo;
import com.pj.vegi.vo.RecipeMaterialVo;

@Controller
public class NaverSearchApi {

	@Autowired
	NaverSearchService service;

	public static StringBuilder sb;//

//	static String getString(String input, String data) // API에서 필요한 문자 자르기.
//	{
//		String[] dataSplit = data.split("{" + input + "}");
//		String[] dataSplit2 = dataSplit[1].split("\"" + input + "\"");
//		return dataSplit2[0];
//	}

	// @RequestMapping("recipeMaterial.do/")
	public String getMaterialName(HttpServletRequest request, RecipeMaterialVo vo) {
		String name = "";
		List<RecipeMaterialVo> materials = service.getMaterialList(vo);

		for (RecipeMaterialVo n : materials) {
			n.getMatName();
			name += n;
		}
		return name;
	}

	@ResponseBody
	@RequestMapping("/recipeMaterial.do/{matName}")
	public static List<NaverSearchVo> naverSearch(@PathVariable String matName) {
		String clientId = "1P0F_fye7hGWfHa0ztCe";
		String clientSecret = "Psh1g_HCW9";
		int display = 3;
		List<NaverSearchVo> list = new ArrayList<NaverSearchVo>();
		System.out.println(matName);
		try {
			String text = URLEncoder.encode(matName, "utf-8");
			String apiURL = "https://openapi.naver.com/v1/search/shop?query=" + text + "&display=" + display + "&";
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			sb = new StringBuilder();
			String line;

			while ((line = br.readLine()) != null) {
				sb.append(line + "\n");
			}

			br.close();
			con.disconnect();
			// System.out.println(sb);
			String data = sb.toString();

//			array = data.split("/");
//			String[] title = new String[display];
//			String[] link = new String[display];
//			String[] mallName = new String[display];
//			String[] lPrice = new String[display];
//			int k = 0;
//			for (int i = 0; i < array.length; i++) {
//				if (array[i].equals("title"))
//					title[k] = array[i + 1];
//				if (array[i].equals("link"))
//					link[k] = array[i + 1];
//				if (array[i].equals("mallName"))
//					mallName[k] = array[i + 1];
//				if (array[i].equals("lPrice"))
//					lPrice[k] = array[i + 1];
//				k++;
//			}
//			System.out.println(sb);
			System.out.println("----------------------------");
//			System.out.println("첫번째 타이틀 : " + title[0]);
//			System.out.println("두번째 타이틀 : " + title[1]);
//			JSONObject sb2 = JSONObject.fromObject(sb);
//			JSONArray sbsb = sb2.getJSONArray("items");
			System.out.println(sb);
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(data);
			String items = (String) obj.get("items").toString();// 맨 첨 한꺼풀 벗음
			String str = "";
			JSONArray arr = (JSONArray) parser.parse(items);//대괄호 벗김
			
			for (int i = 0; i < arr.size(); i++) {
				NaverSearchVo vo = new NaverSearchVo();
				str = arr.get(i).toString();
				obj = (JSONObject) parser.parse(str);
				 vo.setTitle(obj.get("title").toString());
				 vo.setLink(obj.get("link").toString());
				 vo.setMallName(obj.get("mallName").toString());
				 vo.setLprice(obj.get("lprice").toString());
				 list.add(vo);
				 System.out.println(vo.getTitle());
				 System.out.println(vo.getLink());
				 System.out.println(vo.getMallName());
				 System.out.println(vo.getLprice());
			}
			
			
		} catch (

		Exception e) {
			System.out.println(e);
		}
		return list;
	}
}
