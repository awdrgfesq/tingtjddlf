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
		<style type="text/css">
					  #modal {
					    display: none; /* Hidden by default */
			            position: fixed; /* Stay in place */
			            z-index: 1; /* Sit on top */
			            left: 0;
			            top: 0;
			            width: 100%; /* Full width */
			            height: 100%; /* Full height */
			            overflow: auto; /* Enable scroll if needed */
			            background-color: rgb(0,0,0); /* Fallback color */
			            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
					}
					
					#modal h2 {
					  margin:0;   
					}
					
					#modal button {
					  display:inline-block;
					  width:100px;
					  margin-left:calc(100% - 100px - 10px);
					}
					
					#modal .modal_content {
					  width:700px;
					  margin:100px auto;
					  padding:20px 10px;
					  background:#fff;
					  border:2px solid #666;
					}
					
					#modal .modal_layer {
					  position:fixed;
					  top:0;
					  left:0;
					  width:100%;
					  height:100%;
					  background:rgba(0, 0, 0, 0.5);
					  z-index:-1;
					}   
		</style>
		<script type = "text/javascript" src= "http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript">
			$(function(){
				alert("디테일폼 오류없음");
				$("#modal_open_btn").click(function() {
		 			alert("꾸");
		 		    $("#modal").fadeIn(300); // 모달창 보여주기
		 		});
		 		  
		 		// 모달 창 안에 있는 확인 버튼에 이벤트 걸기
		 		$("#modal_closd_btn").click(function() {
		 			alert("꾸");
		 			 $("#modal").fadeOut(300); // 모달창 보여주기
		 		});	
				
		 		$("#insert").click(function(){
		 			alert("클릭");
		 			$("#modalForm").attr("action","/non_Application/non_ApplicationInsert.ssm").submit();
		 		});
		 		
		 		$("#registrationList").click(function(){
		 			var npNo=
		 			location.href=""
		 		});
			});
			
			
			function goUpdate(npNo){
				location.href="/nonprogram/updateForm.ssm?npNo="+npNo;
			}
			function goDelete(npNo){
				location.href="/nonprogram/np_Delete.ssm?npNo="+npNo;
			}
			function applicationList(npNo){
				location.href="/non_Application/applicationList.ssm?npNo="+npNo;
			}
			
		</script>
	</head>
<body>
	<form id="detailForm" name="detailForm" encType="multipart/form-data" method="POST">
		<table border='3'>
				<tr>
					<td>프로그램 제목</td>
					<td><%=npvo.getNpTitle() %></td>
				</tr>
					<tr>
					<td>프로그램 내용</td>
					<td><%=npvo.getNpContents()%></td>
				</tr>
					<tr>
					<td>운영기관</td>
					<td><%=npvo.getNpCenter() %></td>
				</tr>
					<tr>
					<td>포스터 첨부</td>
					<td><img src="/npFile/<%=npvo.getNpImage()%>" width="400" height="400"></td>
				</tr>
					<tr>
					<td>접수기한</td>
					<td><%=date1 %>~<%=date2 %></td>
				</tr>
					<tr>
					<td>프로그램 진행일</td>
					<td><%=date3 %>~<%=date4%></td>
				</tr>
					<tr>
					<td>신청대상</td>
					<td><%=npvo.getNpObject() %></td>
				</tr>
					<tr>
					<td>인원제한</td>
					<td><%=npvo.getNpPersonnel() %></td>
				</tr>
					<tr>
					<td>작성자</td>
					<td><%=npvo.getTtNo() %></td>
				</tr>
					<tr>
					<td>시행 장소</td>
					<td><%=npvo.getNpIo() %></td>
				</tr>
					<tr>
					<td>활동 종류</td>
					<td><%=npvo.getAcode()%></td>
				</tr>
				<tr>
				<td><a href="/nonprogram/downLoad.ssm?filename=<%=npvo.getNpFile()%>"><%=npvo.getNpFile()%></a></td>
				</tr>
				<tr>
				<td colspan='2' align='right'>
				<input type="button" id="teacherList" name="teacherList" value ="신청목록" onclick="applicationList('<%=npvo.getNpNo()%>')">
				<input type="button" id="update" name="update" value="수정" onclick="goUpdate('<%=npvo.getNpNo()%>')">
				<input type="button" id="delete" name="delete" value="삭제" onclick="goDelete('<%=npvo.getNpNo()%>')">
				</td>		
				</tr>
				
			</table>
		
		<input type="hidden" id="npNo" name="npNo" value="<%=npvo.getNpNo()%>">
	</form>
	
		<!--모달창임  -->
	
	<div id="modal">
		<div class="modal_content">
		<form id = "modalForm" name= "modalForm" encType="multipart/form-data" method="post">
		<h2>신청서 작성</h2>
		<table border='2'>
			<tr>
				<td>이름</td>
				<td><input type="text" id="ssName" name="ssName" value="ee" readonly></td>
				<td>이메일</td>
				<td><input type="text" id="ssEmail" name="ssEmail" value="ee" disabled></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>010-2285-4579</td>
				<td>참여 프로그램명</td>
				<td>전국널뛰기선수대회</td>
			</tr>
			<tr>
			<td colspan='4'>개인정보가 맞지 않을시 내정보 에서 수정해주세요</td> 
			</tr>
			<tr><td>신청내용</td>
				<td colspan='3'><input type="text" id="naContents" name="naContents" style="width:472px;height:250px;" ></td>
			</tr>
			<tr>
			<td colspan='4'><input type="file" id="naFile" name="naFile" ></td>
			</tr>
			<tr>
			<td colspan='4' align='right'><input type="button" id="insert" name="insert" value="신청">
			</tr>
		</table>
		<input type="hidden" id="npNo" name="npNo" value="<%=npvo.getNpNo() %>">
		<input type="hidden" id="ssNo" name="ssNo" value="S7180001">
				<input type="button" id="modal_closd_btn" name="modal_closd_btn" value="모달창닫기" >
		</form>
		</div>
	</div>
	
	<input type="button" id="modal_open_btn" name="modal_open_btn" value="신청하기"> 
</body>
</html>