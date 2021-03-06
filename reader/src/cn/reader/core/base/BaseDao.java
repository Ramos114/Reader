package cn.reader.core.base;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import cn.reader.core.page.PageModel;
import cn.reader.core.page.PageUtils;
import cn.reader.core.utils.AppContext;
import cn.reader.core.utils.Constants;

/**
 * 持久化 基类
 * @author jerry-HJY
 * @time 2016年11月22日-下午3:56:31
 */
@SuppressWarnings("all")
public class BaseDao {
	@Autowired//自动注入
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	/**
	 * 获取当前线程Session
	 * @return
	 */
	protected Session getCurrentSession() {
		return this.getSessionFactory().getCurrentSession();
	}
	/**
	 * 获取实体
	 * @param clazz
	 * @param id
	 * @return
	 */
	public <T> T get(Class<T> clazz, Serializable id) {
		return (T)this.getCurrentSession().get(clazz, id);
	}
	
	/**
	 * 获取实体 (延迟加载)
	 * @param clazz
	 * @param id
	 * @return
	 */
	public <T> T load(Class<T> clazz, Serializable id) {
		return (T)this.getCurrentSession().load(clazz, id);
	}
	
	/**
	 * 保存实体
	 * @param entity
	 * @return
	 */
	public <T extends BaseEntity> T save(T entity) {
		AppContext.setEntityInfo(entity);
		this.getCurrentSession().save(entity);
		return entity;
	}
	
	/**
	 * 保存实体集合
	 * @param entities
	 * @return
	 */
	public <T extends BaseEntity> List<T> save(List<T> entities) {
		for(int i=0, size=entities.size(); i<size; i++) {
			entities.set(i, this.save(entities.get(i)));
		}
		return entities;
	}

	/**
	 * 删除实体
	 * @param entity
	 */
	public <T extends Serializable> void delete(T entity) {
		this.getCurrentSession().delete(entity);
	}
	
	public <T> void delete(Class<T> clazz, Serializable id) {
		String hql = "delete " + clazz.getName() + " where id = ? ";
		this.executeHql(hql, Arrays.asList(id).toArray());
	}
	
	/**
	 * 删除实体集合
	 * @param entities
	 */
	public <T extends Serializable> void delete(List<T> entities) {
		for(int i=0, size=entities.size(); i<size; i++) {
			this.delete(entities.get(i));
		}
	}

	/**
	 * 修改实体
	 * @param entity
	 */
	public <T extends BaseEntity> void update(T entity) {
		AppContext.setEntityInfo(entity);
		this.getCurrentSession().update(entity);
	}
	
	/**
	 * 修改实体集合
	 * @param entities
	 */
	public <T extends BaseEntity> void update(List<T> entities) {
		for(int i=0, size=entities.size(); i<size; i++) {
			this.update(entities.get(i));
		}
	}

	/**
	 * 更新实体
	 * @param entity
	 */
	public <T extends BaseEntity> void saveOrUpdate(T entity) {
		AppContext.setEntityInfo(entity);
		this.getCurrentSession().saveOrUpdate(entity);
	}
	
	/**
	 * 更新实体集合
	 * @param entities
	 */
	public <T extends BaseEntity> void saveOrUpdate(List<T> entities) {
		for(int i=0, size=entities.size(); i<size; i++) {
			this.saveOrUpdate(entities.get(i));
		}
	}
	/**
	 * 查询实体集合中第一个实体
	 * @param hql
	 * @param params
	 * @return
	 */
	public <T> T get(String hql, Object[] params) {
		List<T> list = this.find(hql, params);
		return list != null && list.size() > 0 ? list.get(0) : null;
	}
	/**
	 * 按照hql查询实体集合(无参)
	 * @param hql
	 * @return
	 */
	public <T> List<T> find(String hql) {
		return this.find(hql, null);
	}
	/**
	 * 查询实体集合
	 * @param hql
	 * @param params
	 */
	public <T> List<T> find(String hql, Object[] params) {
		Query query = this.getCurrentSession().createQuery(hql);
		if(params!=null && params.length > 0) {
			for(int i=0; i<params.length; i++) {
				query.setParameter(i, params[i]);
			}
		}
		return (List<T>)query.setCacheable(true).list();
	}

