package com.artirection.controllers;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.artirection.dto.FavoriteDTO;
import com.artirection.services.FavoriteService;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private FavoriteService fservice;
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/preview")
	public String preview(Model model) {
		String loginID = (String) session.getAttribute("loginID");
		List<FavoriteDTO> fList = fservice.selectAllById(loginID);
		
		model.addAttribute("fList",fList);
		
		return "preview";
	}
	
	// 추천 전시회 출력
	@Transactional
	@ResponseBody
	@RequestMapping("/recommendList")
	public String recommendList(Model model) throws Exception {
		String loginID = (String) session.getAttribute("loginID");
		
		String category = "";
		// 회원이라면 찜 목록에서 분류 가져오기
		if(loginID != null) {
			category = fservice.selectCategoryById(loginID);
			// 찜한 목록이 없다면
			if(category == null) {
				category = "공연";
			}
		// 비회원이라면 연극으로 고정
		} else {
			category = "연극";
		}
		
		// 카테고리로 전시 검색
		StringBuilder urlBuilder = new StringBuilder("http://www.culture.go.kr/openapi/rest/publicperformancedisplays/realm"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=WTN3HpCtoUbvSxoTg3w7og3Y2piCph2NEpXjiv9QSHsVyTp1ezvYXUPvm4ntMkEIiub%2FLGlzFzf7NpLn2I5cow%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("keyword","UTF-8") + "=" + URLEncoder.encode(category, "UTF-8")); /*분류*/
        urlBuilder.append("&" + URLEncoder.encode("rows","UTF-8") + "=" + URLEncoder.encode("40", "UTF-8")); /**/
        
        URL url = new URL(urlBuilder.toString());
        
        System.out.println(url);
        
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        
        conn.disconnect();
        
        System.out.println(sb.toString());
        
        return sb.toString();
		
	}
}
