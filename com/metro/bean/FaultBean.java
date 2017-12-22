package com.metro.bean;

import java.sql.Timestamp;

/**  
 * @author Deng Ran
 * @since 2017/11/29
 * @version 1.0
 */
public class FaultBean {
	private long id;
	private String metroCode;
	private int faultIndex;
	private String faultName;
	private int faultCode;
	private String faultPosition;
	private String faultDevice;
	private String faultHint;
	private String description;
	private Timestamp startTime;
	private Timestamp endTime;
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
	
	public String getMetroCode() {
		return metroCode;
	}
	
	public void setMetroCode(String metroCode) {
		this.metroCode = metroCode;
	}
	
	public int getFaultIndex() {
		return faultIndex;
	}
	
	public void setFaultIndex(int faultIndex) {
		this.faultIndex = faultIndex;
	}
	
	public String getFaultName() {
		return faultName;
	}
	
	public void setFaultName(String faultName) {
		this.faultName = faultName;
	}
	
	public int getFaultCode() {
		return faultCode;
	}
	
	public void setFaultCode(int faultCode) {
		this.faultCode = faultCode;
	}
	
	public String getFaultPosition() {
		return faultPosition;
	}
	
	public void setFaultPosition(String faultPosition) {
		this.faultPosition = faultPosition;
	}
	
	public String getFaultDevice() {
		return faultDevice;
	}
	
	public void setFaultDevice(String faultDevice) {
		this.faultDevice = faultDevice;
	}
	
	public String getFaultHint() {
		return faultHint;
	}
	
	public void setFaultHint(String faultHint) {
		this.faultHint = faultHint;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public Timestamp getStartTime() {
		return startTime;
	}
	
	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}
	
	public Timestamp getEndTime() {
		return endTime;
	}
	
	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}
}
