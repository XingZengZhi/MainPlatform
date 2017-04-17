package edu.gznc.cxcyzx.dao;

import org.hibernate.criterion.DetachedCriteria;

import edu.gznc.cxcyzx.domain.Classify;

public interface ClassDao extends BaseDao<Classify> {
	Integer ClassCount(DetachedCriteria dc, Classify classify);
}
