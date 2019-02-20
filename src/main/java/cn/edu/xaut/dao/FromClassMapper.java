package cn.edu.xaut.dao;

import java.util.List;

import cn.edu.xaut.bean.FromClass;

public interface FromClassMapper {
    int deleteByPrimaryKey(Integer classId);

    int insert(FromClass record);

    int insertSelective(FromClass record);

    FromClass selectByPrimaryKey(Integer classId);

    int updateByPrimaryKeySelective(FromClass record);

    int updateByPrimaryKey(FromClass record);
    
    List<FromClass> SelectAllClass();
}