package cn.edu.xaut.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.xaut.bean.FromTime;
import cn.edu.xaut.dao.FromTimeMapper;
import cn.edu.xaut.service.FromTimeInterface;

@Service
public class FromTimeImpl implements FromTimeInterface {
    @Autowired
    private FromTimeMapper fromTimeMapper;
    @Override
    public FromTime insertTimeSelective(FromTime fromTime) {
         fromTimeMapper.insertSelective(fromTime);
         return fromTime;
    }

    @Override
    public boolean deleteTimeByPrimaryKey(long time_id) {
         int i = fromTimeMapper.deleteByPrimaryKey(time_id);
         return i>0;
    }

    @Override
    public FromTime updateTimeByPrimaryKey(FromTime fromTime) {
        fromTimeMapper.updateByPrimaryKey(fromTime);
        return fromTime;
    }

    @Override
    public FromTime selectTimeByPrimaryKey(Long fromId) {
        return fromTimeMapper.selectByPrimaryKey(fromId);

    }

	@Override
	public List<FromTime> selectAllTime() {
		return fromTimeMapper.selectAllTime();
	}


}
