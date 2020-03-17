<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.cd.vo.TestTeacherVO" %>
<%@ page import="java.util.List"  %>
<%  request.setCharacterEncoding("EUC-KR");
	Object obj = request.getAttribute("list");
	String loadGrade = (String)request.getAttribute("loadGrade");
	String loadClass = (String)request.getAttribute("loadClass");
	String loadName = (String)request.getAttribute("loadName");
	List list = null;
	int listSize=0;
	TestTeacherVO ttvo = null;
	double totalCountJsp =0.0;
	int listSizeJsp2 = 0;
	double listSizeJsp = 0.0;
	int pageCount = 0;
	listSizeJsp2 = Integer.parseInt((String)request.getAttribute("listSize"));
	if(obj != null){
		list = (List<TestTeacherVO>)request.getAttribute("list");
		if(list.size()>0){
			listSize=list.size();
			ttvo = (TestTeacherVO)list.get(0);
			totalCountJsp = (double)Integer.parseInt(ttvo.getTotalCount());
			
			listSizeJsp = (double)listSizeJsp2;
			pageCount = (int)Math.ceil(totalCountJsp/listSizeJsp);
			
			
		}
	}
	out.print("꾸>>>"+listSizeJsp2);
	if(loadName==null){
		loadName="";
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript">
	
	$(function(){
			//refrash마다 학년 셀렉박스 고정

			$("#ssGrade").val("<%=loadGrade%>");

			//refrash마다 반셀렉박스 고정

			$("#ssClass").val("<%=loadClass%>");

			
			alert("선생님진로설계 메인화면");
			//refrash마다 셀렉박스 고정시키기
			$("#howmany").val("<%=listSizeJsp2%>");
			
			$("#ssName").val("<%=loadName%>");
			
			//정렬 클릭시
			$("#reFresh").click(function(){
				$("#pageNo").val("1");
				$("#listSize").val($("#howmany").val());//howmany=listSize이지만 정렬버튼이아닌 다른버튼클릭시 데려가지않기위해 구분함 
				$("#teacher_board").attr("action","/testTeacher/listStudent.ssm").submit();
			});
			
			
			//페이지번호 클릭시 이동함수
			$(".pageNo").click(function(){
			
				var ss = $(this).val();
				$("#pageNo").val(ss);
				$("#teacher_board").attr("action","/testTeacher/listStudent.ssm").submit();
				
			});
			//전체 학년 선택시 반 블럭걸기 함수
			
			
			//검색시 실행함수
			$("#choice").click(function(){
				$("#pageNo").val("1");
				$("#listSize").val($("#howmany").val())
				$("#teacher_board").attr("action","/testTeacher/listStudent.ssm").submit();
				
			});	
		
		
	});
	
	$(document).on('click', '#ssGrade', function(){
		 if($("#ssGrade").val()!=""){
			 $("#ssClass").attr("disabled",false);
		 }else{
			 $("#ssClass").val("");
			 $("#ssClass").attr("disabled",true);	 
		 }
		});
	</script>
</head>
<body>
	<form id="teacher_board">
		한페이지에
		<select id="howmany" name="howmany">
			<option value="10">10줄</option>
			<option value="20">20줄</option>
			<option value="30">30줄</option>
			<option value="50">50줄</option>
			<option value="70">70줄</option>
			<option value="100">100줄</option>			
		</select>
		<input type="button" id="reFresh" name="reFresh" value="정렬">
		학년
		<select class ="ssGrade" id="ssGrade" name="ssGrade">
			<option value="DD">전체</option>
			<option value="FM">1학년</option>
			<option value="JR">2학년</option>
			<option value="SR">3학년</option>			
		</select>
		반
		<select class ="ssClass" id="ssClass" name="ssClass">
			<option value="DD">전체</option>
			<option value="01">1반</option>
			<option value="02">2반</option>
			<option value="03">3반</option>
			<option value="04">4반</option>
			<option value="05">5반</option>			
		</select>
		이름
		<input type="text" id="ssName" name="ssName" value="">
		<input type="button" id="choice" name="choice" value="검색">
      <table border=1>
         <tr>
            <td>학번</td>
            <td>학년</td>
            <td>반</td>
            <td>이름</td>
            <td>직업적성검사</td>
            <td>직업흥미K검사</td>
            <td>직업흥미H검사</td>
            <td>직업가치관검사</td>
            <td>진로성숙도검사</td>
         </tr>
         
<%			if(obj == null){
			
			%>
			<tr>
				<td colspan ='9' align='center'>데이터가 없습니다.</td>
			</tr>
			<%	
			}		
			else {
				
				for(int i=0;i<listSize;i++){
				 ttvo = (TestTeacherVO)list.get(i); %>
				
			<tr>
            <td><%=ttvo.getSsNo() %></td>
            <td><%=ttvo.getSsGrade() %></td>
            <td><%=ttvo.getSsClass() %></td>
            <td><%=ttvo.getSsName() %></td>
            <% if(ttvo.getJa_Url()==null){ %>
            <td> 결과 없음 </td>
            <% }else{%>
            <td> <input type="button" value="결과 확인" onclick="location.href='<%=ttvo.getJa_Url()%>'"></td>
            <% } %>
            <% if(ttvo.getJi_Url()==null){ %>
            <td> 결과 없음 </td>
            <% }else{%>
            <td> <input type="button" value="결과 확인" onclick="location.href='<%=ttvo.getJi_Url()%>'"></td>
            <% } %>
            <% if(ttvo.getIh_Url()==null){ %>
            <td> 결과 없음 </td>
            <% }else{%>
            <td> <input type="button" value="결과 확인" onclick="location.href='<%=ttvo.getIh_Url()%>'"></td>
            <% } %>
            <% if(ttvo.getVa_Url()==null){ %>
            <td> 결과 없음 </td>
            <% }else{%>
            <td> <input type="button" value="결과 확인" onclick="location.href='<%=ttvo.getVa_Url()%>'"></td>
            <% } %>
            <% if(ttvo.getCm_Url()==null){ %>
            <td> 결과 없음 </td>
            <% }else{%>
            <td> <input type="button" value="결과 확인" onclick="location.href='<%=ttvo.getCm_Url()%>'"></td>
            <% } %>
             </tr>
            <%	}//for문 닫자
			}//else문 닫자%>
        
      </table>
	<input type="hidden" id="listSize" name="listSize" value="<%=listSizeJsp2 %>">
    <input type="hidden" id="pageNo" name="pageNo" value='1'>
   <%for(int i=1 ; i<=pageCount;i++){%>
			<input type="button" class="pageNo" id="pageNo2" name="pageNo2" value="<%=i%>">
	<%}
	%>
   
   </form>  
    
</body>
</html>