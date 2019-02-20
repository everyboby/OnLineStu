package cn.edu.xaut.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.xaut.bean.FromSign;
import cn.edu.xaut.dao.FromSignMapper;
import cn.edu.xaut.service.FromSignInterface;

@Service
public class FromSignImpl implements FromSignInterface {
    @Autowired
    private FromSignMapper fromSignMapper;
    @Override
    public FromSign selectByPrimaryKey(Integer signId) {
        return fromSignMapper.selectByPrimaryKey(signId);
    }


    @Override
    public FromSign insertSelective(FromSign fromSign) {
        fromSignMapper.insertSelective(fromSign);
        return fromSign;
    }

    @Override
    public FromSign updateByPrimaryKey(FromSign fromSign) {
        fromSignMapper.updateByPrimaryKey(fromSign);
        return fromSign;
    }

	@Override
	public List<FromSign> selectAllSign() {
		return fromSignMapper.selectAllSign();
	}

	@Override
	public boolean deleteByPrimaryKey(int dignid) {
		 int i = fromSignMapper.deleteByPrimaryKey(dignid);
		return i>0;
	}
}
