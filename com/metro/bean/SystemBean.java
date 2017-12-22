package com.metro.bean;

import java.util.HashMap;
import java.util.Map;

/**  
 * @author Deng Ran
 * @since 2017/12/13
 * @version 1.2
 */
public class SystemBean {
	private Map<String, MetroBean> metroMap = new HashMap<String, MetroBean>();
	private Map<Integer, FaultTypeBean> faultTypeMap;
	private Map<String, SignalTypeBean> signalTypeMap;
	private Map<Integer, String> stationMap;
	
	public Map<Integer, String> getStationMap() {
		return stationMap;
	}
	
	public void setStationMap(Map<Integer, String> stationMap) {
		this.stationMap = stationMap;
	}
	
	public Map<String, MetroBean> getMetroMap() {
		return metroMap;
	}
	public void setMetroMap(Map<String, MetroBean> metroMap) {
		this.metroMap = metroMap;
	}
	public Map<Integer, FaultTypeBean> getFaultTypeMap() {
		return faultTypeMap;
	}
	public void setFaultTypeMap(Map<Integer, FaultTypeBean> faultTypeMap) {
		this.faultTypeMap = faultTypeMap;
	}
	public Map<String, SignalTypeBean> getSignalTypeMap() {
		return signalTypeMap;
	}
	public void setSignalTypeMap(Map<String, SignalTypeBean> signalTypeMap) {
		this.signalTypeMap = signalTypeMap;
	}
}