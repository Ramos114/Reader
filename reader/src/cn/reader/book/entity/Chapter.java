package cn.reader.book.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import cn.reader.core.base.BaseEntity;

/**
 * 章节 实体
 * @author LMX
 *
 */
@Entity
@Table(name="boo_chapter")
public class Chapter extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/*
	 * 章节编号(第几章)
	 */
	@Column(unique=true)	
	private Integer chapter_id;
	
	/*
	 * 章节数目
	 */
	@Column	
	private Integer chapter_count;
	
	/**
	 * 章节标题
	 */
	@Column
	private String title;
	
	/**
	 * 章节字数
	 */
	@Column
	private Integer word_count;
	
	/*
	 * 与图书存在多对一的关系
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn
	private Book book;


}
