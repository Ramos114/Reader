package cn.reader.reader.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import cn.reader.book.entity.Book;
import cn.reader.core.base.BaseEntity;

/**
 * 评分 实体
 * @author LMX
 * 
 */
@Entity
@Table(name="rea_score")
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
	 * 与读者存在多对一的关系
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn
	private Reader reader;
	
	/*
	 * 与图书存在多对一的关系
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn
	private Book book;

	public Score() {
		
	}
	public Score(String score, Reader reader, Book book) {
		super();
		this.score = score;
		this.reader = reader;
		this.book = book;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public Reader getReader() {
		return reader;
	}
	public void setReader(Reader reader) {
		this.reader = reader;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	

}
