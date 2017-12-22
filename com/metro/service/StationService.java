package com.metro.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.metro.bean.StationBean;
import com.metro.dao.StationMapper;

/**  
 * @author Deng Ran
 * @since 2017/12/05
 * @version 1.2
 */
@Service
public class StationService {
	@Autowired
	private StationMapper stationMapper;
	
	// insert a new station
	public void insertStation(StationBean stationBean) {
		if (this.isStationExists(stationBean.getId())) {
			System.out.println("the station has already been in the database");
		} else {
			this.stationMapper.insertStation(stationBean);
		}
	}
	
	// delete a station by id
	public void deleteStation(int id) {
		this.stationMapper.deleteStation(id);
	}
	
	// update the information of station except its id
	public void updateStation(StationBean stationBean) {
		if (this.isStationExists(stationBean.getId())) {
			this.stationMapper.updateStation(stationBean);
		} else {
			System.out.println("the station does not exist in the database, please check it");
		}
	}
	
	// get the information of station by its id
	public StationBean selectStationBeanById(int id) {
		return this.stationMapper.selectStationById(id);
	}
	
	// get the information of all station
	public List<StationBean> selectAllStation() {
		return this.stationMapper.selectAllStation();
	}
	
	// get the information of all station
	public HashMap<Integer, String> selectAllStationMap() {
		List<StationBean> stationBeanList = this.selectAllStation();
		HashMap<Integer, String> stationBeanMap = new HashMap<Integer, String>();
		
		for (StationBean stationBean: stationBeanList) {
			stationBeanMap.put(stationBean.getId(), stationBean.getStationName());
		}
		
		return stationBeanMap;
	}
	
	public boolean isStationExists(int id) {
		if (this.selectStationBeanById(id) == null) {
			return false;
		} else {
			return true;
		}
	}
}
