package ssm.cd.dao;


import java.util.List;

import ssm.cd.vo.TestTeacherVO;

public interface TestTeacherDao {

	List<TestTeacherVO> listStudent(TestTeacherVO ttvo);

}
