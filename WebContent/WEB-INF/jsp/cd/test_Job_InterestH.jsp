<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List" %>
<%@ page import="ssm.mi.member.vo.*" %>
<%
   request.setCharacterEncoding("EUC-KR");
   Object obj      = null;
   List list       = null;
   String ssNo     = "";
   String ssName   = "";
   String ssEmail  = "";
   String schName  = "비트고등학교";
   String ssGender = "";
   String ssGrade  = "";
   String trgetSe  = "100207";
   obj = request.getAttribute("list");
   
   if(obj != null){
      list = (List)obj;
      if(list.size() > 0){
         SMemberVO svo = (SMemberVO)list.get(0);
         ssNo     = svo.getSsNo();
         ssName   = svo.getSsName();
         ssEmail  = svo.getSsEmail();
         ssGender = svo.getSsGender();
         ssGrade  = svo.getSsGrade();
         if(ssGender.equals("7")){
            ssGender = "100324";
         }else{
            ssGender = "100323";
         }
         if(ssGrade.equals("FM")){
            ssGrade = "1";
         }else if(ssGrade.equals("JR")){
            ssGrade = "2";
         }else{
            ssGrade = "3";
         }
      }else{
         
      }
   }else{
      
   }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type = "text/javascript"
			src= "http://
			code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/include/js/tag.js"></script>
<script type="text/javascript" src="/include/js/val_check.js"></script>
<style>
		select {
		width: 200px;
		padding: .8em .5em;
		border: 1px solid #999;
		font-family: inherit;
		background: url('/images/down.jpg') no-repeat 95% 50%;
		border-radius: 0px;
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;
		}
		
		select::-ms-expand {
		    display: none;
		}

