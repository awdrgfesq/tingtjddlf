package ssm.br.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.xml.ws.Response;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ssm.br.service.Non_VideoService;
import ssm.br.vo.Non_VideoVO;

@Controller
@RequestMapping("/Non_Video")
public class Non_VideoController {
	Logger logger = Logger.getLogger(Non_VideoController.class);
	@Autowired
	private Non_VideoService non_VideoService;
	
	@RequestMapping("/goInsertForm")
	public String goInsertForm(){
		return "br/na_InsertForm";
	}
	
	@RequestMapping("/VideoMain")
	public String VideoMain(@ModelAttribute Non_VideoVO nvvo,Model model){
		List list = non_VideoService.listVideo();
		logger.info("toString비디오>>>"+nvvo.toString());
		if(list.size()>0) {
			logger.info("리트스사이즈>>>"+list.get(0));
			model.addAttribute("list",list);
		}
		else logger.info("리스트없다");
		return "br/na_Main";
	}
	
	@RequestMapping("/insertVideo")
	public String insertVideo(HttpServletRequest request,@ModelAttribute Non_VideoVO nvvo,Model model){
		logger.info("인서트도착비디오");
		String nvNo="";
		int result = 0;
		String resultStr="";
		
		try{
			MultipartRequest mr = new MultipartRequest(request,
													   "C:/ProjectSSM/java142_Luna_SungIll/ProjectSSM/Project_SSM/WebContent/video",
													   100000*100000,
													   "EUC-KR",
													   new DefaultFileRenamePolicy());
			nvNo=non_VideoService.chaebun();
			if(nvNo.length()==1) nvNo="NA000"+nvNo;
			if(nvNo.length()==2) nvNo="NA00"+nvNo;
			if(nvNo.length()==3) nvNo="NA0"+nvNo;
			if(nvNo.length()==4) nvNo="NA"+nvNo;
			nvvo.setNvNo(nvNo);
			nvvo.setNvTitle(mr.getParameter("nvTitle"));
			nvvo.setNvVideo(mr.getFilesystemName("nvVideo"));
			logger.info("nvvo투ㅡ스트링"+nvvo.toString());
			//nvvo.setTtNo(mr.getParameter("ttNo")); 세션후풀기
			nvvo.setTtNo("T8100001");
			result = non_VideoService.insertVideo(nvvo);
			if(result>0) {
				resultStr="동영상 게시성공";
				
				}
			else {resultStr="동영상 게시실패";}
			model.addAttribute("resultStr",resultStr);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "br/result";
	}
	
	//업데이트폼가는함수
	@RequestMapping("/goUpdateVideo")
	public String goupdateVideo(@ModelAttribute Non_VideoVO nvvo,Model model){
		List list=null;
		list = non_VideoService.goUpdateVideo(nvvo);
		model.addAttribute("list",list);
		return "br/na_UpdateForm"; 
	}
	
	
	@RequestMapping("/updateVideo")
	public String updateVideo(HttpServletRequest request,@ModelAttribute Non_VideoVO nvvo,Model model){
		int result =0;
		String resultStr="";
		try{
			MultipartRequest mr = new MultipartRequest(request,
									   "C:/ProjectSSM/java142_Luna_SungIll/ProjectSSM/Project_SSM/WebContent/video",
									   100000*100000,
									   "EUC-KR",
									   new DefaultFileRenamePolicy());
			
			nvvo.setNvTitle(mr.getParameter("nvTitle"));
			nvvo.setNvNo(mr.getParameter("nvNo"));
			if(mr.getFilesystemName("nvVideo")!=null){
				nvvo.setNvVideo(mr.getFilesystemName("nvVideo"));
			}
			logger.info("nvvo투ㅡ스트링"+nvvo.toString());
			result = non_VideoService.updatetVideo(nvvo);
			if(result>0) {
				resultStr="동영상 수정성공";
				}
			else {resultStr="동영상 수정실패";}
			model.addAttribute("resultStr",resultStr);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "br/result";
	}
	
	@RequestMapping("/deleteVideo")
	public String deleteVideo(@ModelAttribute Non_VideoVO nvvo,Model model){
		int result =0;
		String resultStr="";
		result = non_VideoService.deleteVideo(nvvo);
		if(result>0) {
			resultStr="동영상 삭제성공";
			}
		else {resultStr="동영상 삭제실패";}
		model.addAttribute("resultStr",resultStr);
		return "br/result"; 
	}
}
