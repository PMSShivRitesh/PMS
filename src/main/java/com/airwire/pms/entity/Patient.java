package com.airwire.pms.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.GenericGenerator;

import com.airwire.util.SEX;

@Entity(name="PATIENT")  
public class Patient implements Serializable {	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6557612852364993440L;

	@Column(name="PATIENT_ID", columnDefinition = "CHAR(36)")
	@GeneratedValue(generator="uuid")
	@GenericGenerator(name="uuid", strategy="uuid2")
	@Id
	private String patientId;
	
	@Column(name="NAME")
	private String name;
	
	@Column(name="AGE")
	private int age;
	
	@Column(name="SEX")
	@Enumerated(EnumType.STRING)
	private SEX sex;
	
	@Column(name="UID")
	private String uid;
	
	@Column(name="EMAIL_ID")
	private String emailId;
	
	@Column(name="STREET_ADDRESS")
	private String streetAddress;
	
	@Column(name="CITY")
	private String city;
	
	@Column(name="STATE")
	private String state;
	
	@Column(name="COUNTRY")
	private String country;
	
	@Column(name="CONTACT_NO")
	private String contactNo;
	
	@Column(name="CREATED_ON")
	private Date createdOn;
	
	@Column(name="MODIFIED_ON")
	private Date modifiedOn;
	
	@Column(name = "CREATED_BY")
	private String createdBy;
	
	@Column(name = "MODIFIED_BY")
	private String modifiedBy;

	@OneToMany(mappedBy="patient")
	private List<PatientHistory> patientHistory;
	
	@OneToMany(mappedBy="patient")
	private List<PatientBillTransaction> patientBillTransaction;
	
	public String getPatientId() {
		return patientId;
	}

	public void setPatientId(String patientId) {
		this.patientId = patientId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public SEX getSex() {
		return sex;
	}

	public void setSex(SEX sex) {
		this.sex = sex;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getStreetAddress() {
		return streetAddress;
	}

	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getContactNo() {
		return contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public Date getModifiedOn() {
		return modifiedOn;
	}

	public void setModifiedOn(Date modifiedOn) {
		this.modifiedOn = modifiedOn;
	}

	public List<PatientHistory> getPatientHistory() {
		return patientHistory;
	}

	public void setPatientHistory(List<PatientHistory> patientHistory) {
		this.patientHistory = patientHistory;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public String getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	public List<PatientBillTransaction> getPatientBillTransaction() {
		return patientBillTransaction;
	}

	public void setPatientBillTransaction(List<PatientBillTransaction> patientBillTransaction) {
		this.patientBillTransaction = patientBillTransaction;
	}
}
