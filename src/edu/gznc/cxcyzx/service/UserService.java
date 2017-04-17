package edu.gznc.cxcyzx.service;


import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import edu.gznc.cxcyzx.domain.User;


public interface UserService {
	Integer UserCount(DetachedCriteria dc);
	boolean UserRegister(User user);
	List<User> findByPage(DetachedCriteria dc, Integer pageIndex, Integer pageSize);
	User FindUser(User user);
	User FindUserByName(User user);
	User FindUserByid(long uid);
	void UpdateUser(User user);
}
