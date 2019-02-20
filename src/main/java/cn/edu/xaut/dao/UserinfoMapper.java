package cn.edu.xaut.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import cn.edu.xaut.bean.Userinfo;
@Repository("UserDao")
public interface UserinfoMapper {

    int deleteByPrimaryKey(long userId);

//    int insert(Userinfo record);

    int insertSelective(Userinfo record);

    Userinfo selectByUserName(@Param("userName") String userName);

//    int updateByPrimaryKeySelective(Userinfo record);

    int updateByPrimaryKey(Userinfo record);


    //分页查询

    List<Userinfo> selectAll();

}