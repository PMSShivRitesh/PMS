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

import com.airwire.util.BillStatus;
import com.airwire.util.PatientBillType;

@Entity(name="PATIENT_BILL_TRANSACTION")
public class PatientBillTransaction implements Serializable {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6043117460710738303L;

	@Column(name="PATIENT_BILL_TRANSACTION_ID", columnDefinition = "CHAR(36)")
	@GeneratedValue(generator="uuid")
	@GenericGenerator(name="uuid", strategy="uuid2")
	@Id
	private String patientBillTransactionId;
	
	@ManyToOne
	@JoinColumn(name="PATIENT_HISTORY_ID")
	private PatientHistory patientHistory;
	
	@Column(name="PATIENT_BILL_TYPE")
	@Enumerated(EnumType.STRING)
	private PatientBillType patientBillType;
	
	@Column(name="AMOUNT_CHARGED")
	private String amountCharged;
	
	@Enumerated(EnumType.STRING)
	@Column(name="BILL_STATUS")
	private BillStatus billStatus;
	
	@Column(name="CREATED_ON")
	private Date createdOn;
	
	@Column(name="MODIFIED_ON")
	private Date modifiedOn;

	@Column(name = "CREATED_BY")
	private String createdBy;
	
	@Column(name = "MODIFIED_BY")
	private String modifiedBy;

	@ManyToOne
	@JoinColumn(name="PATIENT_ID")
	private Patient patient;
	
	public String getPatientBillTransactionId() {
		return patientBillTransactionId;
	}

	public void setPatientBillTransactionId(String patientBillTransactionId) {
		this.patientBillTransactionId = patientBillTransactionId;
	}

	public PatientBillType getPatientBillType() {
		return patientBillType;
	}

	public void setPatientBillType(PatientBillType patientBillType) {
		this.patientBillType = patientBillType;
	}

	public String getAmountCharged() {
		return amountCharged;
	}

	public void setAmountCharged(String amountCharged) {
		this.amountCharged = amountCharged;
	}

	public BillStatus getBillStatus() {
		return billStatus;
	}

	public void setBillStatus(BillStatus billStatus) {
		this.billStatus = billStatus;
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

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public PatientHistory getPatientHistory() {
		return patientHistory;
	}

	public void setPatientHistory(PatientHistory patientHistory) {
		this.patientHistory = patientHistory;
	}

}
