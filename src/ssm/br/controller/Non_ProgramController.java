package ssm.br.controller;


import java.io.File;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.connector.Request;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ssm.br.service.Non_ProgramService;
import ssm.br.vo.Non_ProgramVO;
import ssm.cd.controller.TeacherController;
import ssm.cd.vo.TestTeacherVO;

@Controller
@RequestMapping("/nonprogram")
public class Non_ProgramController {
	

	Logger logger = Logger.getLogger(TeacherController.class);
	
	@Autowired
	private Non_ProgramService non_ProgramService;
	
	//메인화면 리스트뽑기
	@RequestMapping("/np_Main")
	public String np_Main(@ModelAttribute Non_ProgramVO npvo ,Model model){
		String npTitle="";
		String npContents="";
		if(npvo.getNpTitle()!=null) {
			npTitle=npvo.getNpTitle();
			model.addAttribute("npTitle",npTitle);

		}
		if(npvo.getNpContents()!=null){			
			npContents=npvo.getNpContents();
			model.addAttribute("npContents",npContents);
		}
		//리스트사이즈가 널일시(처음 화면을 실행시)실행
		if(npvo.getListSize()==null){
			logger.info("listSize()값이 null입니다 10으로 초기화합니다");
			npvo.setListSize("10");
		}
		
		//페이지개수가 널일시 (처음 화면 실행시)실행
		if(npvo.getPageNo()==null){
			logger.info("pageNo()값이 null입니다 1으로 초기화합니다");
			npvo.setPageNo("1");
		}
		
		
		List list = non_ProgramService.listProgram(npvo);
		
		if(list.size()>0){
			model.addAttribute("list",list);	
		}else{
			logger.info("리스트사이즈 0이야~");
		}

		logger.info("list>>>"+list.size());
		logger.info("npvo.toString()>>>"+npvo.toString());
		model.addAttribute("listSize",npvo.getListSize());
		

		return "br/np_Main";
	}
	//글입력 폼가기
	@RequestMapping("/np_InsertForm")
	public String np_InsertForm(){
		return "br/np_InsertForm";
	}
	
