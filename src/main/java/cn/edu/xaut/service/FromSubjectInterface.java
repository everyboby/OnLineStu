package cn.edu.xaut.service;

import java.util.List;

import cn.edu.xaut.bean.FromSubject;

public interface FromSubjectInterface {

	public boolean deleteByPrimaryKey(int subject_id);

	public FromSubject updateByPrimaryKeySelective(FromSubject FromSubject);

	public FromSubject selectByPrimaryKey(int fromId);

	List<FromSubject> selectAllSubject();

	FromSubject insertSelective(FromSubject FromSubject);
}
