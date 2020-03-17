<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.br.vo.Non_ProgramVO" %>
<%@ page import="java.util.List"  %>
<%@ page import="java.util.Date"  %>
<%@ page import="java.text.SimpleDateFormat"%>
<%  request.setCharacterEncoding("EUC-KR");
	Object obj = request.getAttribute("list");
	List list = null;
	Non_ProgramVO npvo =null;
	String date1="";
	String date2="";
	String date3="";
	String date4="";
	if(obj!=null){
		list = (List)obj;
		npvo = (Non_ProgramVO)list.get(0);
		Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(npvo.getNpRsdate());
		date1 = new SimpleDateFormat("yyyy-MM-dd").format(date);
		Date date11 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(npvo.getNpRedate());
		date2 = new SimpleDateFormat("yyyy-MM-dd").format(date11);
		Date date22 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(npvo.getNpPsdate());
		date3 = new SimpleDateFormat("yyyy-MM-dd").format(date22);
		Date date33 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(npvo.getNpPedate());
		date4 = new SimpleDateFormat("yyyy-MM-dd").format(date33);
	}
	


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>세부정보</title>
		<script type = "text/javascript" src= "http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript">
			$(function(){
				alert("업데이트폼 오류없음");
				$("#npIo").val("<%=npvo.getNpIo()%>");
				$("#Acode").val("<%=npvo.getAcode()%>");
				
				$("#update").click(function(){

					alert("이미지>"+$("#npImage").val());
					$("#detailForm").attr("action","/nonprogram/np_DetailUpdate.ssm").submit()
				})
					
			});
		</script>
	</head>
<body>
	<form id="detailForm" name="detailForm" encType="multipart/form-data" method="POST">
	
		<table border='3'>
				<tr>
					<td>프로그램 제목</td>
					<td><input type="text" id="npTitle" name="npTitle" value="<%=npvo.getNpTitle() %>"></td>
				</tr>
					<tr>
					<td>프로그램 내용</td>
					<td><input type="text" id="npContents" name="npContents" value="<%=npvo.getNpContents() %>"></td>
				</tr>
					<tr>
					<td>운영기관</td>
					<td><input type="text" id="npCenter" name="npCenter" value="<%= npvo.getNpCenter()%>"></td>
				</tr>
					<tr>
					<td>이미지 교체</td>
					<td><input type="file" id="NEW_npImage" name="NEW_npImage"><td>
				</tr>
					<tr>
					<td>접수기한</td>
					<td><input type="text" id="npRsdate" name="npRsdate" value="<%=date1%>">~
						<input type="text" id="npRedate" name="npRedate" value="<%=date2 %>"></td>
				</tr>
					<tr>
					<td>프로그램 진행일</td>
					<td><input type="text" id="npPsdate" name="npPsdate" value="<%=date3 %>">~
						<input type="text" id="npPedate" name="npPedate" value="<%=date4 %>"></td>
				</tr>
					<tr>
					<td>신청대상</td>
					<td><input type="text" id="npObject" name="npObject" value="<%=npvo.getNpObject() %>"></td>
				</tr>
					<tr>
					<td>인원제한</td>
					<td><input type="text" id="npPersonnel" name="npPersonnel" value="<%=npvo.getNpPersonnel() %>"></td>
				</tr>
					<tr>
					<td>작성자</td>
					<td></td>
				</tr>
					<tr>
					<td>시행 장소</td>
					<td><select id="npIo" name="npIo">
						<option value="I">교내</option>
						<option value="O">교외</option>
						</select>
					</td>
				</tr>
					<tr>
					<td>활동 종류</td>
					<td><select id="Acode" name="Acode">
						<option value="SA">자율</option>
						<option value="CA">동아리</option>
						<option value="VA">봉사</option>
						<option value="DA">진로</option>
						</select></td>
				</tr>
				<tr>
				<td colspan='2' align='right'>
				<input type="button" id="update" name="update" value="수정" >
				</td>		
				</tr>
			</table>
		<input type="hidden" id="npImage" name="npImage" value="<%= npvo.getNpImage()%>">
		<input type="hidden" id="npNo" name="npNo" value="<%=npvo.getNpNo()%>">
	</form>
</body>
</html>