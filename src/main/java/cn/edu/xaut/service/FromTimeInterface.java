package cn.edu.xaut.service;

import java.util.List;

import cn.edu.xaut.bean.FromTime;

public interface FromTimeInterface {
	public FromTime insertTimeSelective(FromTime fromTime);

	public FromTime updateTimeByPrimaryKey(FromTime fromTime);

	public FromTime selectTimeByPrimaryKey(Long fromId);

	List<FromTime> selectAllTime();

	boolean deleteTimeByPrimaryKey(long time_id);
}
