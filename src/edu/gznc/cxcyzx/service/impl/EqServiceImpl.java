package edu.gznc.cxcyzx.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.gznc.cxcyzx.dao.EqDao;
import edu.gznc.cxcyzx.domain.User;
import edu.gznc.cxcyzx.domain.equipment;
import edu.gznc.cxcyzx.service.EqService;

@Transactional
public class EqServiceImpl implements EqService {
	@Resource
	private EqDao eqDao;

	@Override
	public void SaveEquipment(equipment eq) {
		eqDao.save(eq);
	}

	@Override
	public equipment FindEquipmentByName(equipment eq) {
		return eqDao.FindEquipmentByName(eq);
	}

	@Override
	public List<equipment> FindAllEquipment() {
		return eqDao.findAll();
	}

	@Override
	public Integer EquipmentCount(DetachedCriteria dc, User user) {
		return eqDao.FindEquipmentCount(dc, user);
	}

	@Override
	public List<equipment> FindByEquipmentPage(DetachedCriteria dc, Integer begin, Integer pageSize) {
		return eqDao.findByPage(dc, begin, pageSize);
	}

	@Override
	public equipment FindEqById(long id) {
		return eqDao.findById(id);
	}

}
