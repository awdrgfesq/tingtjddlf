<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>���� ������</title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript" src= "/include/js/common.js"></script>
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script type = "text/javascript">	
			$(document).ready(function(){
				
				var ss = 0; // ��й�ȣȮ�� �ߴ��� Ȯ���ϴ� ����
				var dd = 0; // ���̵��ߺ�Ȯ�� �ߴ��� Ȯ���ϴ� ����
				
				$("#ttPwCheck").click(function(){
					var ttPwVal = $("#ttPw").val();
					var ttPwCVal = $("#ttPwC").val();
					
					//��� �Է°˻�
					if (! ttPwVal){
						console.log("(log)pw���� >>> : " + ! ttPwVal);
						alert("��й�ȣ�� �Է��ϼ���");
						$("#ttPw").focus();
						return false;					
					}//ttPwVal if ��
					if(!ttPwCVal){
						console.log("(log)pwC���� >>> "+ !ttPwCVal);
						alert("��й�ȣ Ȯ�ζ��� �Է��ϼ���");
						$("#ttPwC").focus();
						return false; 
					}//if ttPwCVal��
					
					if(ttPwVal ==ttPwCVal){
						alert("��й�ȣ�� Ȯ�εǾ����ϴ�");
						$("#ttPw").attr("readonly",true);
						$("#ttPwC").attr("readonly",true);
						ss = 1;
					}else{
						alert("��й�ȣ ����ġ : �ٽ� Ȯ���ϼ���");
						$("#ttPw").val('');
						$("#ttPwC").val('');
						$("#ttPwCheck").focus();
						return false;
					}
				});//ttPwCheck clickfunction��
				//�̸��� �Է¹�� ����
			 	$('#selectEmail').change(function(){ 
			 		$("#selectEmail option:selected").each(function () { 
				 		if($(this).val()== 'etc'){//�����Է��� ���
						 	$("#ttEmail02").val(''); //�� �ʱ�ȭ 
						 	$("#ttEmail02").attr("disabled",false); //Ȱ��ȭ
				 		}else{ //�����Է��� �ƴҰ�� 
						 	$("#ttEmail02").val($(this).text()); //���ð� �Է� 
						 	$("#ttEmail02").attr("disabled",true); //��Ȱ��ȭ
						} 
			 		}); 
				});
				//���Թ�ư
				$("#insertData").click(function(){
					if(ss == 0){
						alert("���üũ");
						return false;
					}
					if(dd == 0){
						alert("���̵�üũ");
						return false;
					}
					alert("I >>>>> ");
					console.log("insertData_click >>> ");
					//�Է°�üũ
					if(!chkSubmit($('#ttName'),"�̸���")) return;
					else if (!chkSubmit($('#ttBirth'),"���������")) return;
					else if (!chkSubmit($('#ttId'),"���̵�")) return;
					else if (!chkSubmit($('#ttPw'),"��й�ȣ��")) return;
					else if (
							!$("input:radio[name='ttGender']").is(":checked")
							
					) return alert("������ �����Ͻÿ�");
					else if (!chkSubmit($('#sjtCode'),"��������")) return;
					else if (!chkSubmit($('#ttTransferyear'),"�� �ٹ��� ���Գ⵵��")) return;
					else if (!chkSubmit($('#ttPn'),"�޴�����ȣ��")) return;
					else if (!chkSubmit($('#ttEmail'),"�̸�����")) return;
					else if (!chkSubmit($('#ttPostno'),"�����ȣ��")) return;
					else if (!chkSubmit($('#ttAddrDetail'),"���ּҸ�")) return;
					else if (!chkSubmit($('#ttImage'),"������")) return;
					else{
						if(confirm('����� �����ұ��?')){
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
		////////�ݹ�ȣ����
		
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
			
			g_sel.options[0] = new Option("�г� ����", "");
			c_sel.options[0] = new Option("�� ����", "");
			n_sel.options[0] = new Option("��ȣ ����", "");

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

			c_sel.options[0] = new Option("�� ����", "");

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
			
			n_sel.options[0] = new Option("��ȣ ����", "");

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
			<h3>���� ȸ������ �Է� ȭ��</h3>
			<form name="joinForm" id="joinForm"
				method="POST"
				enctype="multipart/form-data">
				
				<table border="1" align="center">
					<tr>
						<th scope="row" colspan="2" align="center">
							������ ����
						</th>			
					</tr>
					<tr>
						<th scope="row"> �̸�</th>
						<td><input type = text name="ttName" id="ttName"></td>
					</tr>
					<tr>
						<th scope="row"> �������</th>
						<td>
							<input type="text" id="yy" placeholder="��(4��)" class="int"  style="width:80px;" maxlength="4" onkeyup="moveFocus(4,this,this.form.mm);">
							<select id="mm" name="mm" class="sel" style="width:80px;" onchange="form.dd.focus()" >
										<option value="">��</option>
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
							<input type="text" id="dd" name ="dd" style="width:80px;" placeholder="��" class="int" maxlength="2">
							<label for="dd" class="lbl"></label>
						</td>
					</tr>
					<tr>
						<th scope="row"> ���̵�</th>
						<td>
							<input type = text name= "ttId" id="ttId"/>
							<input type="button" id="ttIdCheck" value="���̵��ߺ�üũ"/>
							<div id="ajaxResData">���̵� �ߺ�üũ�Ͻÿ�</div>								
						</td>
					</tr>
					<tr>
						<th scope="row"> �н����� </th>
						<td> <input type="password"	name="ttPw" id="ttPw" size="21"></td>
					</tr>
					<tr>
						<th scope="row"> �н����� Ȯ��</th>
						<td>
						<input type="password"	name="ttPwC" id="ttPwC" size="21"/>&nbsp;&nbsp;&nbsp;
						<input type="button"	name="ttPwCheck" id="ttPwCheck" value="��й�ȣȮ��"/>
						</td>
					</tr>
					<tr>
						<th scope="row"> ���� </th>
						<td>
							<input type = "radio" name="ttGender" id="ttGenderF" value="F"> F 
							<input type = "radio" name="ttGender" id="ttGenderM" value="M"> M
						</td>
					</tr>
					<tr>
						<th scope="row"> ������ </th>
						<td>
							<select id="sjtCode" name="sjtCode" >
								<option value="">���� ����</option>
				  	 			<option value="SJT01">�������л��(���ο�����/Wee Class ���)</option>
				  	 			<option value="SJT02">����</option>
				  	 			<option value="SJT03">����</option>
                                <option value="SJT04">����</option>
                                <option value="SJT05">��ȸŽ��(����,��������)</option>
                                <option value="SJT06">����Ž��</option>
                                <option value="SJT07">ü��������(����,�̼�)</option>
                                <option value="SJT08">��Ȱ������(�������,�ѹ�)</option>
                                <option value="SJT09">��2�ܱ���</option>
                                <option value="SJT10">��Ÿ</option>
							</select>
						</td>
					</tr>
					<tr>
						<th scope="row">�� �ٹ��� ���Գ⵵ </th>
						<td><input type = text name="ttTransferyear" id="ttTransferyear" placeholder="��(4��)"></td>
					</tr>
					<tr id="gradeClass" class="gradeClass">
						<th scope="row"><label>�г�/��</label></th>
						<td>
							<select id="gradeId" name="gradeId" style="width:80px;" onchange="classIdChange(this.form);" ></select>
							<label for="gradeId">�г�</label>
							<select id="classId" name="classId" style="width:80px;"  onchange="numIdChange(this.form);" ></select>
							<label for="classId">��</label>
							<select id="numId" name="numId" style="width:80px;"></select>
							<label for="numId">��</label>
						</td>
					</tr>
					<tr>
						<th scope="row"> �޴�����ȣ </th>
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
							<input type="text"  name="hp2" title="�չ�ȣ4�ڸ�" onkeyup="moveFocus(4,this,this.form.hp3);" maxlength="4" style="width:80px;">
							<span class="hypen">-</span>
							<input type="text"  name="hp3" title="�޹�ȣ4�ڸ�" maxlength="4" style="width:80px;">
						</td>
					</tr>
					<tr>
						<th scope="row"> �̸��� </th>
						<td> 
							<input type="text" name="ttEmail01" id="ttEmail01" style="width:100px"> 
						@ 	<input type="text" name="ttEmail02" id="ttEmail02" style="width:100px;" disabled value="�������ּ���"> 
							<select style="width:100px;margin-right:10px" name="selectEmail" id="selectEmail"> 
								<option value="�������ּ���" selected>�������ּ���</option>								
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
								<option value="etc">�����Է�</option> 
							</select> 
						

					</td>
					</tr>
					<tr>
						<th scope="row">������ ����</th>
						<td><input type="file" id= "ttImage" name="ttImage"></td><br>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type = "button" id="insertData" value="����" />
							<input type ="reset" value="�ٽ�"/>							
						</td>
					</tr>			
				</table>		
			</form>
		</div>
	</body>
</html>