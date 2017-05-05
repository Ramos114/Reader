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
	private String chapter_id;
	
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
	public Chapter(String chapter_id, String chapterTitle, Integer word_count,
			Book book) {
		super();
		this.chapter_id = chapter_id;
		this.chapterTitle = chapterTitle;
		this.word_count = word_count;
		this.book = book;
	}
	public String getChapter_id() {
		return chapter_id;
	}
	public void setChapter_id(String chapter_id) {
		this.chapter_id = chapter_id;
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
