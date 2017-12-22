package com.metro.bean;

import java.sql.Date;

/**  
 * @author Deng Ran
 * @since 2017/12/01
 * @version 1.1
 */
public class CumulantBean {
	private long id;
	private String metroCode;
	private Date timeData;
	private long runTime;
	private long maintenanceMileage;
	private long totalMileage;
	private long totalConsuption;
	private long tcuConsuption;
	private long regeneratePower;
	private long sivConsuption;
	private long compressorRunTimeTc1;
	private long compressorRunTimeTc2;
	private int compressorWorkRateTc1;
	private int compressorWorkRateTc2;
	
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
	
	public Date getTimeData() {
		return timeData;
	}
	
	public void setTimeData(Date timeData) {
		this.timeData = timeData;
	}
	
	public long getTotalMileage() {
		return totalMileage;
	}

	public void setTotalMileage(long totalMileage) {
		this.totalMileage = totalMileage;
	}
	
	public long getRunTime() {
		return runTime;
	}
	
	public void setRunTime(long runTime) {
		this.runTime = runTime;
	}
	
	public long getMaintenanceMileage() {
		return maintenanceMileage;
	}
	
	public void setMaintenanceMileage(long maintenanceMileage) {
		this.maintenanceMileage = maintenanceMileage;
	}
	
	public long getTotalConsuption() {
		return totalConsuption;
	}
	
	public void setTotalConsuption(long totalConsuption) {
		this.totalConsuption = totalConsuption;
	}
	
	public long getTcuConsuption() {
		return tcuConsuption;
	}
	
	public void setTcuConsuption(long tcuConsuption) {
		this.tcuConsuption = tcuConsuption;
	}
	
	public long getRegeneratePower() {
		return regeneratePower;
	}
	
	public void setRegeneratePower(long regeneratePower) {
		this.regeneratePower = regeneratePower;
	}
	
	public long getSivConsuption() {
		return sivConsuption;
	}
	
	public void setSivConsuption(long sivConsuption) {
		this.sivConsuption = sivConsuption;
	}
	
	public long getCompressorRunTimeTc1() {
		return compressorRunTimeTc1;
	}
	
	public void setCompressorRunTimeTc1(long compressorRunTimeTc1) {
		this.compressorRunTimeTc1 = compressorRunTimeTc1;
	}
	
	public long getCompressorRunTimeTc2() {
		return compressorRunTimeTc2;
	}
	
	public void setCompressorRunTimeTc2(long compressorRunTimeTc2) {
		this.compressorRunTimeTc2 = compressorRunTimeTc2;
	}
	
	public int getCompressorWorkRateTc1() {
		return compressorWorkRateTc1;
	}
	
	public void setCompressorWorkRateTc1(int compressorWorkRateTc1) {
		this.compressorWorkRateTc1 = compressorWorkRateTc1;
	}
	
	public int getCompressorWorkRateTc2() {
		return compressorWorkRateTc2;
	}
	
	public void setCompressorWorkRateTc2(int compressorWorkRateTc2) {
		this.compressorWorkRateTc2 = compressorWorkRateTc2;
	}
}
