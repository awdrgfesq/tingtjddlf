package ssm.mi.member.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ssm.mi.member.service.SMemberService;
import ssm.mi.member.util.BabySession;
import ssm.mi.member.util.GR_Chaebun;
import ssm.mi.member.vo.BasicInformationVO;
import ssm.mi.member.vo.SMemberGrVO;
import ssm.mi.member.vo.SMemberVO;
import ssm.mi.member.vo.TMemberVO;

@Controller
@RequestMapping("/smember")
public class SMemberController {
	public final String UPLOADPATH = "C:/java142/D/java142_Luna_ProjectSSM/Project_SSM/WebContent/images";
	Logger log = Logger.getLogger(SMemberController.class);
	
	@Autowired
	private SMemberService SMemberService;
	
		// ���̵� �ߺ�üũ �Լ�
		@RequestMapping("ajaxIdCheck")
		public ResponseEntity ajaxIdCheck(@RequestParam("ssId") String ssId,Model model){
			log.info("ajaxIdCheck() start");
			log.info("ssId >>> : "+ssId);
			ssId = ssId.toUpperCase().trim();
			log.info("ssId >>> : "+ssId);
			ResponseEntity entity = null;
			SMemberVO svo = null;
			svo = new SMemberVO();
//			svo.setSsId(ssId);
			
//			SMemberVO smvo = SMemberService.ajaxIdCheck(svo);
			
			
			
			try{
				svo.setSsId(ssId);
				SMemberVO smvo = SMemberService.ajaxIdCheck(svo);
				if(smvo != null && smvo.getSsId() != null){
					entity = new ResponseEntity("false",HttpStatus.OK);
				}else{
					entity = new ResponseEntity("true",HttpStatus.OK);
				}
				
			}catch(Exception e){
				log.info("error >>> : "+e.getMessage());
				entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
			}
			
			log.info("ajaxIdCheck() end");
			return entity;
		}// end of ajaxIdCheck()
	
