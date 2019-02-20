package cn.edu.xaut.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.xaut.bean.FromTime;

public interface FromTimeMapper {

	int deleteByPrimaryKey(long time_id);

	// int insert(FromTime record);

	int insertSelective(FromTime record);

	FromTime selectByPrimaryKey(@Param("fromId") Long fromId);

	// int updateByPrimaryKeySelective(FromTime record);

	int updateByPrimaryKey(FromTime record);

	List<FromTime> selectAllTime();
}