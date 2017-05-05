package cn.reader.book.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import cn.reader.core.base.BaseEntity;

/**
 * 章节内容 实体
 * @author LMX
 *
 */
@Entity
@Table(name="boo_chapterdata")
public class ChapterData extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 章节内容标题
	 */
	@Column
	private String chapterDataTitle;

	/**
	 * 章节内容
	 */
	@Column
	private String chapterDataContent;
	
	
	/**
	 * 与章节存在多对一的关系
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn
	private Chapter chapter;


	public ChapterData() {
		
	}
	public ChapterData(String chapterData_id, String chapterDataTitle,
			String chapterDataContent, Chapter chapter) {
		super();
		this.chapterDataTitle = chapterDataTitle;
		this.chapterDataContent = chapterDataContent;
		this.chapter = chapter;
	}
	public String getChapterDataTitle() {
		return chapterDataTitle;
	}
	public void setChapterDataTitle(String chapterDataTitle) {
		this.chapterDataTitle = chapterDataTitle;
	}
	public String getChapterDataContent() {
		return chapterDataContent;
	}
	public void setChapterDataContent(String chapterDataContent) {
		this.chapterDataContent = chapterDataContent;
	}
	public Chapter getChapter() {
		return chapter;
	}
	public void setChapter(Chapter chapter) {
		this.chapter = chapter;
	}
	
	
}
