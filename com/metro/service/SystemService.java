package com.metro.service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.metro.bean.BasicSignalBean;
import com.metro.bean.FaultBean;
import com.metro.bean.MetroBean;
import com.metro.bean.SystemBean;

/**  
 * @author Deng Ran
 * @since 2017/12/13
 * @version 1.0 the first version
 *          1.1 add the load function
 */
@Service
public class SystemService {
	@Autowired
	SystemBean systemBean;
	@Autowired
	MetroService metroService;
	@Autowired
	FaultTypeService faultTypeService;
	@Autowired
	StationService stationService;
	@Autowired
	SignalService signalService;
	
	public Set<String> getAllMetroCode() {
		return this.systemBean.getMetroMap().keySet();
	}
	
	public boolean isMetroCodeExists(String metroCode) {
		return this.systemBean.getMetroMap().containsKey(metroCode);
	}
	
	public int getMetroSum() {
		return this.systemBean.getMetroMap().size();
	}
	
	public void addMetro(MetroBean metroBean) {
		if (this.isMetroCodeExists(metroBean.getMetroCode()) == false) {
			this.systemBean.getMetroMap().put(metroBean.getMetroCode(), metroBean);
			this.systemBean.getMetroMap().get(metroBean.getMetroCode())
						.setBasicSignalBean(new BasicSignalBean());
			this.systemBean.getMetroMap().get(metroBean.getMetroCode())
						.setCurrentFault(new HashMap<Integer, FaultBean>());
		}
	}
	
	public void deleteMetro(String metroCode) {
		if (this.isMetroCodeExists(metroCode)) {
			this.systemBean.getMetroMap().remove(metroCode);
		}
	}
	
	public MetroBean getMetroByMetroCode(String metroCode) {
		if (this.isMetroCodeExists(metroCode)) {
			return this.systemBean.getMetroMap().get(metroCode);
		} else {
			return null;
		}
	}
	
	public boolean isFaultExists(String metroCode, int faultIndex) {
		if (this.isMetroCodeExists(metroCode) == false) {
			return false;
		} else if (this.systemBean.getMetroMap().get(metroCode).
							getCurrentFault().containsKey(faultIndex)) {
			return true;
		} else {
			return false;
		}
	}
	
	public void addFault(String metroCode, FaultBean faultBean) {
		if (this.isFaultExists(metroCode, faultBean.getFaultIndex()) == false) {
			this.systemBean.getMetroMap().get(metroCode).
				getCurrentFault().put(faultBean.getFaultIndex(), faultBean);
		}
	}
	
	public void deleteFault(String metroCode, int faultIndex) {
		if (this.isFaultExists(metroCode, faultIndex)) {
			this.systemBean.getMetroMap().get(metroCode).
				getCurrentFault().remove(faultIndex);
		}
	}
	
	public void updateFault(String metroCode, BasicSignalBean basicSignalBean) {
		if (this.isMetroCodeExists(metroCode)) {
			this.systemBean.getMetroMap().get(metroCode).setBasicSignalBean(basicSignalBean);
		}
	}
	
	public String getStationNameById(int id) {
		if (this.systemBean.getStationMap() == null) {
			return "no station list";
		} else if (this.systemBean.getStationMap().containsKey(id) == false) {
			return "id is illegal";
		} else {
			return this.systemBean.getStationMap().get(id);
		}
	}
	
	public void loadFaultTypeConfig() {
		this.systemBean.setFaultTypeMap(this.faultTypeService.selectAllFaultTypeHashMap());
	}
	
	public void loadStationConfig() {
		this.systemBean.setStationMap(this.stationService.selectAllStationMap());
	}
	
	public void loadSignalTypeConfig() {
		this.systemBean.setSignalTypeMap(this.signalService.selectAllSignalType());
	}
	
	public void loadMetroConfig() {
		for (MetroBean bean: this.metroService.selectAllMetro()) {
			bean.setBasicSignalBean(new BasicSignalBean());
			bean.setCurrentFault(new HashMap<Integer, FaultBean>());
			this.addMetro(bean);
		}
	}
	
	public void parseProcessFrame(byte[] data) {
		String metroCode = String.valueOf(UniversalService.getInt(data, 16));
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		
		byte[] signal = new byte[35 * 4 * 4];
		
		System.arraycopy(data, 16, signal, 0, 500);
		this.signalService.insertSignalGroup(metroCode, timestamp, signal);
	}
	
	public void parFaultFrame() {
		
	}
}