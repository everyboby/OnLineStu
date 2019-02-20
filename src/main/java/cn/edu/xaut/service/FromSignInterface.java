package cn.edu.xaut.service;

import java.util.List;

import cn.edu.xaut.bean.FromSign;

public interface FromSignInterface {
	FromSign selectByPrimaryKey(Integer signId);

	boolean deleteByPrimaryKey(int dignid);

	FromSign insertSelective(FromSign fromSign);

	FromSign updateByPrimaryKey(FromSign fromSign);

	List<FromSign> selectAllSign();
}
