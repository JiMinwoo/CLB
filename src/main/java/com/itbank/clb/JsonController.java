package com.itbank.clb;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.clb.DAO.BookDAO;
import com.itbank.clb.DTO.BookDTO;

@Controller
public class JsonController {
	
	@Autowired
	BookDAO bDAO;
	
	@RequestMapping("titleInsert")
	public void titleInsert(HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		String title = request.getParameter("title");
		int bnum = 1;
		
		BookDTO bDto = new BookDTO();
		
		bDto.setBnum(bnum);
		bDto.setTitle(title);
		
		bDAO.titleInsert(title);
		
		response.getWriter().write(title + "");
	}
	
	@RequestMapping("infoInsert")
	public void infoInsert(HttpServletRequest request,HttpServletResponse last) throws IOException{
		
		String title = request.getParameter("title");
		
		String clientId = "9_CKUz4XB4rTQ8OfG59n";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "v4Ud5Kl0cu";//애플리케이션 클라이언트 시크릿값";
        
        try {
            String text = URLEncoder.encode(title, "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/book.json?query="+ text + "&display=" + 1; // json 결과
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
            
            // JSON Parser를 이용해서 값 추출
            JSONParser jp = new JSONParser();
            JSONObject jo = (JSONObject)jp.parse(result);
            JSONArray jo2 = (JSONArray)(jo.get("items"));
            
            for(int i=0;i<jo2.size();i++){
            	
            	JSONObject book = (JSONObject)jo2.get(i);
            	
            	BookDTO bDto = new BookDTO();
            	
            	// writer,price,publisher,pubdate,blink,bimg
            	bDto.setTitle(title);
            	bDto.setWriter((String)book.get("author"));
            	bDto.setPrice(Integer.parseInt(((String)book.get("price"))));
            	bDto.setPublisher((String)book.get("publisher"));
            	bDto.setPubdate((String)book.get("pubdate"));
            	bDto.setBlink((String)book.get("blink"));
            	bDto.setBimg((String)book.get("bimg"));
            	
            	bDAO.infoInsert(bDto);
            	
            }
        }
            catch (Exception e) {
                System.out.println(e);
            }
		
		last.getWriter().write("ho ho ho");
	}
	
	}