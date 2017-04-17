package edu.gznc.cxcyzx.dao;

import org.hibernate.criterion.DetachedCriteria;

import edu.gznc.cxcyzx.domain.User;
import edu.gznc.cxcyzx.domain.equipment;

public interface EqDao extends BaseDao<equipment> {
	equipment FindEquipmentByName(equipment eq);
	Integer FindEquipmentCount(DetachedCriteria dc, User user);
}
