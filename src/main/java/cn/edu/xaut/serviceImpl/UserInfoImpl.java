package cn.edu.xaut.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.xaut.bean.Userinfo;
import cn.edu.xaut.dao.UserinfoMapper;
import cn.edu.xaut.service.UserInfoInterface;

@Service("userService")
@Transactional(readOnly=true,propagation=Propagation.SUPPORTS)
public class UserInfoImpl implements UserInfoInterface {
	@Autowired
	private UserinfoMapper userinfoMapper;

	@Override
	public Userinfo insertSelective(Userinfo userinfo) {
		userinfoMapper.insertSelective(userinfo);
		return userinfo;
	}

	@Override
	public boolean delete(long userId) {
		int i = userinfoMapper.deleteByPrimaryKey(userId);
		System.out.println(i);
		return i>0;
	}

	@Override
	public Userinfo updateByPrimaryKey(Userinfo userinfo) {
		userinfoMapper.updateByPrimaryKey(userinfo);
		return userinfo;
	}

	@Override
	public Userinfo selectByUserName(String userName) {
		return userinfoMapper.selectByUserName(userName);

	}

	@Override
	public List<Userinfo> selectAll() {
		return userinfoMapper.selectAll();
	}
}
