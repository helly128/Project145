package com.pj.vegi.search.service.impl;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import org.springframework.stereotype.Service;
import com.pj.vegi.search.service.NaverSearchService;

@Service
public class NaverSearchServiceImpl implements NaverSearchService {
	public static StringBuilder sb;//

	static String getString(String input, String data) // API에서 필요한 문자 자르기.
	{
		String[] dataSplit = data.split("{" + input + "}");
		String[] dataSplit2 = dataSplit[1].split("\"" + input + "\"");
		return dataSplit2[0];
	}

	public static void main(String[] args) {

		String clientId = "1P0F_fye7hGWfHa0ztCe";
		String clientSecret = "Psh1g_HCW9";
		int display = 3;
		
		try {
			String text = URLEncoder.encode("페퍼론치노", "utf-8");
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
			System.out.println(sb);
			String data = sb.toString();
			String[] array;
			array = data.split("\"");
			String[] title = new String[display];
			String[] link = new String[display];
			String[] mallName = new String[display];
			String[] image = new String[display];
			String[] lPrice = new String[display];
			int k = 0;
			for (int i = 0; i < array.length; i++) {
				if (array[i].equals("title"))
					title[k] = array[i + 2];
				if (array[i].equals("link"))
					link[k] = array[i + 2];
				if (array[i].equals("mallName"))
					mallName[k] = array[i + 2];
				if (array[i].equals("image"))
					image[k] = array[i + 2];
				if (array[i].equals("lPrice"))
					lPrice[k] = array[i + 2];
					k++;
			}
			System.out.println(sb);
			System.out.println("----------------------------");
			System.out.println("첫번째 타이틀 : " + title[0]);
			System.out.println("두번째 타이틀 : " + title[1]);
		}catch(

	Exception e)
	{
		System.out.println(e);
	}
}

}
