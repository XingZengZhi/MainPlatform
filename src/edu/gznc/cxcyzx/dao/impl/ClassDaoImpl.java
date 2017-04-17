package edu.gznc.cxcyzx.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import edu.gznc.cxcyzx.dao.ClassDao;
import edu.gznc.cxcyzx.domain.Classify;

@Repository
public class ClassDaoImpl extends BaseDaoImpl<Classify> implements ClassDao {

	@Override
	public Integer ClassCount(DetachedCriteria dc, Classify classify) {
		dc.setProjection(Projections.rowCount());
		dc.add(Restrictions.eq("classify", classify));
		List<Long> eqs = (List<Long>) this.getHibernateTemplate().findByCriteria(dc);
		if(eqs.size() > 0){
			return eqs.get(0).intValue();
		}
		return null;
	}

}
