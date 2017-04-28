package cn.shop.sys.vo;

import java.util.List;

import cn.shop.sys.entity.Menu;

/**
 * 菜单VO
 * @author ozy
 *
 */
public class MenuVO {
	
	/**
	 * 菜单
	 */
	private Menu menu;
	
	/**
	 * 菜单子节点
	 */
	private List<MenuVO> childrenList;

	
	
	public MenuVO() {
		super();
	}


	

	public MenuVO(Menu menu) {
		super();
		this.menu = menu;
	}




	public MenuVO(Menu menu, List<MenuVO> childrenList) {
		super();
		this.menu = menu;
		this.childrenList = childrenList;
	}



	public Menu getMenu() {
		return menu;
	}



	public void setMenu(Menu menu) {
		this.menu = menu;
	}



	public List<MenuVO> getChildrenList() {
		return childrenList;
	}



	public void setChildrenList(List<MenuVO> childrenList) {
		this.childrenList = childrenList;
	}

	
	
	
	
	
}
