package com.airwire.pms.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.GenericGenerator;

import com.airwire.util.UserStatus;

@Entity(name="LOGIN_DETAIL")
public class LoginDetail implements Serializable {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7998366552101438107L;

	@GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    @Column(name="LOGIN_DETAIL_ID",columnDefinition = "CHAR(36)")
    @Id
	private String loginDetailId;
	
	@Column(name = "LOGIN_NAME", nullable=false, unique=true)
	private String loginName;

	@Column(name = "PASSWORD", nullable=false, unique=true)
	private String password;
	
	@Column(name = "CREATED_BY")
	private String createdBy;

	@Column(name = "CREATED_ON")
	private Date createdOn;
	
	@Column(name = "MODIFIED_BY")
	private String modifiedBy;

	@Column(name = "MODIFIED_ON")
	private Date modifiedOn;
	
	@Column(name = "LOGIN_STATUS")
	@Enumerated(EnumType.STRING)
	private UserStatus loginStatus;
	
	@Column(name = "USER_ID")
	private String userId;
 
	@JoinColumn(name="ROLE_ID")
	@ManyToOne()
	private Role role;
	
	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public String getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	public Date getModifiedOn() {
		return modifiedOn;
	}

	public void setModifiedOn(Date modifiedOn) {
		this.modifiedOn = modifiedOn;
	}

	public UserStatus getLoginStatus() {
		return loginStatus;
	}

	public void setLoginStatus(UserStatus loginStatus) {
		this.loginStatus = loginStatus;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}
	
}
