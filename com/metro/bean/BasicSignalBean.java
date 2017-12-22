package com.metro.bean;

/**  
 * @author Deng Ran
 * @since 2017/11/29
 * @version 1.1
 */
public class BasicSignalBean {
	private int test;
	private int metroCode;
	private int netCurrent, netVoltage;
	private int metroSpeed;
	private int currentStation, nextStation, endStation;
	private int metroFaultState;
	private boolean metroOnline;
	private boolean standbyMode, atoMode;
	private int limitedSpeed;
	
	public boolean isStandbyMode() {
		return standbyMode;
	}

	public void setStandbyMode(boolean standbyMode) {
		this.standbyMode = standbyMode;
	}

	public boolean isAtoMode() {
		return atoMode;
	}

	public void setAtoMode(boolean atoMode) {
		this.atoMode = atoMode;
	}

	public int getLimitedSpeed() {
		return limitedSpeed;
	}

	public void setLimitedSpeed(int limitedSpeed) {
		this.limitedSpeed = limitedSpeed;
	}

	public int getMetroCode() {
		return metroCode;
	}
	
	public void setMetroCode(int metroCode) {
		this.metroCode = metroCode;
	}
	
	public int getNetCurrent() {
		return netCurrent;
	}
	
	public void setNetCurrent(int netCurrent) {
		this.netCurrent = netCurrent;
	}
	
	public int getNetVoltage() {
		return netVoltage;
	}
	
	public void setNetVoltage(int netVoltage) {
		this.netVoltage = netVoltage;
	}
	
	public int getMetroSpeed() {
		return metroSpeed;
	}
	
	public void setMetroSpeed(int metroSpeed) {
		this.metroSpeed = metroSpeed;
	}
	
	public int getCurrentStation() {
		return currentStation;
	}
	
	public void setCurrentStation(int currentStation) {
		this.currentStation = currentStation;
	}
	
	public int getNextStation() {
		return nextStation;
	}
	
	public void setNextStation(int nextStation) {
		this.nextStation = nextStation;
	}
	
	public int getEndStation() {
		return endStation;
	}
	
	public void setEndStation(int endStation) {
		this.endStation = endStation;
	}
	
	public int getMetroFaultState() {
		return metroFaultState;
	}
	
	public void setMetroFaultState(int metroFaultState) {
		this.metroFaultState = metroFaultState;
	}
	
	public boolean isMetroOnline() {
		return metroOnline;
	}
	
	public void setMetroOnline(boolean metroOnline) {
		this.metroOnline = metroOnline;
	}
}