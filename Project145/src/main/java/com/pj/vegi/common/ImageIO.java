package com.pj.vegi.common;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class ImageIO {
	//이미지 신규등록
	public static String imageUpload(HttpServletRequest request, MultipartFile uploadfile) throws IllegalStateException, IOException {
		String path = request.getSession().getServletContext().getRealPath("/images"); // 처음의 /는 webapp을 뜻함
		File file = new File(path, uploadfile.getOriginalFilename());

		file = rename(file);

		uploadfile.transferTo(file);
		System.out.println("==file path==" + file.getAbsolutePath());
		return file.getName();
	}
	
	//이미지 변경
	public static String imageUpload(HttpServletRequest request, MultipartFile uploadfile, String orgName)
			throws IllegalStateException, IOException {
		String path = request.getSession().getServletContext().getRealPath("/images"); // 처음의 /는 webapp을 뜻함
		File file = new File(path, uploadfile.getOriginalFilename());

		// 기존 사진파일 삭제
		File deleteFile = new File(path, orgName);
		if (deleteFile.exists()) {
			deleteFile.delete();
		}
		file = rename(file);

		uploadfile.transferTo(file);
		return file.getName();

	}

	public static File rename(File f) { // File f는 원본 파일
		if (!f.exists())
			return f; // 생성된 f가 중복되지 않으면 리턴

		String name = f.getName();
		String body = null;
		String ext = null;

		int dot = name.lastIndexOf(".");
		if (dot != -1) { // 확장자가 없을때
			body = name.substring(0, dot);
			ext = name.substring(dot);
		} else { // 확장자가 있을때
			body = name;
			ext = "";
		}

		int count = 0;
		// 중복된 파일이 있을때
		// 파일이름뒤에 a숫자.확장자 이렇게 들어가게 되는데 숫자는 9999까지 된다.
		while (f.exists() && count < 9999) {
			count++;
			String newName = body + " (" + count + ")" + ext;
			f = new File(f.getParent(), newName);
		}
		return f;
	}
}
