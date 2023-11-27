package com.artirection.controllers;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/api")
public class ApiContorller {

	
	// api 데이터 불러오기
	@ResponseBody
	@RequestMapping(value="selectAll", method=RequestMethod.GET, produces="application/text;charset=utf8")
	public String rtInformation(Model model) throws IOException{
		
	      StringBuilder urlBuilder = new StringBuilder("http://www.culture.go.kr/openapi/rest/publicperformancedisplays/period"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=WTN3HpCtoUbvSxoTg3w7og3Y2piCph2NEpXjiv9QSHsVyTp1ezvYXUPvm4ntMkEIiub%2FLGlzFzf7NpLn2I5cow%3D%3D"); /*Service Key*/
//	        urlBuilder.append("&" + URLEncoder.encode("keyword","UTF-8") + "=" + URLEncoder.encode("연극", "UTF-8")); /**/
//	        urlBuilder.append("&" + URLEncoder.encode("sortStdr","UTF-8") + "=" + URLEncoder.encode("2", "UTF-8")); /*1:등록일, 2:공연명, 3:지역*/
	        
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
	        
	        return sb.toString();
		
		
	}
}