package edu.gznc.cxcyzx.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import edu.gznc.cxcyzx.dao.EqDao;
import edu.gznc.cxcyzx.domain.User;
import edu.gznc.cxcyzx.domain.equipment;

@Repository
public class EqDaoImpl extends BaseDaoImpl<equipment> implements EqDao {

	@Override
	public equipment FindEquipmentByName(equipment eq) {
		List<equipment> eqs = (List<equipment>) this.getHibernateTemplate().find("from equipment where eq_name = ?", eq.getEq_name());
		if(eqs.size() > 0){
			return eqs.get(0);
		}
		return null;
	}

	@Override
	public Integer FindEquipmentCount(DetachedCriteria dc, User user) {
		dc.setProjection(Projections.rowCount());
		dc.add(Restrictions.eq("user", user));
		List<Long> eqs = (List<Long>) this.getHibernateTemplate().findByCriteria(dc);
		if(eqs.size() > 0){
			return eqs.get(0).intValue();
		}
		return null;
	}

}
