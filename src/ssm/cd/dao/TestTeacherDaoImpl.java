package ssm.cd.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import ssm.cd.vo.TestTeacherVO;


@Repository
public class TestTeacherDaoImpl implements TestTeacherDao {
	private SqlSession session;
	
	
	@Override
	public List<TestTeacherVO> listStudent(TestTeacherVO ttvo) {
		// TODO Auto-generated method stub
		return session.selectList("listStudent",ttvo);
	}

}
