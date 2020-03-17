package ssm.cd.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.cd.dao.TestTeacherDao;
import ssm.cd.vo.TestTeacherVO;

@Service
@Transactional
public class TestTeacherServiceImpl implements TestTeacherService {
	
	@Autowired
	private TestTeacherDao testTeacherDao;
	@Override
	public List<TestTeacherVO> listStudent(TestTeacherVO ttvo) {
		
		return testTeacherDao.listStudent(ttvo);
	}

}
