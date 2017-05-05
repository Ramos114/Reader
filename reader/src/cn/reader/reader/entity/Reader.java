package cn.reader.reader.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import cn.reader.core.base.BaseEntity;
import cn.reader.sys.entity.Role;

/**
 * 读者 实体
 * @author LMX
 * 
 */
@Entity
@Table(name="rea_reader")
public class Reader extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 用户名
	 */
	@Column(unique=true)
	private String userName;
	
	/**
	 * 登录密码
	 */
	@Column
	private String loginPassword;
	
	/**
	 * 头像
	 */
	@Column
	private String imgUrl;
	
	/**
	 * 性别
	 */
	@Column
	private String gender;
	
	/**
	 * 手机号
	 */
	@Column
	private String phoneNumber;
	
	/**
	 * 邮箱地址
	 */
	@Column
	private String email;
	
	/**
	 * 个性签名
	 */
	@Column
	private String signature;
	
	
	/**
	 * 角色
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn
	private Role role;


	public Reader() {
		
	}
	public Reader(String userName, String loginPassword, String imgUrl,
			String gender, String phoneNumber, String email, String signature,
			Role role) {
		super();
		this.userName = userName;
		this.loginPassword = loginPassword;
		this.imgUrl = imgUrl;
		this.gender = gender;
		this.phoneNumber = phoneNumber;
		this.email = email;
		this.signature = signature;
		this.role = role;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getLoginPassword() {
		return loginPassword;
	}
	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSignature() {
		return signature;
	}
	public void setSignature(String signature) {
		this.signature = signature;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	

}
