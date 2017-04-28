package cn.shop.sys.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import cn.shop.core.base.BaseEntity;

/**
 * 普通管理员
 * @author ozy
 *
 */
@Entity
@Table(name="sys_generaladmin")
public class GeneralAdmin extends BaseEntity{
	private static final long serialVersionUID = 1L;
	/**
	 * 普通管理员登录名
	 */
	@Column
	private String userName;
	/**
	 * 普通管理员密码
	 */
	@Column
	private String passWord;
	/**
	 * 真实姓名
	 */
	@Column
	private String realName;	
	/**
	 * 性别
	 */
	@Column
	private String gender;
	
	/**
	 * 身份证号
	 */
	@Column
	private String idCard;
	/**
	 * 电话
	 */
	@Column
	private String telNumber;
	/**
	 * 邮箱
	 */
	@Column
	private String email;	
	/**
	 *普通管理员状态 
	 */
	@Column
	private String status;
	
	/**
	 * 角色
	 */
	@OneToOne(fetch=FetchType.EAGER)
	@JoinColumn
	private Role role;
	


	public GeneralAdmin() {
		super();
	}
	
	public GeneralAdmin(String userName, String passWord, String realName,
			String gender, String idCard, String telNumber, String email,
			String status, Role role) {
		super();
		this.userName = userName;
		this.passWord = passWord;
		this.realName = realName;
		this.gender = gender;
		this.idCard = idCard;
		this.telNumber = telNumber;
		this.email = email;
		this.status = status;
		this.role = role;
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
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getTelNumber() {
		return telNumber;
	}
	public void setTelNumber(String telNumber) {
		this.telNumber = telNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getIdCard() {
		return idCard;
	}
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	
	
}
