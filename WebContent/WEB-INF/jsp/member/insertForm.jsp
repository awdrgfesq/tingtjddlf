<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.mi.member.vo.SMemberVO" %>
<%@ page import="ssm.mi.member.vo.SMemberGrVO" %>
<%  request.setCharacterEncoding("EUC-KR"); %>
<%
	/*String grClass   = "";
	String grNum     = "";
	String grTeacher = "";
	Object obj = request.getAttribute("fm");
	Object obj2 = request.getAttribute("jr");
	Object obj3 = request.getAttribute("sr");
	if(obj != null){
		SMemberGrVO smgvo = (SMemberGrVO)request.getAttribute("fm");
		grClass   = smgvo.getFmClass();   // 반
		grNum     = smgvo.getFmNum();     // 번호
		grTeacher = smgvo.getFmTeacher(); // 담임선생님 이름
	}
	if(obj2 != null){
		SMemberGrVO smgvo = (SMemberGrVO)request.getAttribute("jr");
		grClass   = smgvo.getJrClass();   // 반
		grNum     = smgvo.getJrNum();     // 번호
		grTeacher = smgvo.getJrTeacher(); // 담임선생님 이름
	}
	if(obj3 != null){
		SMemberGrVO smgvo = (SMemberGrVO)request.getAttribute("sr");
		grClass   = smgvo.getSrClass();   // 반
		grNum     = smgvo.getSrNum();     // 번호
		grTeacher = smgvo.getSrTeacher(); // 담임선생님 이름
	}*/
	
	SMemberVO smvo     = (SMemberVO)request.getAttribute("data");
	String    ssNo     = smvo.getSsNo();         // 학번
	String    ssBirth  = smvo.getSsBirth();      // 생년월일
	String    ssPn     = smvo.getSsPn();         // 휴대폰번호
	String    ssName   = smvo.getSsName();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>InsertForm.jsp(회원가입)</title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script type="text/javascript">
			$(function(){
				
				$("#insert").click(function(){
					/*var form = $("#i_form")[0];
					var formData = new FormData(form);
					formData.append("file",$("#ssImage").val());
					formData.append("text",$("#ssNo").val());
					$.ajax({
						url : "/smember/fileUpload.ssm",
						processData : false,
                        contentType : false,
						type : "post",
						data : formData,
						success : function(result){
							console.log("success");
						},
						error : function(){
							console.log("error");
						}
					});*/
					
					$("#i_form")
					.attr("action","/smember/insertInfo.ssm")
					.submit();
					
				});
				
			});
		</script>
	</head>
	<body>
		<form name="i_form" id="i_form" encType="multipart/form-data" method="post">
			<input type="hidden" name="ssNo" id="ssNo" value="<%=ssNo%>">
			<input type="hidden" name="ssGender" id="ssGender" value="7">
			<table border="1" align="center">
				<tr>
					<td>사진</td>
					<td><input type="file" id="ssImage" name="ssImage"></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" id="ssId" name="ssId">
						<input type="button" value="중복확인">
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" id="ssPw" name="ssPw"></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" id="ssPw2" name="ssPw2"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><%=ssName%></td>				 
				</tr>
				<tr>
					<td>생년월일</td>
					<td><%=ssBirth%></td>
				</tr>
				<tr>
					<td>휴대폰번호</td>
					<td><%=ssPn %></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input type="text" name="ssEmail" id="ssEmail">
						<select name="ssEmail2" id="ssEmail2">
							<option>직접입력</option>
							<option value="@gmail.com">@gmail.com</option>
							<option value="@naver.com">@naver.com</option>
							<option value="@daum.net">@daum.net</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>학년,반,번호</td>
					<td>
						<select name="grGrade" id="grGrade">
							<option value="FM">1학년</option>
							<option value="JR">2학년</option>
							<option value="SR">3학년</option>
						</select>
						<select name="grClass" id="grClass">
							<option value="01">1반</option>
							<option value="02">2반</option>
							<option value="03">3반</option>
							<option value="04">4반</option>
							<option value="05">5반</option>
							<option value="06">6반</option>
							<option value="07">7반</option>
							<option value="08">8반</option>
							<option value="09">9반</option>
							<option value="10">10반</option>
							<option value="11">11반</option>
							<option value="12">12반</option>
						</select>
						<select name="grNum" id="grNum">
							<option value=01>1번</option>
							<option value=02>2번</option>
							<option value=03>3번</option>
							<option value=04>4번</option>
							<option value=05>5번</option>
							<option value=06>6번</option>
							<option value=07>7번</option>
							<option value=08>8번</option>
							<option value=09>9번</option>
							<option value=10>10번</option>
							<option value=11>11번</option>
							<option value=12>12번</option>
							<option value=13>13번</option>
							<option value=14>14번</option>
							<option value=15>15번</option>
							<option value=16>16번</option>
							<option value=17>17번</option>
							<option value=18>18번</option>
							<option value=19>19번</option>
							<option value=20>20번</option>
							<option value=21>21번</option>
							<option value=22>22번</option>
							<option value=23>23번</option>
							<option value=24>24번</option>
							<option value=25>25번</option>
							<option value=26>26번</option>
							<option value=27>27번</option>
							<option value=28>28번</option>
							<option value=29>29번</option>
							<option value=30>30번</option>
							<option value=31>31번</option>
							<option value=32>32번</option>
							<option value=33>33번</option>
							<option value=34>34번</option>
							<option value=35>35번</option>
							<option value=36>36번</option>
							<option value=37>37번</option>
							<option value=38>38번</option>
							<option value=39>39번</option>
							<option value=40>40번</option>
							<option value=41>41번</option>
							<option value=42>42번</option>
							<option value=43>43번</option>
							<option value=44>44번</option>
							<option value=45>45번</option>
							<option value=46>46번</option>
							<option value=47>47번</option>
							<option value=48>48번</option>
							<option value=49>49번</option>
							<option value=50>50번</option>
							<option value=51>51번</option>
							<option value=52>52번</option>
							<option value=53>53번</option>
							<option value=54>54번</option>
							<option value=55>55번</option>
							<option value=56>56번</option>
							<option value=57>57번</option>
							<option value=58>58번</option>
							<option value=59>59번</option>
							<option value=60>60번</option>
							<option value=61>61번</option>
							<option value=62>62번</option>
							<option value=63>63번</option>
							<option value=64>64번</option>
							<option value=65>65번</option>
							<option value=66>66번</option>
							<option value=67>67번</option>
							<option value=68>68번</option>
							<option value=69>69번</option>
							<option value=70>70번</option>
							<option value=71>71번</option>
							<option value=72>72번</option>
							<option value=73>73번</option>
							<option value=74>74번</option>
							<option value=75>75번</option>
							<option value=76>76번</option>
							<option value=77>77번</option>
							<option value=78>78번</option>
							<option value=79>79번</option>
							<option value=80>80번</option>
							<option value=81>81번</option>
							<option value=82>82번</option>
							<option value=83>83번</option>
							<option value=84>84번</option>
							<option value=85>85번</option>
							<option value=86>86번</option>
							<option value=87>87번</option>
							<option value=88>88번</option>
							<option value=89>89번</option>
							<option value=90>90번</option>
							<option value=91>91번</option>
							<option value=92>92번</option>
							<option value=93>93번</option>
							<option value=94>94번</option>
							<option value=95>95번</option>
							<option value=96>96번</option>
							<option value=97>97번</option>
							<option value=98>98번</option>
							<option value=99>99번</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<input type="button" name="insert" id="insert" value="가입하기">
						<input type="button" name="main" id="main" value="메인가기">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>