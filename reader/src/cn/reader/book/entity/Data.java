package cn.reader.book.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import cn.reader.core.base.BaseEntity;

/**
 * 章节内容 实体
 * @author LMX
 *
 */
@Entity
@Table(name="boo_data")
public class Data extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 0表示成功
	 */
	@Column
	private Integer result;
	
	/**
	 * jsonp加密地址
	 */
	@Column
	private String jsonp;
	
	/**
	 * 内容
	 */
	@Column
	private String content_data;
	
	/**
	 * 与章节存在一对一的关系
	 */
	@OneToOne(cascade={CascadeType.ALL})
	@JoinColumn
	private Chapter chapter;

}
