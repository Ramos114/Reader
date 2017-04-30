package cn.reader.book.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import cn.reader.core.base.BaseEntity;

/**
 * 评分 实体
 * @author LMX
 * 
 */
@Entity
@Table(name="boo_score")
public class Score extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/*
	 * 分数
	 */
	@Column	
	private String score;
	
	
	/**
	 * 与读者存在一对一的关系
	 */
	@OneToOne(fetch=FetchType.EAGER)
	@JoinColumn
	private Reader reader;
	
	/*
	 * 与图书存在多对一的关系
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn
	private Book book;

}
