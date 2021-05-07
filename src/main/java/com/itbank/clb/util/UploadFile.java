package com.itbank.clb.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class UploadFile {
	
	public List<Map<String,String>> fileUp(
			MultipartHttpServletRequest multi){

		//1.저장경로 찾기
		String root = multi.getSession().
				getServletContext().getRealPath("/"); //프로젝트의 가장 바깥쪽 경로를 root에 저장
		String path = root + "resources/photoUpload/"; //upload 디렉토리에 파일 저장
		
		//2.폴더 생성을 꼭 할것...
		File dir = new File(path);
		if(!dir.isDirectory()) { // upload 폴더 없다면
			dir.mkdir(); // upload 폴더 생성
		}
		
		//3.파일을 가져오기 - 일태그 이름들 반환
		Iterator<String> files = multi.getFileNames(); // multi 안에있는 파일들의 이름을 files에 저장
		List<Map<String,String>> fMapList = 
				new ArrayList<Map<String,String>>();
		
		while (files.hasNext()) { // 파일이 없을 때 까지 반복
			Map<String,String> fMap =
					new HashMap<String,String>(); // 파일 하나당 하나의 맵 생성
			String fileTagName = files.next();

		//파일 메모리에 저장
		MultipartFile mf =
				multi.getFile(fileTagName); // 실제파일
		String oriFileName = 
				mf.getOriginalFilename(); // 실제 파일의 이름
		fMap.put("ORIGINAL_FILE_NAME",oriFileName ); // "ORIGINAL_FILE_NAME" 이라는 키로 실제 파일을 맵에 입력
		
		//4.시스템파일이름 생성 a.txt => 112323242424.txt
		String sysFileName = 
				System.currentTimeMillis() + "." + // 파일 중복을 방지하기위해서 이름에 시간값을 더해줌 
						oriFileName.substring( 
								oriFileName.lastIndexOf(".")+1); 
		fMap.put("STORED_FILE_NAME", sysFileName); // "STORED_FILE_NAME" 으로 파일 이름 저장
		fMap.put("FILE_SIZE", Long.toString(mf.getSize())); // 파일크기 저장
		fMapList.add(fMap);
		
		//5.메모리 ->실제 파일 업로드
		try {
			mf.transferTo(new File(path + sysFileName));
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
		
	return fMapList;
	
	}
}