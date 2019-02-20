package cn.edu.xaut.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.xaut.bean.FromArts;

public interface FromArtsMapper {
	int deleteByPrimaryKey(FromArts fromArts);

	// int insert(FromArts record);

	int insertSelective(FromArts record);

	FromArts selectByPrimaryKey(@Param("artsId") Integer artsId);

	// int updateByPrimaryKeySelective(FromArts record);

	int updateByPrimaryKey(FromArts record);

	List<FromArts> selectAllarts();
}