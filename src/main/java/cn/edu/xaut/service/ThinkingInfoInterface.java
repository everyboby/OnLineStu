package cn.edu.xaut.service;

import java.util.List;

import cn.edu.xaut.bean.Thinkinginfo;

public interface ThinkingInfoInterface {
    List<Thinkinginfo> selectAll();
    boolean deleteByPrimaryKey(Thinkinginfo thinkinginfo);
    int insertThink(Thinkinginfo thinkinginfo);
	Thinkinginfo selectByPrimaryKey(Integer thinkId);
	boolean updateByPrimaryKey(Thinkinginfo record);
}
