package cn.edu.xaut.service;

import java.util.List;

import cn.edu.xaut.bean.Questinfo;

public interface QuestInfoInterface {
	List<Questinfo> selectByAnyCondition(Questinfo record);
	
    boolean deleteByPrimaryKey(Long questId);

    //返回插入的ID
	Long  insertSelective(Questinfo questinfo);

	boolean updateByPrimaryKeyWithBLOBs(Questinfo questinfo);
	
	Questinfo selectByPrimaryKey(Long questId);
}
