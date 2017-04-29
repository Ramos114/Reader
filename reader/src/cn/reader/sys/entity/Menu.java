package cn.reader.sys.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;





import cn.reader.core.base.BaseEntity;

/**
 * 菜单
 * @author ozy
 *
 */

@Entity
@Table(name = "sys_menu")
public class Menu extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 菜单编号
	 */
	private Integer menuNo;
	
	/**
	 * 菜单名称
	 */
	@Column
	private String menuName;
	
	/**
	 * 菜单链接
	 */
	@Column
	private String menuUrl;
	
	/**
	 * 父菜单ID
	 */
	@ManyToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name = "parent")
	private Menu parentMenu;

	
	/**
	 * 排序序号
	 */
	@Column
	private Integer serialNo;
	
	
	/**
	 * 菜单级数
	 */
	@Column
	private Integer levels;

	public Menu() {
		super();
	}


	
	


	public Menu(Integer menuNo, String menuName, Integer serialNo,
			Integer levels) {
		super();
		this.menuNo = menuNo;
		this.menuName = menuName;
		this.serialNo = serialNo;
		this.levels = levels;
	}






	public Menu(Integer menuNo, String menuName, String menuUrl,
			Menu parentMenu, Integer serialNo, Integer levels) {
		super();
		this.menuNo = menuNo;
		this.menuName = menuName;
		this.menuUrl = menuUrl;
		this.parentMenu = parentMenu;
		this.serialNo = serialNo;
		this.levels = levels;
	}





	public Integer getMenuNo() {
		return menuNo;
	}


	public void setMenuNo(Integer menuNo) {
		this.menuNo = menuNo;
	}


	public String getMenuName() {
		return menuName;
	}


	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}


	public String getMenuUrl() {
		return menuUrl;
	}


	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}


	public Menu getParentMenu() {
		return parentMenu;
	}


	public void setParentMenu(Menu parentMenu) {
		this.parentMenu = parentMenu;
	}


	public Integer getSerialNo() {
		return serialNo;
	}


	public void setSerialNo(Integer serialNo) {
		this.serialNo = serialNo;
	}





	public Integer getLevels() {
		return levels;
	}





	public void setLevels(Integer levels) {
		this.levels = levels;
	}
	
	
	
	
}
