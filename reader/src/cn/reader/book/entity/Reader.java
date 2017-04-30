package cn.reader.book.entity;

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
@Table(name="boo_reader")
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


}
