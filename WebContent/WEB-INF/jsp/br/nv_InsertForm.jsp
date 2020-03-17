<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
		<script type = "text/javascript" src= "http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript">
			$(function(){
				alert("동영상작성쓰");
				$("#insert").click(function(){
					$("#insertVideoForm").attr("action","/Non_Video/insertVideo.ssm").submit();
				});
				$("#back").click(function(){
					history.go(-1);
				});
				
			});
		</script>
	</head>
	<body>
		<form id="insertVideoForm" name="insertVideoForm" encType="multipart/form-data" method="POST">
			<table>
				<tr>
					<td>동영상 제목</td>
					<td><input type="text" id="nvTitle" name="nvTitle"></td>
				</tr>
				<tr>
					<td>동영상 업로드</td>
					<td>
					<input type="file" id="nvVideo" name="nvVideo">
					</td>
				</tr>
					
				<tr>
				<td align="right">
						<input type="button" id="insert" name="insert" value="게시하기">
						 <input type="button" id="back" name="back" value="뒤로가기">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>