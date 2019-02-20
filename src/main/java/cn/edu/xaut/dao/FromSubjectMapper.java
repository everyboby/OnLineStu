package cn.edu.xaut.dao;

import java.util.List;

import cn.edu.xaut.bean.FromSubject;

public interface FromSubjectMapper {
    int deleteByPrimaryKey(Integer subjectId);

    int insert(FromSubject record);

    int insertSelective(FromSubject record);

    FromSubject selectByPrimaryKey(Integer subjectId);

    int updateByPrimaryKeySelective(FromSubject record);


	List<FromSubject> selectAllSubject();
}