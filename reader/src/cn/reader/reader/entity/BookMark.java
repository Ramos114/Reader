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
 * 书签 实体
 * @author LMX
 * 
 */
@Entity
@Table(name="rea_bookmark")
public class BookMark extends BaseEntity{

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

	public BookMark() {
		
	}
	public BookMark(Integer readedWord, Integer readedChapter, Shelf shelf,
			Book book) {
		super();
		this.readedWord = readedWord;
		this.readedChapter = readedChapter;
		this.shelf = shelf;
		this.book = book;
	}
	public Integer getReadedWord() {
		return readedWord;
	}
	public void setReadedWord(Integer readedWord) {
		this.readedWord = readedWord;
	}
	public Integer getReadedChapter() {
		return readedChapter;
	}
	public void setReadedChapter(Integer readedChapter) {
		this.readedChapter = readedChapter;
	}
	public Shelf getShelf() {
		return shelf;
	}
	public void setShelf(Shelf shelf) {
		this.shelf = shelf;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	

}
