package com.metro.service;

import java.sql.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.metro.bean.CumulantBean;
import com.metro.dao.CumulantMapper;

/**  
 * @author Deng Ran
 * @since 2017/12/06
 * @version 1.1
 */
@Service
public class CumulantService {
	@Autowired
	private CumulantMapper cumulantMapper;
	
	// insert a new cumulant item
	public void insertCumulant(CumulantBean cumulantBean) {
		this.cumulantMapper.insertCumulant(cumulantBean);
	}
	
	// update a new cumulant if the cumulant item has been in the database
	public void update(CumulantBean cumulantBean) {
		this.cumulantMapper.updateCumulant(cumulantBean);
	}
	
	// get a cumulant item by the metro code and the date
	public CumulantBean selectCumulantByMetroCodeAndDate(String metroCode, Date timeData) {
		CumulantBean cumulantBean = this.cumulantMapper.selectCumulantByMetroCodeAndDate(metroCode, timeData);
		
		return cumulantBean;
	}
	
	// check if the cumulant item has been in the database
	public boolean isCumulantExists(String metroCode, Date timeData) {
		CumulantBean cumulantBean = this.selectCumulantByMetroCodeAndDate(metroCode, timeData);
		
		if (cumulantBean == null) {
			return false;
		} else if (cumulantBean.getTimeData().equals(timeData)) {
			return true;
		} else {
			return false;
		}
	}
	
	// if the cumulant item has been in the database, just overwrite it, otherwise insert a new one
	public void overwriteCumulant(CumulantBean cumulantBean) {
		if (this.isCumulantExists(cumulantBean.getMetroCode(), cumulantBean.getTimeData())) {
			this.update(cumulantBean);
		} else {
			this.insertCumulant(cumulantBean);
		}
	}
	
	// get the cumulant item in a period
	public CumulantBean selectPeriodCumulant(String metroCode, Date from, Date to) {
		CumulantBean cumulantBeanFrom = this.selectCumulantByMetroCodeAndDate(metroCode, from);
		CumulantBean cumulantBeanTo = this.selectCumulantByMetroCodeAndDate(metroCode, to);
		
		if (cumulantBeanTo == null) {
			return null;
		} else if (cumulantBeanFrom == null) {
			return cumulantBeanTo;
		} else {
			return this.calculateDifference(cumulantBeanFrom, cumulantBeanTo);
		}
	}
	
	public CumulantBean calculateDifference(CumulantBean from, CumulantBean to) {
		CumulantBean cumulantBean = new CumulantBean();
		
		cumulantBean.setRunTime(to.getRunTime() - from.getRunTime());
		cumulantBean.setMaintenanceMileage(to.getMaintenanceMileage() - from.getMaintenanceMileage());
		cumulantBean.setTotalMileage(to.getTotalMileage() - from.getTotalConsuption());
		cumulantBean.setTcuConsuption(to.getTotalConsuption() - from.getTotalConsuption());
		cumulantBean.setRegeneratePower(to.getRegeneratePower() - from.getRegeneratePower());
		cumulantBean.setSivConsuption(to.getSivConsuption() - from.getSivConsuption());
		cumulantBean.setCompressorRunTimeTc1(to.getCompressorRunTimeTc1() - from.getCompressorRunTimeTc1());
		cumulantBean.setCompressorRunTimeTc2(to.getCompressorRunTimeTc2() - from.getCompressorRunTimeTc2());
		cumulantBean.setCompressorWorkRateTc1(to.getCompressorWorkRateTc1());
		cumulantBean.setCompressorWorkRateTc2(to.getCompressorWorkRateTc2());
		
		return cumulantBean;
	}
}




