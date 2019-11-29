package spring.utility.webtest;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Hashtable;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import spring.model.mapper.ReplyMapper;

public class Utility {

	public static String checkNull(String str) {
		if (str == null) {
			str = "";
		}
		return str;
	}
	
	public static int rcount(int bbsno,ReplyMapper mapper){
        return mapper.rcount(bbsno);
   }

	/**
	 * 
	 * @param totalRecord   전체 레코드수
	 * @param nowPage       현재 페이지
	 * @param recordPerPage 페이지당 레코드 수
	 * @param col           검색 컬럼
	 * @param word          검색어
	 * @return 페이징 생성 문자열
	 */
	public static String paging(int totalRecord, int nowPage, int recordPerPage, String col, String word) {
		int pagePerBlock = 5; // 블럭당 페이지 수
		int totalPage = (int) (Math.ceil((double) totalRecord / recordPerPage)); // 전체 페이지
		int totalGrp = (int) (Math.ceil((double) totalPage / pagePerBlock));// 전체 그룹
		int nowGrp = (int) (Math.ceil((double) nowPage / pagePerBlock)); // 현재 그룹
		int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작
		int endPage = (nowGrp * pagePerBlock); // 특정 그룹의 페이지 목록 종료

		StringBuffer str = new StringBuffer();
		str.append("<div style='text-align:center'>");
		str.append("<ul class='pagination'> ");
		int _nowPage = (nowGrp - 1) * pagePerBlock; // 10개 이전 페이지로 이동
		if (nowGrp >= 2) {
			str.append(
					"<li><a href='./list.do?col=" + col + "&word=" + word + "&nowPage=" + _nowPage + "'>이전</A></li>");
		}

		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}

