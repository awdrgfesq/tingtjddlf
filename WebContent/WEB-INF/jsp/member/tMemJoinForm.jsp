<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>교사 가입폼</title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript" src= "/include/js/common.js"></script>
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script type = "text/javascript">	
			$(document).ready(function(){
				
				var ss = 0; // 비밀번호확인 했는지 확인하는 변수
				var dd = 0; // 아이디중복확인 했는지 확인하는 변수
				
				$("#ttPwCheck").click(function(){
					var ttPwVal = $("#ttPw").val();
					var ttPwCVal = $("#ttPwC").val();
					
					//비번 입력검사
					if (! ttPwVal){
						console.log("(log)pw없음 >>> : " + ! ttPwVal);
						alert("비밀번호를 입력하세요");
						$("#ttPw").focus();
						return false;					
					}//ttPwVal if 끝
					if(!ttPwCVal){
						console.log("(log)pwC없음 >>> "+ !ttPwCVal);
						alert("비밀번호 확인란을 입력하세요");
						$("#ttPwC").focus();
						return false; 
					}//if ttPwCVal끝
					
					if(ttPwVal ==ttPwCVal){
						alert("비밀번호가 확인되었습니다");
						$("#ttPw").attr("readonly",true);
						$("#ttPwC").attr("readonly",true);
						ss = 1;
					}else{
						alert("비밀번호 불일치 : 다시 확인하세요");
						$("#ttPw").val('');
						$("#ttPwC").val('');
						$("#ttPwCheck").focus();
						return false;
					}
				});//ttPwCheck clickfunction끝
				//이메일 입력방식 선택
			 	$('#selectEmail').change(function(){ 
			 		$("#selectEmail option:selected").each(function () { 
				 		if($(this).val()== 'etc'){//직접입력일 경우
						 	$("#ttEmail02").val(''); //값 초기화 
						 	$("#ttEmail02").attr("disabled",false); //활성화
				 		}else{ //직접입력이 아닐경우 
						 	$("#ttEmail02").val($(this).text()); //선택값 입력 
						 	$("#ttEmail02").attr("disabled",true); //비활성화
						} 
			 		}); 
				});
				//가입버튼
				$("#insertData").click(function(){
					if(ss == 0){
						alert("비밀체크");
						return false;
					}
					if(dd == 0){
						alert("아이디체크");
						return false;
					}
					alert("I >>>>> ");
					console.log("insertData_click >>> ");
					//입력값체크
					if(!chkSubmit($('#ttName'),"이름을")) return;
					else if (!chkSubmit($('#ttBirth'),"생년월일을")) return;
					else if (!chkSubmit($('#ttId'),"아이디를")) return;
					else if (!chkSubmit($('#ttPw'),"비밀번호를")) return;
					else if (
							!$("input:radio[name='ttGender']").is(":checked")
							
					) return alert("성별을 선택하시오");
					else if (!chkSubmit($('#sjtCode'),"담당과목을")) return;
					else if (!chkSubmit($('#ttTransferyear'),"현 근무지 전입년도를")) return;
					else if (!chkSubmit($('#ttPn'),"휴대폰번호를")) return;
					else if (!chkSubmit($('#ttEmail'),"이메일을")) return;
					else if (!chkSubmit($('#ttPostno'),"우편번호를")) return;
					else if (!chkSubmit($('#ttAddrDetail'),"상세주소를")) return;
					else if (!chkSubmit($('#ttImage'),"사진을")) return;
					else{
						if(confirm('등록을 진행할까요?')){
							$("#joinForm").attr({
								"method":"POST",
								"action":"/tMember/joinTMember.ssm"});
							$("#joinForm").submit();
						};//confirm
					}//else
				});//insertData_click	
			});//document ready
		</script>
		<script type="text/javascript">
		////////반번호선택
		
		var g_selbox = new Array('1', '2', '3' );
		var c_selbox = new Array();	
			for (var i =0 ; i<3 ;i++){ c_selbox[i] = new Array('1', '2', '3', '4', '5');}
		var n_selbox = new Array();
			for (var i =0; i<5 ; i++){n_selbox[i] = new Array('1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
					'11', '12', '13', '14', '15', '16', '17', '18', '19', '20');}
		function init(f){
			console.log(f);
			console.log("init");
			var g_sel = f.gradeId;
			var c_sel = f.classId;
			var n_sel = f.numId;
			
			g_sel.options[0] = new Option("학년 선택", "");
			c_sel.options[0] = new Option("반 선택", "");
			n_sel.options[0] = new Option("번호 선택", "");

			for(var i =0; i<g_selbox.length; i++){
				g_sel.options[i+1] = new Option(g_selbox[i], g_selbox[i]);
			}
		}//init(f) onload

		function classIdChange(f){
			var g_sel = f.gradeId;
			var c_sel = f.classId;
			
			var sel = g_sel.selectedIndex;
			for(var i=c_sel.length; i>=0; i--){
				c_sel.options[i] = null;
			}

			c_sel.options[0] = new Option("반 선택", "");

			if(sel != 0){
				for(var i=0; i<c_selbox[sel-1].length; i++){
					c_sel.options[i+1] = new Option(c_selbox[sel-1][i], c_selbox[sel-1][i]);
				}
			}
		}//
		
		function numIdChange(f){		
			var c_sel = f.classId;
			var n_sel = f.numId;
			
			var sel = c_sel.selectedIndex;
			for(var i=n_sel.length; i>=0; i--){
				n_sel.options[i] = null;
			}
			
			n_sel.options[0] = new Option("번호 선택", "");

			if(sel != 0){
				for(var i=0; i<n_selbox[sel-1].length; i++){
					n_sel.options[i+1] = new Option(n_selbox[sel-1][i], n_selbox[sel-1][i]);
				}
			}
		}
		function moveFocus(num,here,next){
			 var str = here.value.length;
			 if(str == num)
			    next.focus();
			 }
		</script>
	</head>
	<body onload = "init(this.joinForm);">
		<div align="center" class="body">
			<h3>교사 회원정보 입력 화면</h3>
			<form name="joinForm" id="joinForm"
				method="POST"
				enctype="multipart/form-data">
				
				<table border="1" align="center">
					<tr>
						<th scope="row" colspan="2" align="center">
							교직원 정보
						</th>			
					</tr>
					<tr>
						<th scope="row"> 이름</th>
						<td><input type = text name="ttName" id="ttName"></td>
					</tr>
					<tr>
						<th scope="row"> 생년월일</th>
						<td>
							<input type="text" id="yy" placeholder="년(4자)" class="int"  style="width:80px;" maxlength="4" onkeyup="moveFocus(4,this,this.form.mm);">
							<select id="mm" name="mm" class="sel" style="width:80px;" onchange="form.dd.focus()" >
										<option value="">월</option>
										  	 			<option value="01">
                                                            1
                                                        </option>
										  	 			<option value="02">
                                                            2
                                                        </option>
										  	 			<option value="03">
                                                            3
                                                        </option>
										  	 			<option value="04">
                                                            4
                                                        </option>
										  	 			<option value="05">
                                                            5
                                                        </option>
										  	 			<option value="06">
                                                            6
                                                        </option>
										  	 			<option value="07">
                                                            7
                                                        </option>
										  	 			<option value="08">
                                                            8
                                                        </option>
										  	 			<option value="09">
                                                            9
                                                        </option>
										  	 			<option value="10">
                                                            10
                                                        </option>
										  	 			<option value="11">
                                                            11
                                                        </option>
										  	 			<option value="12">
                                                            12
                                                        </option>
									</select>
							<input type="text" id="dd" name ="dd" style="width:80px;" placeholder="일" class="int" maxlength="2">
							<label for="dd" class="lbl"></label>
						</td>
					</tr>
					<tr>
						<th scope="row"> 아이디</th>
						<td>
							<input type = text name= "ttId" id="ttId"/>
							<input type="button" id="ttIdCheck" value="아이디중복체크"/>
							<div id="ajaxResData">아이디 중복체크하시오</div>								
						</td>
					</tr>
					<tr>
						<th scope="row"> 패스워드 </th>
						<td> <input type="password"	name="ttPw" id="ttPw" size="21"></td>
					</tr>
					<tr>
						<th scope="row"> 패스워드 확인</th>
						<td>
						<input type="password"	name="ttPwC" id="ttPwC" size="21"/>&nbsp;&nbsp;&nbsp;
						<input type="button"	name="ttPwCheck" id="ttPwCheck" value="비밀번호확인"/>
						</td>
					</tr>
					<tr>
						<th scope="row"> 성별 </th>
						<td>
							<input type = "radio" name="ttGender" id="ttGenderF" value="F"> F 
							<input type = "radio" name="ttGender" id="ttGenderM" value="M"> M
						</td>
					</tr>
					<tr>
						<th scope="row"> 담당과목 </th>
						<td>
							<select id="sjtCode" name="sjtCode" >
								<option value="">과목 선택</option>
				  	 			<option value="SJT01">진로진학상담(진로와직업/Wee Class 상담)</option>
				  	 			<option value="SJT02">국어</option>
				  	 			<option value="SJT03">영어</option>
                                <option value="SJT04">수학</option>
                                <option value="SJT05">사회탐구(역사,도덕포함)</option>
                                <option value="SJT06">과학탐구</option>
                                <option value="SJT07">체육·예술(음악,미술)</option>
                                <option value="SJT08">생활·교양(기술가정,한문)</option>
                                <option value="SJT09">제2외국어</option>
                                <option value="SJT10">기타</option>
							</select>
						</td>
					</tr>
					<tr>
						<th scope="row">현 근무지 전입년도 </th>
						<td><input type = text name="ttTransferyear" id="ttTransferyear" placeholder="년(4자)"></td>
					</tr>
					<tr id="gradeClass" class="gradeClass">
						<th scope="row"><label>학년/반</label></th>
						<td>
							<select id="gradeId" name="gradeId" style="width:80px;" onchange="classIdChange(this.form);" ></select>
							<label for="gradeId">학년</label>
							<select id="classId" name="classId" style="width:80px;"  onchange="numIdChange(this.form);" ></select>
							<label for="classId">반</label>
							<select id="numId" name="numId" style="width:80px;"></select>
							<label for="numId">번</label>
						</td>
					</tr>
					<tr>
						<th scope="row"> 휴대폰번호 </th>
						<td><input type = hidden name="ttPn" id="ttPn">
							<select name="hp1" onchange="form.hp2.focus()" style="width:80px;" >
								<option value="010" selected="selected">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
								<option value="0139">0139</option>
							</select>
							<span class="hypen">-</span>
							<input type="text"  name="hp2" title="앞번호4자리" onkeyup="moveFocus(4,this,this.form.hp3);" maxlength="4" style="width:80px;">
							<span class="hypen">-</span>
							<input type="text"  name="hp3" title="뒷번호4자리" maxlength="4" style="width:80px;">
						</td>
					</tr>
					<tr>
						<th scope="row"> 이메일 </th>
						<td> 
							<input type="text" name="ttEmail01" id="ttEmail01" style="width:100px"> 
						@ 	<input type="text" name="ttEmail02" id="ttEmail02" style="width:100px;" disabled value="선택해주세요"> 
							<select style="width:100px;margin-right:10px" name="selectEmail" id="selectEmail"> 
								<option value="선택해주세요" selected>선택해주세요</option>								
								<option value="naver.com">naver.com</option>  
								<option value="hanmail.net">hanmail.net</option> 
								<option value="gmail.com">gmail.com</option> 
								<option value="nate.com">nate.com</option>
								<option value="hotmail.com">hotmail.com</option> 
								<option value="freechal.com">freechal.com</option> 
								<option value="hanmir.com">hanmir.com</option> 
								<option value="korea.com">korea.com</option>
								<option value="yahoo.co.kr">yahoo.co.kr</option> 					
								<option value="paran.com">paran.com</option> 
								<option value="etc">직접입력</option> 
							</select> 
						

					</td>
					</tr>
					<tr>
						<th scope="row">프로필 사진</th>
						<td><input type="file" id= "ttImage" name="ttImage"></td><br>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type = "button" id="insertData" value="가입" />
							<input type ="reset" value="다시"/>							
						</td>
					</tr>			
				</table>		
			</form>
		</div>
	</body>
</html>