	/**
	 * 分页查询实体集合(无参)
	 * @param hql
	 * @param currPage
	 * @param pageSize
	 */
	public <T> List<T> find(String hql, Integer currPage, Integer pageSize) {
		return this.find(hql, null, currPage, pageSize);
	}
	/**
	 * 分页查询实体集合
	 * @param hql
	 * @param currPage
	 * @param pageSize
	 */
	public <T> List<T> find(String hql, Object[] params, Integer currPage, Integer pageSize) {
		if(currPage == null || currPage < 1) {
			currPage = 1;
		}
		if(pageSize == null || pageSize < 1) {
			pageSize = Constants.DEFAULT_PAGE_SIZE;
		}
		Query query = this.getCurrentSession().createQuery(hql);
		if(params != null && params.length > 0) {
			for(int i=0; i<params.length; i++) {
				query.setParameter(i, params[i]);
			}
		}
		return query.setFirstResult((currPage - 1) * pageSize).setMaxResults(pageSize).setCacheable(true).list();
	}
	
	
	/**
	 * 获取分页数据
	 * @param pageModel
	 * @param hql
	 * @param params
	 * @return
	 */
	public PageModel find(PageModel pageModel, String hql, Object[] params) {
		return this.find(pageModel, hql, PageUtils.getCountHql(hql), params);
	}

	/**
	 * 获取分页数据
	 * @param pageModel
	 * @param hql
	 * @param countSql
	 * @param params
	 * @return
	 */
	public PageModel find(PageModel pageModel, String hql, String countSql, Object[] params) {
		//查询总页数
		pageModel.setTotalRecords(this.count(countSql).intValue());
		
		//查询分页数据
		pageModel.setResult(this.find(hql, params, pageModel.getCurrentPage(), pageModel.getPageSize()));
		return pageModel;
	}
	/**
	 * 查询总记录数(无参)
	 * @param hql
	 */
	public Long count(String hql) {
		return this.count(hql, null);
	}
	/**
	 * 查询总记录数
	 * @param hql
	 * @param params
	 */
	public Long count(String hql, Object[] params) {
		Query query = this.getCurrentSession().createQuery(hql);
		if(params != null && params.length > 0) {
			for(int i=0; i<params.length; i++) {
				query.setParameter(i, params[i]);
			}
		}
		return (Long)this.getCurrentSession().createQuery(hql).setCacheable(true).uniqueResult();
	}

	/**
	 * 执行HQL语句
	 * @param hql
	 * @return
	 */
	public Integer executeHql(String hql) {
		return this.executeHql(hql, null);
	}

	/**
	 * 执行HQL语句
	 * @param hql
	 * @param params
	 * @return
	 */
	public Integer executeHql(String hql, Object[] params) {
		Query query = this.getCurrentSession().createQuery(hql);
		if(params != null && params.length > 0) {
			for(int i=0, size=params.length; i<size; i++) {
				query.setParameter(i, params[i]);
			}
		}
		return query.executeUpdate();
	}
	
	/**
	 * 执行sql语句
	 * @param sql
	 * @return
	 */
	public List<Object> executeSql(String sql) {
		return this.executeSql(sql, null);
	}

	/**
	 * 执行sql语句
	 * @param sql
	 * @param params
	 * @return
	 */
	public List<Object> executeSql(String sql, Object[] params) {
		Query query = this.getCurrentSession().createSQLQuery(sql);
		if(params != null && params.length > 0) {
			for(int i=0, size=params.length; i<size; i++) {
				query.setParameter(i, params[i]);
			}
		}
		
		return query.list();
	}
	
	/**
	 * 用于执行原生sql的delete、update
	 * @param sql
	 * @return
	 */
	public int executeUpdate(String sql) {
		Query query = this.getCurrentSession().createSQLQuery(sql);
		int count = query.executeUpdate();
		
		return count;
		
	}
	
}