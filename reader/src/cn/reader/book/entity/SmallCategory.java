package cn.reader.book.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import cn.reader.core.base.BaseEntity;

/**
 * 二级分类  实体
 * @author LMX
 *
 */
@Entity
@Table(name="boo_smallcategory")
public class SmallCategory extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;	

	/**
	 * 二级分类编号,唯一
	 */
	@Column(unique=true)
	private String slcId;
	
	/**
	 * 二级分类名称
	 */
	@Column
	private String slcName;

	/**
	 * 二级分类说明 
	 */
	@Column
	private String slcContent;
	
	/**
	 * 二级分类封面 地址 
	 */
	@Column
	private String slcImgUrl;
	
	/*
	 * 与一级分类存在多对一的关系
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn
	private BigCategory bigCategory;

	public SmallCategory() {
		
	}

	public SmallCategory(String slcId, String slcName, String slcContent,
			String slcImgUrl, BigCategory bigCategory) {
		super();
		this.slcId = slcId;
		this.slcName = slcName;
		this.slcContent = slcContent;
		this.slcImgUrl = slcImgUrl;
		this.bigCategory = bigCategory;
	}

	public String getSlcId() {
		return slcId;
	}

	public void setSlcId(String slcId) {
		this.slcId = slcId;
	}

	public String getSlcName() {
		return slcName;
	}

	public void setSlcName(String slcName) {
		this.slcName = slcName;
	}

	public String getSlcContent() {
		return slcContent;
	}

	public void setSlcContent(String slcContent) {
		this.slcContent = slcContent;
	}

	public String getSlcImgUrl() {
		return slcImgUrl;
	}

	public void setSlcImgUrl(String slcImgUrl) {
		this.slcImgUrl = slcImgUrl;
	}

	public BigCategory getBigCategory() {
		return bigCategory;
	}

	public void setBigCategory(BigCategory bigCategory) {
		this.bigCategory = bigCategory;
	}
	
	
	
}
