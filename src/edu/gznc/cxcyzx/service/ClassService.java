package edu.gznc.cxcyzx.service;

import org.hibernate.criterion.DetachedCriteria;

import edu.gznc.cxcyzx.domain.Classify;

public interface ClassService {
	Classify FindClassById(long id);
	Integer ClassCount(DetachedCriteria dc, Classify classify);
}
