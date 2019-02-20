package cn.edu.xaut.service;

import java.util.List;

import cn.edu.xaut.bean.ThinkingAddress;

public interface ThinkingAddressInterface {
	// 根据动态标志删所有值
	boolean deleteByFlag(String addressThinkFlag);

	// 根据动态标志取所有值
	List<ThinkingAddress> selectThinkingAddressByFlag(String addressThinkFlag);

	// 批量插入
	void insertForeach(List<ThinkingAddress> ThinkingAddressList);
}
