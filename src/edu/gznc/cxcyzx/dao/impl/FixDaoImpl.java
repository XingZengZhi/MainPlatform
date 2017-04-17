package edu.gznc.cxcyzx.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import edu.gznc.cxcyzx.dao.FixDao;
import edu.gznc.cxcyzx.domain.Fix;
import edu.gznc.cxcyzx.domain.User;

@Repository
public class FixDaoImpl extends BaseDaoImpl<Fix> implements FixDao {

	@Override
	public Fix FindFix(Fix fix) {
		List<Fix> fixs = (List<Fix>) this.getHibernateTemplate().find("from Fix where fix_name = ? and fix_pass = ?", fix.getFix_name(), fix.getFix_pass());
		if(fixs.size() > 0){
			return fixs.get(0);
		}
		return null;
	}

}
