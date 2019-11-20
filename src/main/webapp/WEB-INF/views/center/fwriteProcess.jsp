<%@page import="java.util.Enumeration"%>
<%@page import="com.exam.dao.AttachDao"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.io.File"%>
<%@page import="com.exam.dao.BoardDao"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.UUID"%>
<%@page import="com.exam.vo.AttachVO"%>
<%@page import="com.exam.vo.BoardVO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// COS 라이브러리를 이용한 파일업로드
// MultipartRequest 생성자 호출시에 파일업로드가 완료됨
// 필요한 매개값 5개
// 1 request
// 2 saveDirectory (업로드할경로)

MultipartRequest multi=null;

String realpath = application.getRealPath("upload");
System.out.println("realPath : "+realpath);
// 3 최대 업로드 파일크기 (1024*1024 = 1MB)
int maxsize = 1024 * 1024 * 10; // 10MB
// 4 파일이름 한글처리 "utf-8"
// 5 파일이름중복 처리
// 파일업로드 수행 완료!
multi = new MultipartRequest(request, realpath, maxsize, "utf-8", new DefaultFileRenamePolicy());
// =============================게시판 글 등록 처리 시작 =================================
// 자바빈 BoardVO 객체 생성
BoardVO boardVO = new BoardVO();
// 파라미터 찾아서 자바빈에 저장
boardVO.setUsername(multi.getParameter("username"));
boardVO.setPasswd(multi.getParameter("passwd"));
boardVO.setSubject(multi.getParameter("subject"));
boardVO.setContent(multi.getParameter("content"));
// 글등록날짜, IP주소 값 저장
boardVO.setRegDate(new Timestamp(System.currentTimeMillis()));
boardVO.setIp(request.getRemoteAddr());
// BoardDao 객체 준비
BoardDao boardDao = BoardDao.getInstance(); 
//게시글 번호 생성하는 메소드 호출
int num = boardDao.nextBoardNum(); 
//생성된 번호를 자바빈 글번호 필드에 설정
boardVO.setNum(num);
boardVO.setReadcount(0); // 조회수 0
//주글일 경우
boardVO.setReRef(num); // [글그룹번호] 글번호와 동일함
boardVO.setReLev(0); // [들여쓰기 레벨] 0
boardVO.setReSeq(0); // [글그룹 안에서의 순서] 0
// 게시글 한개 등록하는 메소드 호출 insertBoard(boardVO)
boardDao.insertBoard(boardVO); 
//=============================게시판 글 등록 처리 종료 =================================

//=============================첨부파일 등록 처리 시작 =================================
// 업로드한 원본 파일이름 a.ppt
//String originalFileName = multi.getOriginalFileName("filename");
//System.out.println("originalFileName : " + originalFileName); 
// 실제로 업로드된 파일이름 a1.ppt
//String realFileName = multi.getFilesystemName("filename");
//System.out.println("realFileName :" + realFileName);
// Enumeration 열거형. file의 파라미터 이름들을 가짐
// 자바의 Iterator와 사용방법이 동일함
Enumeration<String> enu = multi.getFileNames(); // <String> 제네릭
while (enu.hasMoreElements()) { // 다음요소가 있으면
	String str = enu.nextElement();
	System.out.println(str);
	// 파라미터 이름으로 실제로 업로드된 파일이름 구하기
	// 업로드에 사용 안했으면 
	String realFileName = multi.getFilesystemName(str);
		if (realFileName != null) {	
			// 자바빈 attachVO 객체 생성
			AttachVO attachVO = new AttachVO(); 
			UUID uuid = UUID.randomUUID();
			attachVO.setUuid(uuid.toString());
			attachVO.setFilename(realFileName); // 실제 생성된 파일이름
			attachVO.setBno(num); // 게시글 번호
			// 업로드 
			if (realFileName != null) {	
				// 이미지 파일여부 확인
				File file = new File(realpath, realFileName);  
				String contentType = Files.probeContentType(file.toPath()); 
				boolean isImage = contentType.startsWith("image");
				if (isImage) {
					 attachVO.setFiletype("I"); // Image File
				} else {
					 attachVO.setFiletype("O"); // Other
				} 
		}
	// AttachDao 준비
	AttachDao attachDao = AttachDao.getInstance(); 
	// 첨부파일정보 한개 등록하는 메소드 호출
	attachDao.insertAttach(attachVO);
	} // 파일업로드 여부확인	
} // while
// 파일업로드 여부확인. 업로드 했으면
//=============================첨부파일 등록 처리 종료 =================================
// 이동 fnotice.jsp 
response.sendRedirect("fnotice.jsp");
%>