package cn.reader.book.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import cn.reader.core.base.BaseEntity;

/**
 * 书签 实体
 * @author LMX
 * 
 */
@Entity
@Table(name="boo_bookmark")
public class Bookmark extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 记录 已读字数
	 */
	@Column
	private Integer readedWord;
	
	/**
	 * 记录 已读章节
	 */
	@Column
	private Integer readedChapter;
	
	/**
	 * 与书架存在多对一的关系
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn
	private Shelf shelf;
	
	/**
	 * 与图书存在多对一的关系
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn
	private Book book;

}
