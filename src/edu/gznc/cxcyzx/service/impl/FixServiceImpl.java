package edu.gznc.cxcyzx.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.gznc.cxcyzx.dao.FixDao;
import edu.gznc.cxcyzx.domain.Fix;
import edu.gznc.cxcyzx.service.FixService;

@Transactional
public class FixServiceImpl implements FixService {
	@Resource
	private FixDao fixDao;

	@Override
	public Fix FindFix(Fix fix) {
		return fixDao.FindFix(fix);
	}


}
