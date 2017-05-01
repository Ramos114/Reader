package cn.reader.other.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import cn.reader.core.base.BaseEntity;

/**
 * 频道类别  实体
 * @author LMX
 *
 */
/*@Entity
@Table(name="boo_channels")*/
public class Channels extends BaseEntity{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 频道名称(男频、女频)
	 */
	@Column
	private String name;
	
	/*
	 * 显示数目
	 */
	@Column	
	private Integer count;
	
	/*
	 * 总数
	 */
	@Column	
	private Integer total;
	
	/*
	 * 与频道存在多对一的关系
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn
	private Channel channel;

}
