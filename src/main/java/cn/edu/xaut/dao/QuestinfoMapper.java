package cn.edu.xaut.dao;

import java.util.List;

import cn.edu.xaut.bean.Questinfo;

public interface QuestinfoMapper {
	int deleteByPrimaryKey(Long questId);

	int insert(Questinfo record);

	int insertSelective(Questinfo record);
	
	Questinfo selectByPrimaryKey(Long questId);
	//分页
	List<Questinfo> selectByAnyCondition(Questinfo record);

	int updateByPrimaryKeySelective(Questinfo record);
	
	int updateByPrimaryKeyWithBLOBs(Questinfo record);

	
}