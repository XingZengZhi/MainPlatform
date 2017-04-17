package edu.gznc.cxcyzx.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import edu.gznc.cxcyzx.dao.BaseDao;

@Repository
public class BaseDaoImpl<T> extends HibernateDaoSupport implements BaseDao<T> {
	private Class clazz;
	
	public BaseDaoImpl(){
		Class c = this.getClass();
		Type type = c.getGenericSuperclass();
		ParameterizedType pt = (ParameterizedType) type;
		Type[] types = pt.getActualTypeArguments();
		this.clazz = (Class) types[0];
	}

	@Override
	public void save(T t) {
		this.getHibernateTemplate().save(t);
	}

	@Override
	public void update(T t) {
		this.getHibernateTemplate().update(t);
	}

	@Override
	public void delete(T t) {
		this.getHibernateTemplate().delete(t);
	}

	@Override
	public T findById(Serializable id) {
		T t = (T) this.getHibernateTemplate().get(clazz, id);
		return t;
	}

	@Override
	public Integer Count(DetachedCriteria dc) {
		dc.setProjection(Projections.rowCount());
		List<Long> list = (List<Long>) this.getHibernateTemplate().findByCriteria(dc);
		if(list.size() > 0){
			return list.get(0).intValue();
		}
		return null;
	}

	@Override
	public List<T> findByPage(DetachedCriteria dc, Integer begin, Integer pageSize) {
		dc.setProjection(null);
		List<T> list = (List<T>) this.getHibernateTemplate().findByCriteria(dc, begin, pageSize);
		return list;
	}

	@Override
	public List<T> findAll() {
		List<T> list = (List<T>) this.getHibernateTemplate().find("from "+this.clazz.getSimpleName());
		return list;
	}

	@Override
	public void saveOrupdate(T t) {
		this.getHibernateTemplate().saveOrUpdate(t);
	}

}
