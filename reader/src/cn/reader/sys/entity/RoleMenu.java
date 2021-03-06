package cn.reader.sys.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import cn.reader.core.base.BaseEntity;

/**
 * 角色菜单权限实体
 * @author ozy
 *
 */
@Entity
@Table(name = "sys_rolemenu")
public class RoleMenu extends BaseEntity{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 角色
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn
	private Role role;
	
	/**
	 * 菜单
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn
	private Menu menu;

	public RoleMenu() {
		super();
	}

	public RoleMenu(Role role, Menu menu) {
		super();
		this.role = role;
		this.menu = menu;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}
	
	
}
