package ssm.mi.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssm.mi.member.vo.BasicInformationVO;
import ssm.mi.member.vo.SMemberGrVO;
import ssm.mi.member.vo.SMemberVO;
import ssm.mi.member.vo.TMemberVO;

@Repository
public class SMemberDaoImpl implements SMemberDao {

	@Autowired
	private SqlSession SqlSession;
	
	@Override
	public SMemberVO checkInfo(SMemberVO smvo) {
		// TODO Auto-generated method stub
		return SqlSession.selectOne("checkInfo");
	}

	@Override
	public SMemberGrVO checkFM_Member(SMemberVO svo) {
		// TODO Auto-generated method stub
		return SqlSession.selectOne("checkFM_Member");
	}

	@Override
	public SMemberGrVO checkJR_Member(SMemberVO svo) {
		// TODO Auto-generated method stub
		return SqlSession.selectOne("checkJR_Member");
	}

	@Override
	public SMemberGrVO checkSR_Member(SMemberVO svo) {
		// TODO Auto-generated method stub
		return SqlSession.selectOne("checkSR_Member");
	}

	@Override
	public void fileUpload(SMemberVO smvo) {
		// TODO Auto-generated method stub
		SqlSession.update("fileUpload");
	}

	@Override
	public int insertInfo(SMemberVO smvo) {
		// TODO Auto-generated method stub
		return SqlSession.update("insertInfo");
	}

	@Override
	public TMemberVO teacherInfo(SMemberGrVO sgvo) {
		// TODO Auto-generated method stub
		return SqlSession.selectOne("teacherInfo");
	}

	@Override
	public int insertGr(SMemberGrVO sgvo) {
		// TODO Auto-generated method stub
		return SqlSession.update("insertGr");
	}

	@Override
	public int chaebunGr(SMemberGrVO sgvo) {
		// TODO Auto-generated method stub
		return SqlSession.selectOne("chaebunGr");
	}

	@Override
	public List<SMemberVO> smListAll() {
		// TODO Auto-generated method stub
		return SqlSession.selectList("smListAll");
	}

	@Override
	public SMemberVO ajaxIdCheck(SMemberVO svo) {
		// TODO Auto-generated method stub
		return SqlSession.selectOne("ajaxIdCheck");
	}

	@Override
	public SMemberVO loginCheck(SMemberVO svo) {
		// TODO Auto-generated method stub
		return SqlSession.selectOne("loginCheck");
	}

	@Override
	public TMemberVO tLoginCheck(TMemberVO tvo) {
		// TODO Auto-generated method stub
		return SqlSession.selectOne("tLoginCheck");
	}

	@Override
	public List basicInformation(BasicInformationVO bivo) {
		// TODO Auto-generated method stub
		return SqlSession.selectOne("basicInformation");
	}

	@Override
	public SMemberVO selectPn(SMemberVO svo) {
		// TODO Auto-generated method stub
		return SqlSession.selectOne("selectPn");
	}

	@Override
	public String biChaebun() {
		// TODO Auto-generated method stub
		return SqlSession.selectOne("biChaebun");
	}

	@Override
	public int BIInsert(BasicInformationVO bivo) {
		// TODO Auto-generated method stub
		return SqlSession.insert("BIInsert");
	}

	@Override
	public int BIUpdate(BasicInformationVO bivo) {
		// TODO Auto-generated method stub
		return SqlSession.update("BIUpdate");
	}

	@Override
	public List sInformation(SMemberVO svo) {
		// TODO Auto-generated method stub
		return SqlSession.selectOne("sInformation");
	}

	

}
