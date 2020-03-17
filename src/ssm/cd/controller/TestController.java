package ssm.cd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ssm.cd.service.TestService;
import ssm.cd.vo.J_DataVO;
import ssm.cd.vo.Job_DataVO;
import ssm.cd.vo.M_DataVO;
import ssm.cd.vo.Major_DataVO;
import ssm.cd.vo.S_DataVO;
import ssm.cd.vo.School_DataVO;
import ssm.cd.vo.TestVO;
import ssm.mi.member.service.SMemberService;
import ssm.mi.member.util.BabySession;
import ssm.mi.member.vo.SMemberVO;

@Controller
@RequestMapping("/test")
public class TestController {
	
	Logger logger = Logger.getLogger(TestController.class);
	@Autowired
	private TestService testService;
	
	@Autowired
	private SMemberService SMemberService;
	
	// 테스트
	@RequestMapping("/test")
	public String test(){
		return"cd/test";
	}
	
	@RequestMapping("/goMainPage")
	public String goMainPage(){
		return "cd/cd_Main";
	}
	
	// 검사페이지 가는 함수
	@RequestMapping("/go_test")
	public String JobAptitudePage(@RequestParam("page") String page,HttpServletRequest req,Model model){
		logger.info("test() start");
	      String ssNo   = "";
	      String url = "";
	      List list     = null;
	      SMemberVO svo = null;
	      
	      try {
	         ssNo = BabySession.getSessionNO(req);
	         svo = new SMemberVO();
	         svo.setSsNo(ssNo);
	         list = SMemberService.sInformation(svo);
	         if(list != null){
	            model.addAttribute("list", list);
	            url = "cd/"+page;
	         }else{
	            model.addAttribute("alert","회원정보를 가져올 수 없습니다. 다시 로그인 해주세요.");
	            url = "mainForm";
	            
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	      
	      logger.info("test() end");
		return url;
	}
	
	
	//검사 디비넣기함수
	@RequestMapping("/jobAptitudeInsert")
	public String insertResult(@ModelAttribute TestVO cdvo,Model model){
	logger.info("insertResult 함수 시작");
	int result = 0;
	String resultStr="";
//	String SsNo = "1";//세션함수로 받아오기
//	String CdGrade="1";//세션함수로 받아오기
	
	int chaebun = testService.makeChaebun();//채번제작
	String Chaebun = chaebun+"";
	if (Chaebun.length()==1) Chaebun ="000"+Chaebun;
	if (Chaebun.length()==2) Chaebun ="00"+Chaebun;
	if (Chaebun.length()==3) Chaebun ="0"+Chaebun;
	Chaebun = "CD"+Chaebun;
	cdvo.setCdNo(Chaebun);
	
//	logger.info("cdvo의 CdNo>>>"+ cdvo.getCdNo());
//	cdvo.setSsNo(SsNo);
//	logger.info("cdvo의 SsNo>>>"+ cdvo.getSsNo());
//	cdvo.setCdGrade(CdGrade);
//	logger.info("cdvo의 CdGrade>>>"+ cdvo.getCdGrade());
//	cdvo.setCdValue("JA");
//	logger.info("cdvo의 setCdValue>>>"+ cdvo.getCdValue());
//	logger.info("cdvo의 CdUrl>>>"+ cdvo.getCdUrl());
	
	String url = "";
	result = testService.insertResult(cdvo);
		if(result>0)resultStr="성공"; 
		else resultStr="실패";
		model.addAttribute("resultStr", resultStr);
		model.addAttribute("resultUrl", cdvo);
		return "cd/result";
	}
	
	//학교정보 페이지로 가는 함수
		@RequestMapping("/schoolInfoList")
		public String schoolInfoList(@ModelAttribute School_DataVO svo,Model model,@ModelAttribute S_DataVO dvo){
			logger.info("schoolInfoList() start");
			if(svo.getSd_listSize() == null){
				svo.setSd_listSize("10");
			}
			if(svo.getSd_curPage() == null){
				svo.setSd_curPage("1"); 
			}
			List list = null;
			logger.info("서비스가기전 값들>>>"+svo.toString());
			list = testService.schoolInfoList(svo);
			logger.info("list.size() >>> : "+list.size());
			model.addAttribute("list", list);
			model.addAttribute("saveData", dvo);
			model.addAttribute("saveData3", svo);
			logger.info("schoolInfoList() end");
			return "cd/schoolInfoList";
		}
		
		//학과정보 페이지로 가는 함수
		@RequestMapping("/majorList")
		public String majorList(@ModelAttribute Major_DataVO mdvo,Model model,@ModelAttribute M_DataVO mdvo2){
			logger.info("majorList() start");
			
			if(mdvo.getListSize() == null){
				mdvo.setListSize("10");
			}
			if(mdvo.getCurPage() == null){
				mdvo.setCurPage("1"); 
			}
			
			List list = testService.majorList(mdvo);
//			List list = null;
			if(list != null){
				model.addAttribute("list", list);
				model.addAttribute("saveData", mdvo);
				model.addAttribute("saveData2", mdvo2);
			}else{
				logger.info("list.size >>> : 0입니다.");
			}
			
			logger.info("majorList() end");
			return "cd/majorList";
		}
		
		//학과정보 디테일페이지
		@RequestMapping("/majorDetail")
		public String majorDetail(@RequestParam("majorSeq") String majorSeq,Model mod){
			logger.info("majorDeatail() start");
			logger.info("majorSeq >>> : "+majorSeq);
			
			if(majorSeq != null && majorSeq.length() > 0){
				Major_DataVO mdvo = null;
				mdvo = new Major_DataVO();
				mdvo.setMajorSeq(majorSeq);
				List list = testService.majorDetail(mdvo);
				if(list != null && list.size() > 0){
					mod.addAttribute("list", list);
				}
			}
			
			logger.info("majorDeatail() end");
			return "cd/majorDetail";
		}
		
		//직업정보 디테일 페이지
		@RequestMapping("/jobDetail")
		public String jobDetail(@RequestParam("jobDicSeq") String jobDicSeq,Model model){
			logger.info("jobDetail() start");
			logger.info("jobDicSeq >>> : "+jobDicSeq);
			String url = "";
			Job_DataVO jdvo = null;
			List list = null;
			
			if(jobDicSeq != null && jobDicSeq.length() > 0){
				jdvo = new Job_DataVO();
				jdvo.setJobDicSeq(jobDicSeq);
				list = testService.jobDetail(jdvo);
				if(list != null && list.size() > 0){
					model.addAttribute("list", list);
					url = "cd/jobDetail";
				}else{
					url = "cd/jobList";
				}
			}else{
				url = "cd/jobList";
			}
			
			logger.info("jobDetail() end");
			return url;
		}
			
			
		//직업정보 리스트페이지
		@RequestMapping("/jobList")
		public String jobList(@ModelAttribute Job_DataVO jdvo,Model model,@ModelAttribute J_DataVO jvo ){
			logger.info("jobList() start");
			logger.info("jdvo.ppossibility >>> : "+jdvo.getPpossibility());
			if(jdvo.getListSize() == null){
				jdvo.setListSize("10");
			}
			if(jdvo.getCurPage() == null){
				jdvo.setCurPage("1"); 
			}
			List list = testService.jobList(jdvo);
			if(list != null && list.size() > 0){
				model.addAttribute("list", list);
				model.addAttribute("saveData", jdvo);
			}
			model.addAttribute("saveData2", jvo);
			logger.info("jobList() end");
			return "cd/jobList";
		}
}
