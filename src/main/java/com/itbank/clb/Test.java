package com.itbank.clb;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String clientId = "9_CKUz4XB4rTQ8OfG59n";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "v4Ud5Kl0cu";//애플리케이션 클라이언트 시크릿값";
        
        try {
        	
            String text = URLEncoder.encode("기후, 예고된 재앙 ", "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/book.json?query="+ text + "&display=1"; // json 결과
            // String apiURL = "https://openapi.naver.com/v1/search/book.xml?query="+ text; // xml 결과
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            
            br.close();
            
            String result = response.toString();
            
            System.out.println(result);
            
            // JSON Parser를 이용해서 값 추출
            JSONParser jp = new JSONParser();
            JSONObject jo = (JSONObject)jp.parse(result);
            JSONArray jo2 = (JSONArray)(jo.get("items"));
            
            for(int i=0;i<jo2.size();i++){
            	
            	JSONObject book = (JSONObject)jo2.get(i);
            	System.out.println(book);
            	System.out.println("이미지 : " + book.get("image"));
            	System.out.println("링크 : " + book.get("link"));
            	
            }
        }
            catch (Exception e) {
                System.out.println(e);
            }
	}
}