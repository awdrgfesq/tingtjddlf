package ssm.cd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import ssm.cd.service.Value_SettingService;
import ssm.cd.vo.Value_SettingVO;
import ssm.mi.member.util.BabySession;

@Controller
@RequestMapping("/value_Setting")
public class Value_SettingController {
	Logger logger=Logger.getLogger(Value_SettingController.class); 
	
	@Autowired
	private Value_SettingService value_SettingService;
	
	@RequestMapping("go_VS_Main")
	public String go_VS_Main (Value_SettingVO vsvo,HttpServletRequest request,Model model){
		logger.info("벨류셋팅함수시작");
		String ssNo = "";
		try{
			ssNo = BabySession.getSessionNO(request);
	
		logger.info("ss뽑아옴");
		logger.info("ssNo");
		vsvo.setSsNo(ssNo);
		logger.info("vo넣을꺼>>>"+vsvo.toString());
		List list = value_SettingService.loadValueSetting(vsvo);
		logger.info("vo받아온거>>>"+list.get(0).toString());
		if(list!=null){
			model.addAttribute("list",list);
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "/cd/value_Setting_Main";
	}
	
	@RequestMapping("saveValueSetting")
	public String saveValueSetting(@ModelAttribute Value_SettingVO vsvo,HttpServletRequest request,Model model){
		String resultStr="";
		String isud = request.getParameter("ISUD");
		logger.info(vsvo.toString());
		
		if(isud.equals("I")){
			//인서트
			try{
				vsvo.setSsNo(BabySession.getSessionNO(request));
				
				String chaebun = value_SettingService.makeChaebun_VS()+"";
				if (chaebun.length()==1) chaebun ="000"+chaebun;
				if (chaebun.length()==2) chaebun ="00"+chaebun;
				if (chaebun.length()==3) chaebun ="0"+chaebun;
				chaebun = "VS"+chaebun;
				vsvo.setVsNo(chaebun);
				int result = value_SettingService.saveValueSetting(vsvo);
				if (result>0){
					resultStr="잘저장되었습니다";
					logger.info(resultStr);
				}else{
					resultStr="저장에 오류낫엉";
					logger.info(resultStr);
				}
				
				
			}catch(Exception e){
				e.printStackTrace();
			}
			List list = value_SettingService.loadValueSetting(vsvo);
			logger.info("vo받아온거>>>"+list.get(0).toString());
			if(list!=null){
				model.addAttribute("list",list);
			}
			model.addAttribute("resultStr",resultStr);
			return "/cd/value_Setting_Main";
		}else{
			//업데이트
			try{
				vsvo.setSsNo(BabySession.getSessionNO(request));
				int result = value_SettingService.updateValueSetting(vsvo);
				if (result>0){
					resultStr="잘변경되었습니다";
					logger.info(resultStr);
				}else{
					resultStr="변경에 오류낫엉";
					logger.info(resultStr);
				}
				List list = value_SettingService.loadValueSetting(vsvo);
				logger.info("vo받아온거>>>"+list.get(0).toString());
				if(list!=null){
					model.addAttribute("list",list);
				}
				
			}catch(Exception e){
				e.printStackTrace();
			}
			model.addAttribute("resultStr",resultStr);
			return "/cd/value_Setting_Main";
		}
		//세션처리하면 지울것
		
	}

}
