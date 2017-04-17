package edu.gznc.cxcyzx.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

public interface BaseDao<T> {
	public void save(T t);
	public void update(T t);
	public void saveOrupdate(T t);
	public void delete(T t);
	public T findById(Serializable id);
	// 分页查询方法
	public Integer Count(DetachedCriteria dc);
	public List<T> findByPage(DetachedCriteria dc,Integer begin,Integer pageSize);
	// 查询所有
	public List<T> findAll();
}
