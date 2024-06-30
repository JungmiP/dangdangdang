<%@page import="kr.ac.kopo.board.vo.BoardFileVO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="kr.ac.kopo.util.KopoFileNamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
 	// 1. 인코딩 후 파라미터 추출
 	// POST 방식일 땐 characterset 인코딩 필요
 	request.setCharacterEncoding("utf-8");
 	// 저장 폴더는 서버 안에 있어야함!
 	String saveDirectory = "C:/Lecture/web-workspace/Mission-WEB/src/main/webapp/upload";
 	
 	//cos.jar 매직넘버 형태로 넘어오는 파라미터 파싱을 위해 필요
 	MultipartRequest multi = new MultipartRequest(
 			request, saveDirectory, 1024*1024*3, "utf-8", new KopoFileNamePolicy());
	
 	
 	String title = multi.getParameter("title");
 	String writer = multi.getParameter("writer");
 	String content = multi.getParameter("content");
 	
 	// 2-1. 게시글(t_board) 저장 
 	
 	
 	BoardVO board = new BoardVO();
 	board.setTitle(title);
 	board.setWriter(writer);
 	board.setContent(content);
 	
 	BoardDAO boardDao = new BoardDAO();
 	
 	// 게시글 번호 추출(seq_t_board_no)
 	int no = boardDao.selectNo();
 	board.setNo(no);
 	
 	boardDao.insertBoard(board);
 	
 	
 	// 2-2. t_board_file(첨부파일) 테이블에 저장
 	
 	Enumeration<String> files = multi.getFileNames();
 	while(files.hasMoreElements()){
 		String fileName = files.nextElement();
 		File f = multi.getFile(fileName);
 		if(f != null){
 			String fileOriName = multi.getOriginalFileName(fileName);
 			String fileSaveName = multi.getFilesystemName(fileName);
 			long fileSize = f.length();
 			
 			BoardFileVO fileVO = new BoardFileVO();
 			fileVO.setFileOriName(fileOriName);
 			fileVO.setFileSaveName(fileSaveName);
 			fileVO.setFileSize(fileSize);
 			fileVO.setBoardNo(no);
 			
 			// t_board_file 저장
 			boardDao.insertBoardFile(fileVO);
 		} 		
 	}
 	
 	
 %>

<script>
	// 3단계
	alert('새 글 등록을 완료하였습니다.')
	location.href = "list2.jsp"
</script>







<%-- 입력 받는 페이지 --%>


<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Mission-WEB/resources/css/layout.css">
<link rel="stylesheet" href="/Mission-WEB/resources/css/table.css">
<script>
	if("${ userVO.id}" == ''){
		location.href = '/Mission-WEB/login/login.jsp'
	}
	
	let isNull = function(obj, msg){
		if(obj.value == ''){
			alert(msg)
			obj.focus()
			return true
		}
		return false
	}
	
	let checkExt = function (obj) {
		let forbidName = ['exe', 'bat', 'java', 'class', 'jsp']
		let fileName = obj.value
		let ext = fileName.substring(fileName.lastIndexOf('.') + 1)
		for(let forbid of forbidName) {
			if(forbid == ext){
				alert(ext + ' 확장자는 파일 업로드 정책에 위배됩니다.')
				return true
			}
		}
		return false
	}
	
	let checkForm = function(){
		let f = document.inputForm
		
		if(isNull(f.title, '제목을 입력해주세요')){
			return false
		}
		
		/*
		if(isNull(f.writer, '작성자를 입력해주세요')){
			return false
		}
		*/
		
		if(isNull(f.content, '내용을 입력해주세요')){
			return false
		}
		
		//파일 확장자 체크
		if(checkExt(f.attachfile1)){
			return false			
		}
		
		if(checkExt(f.attachfile2)){
			return false
		}
		
		return true
	}
	
</script>
</head>
<body>
	<header>
		<jsp:include page="/include/topMenu.jsp" />
	</header>
	<section>
		<div align="center">
		<hr>
		<h2>새 글 등록</h2>
		<hr>
		<form name="inputForm" action="write.jsp" method="post" onsubmit="return checkForm()"
			  enctype="multipart/form-data">
			  <!-- enctype="multipart/form-data" 파라미터를 매직넘버 형태로 변환후 바이트스트림으로 전달  -->
			<input type="hidden" name="writer" value="${ userVO.id }">
			<table style="width: 100%" border="1">
				<tr>
					<th width="25%">제목</th>
					<td>
						<input type="text" name="title" size="80">
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>
						<c:out value="${ userVO.id }" />
						<%-- 
						<input type="text" name="writer" size="80" value="${ userVO.id }" readonly>
						--%>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="7" cols="80" name="content"></textarea>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<input type="file" name="attachfile1"><br>
						<input type="file" name="attachfile2"><br>
					</td>
				</tr>
			</table>
			<br>
			<button type="submit">등 록 </button>
		</form>
	</div>
	</section>
	<footer>
		<%@ include file="/include/footer.jsp" %>
	</footer>
</body>
</html>





<%-- DAO --%>


	// 첨부파일(t_board_file) CRUD 기능클래스
	
	/**
	 * 첨부 파일 테이블(t_board_file) 데이터 삽입
	 * @param fileVO 저장할 파일 데이터
	 * */
	public void insertBoardFile(BoardFileVO fileVO) {
		StringBuilder sql = new StringBuilder();
		sql.append(" insert into t_board_file ");
		sql.append(" values(seq_t_board_file_no.nextval, ?, ?, ?, ?) ");
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			int loc = 1;
			pstmt.setInt(loc++, fileVO.getBoardNo());
			pstmt.setString(loc++, fileVO.getFileOriName());
			pstmt.setString(loc++, fileVO.getFileSaveName());
			pstmt.setLong(loc++, fileVO.getFileSize());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/** 
	게시글 번호에 해당하는 첨부파일 조회
	@param boardNo 게시글 번호
	@return boardFileVO 리스트 
	*/
	
	public List<BoardFileVO> selectFileByNo (int boardNo) {
		List<BoardFileVO> fileList = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append(" select no, file_ori_name, file_save_name, file_size ");
		sql.append(" from t_board_file ");
		sql.append(" where board_no = ? ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setInt(1, boardNo);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardFileVO boardFile = new BoardFileVO();
				boardFile.setNo(rs.getInt("no"));
				boardFile.setFileOriName(rs.getString("file_ori_name"));
				boardFile.setFileSaveName(rs.getString("file_save_name"));
				boardFile.setFileSize(rs.getLong("file_size"));
				
				fileList.add(boardFile);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return fileList;
	}
	
