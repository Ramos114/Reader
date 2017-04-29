package cn.reader.core.base;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Version;

import org.hibernate.annotations.GenericGenerator;

/**
 * 表 基类
 * 
 * @author jerry-HJY
 * @time 2016年11月22日-下午3:56:51
 */
@MappedSuperclass
public abstract class BaseEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GenericGenerator(name = "generator", strategy = "uuid")
	@GeneratedValue(generator = "generator")
	@Column(length = 64)
	protected String id;

	/**
	 * 创建时间
	 */
	@Column
	@Temporal(TemporalType.TIMESTAMP)
	protected Date createDate;

	/**
	 * 创建者ID
	 */
	@Column(length = 64)
	protected String createId;

	/**
	 * 创建者名称
	 */
	@Column(length = 64)
	protected String createName;

	/**
	 * 修改者名称
	 */
	@Column(length = 64)
	protected String modifyName;

	/**
	 * 修改者ID
	 */
	@Column(length = 64)
	protected String modifyId;

	/**
	 * 修改时间
	 */
	@Column
	@Temporal(TemporalType.TIMESTAMP)
	protected Date modifyDate;

	/**
	 * 乐观锁
	 */
	@Version
	private Integer optLock = 0;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getCreateId() {
		return createId;
	}

	public void setCreateId(String createId) {
		this.createId = createId;
	}

	public String getCreateName() {
		return createName;
	}

	public void setCreateName(String createName) {
		this.createName = createName;
	}

	public String getModifyName() {
		return modifyName;
	}

	public void setModifyName(String modifyName) {
		this.modifyName = modifyName;
	}

	public String getModifyId() {
		return modifyId;
	}

	public void setModifyId(String modifyId) {
		this.modifyId = modifyId;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public Integer getOptLock() {
		return optLock;
	}

	public void setOptLock(Integer optLock) {
		this.optLock = optLock;
	}

}
