package cn.edu.xaut.service;

import java.util.List;

import cn.edu.xaut.bean.Userinfo;

public interface UserInfoInterface {
    public Userinfo insertSelective(Userinfo userinfo);
    public boolean delete(long userId);
    public Userinfo updateByPrimaryKey(Userinfo userinfo);
    public Userinfo selectByUserName(String userName);
    public List<Userinfo> selectAll();
}
