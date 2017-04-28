package cn.shop.sys.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import cn.shop.core.base.BaseEntity;

/***
 * 角色实体
 * @author ozy
 *
 */

@Entity
@Table(name = "sys_role")
public class Role extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 编号
	 */
	@Column
	private String roleNo;
	
	/**
	 * 角色名称
	 */
	@Column
	private String roleName;

	
	/**
	 * 角色类型(普通管理员 )
	 */
	@Column
	private String roleType;
	
	
	/**
	 * 描述
	 */
	@Column
	private String description;

	
	public Role() {
		super();
	}


	public Role(String roleNo, String roleName, String description) {
		super();
		this.roleNo = roleNo;
		this.roleName = roleName;
		this.description = description;
	}
	
	


	public Role(String roleNo, String roleName, String roleType,
			String description) {
		super();
		this.roleNo = roleNo;
		this.roleName = roleName;
		this.roleType = roleType;
		this.description = description;
	}


	public String getRoleNo() {
		return roleNo;
	}


	public void setRoleNo(String roleNo) {
		this.roleNo = roleNo;
	}


	public String getRoleName() {
		return roleName;
	}


	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
	
	


	public String getRoleType() {
		return roleType;
	}


	public void setRoleType(String roleType) {
		this.roleType = roleType;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
