package cn.edu.xaut.dao;

import java.util.List;

import cn.edu.xaut.bean.Thinkinginfo;

public interface ThinkinginfoMapper {

    int insert(Thinkinginfo record);

    int insertSelective(Thinkinginfo record);

    Thinkinginfo selectByPrimaryKey(Integer thinkId);

    List <Thinkinginfo> selectAll();

    int updateByPrimaryKeySelective(Thinkinginfo record);

    int updateByPrimaryKey(Thinkinginfo record);

	int deleteByPrimaryKey(Integer thinkId);


}