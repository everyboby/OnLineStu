package cn.edu.xaut.service;

import java.util.List;

import cn.edu.xaut.bean.FromClass;

public interface FromClassInterface {
	int deleteByPrimaryKey(Integer classId);

	int insertSelective(FromClass record);
	
	List<FromClass> SelectAllClass();
}
