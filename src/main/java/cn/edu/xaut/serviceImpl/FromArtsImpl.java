package cn.edu.xaut.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.xaut.bean.FromArts;
import cn.edu.xaut.dao.FromArtsMapper;
import cn.edu.xaut.service.FromArtsInterface;

@Service
public class FromArtsImpl implements FromArtsInterface {
    @Autowired
    private FromArtsMapper fromArtsMapper;
    @Override
    public FromArts selectByPrimaryKey(Integer artsId) {
        return fromArtsMapper.selectByPrimaryKey(artsId);
    }

    @Override
    public FromArts deleteByPrimaryKey(FromArts fromSign) {
        fromArtsMapper.deleteByPrimaryKey(fromSign);
        return fromSign;
    }

    @Override
    public FromArts insertSelective(FromArts fromSign) {
        fromArtsMapper.insertSelective(fromSign);
        return fromSign;
    }

    @Override
    public FromArts updateByPrimaryKey(FromArts fromSign) {
        fromArtsMapper.updateByPrimaryKey(fromSign);
        return fromSign;
    }

	@Override
	public List<FromArts> selectAllarts() {
		return fromArtsMapper.selectAllarts();
	}
}
