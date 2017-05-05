package cn.reader.book.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import cn.reader.author.entity.Author;
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
	
	/**
	 * 总字数
	 */
	@Column
	private Integer word_count;
	
	/*
	 * 是否完结
	 * 1完结
	 * 0未完结
	 */
	@Column	
	private String isFinish;
	
	/*
	 * 是否本周最火
	 * 1是
	 * 0否
	 */
	@Column	
	private Integer isHot;
	
	/*
	 * 是否重磅推荐
	 * 1是
	 * 0否
	 */
	@Column	
	private Integer isRecommend;
	
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
	 * 评论数'
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
	 * 更新时间
	 */
	@Column	
	private Date updateTime;
	
	/*
	 * 上架时间'
	 */
	@Column	
	private Date listingTime;
	
	/*
	 * 下架时间'
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
	 * 与小类别存在多对一的关系
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn
	private SmallCategory smallCategory;


	public Book() {
		
	}
	public Book(String bookNo, String title, String summary,
			Integer word_count, String isFinish, Integer isHot,
			Integer isRecommend, String rights, String lastest,
			Integer score_count, String cover, Date publicationTime,
			Date updateTime, Date listingTime, Date delistingTime,
			Author author, SmallCategory smallCategory) {
		super();
		this.bookNo = bookNo;
		this.title = title;
		this.summary = summary;
		this.word_count = word_count;
		this.isFinish = isFinish;
		this.isHot = isHot;
		this.isRecommend = isRecommend;
		this.rights = rights;
		this.lastest = lastest;
		this.score_count = score_count;
		this.cover = cover;
		this.publicationTime = publicationTime;
		this.updateTime = updateTime;
		this.listingTime = listingTime;
		this.delistingTime = delistingTime;
		this.author = author;
		this.smallCategory = smallCategory;
	}
	public String getBookNo() {
		return bookNo;
	}
	public void setBookNo(String bookNo) {
		this.bookNo = bookNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public Integer getWord_count() {
		return word_count;
	}
	public void setWord_count(Integer word_count) {
		this.word_count = word_count;
	}
	public String getIsFinish() {
		return isFinish;
	}
	public void setIsFinish(String isFinish) {
		this.isFinish = isFinish;
	}
	public Integer getIsHot() {
		return isHot;
	}
	public void setIsHot(Integer isHot) {
		this.isHot = isHot;
	}
	public Integer getIsRecommend() {
		return isRecommend;
	}
	public void setIsRecommend(Integer isRecommend) {
		this.isRecommend = isRecommend;
	}
	public String getRights() {
		return rights;
	}
	public void setRights(String rights) {
		this.rights = rights;
	}
	public String getLastest() {
		return lastest;
	}
	public void setLastest(String lastest) {
		this.lastest = lastest;
	}
	public Integer getScore_count() {
		return score_count;
	}
	public void setScore_count(Integer score_count) {
		this.score_count = score_count;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	public Date getPublicationTime() {
		return publicationTime;
	}
	public void setPublicationTime(Date publicationTime) {
		this.publicationTime = publicationTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public Date getListingTime() {
		return listingTime;
	}
	public void setListingTime(Date listingTime) {
		this.listingTime = listingTime;
	}
	public Date getDelistingTime() {
		return delistingTime;
	}
	public void setDelistingTime(Date delistingTime) {
		this.delistingTime = delistingTime;
	}
	public Author getAuthor() {
		return author;
	}
	public void setAuthor(Author author) {
		this.author = author;
	}
	public SmallCategory getSmallCategory() {
		return smallCategory;
	}
	public void setSmallCategory(SmallCategory smallCategory) {
		this.smallCategory = smallCategory;
	}
	

}
