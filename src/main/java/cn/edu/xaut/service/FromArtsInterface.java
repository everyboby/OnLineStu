package cn.edu.xaut.service;

import java.util.List;

import cn.edu.xaut.bean.FromArts;

public interface FromArtsInterface {
	FromArts selectByPrimaryKey(Integer artsId);

	FromArts deleteByPrimaryKey(FromArts fromArts);

	FromArts insertSelective(FromArts fromArts);

	FromArts updateByPrimaryKey(FromArts fromArts);

	List<FromArts> selectAllarts();
}
