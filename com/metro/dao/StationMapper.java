package com.metro.dao;

import java.util.List;
import com.metro.bean.StationBean;

/**  
 * @author Deng Ran
 * @since 2017/12/05
 * @version 1.1
 */
public interface StationMapper {
	public void insertStation(StationBean stationBean);
	public void deleteStation(int id);
	public void updateStation(StationBean stationBean);
	public StationBean selectStationById(int id);
	public List<StationBean> selectAllStation();
}
