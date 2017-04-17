package edu.gznc.cxcyzx.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import edu.gznc.cxcyzx.dao.UserDao;
import edu.gznc.cxcyzx.domain.User;
import edu.gznc.cxcyzx.service.UserService;

@Transactional
public class UserServiceImpl implements UserService {
	@Resource
	private UserDao userDao;

	@Override
	public Integer UserCount(DetachedCriteria dc) {
		return userDao.Count(dc);
	}

	@Override
	public List<User> findByPage(DetachedCriteria dc, Integer pageIndex, Integer pageSize) {
		return userDao.findByPage(dc, pageIndex, pageSize);
	}

	@Override
	public boolean UserRegister(User user) {
		User havUser = userDao.FindUserByName(user);//判断用户是否在保存
		if(havUser == null){
			userDao.save(user);
			return true;
		}
		return false;
	}

	@Override
	public User FindUser(User user) {
		return userDao.FindUser(user);
	}

	@Override
	public User FindUserByName(User user) {
		return userDao.FindUserByName(user);
	}

	@Override
	public void UpdateUser(User user) {
		userDao.update(user);
	}

	@Override
	public User FindUserByid(long uid) {
		return userDao.findById(uid);
	}

	
}