</style>
</head>
<body>
	

		<form id="outQuestion">
		<table border="1" align="center" id="aaa">
			
		
			<script type="text/javascript">
			
	$(document).ready(function(){
	
		function oneCheckbox(a){

	        var obj = document.getElementsByName("anwser");

	        for(var i=0; i<obj.length; i++){

	            if(obj[i] != a){

	                obj[i].checked = false;
	            }
	        }
	    }
		alert("이상없음");	
	  

	var data
	alert("버튼클릭");
	$.ajax({
		type:"GET",//방식 get put delete있음
		headers:{"Content-Type":"application/json"}, 
		url: "http://inspct.career.go.kr/openapi/test/questions?apikey=961f47ce54cb960e4f6929a39c6b83dc&q=18",//데이터 보낼url
			     
		success : function(data){
			console.log(data);
			
			for(var i=0 ;i<data.RESULT.length ; i++){
				
				var qNo = data.RESULT[i].qitemNo;
				
				var an01 =  data.RESULT[i].answer01;
				var an02 =  data.RESULT[i].answer02;
				var an03 =  data.RESULT[i].answer03;
				var an04 =  data.RESULT[i].answer04;
				var an05 =  data.RESULT[i].answer05;
				var an06 =  data.RESULT[i].answer06;
				var an07 =  data.RESULT[i].answer07;
				var aval01 =  data.RESULT[i].answerScore01;
				var aval02 =  data.RESULT[i].answerScore02;
				var aval03 =  data.RESULT[i].answerScore03;
				var aval04 =  data.RESULT[i].answerScore04;
				var aval05 =  data.RESULT[i].answerScore05;
				var aval06 =  data.RESULT[i].answerScore06;
				var aval07 =  data.RESULT[i].answerScore07;
				if(an01 != null){
					
					var ar01 = "<input type='radio' id='"+qNo+"' name='"+(i+1)+"' class='"+qNo+"' value = '"+aval01+"' checked>"+an01;
				}else{
					var ar01 = "";
				}
				
				if(an02 != null){
					var ar02 = "<input type='radio' id='"+qNo+"' name='"+(i+1)+"' class='"+qNo+"' value = '"+aval02+"'>"+an02;
				}else{
					var ar02 = "";
				}
				
				if(an03 != null){
					var ar03 = "<input type='radio' id='"+qNo+"' name='"+(i+1)+"' class='"+qNo+"' value = '"+aval03+"'>"+an03;
				}else{
					var ar03 = "";
				}
				
				if(an04 != null){
					var ar04 = "<input type='radio' id='"+qNo+"' name='"+(i+1)+"' class='"+qNo+"' value = '"+aval04+"'>"+an04;
				}else{
					var ar04 = "";
				}
				
				if(an05 != null){
					var ar05 = "<input type='radio' id='"+qNo+"' name='"+(i+1)+"' class='"+qNo+"' value = '"+aval05+"'>"+an05;
				}else{
					var ar05 = "";
				}
				
				if(an06 != null){
					var ar06 = "<input type='radio' id='"+qNo+"' name='"+(i+1)+"' class='"+qNo+"' value = '"+aval06+"'>"+an06;
				}else{
					var ar06 = "";
				}
				
				if(an07 != null){
					var ar07 = "<input type='radio' id='"+qNo+"' name='"+(i+1)+"' class='"+qNo+"' value = '"+aval07+"'>"+an07;
				}else{
					var ar07 = "";
				}
				var massage = "";
				massage = data.RESULT[i].question;
				
				if(massage.split('.').length >= 4){
					massage =  massage.split('.');
					massage = massage[0]+"."+"<br>&nbsp;&nbsp;&nbsp;&nbsp;"+massage[1]+"."+"<br>&nbsp;&nbsp;&nbsp;&nbsp;"+massage[2]+".";
						
				}
				if(massage.split('.').length >= 3 && massage.split('.').length < 4){
					massage =  massage.split('.');
					massage = massage[0]+"."+"<br>&nbsp;&nbsp;&nbsp;&nbsp;"+massage[1]+".";
						
				}
				
				
				if(qNo==146 || qNo == 145){
					
					var selop = tag(qNo);
					var ss = $("<div>");
					ss.attr({"id" : "qwe"+qNo});
					ss.append(i+1+".").append("<strong>"+massage+"</strong>"+"<br>").append(selop+"<br><hr>");
					$("#aaa").append(ss);
					
				}else if(qNo == 151){
					var ar01 = "<input type='radio' id='"+qNo+"' name='"+(i+1)+"' class='"+qNo+"' value = '"+aval01+"'>"+"매우 불만족";
					var ar02 = "<input type='radio' id='"+qNo+"' name='"+(i+1)+"' class='"+qNo+"' value = '"+aval02+"'>"+"불만족";
					var ar03 = "<input type='radio' id='"+qNo+"' name='"+(i+1)+"' class='"+qNo+"' value = '"+aval03+"'>"+"보통";
					var ar04 = "<input type='radio' id='"+qNo+"' name='"+(i+1)+"' class='"+qNo+"' value = '"+aval04+"'>"+"만족";
					var ar05 = "<input type='radio' id='"+qNo+"' name='"+(i+1)+"' class='"+qNo+"' value = '"+aval05+"'>"+"매우 만족";
					var ss = $("<div>");
					ss.attr({"id" : "qwe"+qNo});
					ss.append(i+1+".")
					.append("<strong>"+massage+"</strong>"+"<br>")
					.append(ar01+ar02+ar03+ar04+ar05+ar06+ar07+"<br><hr>");
					$("#aaa").append(ss);
				}else if(qNo==149 || qNo == 148){
					var selop = tag2(qNo);
					var ss = $("<div>");
					ss.attr({"id" : "qwe"+qNo});
					ss.append(i+1+".").append("<strong>"+massage+"</strong>"+"<br>").append(selop+"<br><hr>");
					$("#aaa").append(ss);
				}else{
					var ss = $("<div>");
					ss.attr({"id" : "qwe"+qNo});
					ss.append(i+1+".")
					.append("<strong>"+massage+"</strong>"+"<br>")
					.append(ar01+ar02+ar03+ar04+ar05+ar06+ar07+"<br><hr>");
					$("#aaa").append(ss);
				}
			}
			var ss22 = Number(1);
			defaultPage(ss22);
			$('.146').attr("disabled",true);
			$('.145').attr("disabled",true);
		},
		
		error : function(e){
			console.log(e);
		}
	
		});
	
		$(document).on('click', '#141', function(){
			 if($("input:radio[id=141]:checked").val()=='2'){
				 $(".140").attr("disabled",true);
				 $(".140").attr("checked",false);
			 }else{
				 $(".140").attr("disabled",false);	 
			 }
		});
		$(document).on('click', '#146', function(){
			 if($("#146").val()=='etc'){
				 $(".146").attr("disabled",false);
			 }else{
				 $("input:text[class=146]").val("");
				 $(".146").attr("disabled",true);	 
			 }
		});
		$(document).on('click', '#145', function(){
			 if($("#145").val()=='etc'){
				 $(".145").attr("disabled",false);
			 }else{
				 $("input:text[class=145]").val("");
				 $(".145").attr("disabled",true);	 
			 }
		});
		/*
		$("#141").click(function(){
			  alert("s");
			console.log('.................');
		 	     
		});
		*/
	

		$("#next").click(function() {
			var page = $("#page").val();
			
			var bool = validation(page);
			if(bool){
				$("#page").attr("value",(Number(page)+1));
				page2 = $("#page").val();
				if(page2>8){
					var page = $("#page").val();
					alert("마지막 페이지입니다.");
					$("#page").attr("value",(Number(page)-1));
					alert($("#page").val());
				}else{
					alert($("#page").val());
					defaultPage(page2);  	
				}
			}else{
				
			}
			
			
			return bool;
		});
		
		$("#prev").click(function() {
			var page = $("#page").val();
			$("#page").attr("value",(Number(page)-1));
			
			page2 = $("#page").val();
			if(page2 < 1){
				var page = $("#page").val();
				alert("첫 페이지입니다.");
				$("#page").attr("value",(Number(page)+1));
				alert($("#page").val());
			}else{
				alert($("#page").val());
				defaultPage(page2);
			}
			
			
		});
	
	
	$("#send").click(function() {
		alert("버튼클릭");
		var a = sendAnswer();
		$.ajax({
			type:"POST",//방식 get put delete있음
			headers:{"Content-Type":"application/json"}, 
			url: "http://inspct.career.go.kr/openapi/test/report",//데이터 보낼url
			
			data : JSON.stringify({ "apikey": "961f47ce54cb960e4f6929a39c6b83dc",//인증키
				     "qestrnSeq": "18",//검사번호 4직업흥미검사(k) 18직업흥미검사(h), 직업적성검사 고등학생 21
				     "trgetSe": "100207",//검시자타입 100205 초딩,110206 중딩,100207 고딩,100208 학식
				     "name": " <%=ssName %>",//이름
				     "gender": "<%=ssGender %>",//성별
				     "school": "<%=schName %>",//학교명
				     "grade": "<%=ssGrade %>",//학년
				     "email" : "<%=ssEmail %>",//이메일
				     "startDtm": "1550466291034",//날짜(기준을모르겠음)
				     "answers": a
				     }),
				     
			success : function(data){
				console.log(data);
				alert(data.RESULT.url);
				console.log(data.RESULT.url);
				//location.href=data.RESULT.url;
				
				//새차엥 결과물 출력함수
				//window.open("","pop","width=1000,height=1000");
				
				//$("#def")
				//.attr("action", data.RESULT.url)
				//.attr("target","pop")
				//.submit();
				alert("성공");
				//var url = data.RESULT.url;
				//$("#cdUrl").attr("value",url);
				//$("#def").attr("action","/career_Design/jobAptitudeInsert.ssm").submit();
				

				var url = data.RESULT.url;
				$("#cdUrl").attr("value",url);
				$("#ssNo").val("<%=ssNo%>");
				$("#cdGrade").val("<%=ssGrade%>");
				$("#def").attr("action","/test/jobAptitudeInsert.ssm").submit();

			},
			
			error : function(){
				alert("에러떳어용");
				console.log(e);
			}
		
			})
			
		});
	
	});

	function sendAnswer(){
			
			var answer = "";
			var id = "";
			var val = "";
			for(var i=1;i<=161;i++){
				id=$('#'+i).attr('id');
				val = $('input[id='+i+']:checked').val();
				if($('input[id='+i+']:checked').val() == null || $('input[id='+i+']:checked').val() == ""){
					val = $('#'+i).val();
					if($('#'+i).val() == "etc"){
						val = $('.'+i).val();
					}
				}
				str = id+"="+val+" ";
				answer += str;
			}
			console.log(answer);
		return answer;
	}
	
	function defaultPage(data){
		alert("이이잉앗살라말라이굼");
		var sta = 0;
		var end = 0;
		if(data==1){sta = Number(1); end = Number(20);}
		if(data==2){sta = Number(21); end = Number(40);}	
		if(data==3){sta = Number(41); end = Number(50);}
		if(data==4){sta = Number(51); end = Number(70);}
		if(data==5){sta = Number(71); end = Number(90);}
		if(data==6){sta = Number(91); end = Number(110);}
		if(data==7){sta = Number(111); end = Number(130);}
		if(data==8){sta = Number(131); end = Number(161);}
		
		for(var i=1;i<=161;i++){
			$("#qwe"+i).hide();	
		}
		for(var i=sta;i<=end;i++){
			$("#qwe"+i).show();	
		}
	}
	
	function goMain(){
		location.href="/career_Design/goMainPage.ssm";
	}
	
	function validation(data){
		var sta = 0;
		var end = 0;
		var bool = false;
		if(data==1){sta = Number(1); end = Number(20);}
		if(data==2){sta = Number(21); end = Number(40);}	
		if(data==3){sta = Number(41); end = Number(50);}
		if(data==4){sta = Number(51); end = Number(70);}
		if(data==5){sta = Number(71); end = Number(90);}
		if(data==6){sta = Number(91); end = Number(110);}
		if(data==7){sta = Number(111); end = Number(130);}
		if(data==8){sta = Number(131); end = Number(161);}
			var id = "";
			var val = "";
			var divId = "";
			for(var i=sta;i<=end;i++){
				val = $('input[name='+i+']:checked').val();
				bool = val_check(val,i);
				if(bool){
					bool = true;
				}else{
					bool = false;
					break;
				} 
			}
			
		    return bool;
		
	}
	</script>
			
		</table>
			<table align="center">
				<tr>
					<td>

						<input type="hidden" id="page" name="page"  value="1">
						<input type="button" id="prev" name="prev"  value="이전페이지">
						<input type="button" id="send" name="send"  value="보내기">
						<input type="button" id="next" name="next"  value="다음페이지">
						<input type="button" value="goMain" onclick="goMain()">
					</td>
				</tr>
			</table>
	</form>



			<form name="def" id="def" method='POST'>
				<input type="hidden" id="cdValue" name="cdValue" value="IH">
				<input type="hidden" id="cdGrade" name="cdGrade">
				<input type="hidden" name="ssNo" id="ssNo">
				<input type="hidden" id="cdUrl"  name="cdUrl">
			</form>
</body>
</html>