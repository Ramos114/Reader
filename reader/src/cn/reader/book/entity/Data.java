package cn.reader.book.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
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
	 * 内容
	 */
	@Column
	private String content_data;


}
