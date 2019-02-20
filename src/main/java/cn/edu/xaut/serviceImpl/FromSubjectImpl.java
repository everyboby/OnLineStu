package cn.edu.xaut.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.xaut.bean.FromSubject;
import cn.edu.xaut.dao.FromSubjectMapper;
import cn.edu.xaut.service.FromSubjectInterface;

@Service
public class FromSubjectImpl implements FromSubjectInterface {
	@Autowired
	private FromSubjectMapper fromsubject;

	@Override
	public FromSubject insertSelective(FromSubject FromSubject) {
		fromsubject.insertSelective(FromSubject);
		return FromSubject;
	}

	@Override
	public boolean deleteByPrimaryKey(int subject_id) {
		int i = fromsubject.deleteByPrimaryKey(subject_id);
		return i>0;
	}

	@Override
	public FromSubject updateByPrimaryKeySelective(FromSubject FromSubject) {
		@SuppressWarnings("unused")
		int i = fromsubject.updateByPrimaryKeySelective(FromSubject);
		return FromSubject;
	}

	@Override
	public FromSubject selectByPrimaryKey(int fromId) {
		return fromsubject.selectByPrimaryKey(fromId);
	}

	@Override
	public List<FromSubject> selectAllSubject() {
		return fromsubject.selectAllSubject();
	}


}
