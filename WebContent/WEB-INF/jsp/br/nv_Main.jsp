<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List,ssm.br.vo.Non_VideoVO" %>
<%
	System.out.println("response.getCharacterEncoding() > "+response.getCharacterEncoding());
	System.out.println("response.getContentType() >>> "+response.getContentType());
	response.setCharacterEncoding("EUC-KR");
	request.setCharacterEncoding("EUC-KR");
	Object obj = request.getAttribute("list");
	List list = null;
	Non_VideoVO nvvo = null;
	if(obj != null && obj !=""){
		list = (List)obj;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
		<script type = "text/javascript" src= "http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#detail").hide();
				
				$("#goinsert").click(function(){
					location.href="/Non_Video/goInsertForm.ssm";
				});
				
				$("#godelete").click(function(){
					$("#videoForm").attr("action","/Non_Video/deleteVideo.ssm").submit();
				});
				$("#goupdate").click(function(){
					$("#videoForm").attr("action","/Non_Video/goUpdateVideo.ssm").submit();
				});

			});
			function getVideo(data,nvNo,title,ttno,insertDate,updateDate,likes,views){
				alert("data>>>"+data);
				$("#nvNo").val(nvNo);
				$("#videoView").attr("src","/video/"+data);
				$("#videoOO").load();
				$("#detail").show();
				$("#nvNo").val(nvNo);
				$("#nvTitle").val(title);
				$("#ttNo").val(ttno);
				$("#nvInsertdate").val(insertDate);
				$("#nvUpdatedate").val(updateDate);
				$("#nvViews").val(views);
				$("#nvLikes").val(likes);
				
				
				
					
			}
		</script>
		<style>
 			#leftcol { overflow:auto;
 						height:570px;
 						float: left; 
					    width: 230px; 
					    padding-bottom: 50px; 
					}	
			#box2 { width:900px;
			      	height:600px;
			      	background;
			      	border: 5px solid ;
			      	float:left;
			      	margin:10px;
			      	font-size:60px;
			    	
					}
			 li a{	    float: left;
							    height: 31px;
							    width: 138px;
							    padding: 17px 0 0 16px;
							    border: solid 1px #e6e6e6;
								text-decoration: none;
							    font-size: 12px;
							    color: #555555;
							    font-family: 'NanumGothicBoldWeb';
							    text-align: center;
							}	
 			li {	 
 				overflow: hidden;
 				display: inline;
			}			 
			.imbox2ul{
					 margin-top: 0px; 
					 margin-bottom: 0px;					
				    padding-left: 0px;

			}
		</style>

	</head>
	<body>
	<form id="videoForm" name="videoForm">
		<input type="hidden" id="nvNo" name="nvNo">
	</form>
	<div id="leftcol">
		<ul>
			
			<%

			if(list==null){
				%>
			<li><a href="#"> 동영상이 없습니다</a></li>
				<%
			}else{
				for(int i=0;i<list.size();i++){
					nvvo=(Non_VideoVO)list.get(i);
				%>
			<li><a id="nvNoInput" name="nvNoinput" href="javascript:getVideo('<%=nvvo.getNvVideo()%>','<%=nvvo.getNvNo() %>','<%=nvvo.getNvTitle()%>','<%=nvvo.getTtNo()%>','<%=nvvo.getNvInsertdate()%>','<%=nvvo.getNvUpdatedate()%>','<%=nvvo.getNvLikes()%>','<%=nvvo.getNvViews()%>')"><%=nvvo.getNvTitle()%></a></li>
				<%
				}
			}
				%>
		</ul>
	</div>
	<div id="box2">
		<ul class="imbox2ul">
			<video id = "videoOO" width="900" height="600" style=" margin-top: 0px; margin-bottom: 0px;" controls>
		 		<source id="videoView" type="video/mp4" />
			</video>
		</ul>
	
	
			
		   
	</div>
	<div id="detail">
		<table>
			<tr>
				<td>글번호</td>
				<td><input type="text" id="nvNo" name="nvNo" disabled></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" id="nvTitle" name="nvTitle" disabled></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" id="ttNo" name="ttNo" disabled></td>
			</tr>
			<tr>
				<td>게시일</td>
				<td><input type="text" id="nvInsertdate" name="nvInsertdate" disabled></td>
			</tr>
			<tr>
				<td>최근 수정일</td>
				<td><input type="text" id="nvUpdatedate" name="nvUpdatedate" disabled></td>
			</tr>
			<tr>
				<td>조회수</td>
				<td><input type="text" id="nvViews" name="nvViews" disabled></td>
			</tr>
			<tr>
				<td>추천수</td>
				<td><input type="text" id="nvLikes" name="nvLikes" disabled></td>
			</tr>
			<tr>
				<td>
					<input type="button" id="godelete" name="godelete" value="삭제">
					<input type="button" id="goupdate" name="goupdate" value="수정">
				</td>
			</tr>
		</table>
	</div>
	<input type="button" id="goinsert" name="goinsert" value="글쓰기">
	</body>
</html>