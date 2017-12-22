package com.metro.bean;

/**  
 * @author Deng Ran
 * @since 2017/11/29
 * @version 1.0
 */
public class SignalTypeBean {
	String signalName;
	String signalType;
	String device;
	int byteAddress;
	int bitAddress;
	String description;
	
	public String getSignalName() {
		return signalName;
	}
	
	public void setSignalName(String signalName) {
		this.signalName = signalName;
	}
	
	public String getSignalType() {
		return signalType;
	}
	
	public void setSignalType(String signalType) {
		this.signalType = signalType;
	}
	
	public String getDevice() {
		return device;
	}
	
	public void setDevice(String device) {
		this.device = device;
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
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
}