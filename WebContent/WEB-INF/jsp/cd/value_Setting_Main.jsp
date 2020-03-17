<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.cd.vo.Value_SettingVO,java.util.List" %>
<% request.setCharacterEncoding("EUC-KR");
	String ssNo="";
	String vsFirst="";
	String vsSecond="";
	String vsThird="";
	String isud = "";
	Value_SettingVO vsvo = new Value_SettingVO();
	Object obj = request.getAttribute("list");
	String resultStr= (String)request.getAttribute("resultStr");
	if(obj!=null&&obj!=""){
	 List list = (List)request.getAttribute("list");
	 vsvo = (Value_SettingVO)list.get(0);
	 ssNo=vsvo.getSsNo();
	 vsFirst=vsvo.getVsFirst();
	 vsSecond=vsvo.getVsSecond();
	 vsThird=vsvo.getVsThird();
	isud = "U";
	}else{
		isud = "I";
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
		alert("으앙");
		if("<%=resultStr%>" != 'null') alert("<%=resultStr%>");
		
		$("#ISUD").val("<%=isud%>");
		if("<%=vsFirst%>"=="HE") $("#select1").val("봉사");
		if("<%=vsFirst%>"=="CH") $("#select1").val("변화");
		if("<%=vsFirst%>"=="SU") $("#select1").val("성공");
		if("<%=vsFirst%>"=="LE") $("#select1").val("여가");
		if("<%=vsFirst%>"=="MN") $("#select1").val("돈");
		if("<%=vsFirst%>"=="CO") $("#select1").val("공익");
		if("<%=vsFirst%>"=="CR") $("#select1").val("창조");
		if("<%=vsFirst%>"=="KN") $("#select1").val("지식");
		
		if("<%=vsSecond%>"=="HE") $("#select2").val("봉사");
		if("<%=vsSecond%>"=="CH") $("#select2").val("변화");
		if("<%=vsSecond%>"=="SU") $("#select2").val("성공");
		if("<%=vsSecond%>"=="LE") $("#select2").val("여가");
		if("<%=vsSecond%>"=="MN") $("#select2").val("돈");
		if("<%=vsSecond%>"=="CO") $("#select2").val("공익");
		if("<%=vsSecond%>"=="CR") $("#select2").val("창조");
		if("<%=vsSecond%>"=="KN") $("#select2").val("지식");
		
		if("<%=vsThird%>"=="HE") $("#select3").val("봉사");
		if("<%=vsThird%>"=="CH") $("#select3").val("변화");
		if("<%=vsThird%>"=="SU") $("#select3").val("성공");
		if("<%=vsThird%>"=="LE") $("#select3").val("여가");
		if("<%=vsThird%>"=="MN") $("#select3").val("돈");
		if("<%=vsThird%>"=="CO") $("#select3").val("공익");
		if("<%=vsThird%>"=="CR") $("#select3").val("창조");
		if("<%=vsThird%>"=="KN") $("#select3").val("지식");
		
		$("#saveValueSetting").click(function(){
			var valueK = $("#select1").val();
			if(valueK=="봉사") var valueE = "HE";
			if(valueK=="변화") var valueE = "CH";
			if(valueK=="성공") var valueE = "SU";
			if(valueK=="여가") var valueE = "LE";
			if(valueK=="돈") var valueE = "MN";			
			if(valueK=="공익") var valueE = "CO";
			if(valueK=="창조") var valueE = "CR";
			if(valueK=="지식") var valueE = "KN";
			$("#select1").val(valueE);

			var valueK2 = $("#select2").val();
			if(valueK2=="봉사") var valueE2 = "HE";
			if(valueK2=="변화") var valueE2 = "CH";
			if(valueK2=="성공") var valueE2 = "SU";
			if(valueK2=="여가") var valueE2 = "LE";
			if(valueK2=="돈") var valueE2= "MN";			
			if(valueK2=="공익") var valueE2 = "CO";
			if(valueK2=="창조") var valueE2 = "CR";
			if(valueK2=="지식") var valueE2 = "KN";
			$("#select2").val(valueE2);
			
			var valueK3 = $("#select3").val();
			if(valueK3=="봉사") var valueE3 = "HE";
			if(valueK3=="변화") var valueE3 = "CH";
			if(valueK3=="성공") var valueE3 = "SU";
			if(valueK3=="여가") var valueE3 = "LE";
			if(valueK3=="돈") var valueE3= "MN";			
			if(valueK3=="공익") var valueE3 = "CO";
			if(valueK3=="창조") var valueE3 = "CR";
			if(valueK3=="지식") var valueE3 = "KN";
			$("#select3").val(valueE3);
			

			$("#select_Info").attr("action","/value_Setting/saveValueSetting.ssm").submit();
		});
		
		
		$("#HE").click(function(){
			//alert("봉사클릭");
			select("봉사");
		});
		$("#CH").click(function(){
			//alert("변화클릭");
			select("변화");
		});
		
		$("#SU").click(function(){
			//alert("성공클릭");
			select("성공");
		});
		
		$("#LE").click(function(){
			//alert("여가클릭");
			select("여가");
		});
		
		$("#MN").click(function(){
			//alert("돈클릭");
			select("돈");
		});
		
		$("#CO").click(function(){
			//alert("공익클릭");
			select("공익");
		});
		
		$("#CR").click(function(){
			//alert("창조클릭");
			select("창조");
		});
		
		$("#KN").click(function(){
			//alert("지식클릭");
			select("지식");
		});
		
	});
	
	function select(vs){ 
		for(var i =1 ; i<4;i++){
			if($("#select"+i).val()== vs){
				$("#select"+i).val("");
				//alert("이미 있는거임 지울게여");
				return;
			}
		}
		//alert("select함수 시작");
		if($("#select1").val()==""){
			//alert("select1널임!!");
			$("#select1").val(vs);
			//alert($('#select1').val());
			return;
		}

		if($("#select2").val()==""){
			//alert("select2널임!!");
	
			$("#select2").val(vs);
			//alert($('#select2').val());
			return;
		}
		
		if($("#select3").val()==""){
			//alert("select3널임!!");
			$("#select3").val(vs);
			//alert($('#select3').val());
			return;
		}
		
		
		
		alert("3가지이상 선택할수 없습니다");
		return;
		
		
		
					
	}
