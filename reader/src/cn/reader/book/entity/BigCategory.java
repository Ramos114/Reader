package cn.reader.book.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import cn.reader.core.base.BaseEntity;

/**
 * 一级分类  实体
 * @author LMX
 * 
 */
@Entity
@Table(name="boo_bigcategory")
public class BigCategory extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 一级分类编号,唯一
	 */
	@Column(unique=true)
	private String bgcId;
	
	/**
	 * 一级分类名称 (网文男频、网文女频)
	 */
	@Column
	private String bgcName;
	
	/**
	 * 一级分类英文名keyName(male、female)
	 * 注意不能用key，会有冲突
	 */
	@Column
	private String keyName;
	
	/**
	 * 一级分类说明 
	 */
	@Column
	private String bgcContent;
	
	/**
	 * 一级分类副说明 
	 */
	@Column
	private String bgcRcontent;
	
	/**
	 * 一级分类图片地址 
	 */
	@Column
	private String bgcImgUrl;
	
	
	public BigCategory() {

	}

	public BigCategory(String bgcId, String bgcName, String keyName,
			String bgcContent, String bgcRcontent, String bgcImgUrl) {
		super();
		this.bgcId = bgcId;
		this.bgcName = bgcName;
		this.keyName = keyName;
		this.bgcContent = bgcContent;
		this.bgcRcontent = bgcRcontent;
		this.bgcImgUrl = bgcImgUrl;
	}

	public String getBgcId() {
		return bgcId;
	}

	public void setBgcId(String bgcId) {
		this.bgcId = bgcId;
	}

	public String getBgcName() {
		return bgcName;
	}

	public void setBgcName(String bgcName) {
		this.bgcName = bgcName;
	}

	public String getKeyName() {
		return keyName;
	}

	public void setKeyName(String keyName) {
		this.keyName = keyName;
	}

	public String getBgcContent() {
		return bgcContent;
	}

	public void setBgcContent(String bgcContent) {
		this.bgcContent = bgcContent;
	}

	public String getBgcRcontent() {
		return bgcRcontent;
	}

	public void setBgcRcontent(String bgcRcontent) {
		this.bgcRcontent = bgcRcontent;
	}

	public String getBgcImgUrl() {
		return bgcImgUrl;
	}

	public void setBgcImgUrl(String bgcImgUrl) {
		this.bgcImgUrl = bgcImgUrl;
	}
	
	

}
