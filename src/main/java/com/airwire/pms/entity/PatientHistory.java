package com.airwire.pms.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.GenericGenerator;

@Entity(name="PATIENT_HISTORY")
public class PatientHistory implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4970563626301649078L;

	@Column(name="PATIENT_HISTORY_ID", columnDefinition = "CHAR(36)")
	@GeneratedValue(generator="uuid")
	@GenericGenerator(name="uuid", strategy="uuid2")
	@Id
	private String patientHistoryId;

	@Column(name="DOCTOR_PRESCRIPTION")
	private String doctorPrescription;
	
	@Column(name="ATTENDED_PHYSICIAN_ID")
	private String attendedPhsicianId;
	
	@OneToMany(mappedBy="patientHistory")
	private List<PatientBillTransaction> patientBillTransaction;
	
	@ManyToOne
	@JoinColumn(name="PATIENT_ID")
	private Patient patient;

	public String getPatientHistoryId() {
		return patientHistoryId;
	}

	public void setPatientHistoryId(String patientHistoryId) {
		this.patientHistoryId = patientHistoryId;
	}

	public String getDoctorPrescription() {
		return doctorPrescription;
	}

	public void setDoctorPrescription(String doctorPrescription) {
		this.doctorPrescription = doctorPrescription;
	}

	public String getAttendedPhsicianId() {
		return attendedPhsicianId;
	}

	public void setAttendedPhsicianId(String attendedPhsicianId) {
		this.attendedPhsicianId = attendedPhsicianId;
	}

	public List<PatientBillTransaction> getPatientBillTransaction() {
		return patientBillTransaction;
	}

	public void setPatientBillTransaction(List<PatientBillTransaction> patientBillTransaction) {
		this.patientBillTransaction = patientBillTransaction;
	}

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

}
