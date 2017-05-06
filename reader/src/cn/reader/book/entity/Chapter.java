package cn.reader.book.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import cn.reader.core.base.BaseEntity;

/**
 * 章节(目录) 实体
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
	private String chapterNo;
	
	/**
	 * 章节标题
	 */
	@Column
	private String chapterTitle;
	
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


	public Chapter() {
		
	}
	public Chapter(String chapterNo, String chapterTitle, Integer word_count,
			Book book) {
		super();
		this.chapterNo = chapterNo;
		this.chapterTitle = chapterTitle;
		this.word_count = word_count;
		this.book = book;
	}
	public String getChapterNo() {
		return chapterNo;
	}
	public void setChapterNo(String chapterNo) {
		this.chapterNo = chapterNo;
	}
	public String getChapterTitle() {
		return chapterTitle;
	}
	public void setChapterTitle(String chapterTitle) {
		this.chapterTitle = chapterTitle;
	}
	public Integer getWord_count() {
		return word_count;
	}
	public void setWord_count(Integer word_count) {
		this.word_count = word_count;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	

}
