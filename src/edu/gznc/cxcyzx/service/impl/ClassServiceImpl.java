package edu.gznc.cxcyzx.service.impl;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import edu.gznc.cxcyzx.dao.ClassDao;
import edu.gznc.cxcyzx.domain.Classify;
import edu.gznc.cxcyzx.service.ClassService;

@Transactional
public class ClassServiceImpl implements ClassService{
	@Resource
	private ClassDao classDao;

	@Override
	public Classify FindClassById(long id) {
		return classDao.findById(id);
	}

	@Override
	public Integer ClassCount(DetachedCriteria dc, Classify classify) {
		return classDao.ClassCount(dc, classify);
	}

}
