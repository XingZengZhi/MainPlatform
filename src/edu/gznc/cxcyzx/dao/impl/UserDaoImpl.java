package edu.gznc.cxcyzx.dao.impl;


import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.springframework.stereotype.Repository;

import edu.gznc.cxcyzx.dao.UserDao;
import edu.gznc.cxcyzx.domain.User;

@Repository
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {

	@Override
	public Integer FindUserCount(DetachedCriteria dc) {
		dc.setProjection(Projections.rowCount());
		List<Long> longs = (List<Long>) this.getHibernateTemplate().findByCriteria(dc);
		if(longs.size() > 0){
			return longs.get(0).intValue();
		}
		return null;
	}

	@Override
	public User FindUser(User user) {
		List<User> users = (List<User>) this.getHibernateTemplate().find("from User where uname = ? and upassword = ?", user.getUname(), user.getUpassword());
		if(users.size() > 0){
			return users.get(0);
		}
		return null;
	}

	@Override
	public User FindUserByName(User user) {
		List<User> users = (List<User>) this.getHibernateTemplate().find("from User where uname = ?", user.getUname());
		if(users.size() > 0){
			return users.get(0);
		}
		return null;
	}

}
