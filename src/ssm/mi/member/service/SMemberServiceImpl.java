package ssm.mi.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.mi.member.dao.SMemberDao;
import ssm.mi.member.vo.BasicInformationVO;
import ssm.mi.member.vo.SMemberGrVO;
import ssm.mi.member.vo.SMemberVO;
import ssm.mi.member.vo.TMemberVO;

@Service
@Transactional
public class SMemberServiceImpl implements SMemberService {

	
	@Autowired
	private SMemberDao SMemberDao;
	
	@Override
	public SMemberVO checkInfo(SMemberVO smvo) {
		// TODO Auto-generated method stub
		return SMemberDao.checkInfo(smvo);
	}

	@Override
	public SMemberGrVO checkFM_Member(SMemberVO svo) {
		// TODO Auto-generated method stub
		return SMemberDao.checkFM_Member(svo);
	}

	@Override
	public SMemberGrVO checkJR_Member(SMemberVO svo) {
		// TODO Auto-generated method stub
		return SMemberDao.checkJR_Member(svo);
	}

	@Override
	public SMemberGrVO checkSR_Member(SMemberVO svo) {
		// TODO Auto-generated method stub
		return SMemberDao.checkSR_Member(svo);
	}

	@Override
	public void fileUpload(SMemberVO smvo) {
		// TODO Auto-generated method stub
		SMemberDao.fileUpload(smvo);
	}

	@Override
	public int insertInfo(SMemberVO smvo) {
		// TODO Auto-generated method stub
		return SMemberDao.insertInfo(smvo);
	}

	@Override
	public TMemberVO teacherInfo(SMemberGrVO sgvo) {
		// TODO Auto-generated method stub
		return SMemberDao.teacherInfo(sgvo);
	}

	@Override
	public int insertGr(SMemberGrVO sgvo) {
		// TODO Auto-generated method stub
		return SMemberDao.insertGr(sgvo);
	}

	@Override
	public int chaebunGr(SMemberGrVO sgvo) {
		// TODO Auto-generated method stub
		return SMemberDao.chaebunGr(sgvo);
	}

	@Override
	public List<SMemberVO> smListAll() {
		// TODO Auto-generated method stub
		List<SMemberVO> list = SMemberDao.smListAll();
		return list;
	}

	@Override
	public SMemberVO ajaxIdCheck(SMemberVO svo) {
		// TODO Auto-generated method stub
		return SMemberDao.ajaxIdCheck(svo);
	}

	@Override
	public SMemberVO loginCheck(SMemberVO svo) {
		// TODO Auto-generated method stub
		return SMemberDao.loginCheck(svo);
	}

	@Override
	public TMemberVO tLoginCheck(TMemberVO tvo) {
		// TODO Auto-generated method stub
		return SMemberDao.tLoginCheck(tvo);
	}

	@Override
	public List basicInformation(BasicInformationVO bivo) {
		// TODO Auto-generated method stub
		return SMemberDao.basicInformation(bivo);
	}

	@Override
	public SMemberVO selectPn(SMemberVO svo) {
		// TODO Auto-generated method stub
		return SMemberDao.selectPn(svo);
	}

	@Override
	public String biChaebun() {
		// TODO Auto-generated method stub
		return SMemberDao.biChaebun();
	}

	@Override
	public int BIInsert(BasicInformationVO bivo) {
		// TODO Auto-generated method stub
		return SMemberDao.BIInsert(bivo);
	}

	@Override
	public int BIUpdate(BasicInformationVO bivo) {
		// TODO Auto-generated method stub
		return SMemberDao.BIUpdate(bivo);
	}

	@Override
	public List sInformation(SMemberVO svo) {
		// TODO Auto-generated method stub
		List list = null;
		list = SMemberDao.sInformation(svo);
		return list;
	}

		

}
