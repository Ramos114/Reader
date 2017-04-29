package cn.reader.book.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import cn.reader.core.base.BaseEntity;

/**
 * 分类类别  实体
 * @author LMX
 *
 */
@Entity
@Table(name="boo_categories")
public class Categories extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 类别标签
	 */
	@Column
	private String label;
	
	/**
	 * 类别数量
	 */
	@Column
	private Integer fiction_count;
	
	/**
	 * 类别封面 地址
	 */
	@Column
	private String new_image;
	
	/*
	 * 与分类存在多对一的关系
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn
	private Category category;
	
	

}
