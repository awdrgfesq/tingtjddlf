<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%  request.setCharacterEncoding("EUC-KR"); 
	Object obj = request.getAttribute("alert");
	String alertt = "";
	if(obj != null){
		alertt = (String)obj;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>checkForm.jsp</title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script type="text/javascript">
			$(function(){
				if("<%=alertt%>".length > 0){
					alert("<%=alertt%>");
				}
				$("#check").click(function(){
					$("#chk_form")
					.attr("action","/smember/checkInfo.ssm")
					.submit();
				});
			});
		</script>
	</head>
	<body>
		<form name="chk_form" id="chk_form" method="post">
			<table border="1" align="center">
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="ssName" id="ssName" >
					</td>
				</tr>
				<tr>	
					<th>생년월일</th>
					<td>
						<input type="text" name="ssBirth" id="ssBirth" placeholder="7자리까지 입력해주세요.">
					</td>
				</tr>
				<tr>
					<th>휴대폰번호</th>
					<td>
						<input type="text" name="ssPn" id="ssPn" placeholder="`-는 빼고 입력해주세요.">
					</td>
				</tr>
				<tr align="center" >
					<td colspan="4">
						<input type="button" name="check" id="check" value="정보확인">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>