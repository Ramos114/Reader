package cn.reader.book.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import cn.reader.core.base.BaseEntity;

/**
 * 图书 实体
 * @author LMX
 * 
 */
@Entity
@Table(name="boo_book")
public class Book extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/*
	 * 图书编号,唯一
	 */
	@Column(unique=true)	
	private String bookNo;
	
	/**
	 * 字数
	 */
	@Column
	private Integer word_count;
	
	/**
	 * 图书标题
	 */
	@Column
	private String title;
	
	/**
	 * 简介、摘要
	 */
	@Column
	private String summary;
	
	/*
	 * 是否完结(true或false)
	 */
	@Column	
	private String finish;
	
	/*
	 * 作者
	 */
	@Column	
	private String authors;
	
	/**
	 * 版权
	 */
	@Column
	private String rights;
	
	/**
	 * 最新章节内容(如：第二十七章 缠斗)
	 */
	@Column
	private String lastest;

	/*
	 * 评论数
	 */
	@Column	
	private Integer score_count;
	
	/*
	 * 封面存放地址
	 */
	@Column	
	private String cover;
	
	/**
	 * 类别标签
	 */
	@Column
	private String tags;
	
	/**
	 * 与类别存在多对一的关系
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn
	private Category category;
	
	
	
	/*
	 * 与频道存在多对一的关系
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn
	private Channel channel;

}
