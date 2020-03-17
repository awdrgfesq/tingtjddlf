<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List,ssm.br.vo.Non_VideoVO" %>

<%
	request.setCharacterEncoding("EUC-KR");
	List list = null;
	list = (List)request.getAttribute("list");
	Non_VideoVO nvvo = (Non_VideoVO)list.get(0);


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
		<script type = "text/javascript" src= "http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript">
			$(function(){
				alert("티모대위");
				$("#update").click(function(){
					$("#updateVideoForm").attr("action","/Non_Video/updateVideo.ssm").submit();
				})
					
				
			})
		</script>	
	</head>


	<body>
		
		<form id="updateVideoForm" name="insertVideoForm" encType="multipart/form-data" method="POST">
			<table>
				<tr>
					<td>동영상 제목</td>
					<td><input type="text" id="nvTitle" name="nvTitle" value="<%=nvvo.getNvTitle()%>"></td>
				</tr>
				<tr>
					<td>동영상 업로드</td>
					<td>
					<input type="file" id="nvVideo" name="nvVideo">
					</td>
				</tr>
				<tr>
					<td>
					<input type="button" id="update" name="update" value="수정하기">
					 <input type="button" id="back" name="back" value="뒤로가기">
					</td>
				</tr>
			</table>
			<input type="hidden" id="nvNo" name="nvNo" value="<%=nvvo.getNvNo()%>">
		</form>
	</body>
</html>