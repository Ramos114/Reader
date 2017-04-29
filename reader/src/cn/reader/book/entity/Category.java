package cn.reader.book.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import cn.reader.core.base.BaseEntity;

/**
 * 分类  实体
 * @author LMX
 *
 */
@Entity
@Table(name="boo_category")
public class Category extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 分类名称(网文男频、网文女频)
	 */
	@Column
	private String name;
	
	/**
	 * 分类key(male、female)
	 */
	@Column
	private String key;
	
	

}
