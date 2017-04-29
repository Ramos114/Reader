package cn.reader.sys.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import cn.reader.core.base.BaseEntity;

/**
 * 系统管理员
 * @author ozy
 *
 */
@Entity
@Table(name="sys_SuperAdmin")
public class SuperAdmin extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 系统管理员名称
	 */
	@Column
	private String userName;
	
	/**
	 * 系统管理员密码
	 */
	@Column
	private String passWord;

	public SuperAdmin() {
		super();
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	
	
}
