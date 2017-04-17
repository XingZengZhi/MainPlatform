package edu.gznc.cxcyzx.dao;

import edu.gznc.cxcyzx.domain.Fix;

public interface FixDao extends BaseDao<Fix> {
	Fix FindFix(Fix fix);
}
