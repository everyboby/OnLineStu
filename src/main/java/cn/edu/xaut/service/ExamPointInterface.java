package cn.edu.xaut.service;

import java.util.List;

import cn.edu.xaut.bean.ExamPoint;

public interface ExamPointInterface {
	int deleteByThinkFlag(String pointThinkFlag);// 根据动态flag删除

	List<ExamPoint> selectAllPoint();

	int deleteById(int pointId);// 根据id删除，检索管理中

	List<ExamPoint> selectPointByCon(String reqWord);// ajax模糊搜索，三个检索

	int insertForeach(List<ExamPoint> list);// 批量插入

	ExamPoint selectByPrimaryKey(Long pointId);// 根据id查询

	int updateByPrimaryKey(ExamPoint record);
}
