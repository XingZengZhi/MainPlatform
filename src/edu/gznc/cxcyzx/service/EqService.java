package edu.gznc.cxcyzx.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import edu.gznc.cxcyzx.domain.User;
import edu.gznc.cxcyzx.domain.equipment;

public interface EqService {
	void SaveEquipment(equipment eq);
	equipment FindEquipmentByName(equipment eq);
	List<equipment> FindAllEquipment();
	Integer EquipmentCount(DetachedCriteria dc, User user);
	List<equipment> FindByEquipmentPage(DetachedCriteria dc, Integer begin, Integer pageSize);
	equipment FindEqById(long id);
}
