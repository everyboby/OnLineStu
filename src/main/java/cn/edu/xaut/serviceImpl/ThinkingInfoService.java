package cn.edu.xaut.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.xaut.bean.Thinkinginfo;
import cn.edu.xaut.dao.ThinkinginfoMapper;
import cn.edu.xaut.service.ThinkingInfoInterface;

@Service
public class ThinkingInfoService implements ThinkingInfoInterface {
    @Autowired
    private ThinkinginfoMapper thinkinginfoMapper;
    @Override
    public List<Thinkinginfo> selectAll() {
        List<Thinkinginfo> list=thinkinginfoMapper.selectAll();
        return list;
    }

    @Override
    public boolean deleteByPrimaryKey(Thinkinginfo thinkinginfo) {
        int i = thinkinginfoMapper.deleteByPrimaryKey(Integer.valueOf(thinkinginfo.getThinkId()));
        return i>0;
    }

	@Override
	public int  insertThink(Thinkinginfo thinkinginfo) {
		
		return thinkinginfoMapper.insertSelective(thinkinginfo);
	}
	
	@Override
	public Thinkinginfo selectByPrimaryKey(Integer thinkId) {
		return thinkinginfoMapper.selectByPrimaryKey(thinkId);
	}
	@Override
	public boolean updateByPrimaryKey(Thinkinginfo record){
		int i = thinkinginfoMapper.updateByPrimaryKey(record);
		return i>0;
	}
    
}