			if (nowPage == i) {
				str.append("<li class='active'><a href=#>" + i + "</a></li>"); // 현재위치를 나타낼때 li의 클래스에 active
			} else {
				str.append("<li><a href='./list.do?col=" + col + "&word=" + word + "&nowPage=" + i + "'>" + i
						+ "</A></li>");
			}
		}

		_nowPage = (nowGrp * pagePerBlock) + 1; // 10개 다음 페이지로 이동
		if (nowGrp < totalGrp) {
			str.append(
					"<li><A href='./list.do?col=" + col + "&word=" + word + "&nowPage=" + _nowPage + "'>다음</A></li>");
		}
		str.append("</ul>");
		str.append("</div>");

		return str.toString();
	}
	
	//rpaging
	public static String rpaging(int total, int nowPage, int recordPerPage, String col, String word, String url,
			int nPage, int bbsno) {
		int pagePerBlock = 5; // 블럭당 페이지 수
		int totalPage = (int) (Math.ceil((double) total / recordPerPage)); // 전체 페이지
		int totalGrp = (int) (Math.ceil((double) totalPage / pagePerBlock));// 전체 그룹
		int nowGrp = (int) (Math.ceil((double) nPage / pagePerBlock)); // 현재 그룹
		int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작
		int endPage = (nowGrp * pagePerBlock); // 특정 그룹의 페이지 목록 종료

		StringBuffer str = new StringBuffer();
		str.append("<div style='text-align:center'>");
		str.append("<ul class='pagination'> ");
		int _nowPage = (nowGrp - 1) * pagePerBlock; // 10개 이전 페이지로 이동

		if (nowGrp >= 2) {
			str.append("<li><a href='" + url + "?col=" + col + "&word=" + word + "&nowPage=" + nowPage + "&bbsno="
					+ bbsno + "&nPage=" + _nowPage + "'>이전</A></li>");
		}

		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}

			if (nPage == i) {
				str.append("<li class='active'><a href=#>" + i + "</a></li>");
			} else {
				str.append("<li><a href='" + url + "?col=" + col + "&word=" + word + "&nowPage=" + nowPage + "&bbsno="
						+ bbsno + "&nPage=" + i + "'>" + i + "</A></li>");
			}
		}

		_nowPage = (nowGrp * pagePerBlock) + 1; // 10개 다음 페이지로 이동
		if (nowGrp < totalGrp) {
			str.append("<li><A href='" + url + "?col=" + col + "&word=" + word + "&nowPage=" + nowPage + "&bbsno="
					+ bbsno + "&nPage=" + _nowPage + "'>다음</A></li>");
		}
		str.append("</ul>");
		str.append("</div>");

		return str.toString();

	}

	public static List<String> getDay() {
		List<String> list = new ArrayList<String>();

		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");

		Calendar cal = Calendar.getInstance();

		for (int i = 0; i < 3; i++) {
			list.add(sd.format(cal.getTime())); // 오늘의 날짜 정보를 dateForformat해서 가져오겠음

			cal.add(Calendar.DATE, -1);
		}
		return list;
	}

	public static boolean compareDay(String wdate) {
		boolean flag = false;

		List<String> list = getDay();
		if (wdate.equals(list.get(0)) || wdate.equals(list.get(1)) || wdate.equals(list.get(2))) { // list가 갖고있는 0 첫번째값
			flag = true;
		}
		return flag;
	}

	public static String getCodeValue(String code) {
		String jobname = null;

		Hashtable<String, String> codes = new Hashtable<String, String>();
		codes.put("A01", "회사원");
		codes.put("A02", "전산관련직");
		codes.put("A03", "연구전문직");
		codes.put("A04", "각종학교학생");
		codes.put("A05", "일반자영업");
		codes.put("A06", "공무원");
		codes.put("A07", "의료인");
		codes.put("A08", "법조인");
		codes.put("A09", "종교/언론/예술인");
		codes.put("A10", "기타");

		jobname = codes.get(code);

		return jobname;
	}

	public static String saveFileSpring(MultipartFile multipartFile, String basePath) {
		// String basePath --> storage
		// input form's parameter name
		String fileName = "";
		// original file name
		String originalFileName = multipartFile.getOriginalFilename();
		// 순수하게 파일만 가져옴
		// file content type
		String contentType = multipartFile.getContentType();
		// 파일이 어떤 타입 .txt 인지 .gif 인지 이런것들
		// file size
		long fileSize = multipartFile.getSize();

		System.out.println("fileSize: " + fileSize);
		System.out.println("originalFileName: " + originalFileName);

		InputStream inputStream = null;
		OutputStream outputStream = null;

		try {
			if (fileSize > 0) { // 파일이 존재한다면
				// 인풋 스트림을 얻는다.
				inputStream = multipartFile.getInputStream();
				// 파일을 읽어오겠음_업로드되어진 파일객체를 읽어온다???

				File oldfile = new File(basePath, originalFileName);

				if (oldfile.exists()) {
					for (int k = 0; true; k++) {
						// 파일명 중복을 피하기 위한 일련 번호를 생성하여
						// 파일명으로 조합
						oldfile = new File(basePath, "(" + k + ")" + originalFileName);

						// 조합된 파일명이 존재하지 않는다면, 일련번호가
						// 붙은 파일명 다시 생성
						if (!oldfile.exists()) { // 존재하지 않는 경우
							fileName = "(" + k + ")" + originalFileName;
							break;
						}
					}
				} else {
					fileName = originalFileName;
				}
				// make server full path to save
				// 여기서부터의 코딩은
				// 실제 존재하는 파일을 storage 안에 넣어주는
				String serverFullPath = basePath + "\\" + fileName;

				System.out.println("fileName: " + fileName);
				System.out.println("serverFullPath: " + serverFullPath);

				outputStream = new FileOutputStream(serverFullPath);

				// 버퍼를 만든다.
				int readBytes = 0;
				byte[] buffer = new byte[8192];

				while ((readBytes = inputStream.read(buffer, 0, 8192)) != -1) {
					outputStream.write(buffer, 0, readBytes);
					// storage 영역으로 파일을 옮겨주는 역할
				}
				outputStream.close();
				inputStream.close();

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}

		return fileName;
	}

	public static void deleteFile(String basePath, String oldfile) {
		if (oldfile != null && !oldfile.equals("")) {
			File file = new File(basePath, oldfile);
			if (file.exists()) {
				file.delete();
			}
		}
	}
}
