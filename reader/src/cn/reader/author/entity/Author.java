package cn.reader.author.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import cn.reader.core.base.BaseEntity;
import cn.reader.sys.entity.Role;

/**
 * 作者 实体
 * @author LMX
 * 
 */
@Entity
@Table(name="aut_author")
public class Author extends BaseEntity{
	
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
	private String passWord;
	
	/**
	 * 真实姓名
	 */
	@Column
	private String realName;
	
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
	private String telNumber;
	
	/**
	 * 邮箱地址
	 */
	@Column
	private String email;
	
	
	/**
	 * 角色
	 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn
	private Role role;


	public Author() {
		
	}
	public Author(String userName, String passWord, String realName,
			String imgUrl, String gender, String telNumber, String email,
			Role role) {
		super();
		this.userName = userName;
		this.passWord = passWord;
		this.realName = realName;
		this.imgUrl = imgUrl;
		this.gender = gender;
		this.telNumber = telNumber;
		this.email = email;
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
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	

}
