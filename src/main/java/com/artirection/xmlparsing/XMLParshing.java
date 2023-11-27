package com.artirection.xmlparsing;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class XMLParshing {
	
	// tag값의 정보를 가져오는 메서드
	private static String getTagValue(String tag, Element eElement) {
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node) nlList.item(0);
		if(nValue == null) {
			return null;
		}
		return nValue.getNodeValue();
	}
	
	public static void main(String[] args) {
		int page = 1; // 페이지 초기값
		try {
			while(true) {
				// parsing할 url (API 키 포함)
				String url = "http://www.culture.go.kr/openapi/rest/publicperformancedisplays/period?serviceKey=WTN3HpCtoUbvSxoTg3w7og3Y2piCph2NEpXjiv9QSHsVyTp1ezvYXUPvm4ntMkEIiub%2FLGlzFzf7NpLn2I5cow%3D%3D&sortStdr=2&cPage=" + page;
				
				// 페이지에 접근할 Document 객체 생성
				DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
				Document doc = dBuilder.parse(url);
				
				// root tag
				doc.getDocumentElement().normalize();
				System.out.println("Root element : " + doc.getDocumentElement().getNodeName());
				
				// parsing tag
				NodeList nList = doc.getElementsByTagName("perforList");
				System.out.println("파싱할 리스트 수 : " +  nList.getLength());
				
				for(int i = 0; i < nList.getLength(); i++) {
					Node nNode = nList.item(i);
					
					Element eElement = (Element) nNode;
					System.out.println("---------------------");
					System.out.println("제목 : " + getTagValue("title", eElement));
					System.out.println("시작일 : " + getTagValue("startDate", eElement));
					System.out.println("마감일 : " + getTagValue("endDate", eElement));
					System.out.println("장소 : " + getTagValue("place", eElement));
					System.out.println("분류명 : " + getTagValue("realmName", eElement));
					System.out.println("지역 : " + getTagValue("area", eElement));
					System.out.println("썸네일 : " + getTagValue("thumbnail", eElement));
					System.out.println("GPS-X좌표 : " + getTagValue("gpsX", eElement));
					System.out.println("GPS-Y좌표 : " + getTagValue("gpsY", eElement));
				}
				
				page += 1;
				System.out.println("page number : " + page);
				if(page > 12) {
					break;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
