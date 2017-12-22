package com.metro.bean;

import java.sql.Date;
import java.util.Map;

/**  
 * @author Deng Ran
 * @since 2017/11/29
 * @version 1.1
 */
public class MetroBean {
	private long id;
	private String metroCode;
	private String metroType;
	private String manufacturer;
	private Date dateManufacture;
	private String line;
	private String description;
	private BasicSignalBean basicSignalBean;
	private Map<Integer, FaultBean> currentFault;

	public BasicSignalBean getBasicSignalBean() {
		return basicSignalBean;
	}

	public void setBasicSignalBean(BasicSignalBean basicSignalBean) {
		this.basicSignalBean = basicSignalBean;
	}

	public Map<Integer, FaultBean> getCurrentFault() {
		return currentFault;
	}

	public void setCurrentFault(Map<Integer, FaultBean> currentFault) {
		this.currentFault = currentFault;
	}

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
	
	public String getMetroType() {
		return metroType;
	}
	
	public void setMetroType(String metroType) {
		this.metroType = metroType;
	}
	
	public String getManufacturer() {
		return manufacturer;
	}
	
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	
	public Date getDateManufacture() {
		return dateManufacture;
	}
	
	public void setDateManufacture(Date dateManufacture) {
		this.dateManufacture = dateManufacture;
	}
	
	public String getLine() {
		return line;
	}
	
	public void setLine(String line) {
		this.line = line;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
}
