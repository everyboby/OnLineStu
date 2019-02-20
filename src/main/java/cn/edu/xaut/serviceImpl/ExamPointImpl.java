package cn.edu.xaut.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.xaut.bean.ExamPoint;
import cn.edu.xaut.dao.ExamPointMapper;
import cn.edu.xaut.service.ExamPointInterface;

@Service
public class ExamPointImpl implements ExamPointInterface {
    @Autowired
    private ExamPointMapper examPointMapper;

	@Override
	public int deleteByThinkFlag(String pointThinkFlag) {
		return examPointMapper.deleteByThinkFlag(pointThinkFlag);
	}

	@Override
	public List<ExamPoint> selectAllPoint() {
		return examPointMapper.selectAllPoint();
	}

	@Override
	public int deleteById(int pointId) {
		return examPointMapper.deleteById(pointId);
	}

	@Override
	public List<ExamPoint> selectPointByCon(String reqWord) {
		return examPointMapper.selectPointByCon(reqWord);
	}

	@Override
	public int insertForeach(List<ExamPoint> list) {
		return examPointMapper.insertForeach(list);
	}

	@Override
	public ExamPoint selectByPrimaryKey(Long pointId) {
		return examPointMapper.selectByPrimaryKey(pointId);
	}

	@Override
	public int updateByPrimaryKey(ExamPoint record) {
		return examPointMapper.updateByPrimaryKey(record);
	}
}
