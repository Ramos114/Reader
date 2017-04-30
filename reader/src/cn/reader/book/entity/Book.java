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
	
	/*
	 * 章节数目
	 */
	@Column	
	private Integer chapter_count;
	
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
	
	/**
	 * 总字数
	 */
	@Column
	private Integer word_count;
	
	/*
	 * 是否完结
	 * 0,1
	 */
	@Column	
	private String isFinish;
	
	/*
	 * 是否本周最火
	 * 0,1
	 */
	@Column	
	private String hot;
	
	/*
	 * 是否重磅推荐
	 * 0,1
	 */
	@Column	
	private String recommend;
	
	/**
	 * 版权
	 */
	@Column
	private String rights;

	/*
	 * 最新章节内容与章节存在一对一(如：第二十七章 缠斗)!
	 */
	@OneToOne(fetch=FetchType.EAGER)
	@JoinColumn
	private Chapter lastest;

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
	 * 与作者存在多对一的关系
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn
	private Author author;
	
	/**
	 * 与小类存在多对一的关系
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn
	private Categories categories;

}
