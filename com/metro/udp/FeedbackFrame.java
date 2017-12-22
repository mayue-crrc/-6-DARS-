package com.metro.udp;

import com.metro.service.UniversalService;

public class FeedbackFrame {
	private byte[] frame;
	
	public FeedbackFrame() {
		this.frame = new byte[20];
		UniversalService.setU32(this.frame, 4, System.currentTimeMillis());
	}
	
	public void setProjectCode(byte projectCode) {
		this.frame[0] = projectCode;
	}
	
	public void setWirelessDeviceCode(long wirelessDeviceCode) {
		UniversalService.setU24(this.frame, 1, wirelessDeviceCode);
	}
	
	public void setSourceDeviceCode(byte sourceDeviceCode) {
		this.frame[5] = sourceDeviceCode;
	}
	
	public void setSinkDeviceCode(byte sinkDeviceCode) {
		this.frame[6] = sinkDeviceCode;
	}
	
	public void setSourcePort(byte sourcePort) {
		this.frame[7] = sourcePort;
	}
	
	public void setSinkPort(byte sinkPort) {
		this.frame[8] = sinkPort;
	}
	
	public void setProtocolVersion(byte protocolVersion) {
		this.frame[9] = protocolVersion;
	}
	
	public void setFeedbackFlag(byte feedbackFlag) {
		this.frame[10] = feedbackFlag;
	}
	
	public void setMetroCodeFlag(byte metroCodeFlag) {
		this.frame[11] = metroCodeFlag;
	}
	
	public void setMessageType(int messageType) {
		UniversalService.setU16(this.frame, 12, messageType);
	}
	
	public void setDataLength(int dataLength) {
		UniversalService.setU16(this.frame, 14, dataLength);
	}
	
	public void setData(int data) {
		UniversalService.setU16(this.frame, 16, data);
	}
	
	public void setCrc16() {
		UniversalService.setU16(this.frame, 18,
					DatagramPacketCheck.getCrcCode(this.frame, 0, 16, 0xFFFF));
	}
	
	public byte[] getFrame() {
		return this.frame;
	}
}
