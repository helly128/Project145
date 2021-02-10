package com.pj.vegi.crawling.web;

import java.io.IOException;
import java.util.Iterator;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.pj.vegi.crawling.mapper.CrawlingMapper;
import com.pj.vegi.vo.RecipeMaterialVo;
import com.pj.vegi.vo.RecipeVo;

@Controller
public class RecipeCrawlingController {
	@Autowired
	CrawlingMapper dao;

	@RequestMapping("crawling.do")
	public String crawling() {
		RecipeVo vo;

		int n = 1;
		for (n = 1; n <= 4; n++) {
			String url = "https://www.10000recipe.com/recipe/list.html?q=%EC%B1%84%EC%8B%9D&order=reco&page=" + n;

			Document doc = null;
			try {
				doc = Jsoup.connect(url).get();
			} catch (IOException e) {
				e.printStackTrace();
			}

			Elements element = doc.select("li.common_sp_list_li");
			Iterator<Element> recipelink = element.select(".common_sp_thumb a").iterator();

			// 각 레시피별 세부 내용 크롤링
			//
			while (recipelink.hasNext()) {
				vo = new RecipeVo();
				String linkin = "https://www.10000recipe.com" + recipelink.next().attr("href");

				// 제목
				Document docIn = null;
				try {
					docIn = Jsoup.connect(linkin).get();
				} catch (IOException e) {
					e.printStackTrace();
				}

				Elements title = docIn.select("div.view2_summary h3");
				System.out.println(title.text());
				vo.setRTitle(title.text());

				// 요리순서
				String cookStep = "";
				boolean stepFlag = true;
				int num = 1;
				while (stepFlag) {
					Elements element3 = docIn.select("#stepdescr" + num);
					Iterator<Element> step = element3.iterator();

					if (step.hasNext()) {
						// System.out.println(step.next().text()); // 열기
						cookStep += num + ". " + step.next().text() + "\r\n";
					} else {
						stepFlag = false;
					}

					num++;
				}
				vo.setRContent(cookStep);

				// 요리사진
				Elements element4 = docIn.select("div.centeredcrop img");
				System.out.println(element4.attr("src"));
				vo.setRImage(element4.attr("src"));

				dao.insertRecipe(vo);

				// ===============================
				// 재료
//				Elements element2 = docIn.select("ul.case1 a");
//				Iterator<Element> ingredients = element2.select("li").iterator();
				Elements element3 = docIn.select("ul.case1 li");
				Iterator<Element> ingredients2 = element3.iterator();
				RecipeMaterialVo mvo;

				while (ingredients2.hasNext()) {
					mvo = new RecipeMaterialVo();
					String iningredient = ingredients2.next().text();
					String[] cut = iningredient.split(" ");

					int length = cut.length;
					String material = "";
					String volume = "";
					for (int i = 0; i < length; i++) {
						if (i < length - 1) {
							material += cut[i];
						} else {
							volume = cut[length - 1];
						}
					}
					if (material.equals(""))
						material = cut[0];

					System.out.println(material);
					System.out.println(volume);
					mvo.setMatName(material);
					mvo.setMatVol(volume);
					if(mvo != null) {
						dao.insertMaterial(mvo);
					}
				}
			}
		}
		
		return "main/main";
	}
}
