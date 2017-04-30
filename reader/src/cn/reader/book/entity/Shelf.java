package cn.reader.book.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import cn.reader.core.base.BaseEntity;

/**
 * 书架(收藏夹) 实体
 * @author LMX
 * 
 */
@Entity
@Table(name="boo_shelf")
public class Shelf extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 与读者存在一对一的关系
	 */
	@OneToOne(fetch=FetchType.EAGER)
	@JoinColumn
	private Reader reader;
	
}
