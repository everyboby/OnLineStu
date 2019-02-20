package cn.edu.xaut.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.xaut.bean.FromSign;

public interface FromSignMapper {
	int deleteByPrimaryKey(int dignid);

	// int insert(FromSign record);

	int insertSelective(FromSign record);

	FromSign selectByPrimaryKey(@Param("signId") Integer signId);

	// int updateByPrimaryKeySelective(FromSign record);

	int updateByPrimaryKey(FromSign record);

	List<FromSign> selectAllSign();
}