	//글작성 클릭시 실행함수
	@RequestMapping("/np_InsertData")
		public String np_InsertData(HttpServletRequest hsr,Model model){
		logger.info("글작성 시작");
		
		int result = 0;
		String resultStr="";
		Non_ProgramVO npvo = new Non_ProgramVO();
		
		try{
			logger.info("try문 진입했음");
		String npNo="";
		logger.info("야 채번 넣을게");
			npNo = non_ProgramService.np_Chaebun();
			logger.info("야 채번돌고옴");
			if (npNo.length()==1) npNo ="000"+npNo;
			if (npNo.length()==2) npNo ="00"+npNo;
			if (npNo.length()==3) npNo ="0"+npNo;
			npNo = "NP"+npNo;
			
			
			MultipartRequest mr = new MultipartRequest(hsr,
								"C:/ProjectSSM/java142_Luna_SungIll/ProjectSSM/Project_SSM/WebContent/npFile",
								10000*10000,
								"EUC-KR"
								,new DefaultFileRenamePolicy());
			
			
			logger.info("야 npvo 넣을게");
			npvo.setNpNo(npNo);
			npvo.setNpTitle(mr.getParameter("npTitle"));
			npvo.setNpContents(mr.getParameter("npContents"));
			npvo.setNpCenter(mr.getParameter("npCenter"));
			npvo.setNpImage(mr.getFilesystemName("npImage"));
			npvo.setNpRsdate(mr.getParameter("npRsdate"));
			npvo.setNpRedate(mr.getParameter("npRedate"));
			npvo.setNpPsdate(mr.getParameter("npPsdate"));
			npvo.setNpPedate(mr.getParameter("npPedate"));
			npvo.setNpObject(mr.getParameter("npObject"));
			npvo.setNpPersonnel(mr.getParameter("npPersonnel"));
			//npvo.setTtNo(mr.getParameter("ttNo"));ttno 세션으로 가져오기
			npvo.setTtNo("T200001");
			npvo.setNpIo(mr.getParameter("npIo"));
			npvo.setAcode(mr.getParameter("Acode"));
			//파일친거
			logger.info("파일시작");
			npvo.setNpFile(mr.getFilesystemName("npFile"));
			logger.info("파일끝");
			//파일친거 끝
			logger.info("야서비스 넣을게");
			result = non_ProgramService.np_InsertData(npvo);
			logger.info("try문 끝낫음");
		}catch(Exception e){
			e.printStackTrace();
		}
		logger.info("npvo.toString()>>>"+npvo.toString());
		if(result>0) resultStr="글작성성공";
		else resultStr="실패";
			model.addAttribute("resultStr",resultStr);
			
		return "br/result";	
		}
	//디테일
	@RequestMapping("/np_detailData")
	public String np_detailData(@RequestParam String npNo ,Model model){
		logger.info("npNo>>>"+npNo);
		Non_ProgramVO npvo = new Non_ProgramVO();
		npvo.setNpNo(npNo);
		
		
		List list = non_ProgramService.np_detailData(npvo);
		if(list.size()>0){
			model.addAttribute("list",list);
		}else{
			logger.info("list 널이야~");
		}
			
		return "br/np_Detail";
	}
	//수정폼 가기
	@RequestMapping("/updateForm")
	public String updateForm(@RequestParam String npNo ,Model model){
		logger.info("npNo>>>"+npNo);
		Non_ProgramVO npvo = new Non_ProgramVO();
		npvo.setNpNo(npNo);
		
		
		List list = non_ProgramService.np_detailData(npvo);
		if(list.size()>0){
			model.addAttribute("list",list);
		}else{
			logger.info("list 널이야~");
		}	
		return "br/np_UpdateForm";
	}
	//수정 클릭시 실행함수
	@RequestMapping("/np_DetailUpdate")
	public String np_DetailUpdate(HttpServletRequest hsr,Model model){
		int result = 0;
		String resultStr="";
		Non_ProgramVO npvo = new Non_ProgramVO();
		
		try{
			logger.info("try문 진입했음");
			logger.info("야 npvo 넣을게");
			MultipartRequest mr = new MultipartRequest(hsr,
								"C:/ProjectSSM/java142_Luna_SungIll/ProjectSSM/Project_SSM/WebContent/images",
								10000*10000,
								"EUC-KR"
								,new DefaultFileRenamePolicy());
			
			
			logger.info("야 npvo 넣을게");
			npvo.setNpNo(mr.getParameter("npNo"));
			npvo.setNpTitle(mr.getParameter("npTitle"));
			npvo.setNpContents(mr.getParameter("npContents"));
			npvo.setNpCenter(mr.getParameter("npCenter"));
			npvo.setNpImage(mr.getParameter("npImage"));
			npvo.setNpRsdate(mr.getParameter("npRsdate"));
			npvo.setNpRedate(mr.getParameter("npRedate"));
			npvo.setNpPsdate(mr.getParameter("npPsdate"));
			npvo.setNpPedate(mr.getParameter("npPedate"));
			npvo.setNpObject(mr.getParameter("npObject"));
			npvo.setNpPersonnel(mr.getParameter("npPersonnel"));
			//npvo.setTtNo(mr.getParameter("ttNo"));ttno 세션으로 가져오기
			npvo.setTtNo("T200001");
			npvo.setNpIo(mr.getParameter("npIo"));
			npvo.setAcode(mr.getParameter("Acode"));
			logger.info("기존이미지"+mr.getParameter("npImage"));
			logger.info("새로운 이미지"+mr.getFilesystemName("NEW_npImage"));
			logger.info("야서비스 넣을게");
			result = non_ProgramService.np_DetailUpdate(npvo);
			logger.info("try문 끝낫음");
		}catch(Exception e){
			e.printStackTrace();
		}
		logger.info("npvo.toString()>>>"+npvo.toString());
		if(result>0) resultStr="업데이트성공";
		else resultStr="실패";
			model.addAttribute("resultStr",resultStr);
			model.addAttribute("npNo",npvo.getNpNo());
		return "br/result";	
		}
	
	//삭제 쿼리
		@RequestMapping("np_Delete")
		public String np_Delete(@ModelAttribute Non_ProgramVO npvo,Model model){
			logger.info("npvo.getNpNo>>>"+npvo.getNpNo());
			int result = 0;
			String resultStr = "";
			result = non_ProgramService.np_Delete(npvo);
			logger.info("result>>>"+result);
			if(result>0) resultStr = "np삭제 성공";
			else resultStr = "np삭제 실패";
			model.addAttribute("resultStr",resultStr);
			return "br/result";
		}
		
		@RequestMapping("downLoad")
		public String downLoad(@ModelAttribute Non_ProgramVO npvo,HttpServletRequest hsr,Model model ){
			String npFile = hsr.getParameter("filename");
			logger.info("npFile>>"+npFile);
			model.addAttribute("npFile",npFile);
			return "common/download";
		}
		
}