</script>

</head>
<body>

	<form id="select_Info" name="select_Info">
		<table border='1'>
			<tr>
				<td align='center'>1순위</td>
				<td align='center'>2순위</td>
				<td align='center'>3순위</td>
			</tr>
			<tr>
				<td>
					<input type="text" id="select1" name="vsFirst" readonly >
				</td>
				<td>
					<input type="text" id="select2" name="vsSecond" readonly >
				</td>		
				<td>
					<input type="text" id="select3" name="vsThird" readonly >
				</td>
			</tr>
		</table>
		<input type="hidden" id="ISUD" name="ISUD">
	</form>
	
		
	<table>
		<tr>
			<td>
				<button class="HE" type="button" id="HE" name="HE" value="봉사" ><img src="/images/HE.png"></button>
			</td>
			<td>
				<button class="CH" type="button" id="CH" name="CH" value="변화" ><img src="/images/CH.png"></button>
			</td>
			<td>
				<button class="SU" type="button" id="SU" name="SU" value="성공" ><img src="/images/SU.png"></button>
			</td>
			<td>
				<button class="LE" type="button" id="LE" name="LE" value="여가" ><img src="/images/LE.png"></button>
			</td>
		</tr>
		<tr>
			<td>
				<button class="MN" type="button" id="MN" name="MN" value="돈" ><img src="/images/MN.png"></button>
			</td>
			<td>
				<button class="CO" type="button" id="CO" name="CO" value="공익" ><img src="/images/CO.png"></button>
			</td>
			<td>
				<button class="CR" type="button" id="CR" name="CR" value="창조" ><img src="/images/CR.png"></button>
			</td>
			<td>
				<button class="KN" type="button" id="KN" name="KN" value="지식" ><img src="/images/KN.png"></button>
			</td>
		</tr>
	</table>


	


	<input type="button" id="saveValueSetting" name="saveValueSetting" value="저장하기">
	</body>
</html>