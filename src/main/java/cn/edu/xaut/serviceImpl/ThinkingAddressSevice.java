package cn.edu.xaut.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.xaut.bean.ThinkingAddress;
import cn.edu.xaut.dao.ThinkingAddressMapper;
import cn.edu.xaut.service.ThinkingAddressInterface;

@Service
public class ThinkingAddressSevice implements ThinkingAddressInterface {
    @Autowired
    private ThinkingAddressMapper thinkingAddressMapper;
    
 	 // 根据动态标志删所有值
	@Override
	public boolean deleteByFlag(String addressThinkFlag) {
		return thinkingAddressMapper.deleteByFlag(addressThinkFlag)>0;
	}
	// 根据动态标志取所有值
	@Override
	public List<ThinkingAddress> selectThinkingAddressByFlag(String addressThinkFlag) {
		return thinkingAddressMapper.selectThinkingAddressByFlag(addressThinkFlag);
	}
	// 批量插入
	@Override
	public void insertForeach(List<ThinkingAddress> ThinkingAddressList) {
		thinkingAddressMapper.insertForeach(ThinkingAddressList);
	}
    
}
