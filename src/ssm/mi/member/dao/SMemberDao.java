package ssm.mi.member.dao;

import java.util.List;

import ssm.mi.member.vo.BasicInformationVO;
import ssm.mi.member.vo.SMemberGrVO;
import ssm.mi.member.vo.SMemberVO;
import ssm.mi.member.vo.TMemberVO;

public interface SMemberDao {


	SMemberVO checkInfo(SMemberVO smvo);
	
	SMemberGrVO checkFM_Member(SMemberVO svo);
	
	SMemberGrVO checkJR_Member(SMemberVO svo);
	
	SMemberGrVO checkSR_Member(SMemberVO svo);
	
	void fileUpload(SMemberVO smvo);
	
	int insertInfo(SMemberVO smvo);

	TMemberVO teacherInfo(SMemberGrVO sgvo);

	int insertGr(SMemberGrVO sgvo);

	int chaebunGr(SMemberGrVO sgvo);

	List<SMemberVO> smListAll();

	SMemberVO ajaxIdCheck(SMemberVO svo);

	SMemberVO loginCheck(SMemberVO svo);

	TMemberVO tLoginCheck(TMemberVO tvo);

	List basicInformation(BasicInformationVO bivo);

	SMemberVO selectPn(SMemberVO svo);

	String biChaebun();

	int BIInsert(BasicInformationVO bivo);

	int BIUpdate(BasicInformationVO bivo);

	List sInformation(SMemberVO svo);

}
