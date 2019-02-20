package cn.edu.xaut.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.xaut.bean.FromClass;
import cn.edu.xaut.dao.FromClassMapper;
import cn.edu.xaut.service.FromClassInterface;

@Service
public class FromClassImpl implements FromClassInterface {
	@Autowired
	private FromClassMapper FromClassMapper;

	@Override
	public int deleteByPrimaryKey(Integer classId) {
		return FromClassMapper.deleteByPrimaryKey(classId);
	}

	@Override
	public int insertSelective(FromClass record) {
		return FromClassMapper.insertSelective(record);
	}

	@Override
	public List<FromClass> SelectAllClass() {
		return FromClassMapper.SelectAllClass();
	}

}
