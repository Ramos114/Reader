package cn.reader.channel.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import cn.reader.core.base.BaseEntity;

/**
 * 频道  实体
 * @author LMX
 *
 */
/*@Entity
@Table(name="boo_channel")*/
public class Channel extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 频道名称(男频、女频)
	 */
	@Column
	private String name;
	
	/**
	 * 频道关键字
	 */
	@Column
	private String keyword;
	
}
