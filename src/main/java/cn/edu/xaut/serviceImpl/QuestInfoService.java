package cn.edu.xaut.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.xaut.bean.Questinfo;
import cn.edu.xaut.dao.QuestinfoMapper;
import cn.edu.xaut.service.QuestInfoInterface;

@Service
public class QuestInfoService implements QuestInfoInterface {

    @Autowired
    private QuestinfoMapper questinfoMapper;
    //查
	@Override
	public List<Questinfo> selectByAnyCondition(Questinfo record) {
		return questinfoMapper.selectByAnyCondition(record);
	}
    //删
    @Override
    public boolean deleteByPrimaryKey(Long questId) {
        int i = questinfoMapper.deleteByPrimaryKey(questId);
        return i>0;
    }

    @Override
    public boolean updateByPrimaryKeyWithBLOBs(Questinfo questinfo) {
        int i = questinfoMapper.updateByPrimaryKeySelective(questinfo);
        return i>0;
    }
    
    
    @Override
    public Long insertSelective(Questinfo questinfo) {
        @SuppressWarnings("unused")
		int i = questinfoMapper.insertSelective(questinfo);
        return questinfo.getQuestId();
    }
	@Override
	public Questinfo selectByPrimaryKey(Long questId) {
		return questinfoMapper.selectByPrimaryKey(questId);
	}
}
