package com.metro.bean;

/**  
 * @author Deng Ran
 * @since 2017/11/29
 * @version 1.1
 */
public class FaultTypeBean {
	private long id;
	private int metroCode;
	private int faultIndex;
	private String faultName;
	private int faultCode;
	private String faultPosition;
	private String faultDevice;
	private String faultHint;
	private String description;
	private int byteAddress;
	private int bitAddress;
	private boolean virtualValue;
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
	
	public int getMetroCode() {
		return metroCode;
	}
	
	public void setMetroCode(int metroCode) {
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
	
	public int getByteAddress() {
		return byteAddress;
	}
	
	public void setByteAddress(int byteAddress) {
		this.byteAddress = byteAddress;
	}
	
	public int getBitAddress() {
		return bitAddress;
	}
	
	public void setBitAddress(int bitAddress) {
		this.bitAddress = bitAddress;
	}
	
	public boolean isVirtualValue() {
		return virtualValue;
	}
	
	public void setVirtualValue(boolean virtualValue) {
		this.virtualValue = virtualValue;
	}
}
