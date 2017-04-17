package edu.gznc.cxcyzx.dao;

import org.hibernate.criterion.DetachedCriteria;

import edu.gznc.cxcyzx.domain.User;

public interface UserDao extends BaseDao<User> {
	Integer FindUserCount(DetachedCriteria dc);
	User FindUser(User user);
	User FindUserByName(User user);
}