		// �α���,ȸ������ �������� ���� �Լ�. 
		@RequestMapping(value="/mainForm")
		public String mainForm(){
			log.info("mainForm() start");
//			for(int i=1;i<100;i++){
//				if(i<10){
//					System.out.println("<option value=0"+i+">"+i+"��</option>");
//				}
//				if(i>=10){
//					System.out.println("<option value="+i+">"+i+"��</option>");
//				}
//				
//			}
//			Date year = new Date();
//			SimpleDateFormat format = new SimpleDateFormat("yy");
//			String yearr = format.format(year);
//			System.out.println(yearr);
			String url = "";
			url = "mainForm";
			
			log.info("mainForm() end");
			return url;
		}// end of mainForm()
		
		
		// �л��� ȸ������ ��ư�� Ŭ�� ���� �� ����,�������,�޴�����ȣ�� üũ�ϴ� �����ΰ��� �Լ�
		@RequestMapping(value="/checkForm")
		public String checkForm(){
			log.info("checkForm() start");
			
			String url = "";
			url= "member/checkForm";     
			
			log.info("checkForm() end");
			return url;
		}// end of checkForm()
		
		
		// �����(�л�)�� �̸�,��������� �Է��ϸ� �л��������̺� �ִ� �������� üũ�ϴ� �Լ�
		@RequestMapping(value="/checkInfo",method=RequestMethod.POST)
		public String checkInfo(@ModelAttribute SMemberVO smvo,Model model){
			log.info("checkInfo() start"); 
			log.info("smvo.getSsName() >>> : "+smvo.getSsName());
			log.info("smvo.getSsBirth() >>> : "+smvo.getSsBirth());
			log.info("smvo.getSsPn() >>> : "+smvo.getSsPn());
			String url = "";                             // select ���ο� ���� url�� �ٲ�
			SMemberVO svo  = SMemberService.checkInfo(smvo);  // �л�����Ȯ�� DB���ٿ���
			log.info("svo >>> : "+svo);
			if(svo != null){
				String ssId = svo.getSsId();
				String ssA = svo.getSsAuthority(); // ���Խ��� ��������� Ȯ��
				if(ssId != null && ssId.length() > 0){					// �л������� Ȯ�εǸ� ���ԵǾ� �ִ��� üũ�ϰ�
					if(ssA.equals("Y")){
						model.addAttribute("alert","���Խ��� ������Դϴ�.");
						url = "mainForm";
					}else{
						model.addAttribute("alert","�̹� ���Ե� ȸ���Դϴ�.");    // ���ԵǾ� ������ ���ڿ��� ������ checkForm���� ����
						url = "mainForm";
					}
				}else{
//					SMemberGrVO mg = SMemberService.checkFM_Member(svo);     // 1�г����̺� ��ȸ 
//					String gr = "fm";
//					if(mg == null){ 
//							  mg = SMemberService.checkJR_Member(svo);      // 2�г����̺� ��ȸ
//							  gr = "jr";
//						if(mg == null){
//							  mg = SMemberService.checkSR_Member(svo);      // 3�г����̺� ��ȸ
//							  gr = "sr";
//						}
//					}
//					model.addAttribute(gr, mg);                         // ȸ�������� Ȯ�ε����� ���ԵǾ� ���� ������
					model.addAttribute("data", svo);                    // �й�, �̸�, �������, ����, �޴�����ȣ�� ������					
					url = "member/ex";                          // insertForm���� ����.
				}											 	               
			}else{
				model.addAttribute("alert","���������� Ȯ�ε��� �ʽ��ϴ�.");    // ������ Ȯ�ε��� ������ ���ڿ��� ������
				url = "member/checkForm";                               // checkForm���� �����Ѵ�.
			}
			
			log.info("checkInfo() end");
			return url;
		}// end of checkInfo()
		
		
		// �����(�л�)�� ���Խ�û ���� �� ���̺� ������ �Է��ϴ� �Լ�
		@RequestMapping(value="/insertInfo")
		public String insertInfo(HttpServletRequest request,Model model){
			log.info("insertInfo() start");
			String uploadPath = UPLOADPATH;
			int size = 10*1024*1024;
			try{
				MultipartRequest mt = new MultipartRequest(request,
														   uploadPath,
														   size,
														   "EUC-KR",
														   new DefaultFileRenamePolicy());
				
				String ssImage = mt.getFilesystemName("ssImage");
				String ssNo = mt.getParameter("ssNo");
				String ssId = mt.getParameter("ssId");
				String ssPw = mt.getParameter("ssPw");
				String ssGender = mt.getParameter("ssGender");
				String ssEmail = mt.getParameter("ssEmail");
				String grGrade = mt.getParameter("grGrade");
				String grClass = mt.getParameter("grClass");
				String grNum = mt.getParameter("grNum");
				
				log.info("ssImage >>> : "+ssImage);
				log.info("ssNo >>> : "+ssNo);
				log.info("ssId >>> : "+ssId);
				log.info("ssPw >>> : "+ssPw);
				log.info("ssEmail >>> : "+ssEmail);
				log.info("grGrade >>> : "+grGrade);
				log.info("grClass >>> : "+grClass);
				log.info("grNum >>> : "+grNum);
				
				SMemberVO smvo = null;
				smvo = new SMemberVO();
				
				smvo.setSsImage(ssImage);
				smvo.setSsNo(ssNo);
				smvo.setSsId(ssId);
				smvo.setSsPw(ssPw);
				smvo.setSsGender(ssGender);
				smvo.setSsEmail(ssEmail);
				smvo.setSsGrade(grGrade);
				int result = SMemberService.insertInfo(smvo);
				log.info("result >>> : "+result);
				SMemberGrVO sgvo = null;
				sgvo = new SMemberGrVO();
				
				if(grGrade.equals("FM")){
					log.info("FM >>> ");
					sgvo.setFmGrade(grGrade);
					sgvo.setFmClass(grClass);
					sgvo.setFmNum(grNum);
					sgvo.setSsNo(ssNo);
					log.info("grade : "+grGrade+" class : "+grClass+" num : "+grNum+" ssNo : "+ssNo);
					int chaebun = SMemberService.chaebunGr(sgvo);
					String fmNo = GR_Chaebun.chaebun(chaebun,"FM");
					sgvo.setFmNo(fmNo);
					
					TMemberVO tvo = SMemberService.teacherInfo(sgvo);
					String fmTeacher = tvo.getTtNo();
					sgvo.setTtNo(fmTeacher);
					int result2 = SMemberService.insertGr(sgvo);
					log.info("result2 >>> : "+result2);
				}else if(grGrade.equals("JR")){
					log.info("JR >>> ");
					sgvo.setJrGrade(grGrade);
					sgvo.setJrClass(grClass);
					sgvo.setJrNum(grNum);
					sgvo.setSsNo(ssNo);
					log.info("grade : "+grGrade+" class : "+grClass+" num : "+grNum+" ssNo : "+ssNo);
					
					int chaebun = SMemberService.chaebunGr(sgvo);
					String jrNo = GR_Chaebun.chaebun(chaebun,"JR");
					sgvo.setJrNo(jrNo);
					
					TMemberVO tvo = SMemberService.teacherInfo(sgvo);
					String jrTeacher = tvo.getTtNo();
					log.info("teacher >>> : "+jrTeacher);
					sgvo.setTtNo(jrTeacher);
					int result2 = SMemberService.insertGr(sgvo);
					log.info("result2 >>> : "+result2);
				}else{
					log.info("SR >>> ");
					sgvo.setSrGrade(grGrade);
					sgvo.setSrClass(grClass);
					sgvo.setSrNum(grNum);
					sgvo.setSsNo(ssNo);
					log.info("grade : "+grGrade+" class : "+grClass+" num : "+grNum+" ssNo : "+ssNo);
					
					int chaebun = SMemberService.chaebunGr(sgvo);
					String srNo = GR_Chaebun.chaebun(chaebun,"SR");
					sgvo.setSrNo(srNo);
					
					TMemberVO tvo = SMemberService.teacherInfo(sgvo);
					String srTeacher = tvo.getTtNo();
					sgvo.setTtNo(srTeacher);
					int result2 =  SMemberService.insertGr(sgvo);
					log.info("result2 >>> : "+result2);
				}
				
			}catch(Exception e){
				log.info("���� >>> : "+e.getMessage());
				e.printStackTrace();
			}
			
			
			
			log.info("insertInfo() end");
			return "mainForm";
		}// end of insertInfo
		
		
		// �Ƚ��
		@RequestMapping(value="/fileUpload")
		public String fileUpload(HttpServletRequest request){

			log.info("fileUpload() start");
			String uploadPath = UPLOADPATH;
			int size = 10*1024*1024;
			try{
				MultipartRequest mt = new MultipartRequest(request,
														   uploadPath,
														   size,
														   "EUC-KR",
														   new DefaultFileRenamePolicy());
				
				String ssImage = mt.getFilesystemName("ssImage");
				String ssNo = mt.getParameter("ssNo");
				
				log.info("ssImage >>> : "+ssImage);
				log.info("ssNo >>> : "+ssNo);
				
				SMemberVO smvo = null;
				smvo = new SMemberVO();
				
				smvo.setSsImage(ssImage);
				smvo.setSsNo(ssNo);
				SMemberService.fileUpload(smvo);
				
			}catch(Exception e){
				log.info("fileUpload.���� >>> : "+e.getMessage());
			}
			
			log.info("fileUpload() end");
			return "";
		}
		
		
		// ���Խ��� �������� ���� �Լ�
		@RequestMapping(value="/approveForm")
		public String approveForm(Model mod){
			log.info("approveForm() start"); 
			
			List<SMemberVO> list = SMemberService.smListAll();
			mod.addAttribute("list", list);
			String url = "/admin/approveForm";
			
			log.info("approveForm() end");
			return url;
		}
		
		
		// �α����ϴ� �Լ�
		@RequestMapping("/loginCheck")
		public String loginCheck(@ModelAttribute SMemberVO svo,Model model,HttpServletRequest req){
			log.info("loginCheck() start"); 
			String url = "";
			String authority = svo.getSsAuthority();
			
			if(authority.equals("S")){       // �л��������̺��� ���� 1�� select
				SMemberVO smvo = SMemberService.loginCheck(svo);
				if(smvo == null){
					model.addAttribute("alert","���������� �����ϴ�.");
					url = "mainForm";
				}else{
					if(smvo.getSsAuthority().equals("Y")){
						model.addAttribute("alert","���Խ��� ������Դϴ�.");
						model.addAttribute("dataS", smvo);
						url = "member/signCheck";
					}else{
						String id = smvo.getSsId();
						String no = smvo.getSsNo();
						String au = smvo.getSsAuthority();
						try {
							BabySession.setSession(req, id, no, au);
							log.info("id,no,au"+id+","+no+","+au);
						} catch (Exception e) {               
							// TODO Auto-generated catch block
							log.info("error.controller >> "+e.getMessage());
						}
						url = "mainForm";	
					}
				}
				
			}else if(authority.equals("T")){ // �������������̺��� ���� 2,3�� select
				TMemberVO tvo = null;
				tvo = new TMemberVO();
				String ttId = svo.getSsId();
				String ttPw = svo.getSsPw();
				tvo.setTtId(ttId);
				tvo.setTtPw(ttPw);
				TMemberVO tmvo = SMemberService.tLoginCheck(tvo);
				if(tmvo == null){
					model.addAttribute("alert","���������� �����ϴ�.");
					url = "mainForm";
				}else{
					if(tmvo.getTtAuthority().equals("Y")){
						model.addAttribute("alert","���Խ��� ������Դϴ�.");
						model.addAttribute("dataT", tmvo);
						url = "member/signCheck";
					}else{
						String id = tmvo.getTtId();
						String no = tmvo.getTtNo();
						String au = tmvo.getTtAuthority();
						log.info("id,no,au"+id+","+no+","+au);
						try {
							BabySession.setSession(req, id, no, au);
						} catch (Exception e) {               
							// TODO Auto-generated catch block
							log.info("error.controller >> "+e.getMessage());
						}
						url = "mainForm";
					}
				}
			}
			
			
			log.info("loginCheck() end");
			return url;
		}
		
