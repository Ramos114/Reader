package cn.reader.book.entity;

import java.util.Date;

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
	 * 章节数目
	 */
	@Column	
	private Integer chapter_count;
	
	/**
	 * 总字数
	 */
	@Column
	private Integer word_count;
	
	/*
	 * 是否完结
	 */
	@Column	
	private String isFinish;
	
	/*
	 * 是否本周最火
	 */
	@Column	
	private String isHot;
	
	/*
	 * 是否重磅推荐
	 */
	@Column	
	private String isRecommend;
	
	/**
	 * 版权
	 */
	@Column
	private String rights;

	/*
	 * 最新章节内容(如：第二十七章 缠斗)!
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
	
	/*
	 * 出版时间
	 */
	@Column	
	private Date publicationTime;
	
	/*
	 * 上架时间
	 */
	@Column	
	private Date listingTime;
	
	/*
	 * 下架时间
	 */
	@Column	
	private Date delistingTime;
	

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