		//�α׾ƿ��� �������� �����Լ�
		@RequestMapping("/logout")
		public String logout(HttpServletRequest req){
			try {
				BabySession.killSession(req);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "mainForm";
		}
		
		//�������� �������� �����Լ�
		@RequestMapping("basicInformation")
		public String basicInformation(HttpServletRequest request,Model model){
			log.info("basicInformation() start");
			String sessionNO        = "";
			List list               = null;
			BasicInformationVO bivo = null;
			SMemberVO svo           = null;
			String isud             = "";
			String url              = "";
			isud = request.getParameter("ISUD_TYPE");
			try {
				sessionNO = BabySession.getSessionNO(request);
				bivo = new BasicInformationVO();
				bivo.setSsNo(sessionNO);
				list = SMemberService.basicInformation(bivo);
				if(list != null && list.size() > 0){
					model.addAttribute("list",list);
					if(isud != null){
						url = "BI/BIInsert";
					}else{
						url = "BI/basicInformation";
					}
				}else{
					svo = new SMemberVO();
					svo.setSsNo(sessionNO);
					SMemberVO svo2 = SMemberService.selectPn(svo);
					model.addAttribute("svo", svo2);
					model.addAttribute("ssNo", sessionNO);
					if(isud != null){
						url = "BI/BIInsert";
					}else{
						url = "BI/basicInformation";
					}
				}
				
			} catch (Exception e) {
				log.info("error >>> : "+e.getMessage());
			}
			log.info("model >>> : "+model);
			log.info("basicInformation() end");
			return url;
		}
		
		// �������� ���� insert or update�Լ�
		@RequestMapping("/BIInsert")
		public String BIInsert(@ModelAttribute BasicInformationVO bivo,HttpServletRequest req, Model model){
			log.info("BIInsert() start");
			String isud = "";
			String url  = "";
			List list   = null;
			isud = req.getParameter("ISUD_TYPE");
			log.info("isud >>> : "+isud);
			if(isud.equals("U")){
				int result = SMemberService.BIUpdate(bivo);
				
			}else if(isud.equals("I")){
				String biChaebun = SMemberService.biChaebun();
				biChaebun = "000"+biChaebun;
				if(biChaebun.length()>4){
					for(int j=0;j<biChaebun.length();j++){
						if(biChaebun.length()>4){
							biChaebun=biChaebun.substring(1);
						}else{
							break;
						}
					}
				}
				biChaebun = "BI"+biChaebun;
				log.info("biChaebun >>> : "+biChaebun);
				bivo.setBiNo(biChaebun);
				int result = SMemberService.BIInsert(bivo);
			}
			list = SMemberService.basicInformation(bivo);
			model.addAttribute("list",list);
			url = "BI/basicInformation";
			
			log.info("BIInsert() end");
			return url;
		}
}
