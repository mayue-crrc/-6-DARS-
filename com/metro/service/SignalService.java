package com.metro.service;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.metro.bean.SignalTypeBean;
import com.metro.bean.SubSignalBean;
import com.metro.dao.SignalMapper;

/**  
 * @author Deng Ran
 * @since 2017/12/12
 * @version 1.0
 */
@Service
public class SignalService {
	@Autowired
	private SignalMapper signalMapper;
	
	public Map<String, SignalTypeBean> selectAllSignalType() {
		Map<String, SignalTypeBean> map = new HashMap<String, SignalTypeBean>();
		
		for (SignalTypeBean bean: this.signalMapper.selectAllSignalType()) {
			map.put(bean.getSignalName(), bean);
		}
		
		return map;
	}
	
	public Map<String, String> selectAllSingalNameAndDevice() {
		Map<String, String> map = new HashMap<String, String>();
		
		for (SignalTypeBean bean: this.signalMapper.selectAllSignalType()) {
			map.put(bean.getSignalName(), bean.getDevice());
		}
		
		return map;
	}
	
	public List<String> getHistorySignalByName(String signalName, 
											   String metroCode, 
											   Date from,
											   Date to) {
		return null;
	}
	
	public void insertSignalGroup(String metroCode, Timestamp timeData, byte[] signal) {
		List<SubSignalBean> list = this.convertToSubSignalBean(signal);
		
		long id = this.signalMapper.insertSignalGroup(metroCode, timeData);
		
		list.get(0).setId(id);
		list.get(1).setId(id);
		list.get(2).setId(id);
		list.get(3).setId(id);
		
		this.signalMapper.insertSubSignal(list.get(0));
		this.signalMapper.insertSubSignal(list.get(1));
		this.signalMapper.insertSubSignal(list.get(2));
		this.signalMapper.insertSubSignal(list.get(3));
	}
	
	private List<SubSignalBean> convertToSubSignalBean(byte[] signal) {
		if (signal.length != 560) {
			return null;
		}
		
		List<SubSignalBean> list = new ArrayList<SubSignalBean>();
		
		list.add(new SubSignalBean());
		list.add(new SubSignalBean());
		list.add(new SubSignalBean());
		list.add(new SubSignalBean());
		
		for (int i = 0; i < list.size(); i ++) {
			list.get(i).setTable(i + 1);
			list.get(i).setData1(UniversalService.getInt(signal, 0 + 136 * i));
			list.get(i).setData2(UniversalService.getInt(signal, 4 + 136 * i));
			list.get(i).setData3(UniversalService.getInt(signal, 8 + 136 * i));
			list.get(i).setData4(UniversalService.getInt(signal, 12 + 136 * i));
			list.get(i).setData5(UniversalService.getInt(signal, 16 + 136 * i));
			list.get(i).setData6(UniversalService.getInt(signal, 20 + 136 * i));
			list.get(i).setData7(UniversalService.getInt(signal, 24 + 136 * i));
			list.get(i).setData8(UniversalService.getInt(signal, 28 + 136 * i));
			list.get(i).setData9(UniversalService.getInt(signal, 32 + 136 * i));
			list.get(i).setData10(UniversalService.getInt(signal, 36 + 136 * i));
			list.get(i).setData11(UniversalService.getInt(signal, 40 + 136 * i));
			list.get(i).setData12(UniversalService.getInt(signal, 44 + 136 * i));
			list.get(i).setData13(UniversalService.getInt(signal, 48 + 136 * i));
			list.get(i).setData14(UniversalService.getInt(signal, 52 + 136 * i));
			list.get(i).setData15(UniversalService.getInt(signal, 56 + 136 * i));
			list.get(i).setData16(UniversalService.getInt(signal, 60 + 136 * i));
			list.get(i).setData17(UniversalService.getInt(signal, 64 + 136 * i));
			list.get(i).setData18(UniversalService.getInt(signal, 68 + 136 * i));
			list.get(i).setData19(UniversalService.getInt(signal, 72 + 136 * i));
			list.get(i).setData20(UniversalService.getInt(signal, 76 + 136 * i));
			list.get(i).setData21(UniversalService.getInt(signal, 80 + 136 * i));
			list.get(i).setData22(UniversalService.getInt(signal, 84 + 136 * i));
			list.get(i).setData23(UniversalService.getInt(signal, 88 + 136 * i));
			list.get(i).setData24(UniversalService.getInt(signal, 92 + 136 * i));
			list.get(i).setData25(UniversalService.getInt(signal, 96 + 136 * i));
			list.get(i).setData26(UniversalService.getInt(signal, 100 + 136 * i));
			list.get(i).setData27(UniversalService.getInt(signal, 104 + 136 * i));
			list.get(i).setData28(UniversalService.getInt(signal, 108 + 136 * i));
			list.get(i).setData29(UniversalService.getInt(signal, 112 + 136 * i));
			list.get(i).setData30(UniversalService.getInt(signal, 116 + 136 * i));
			list.get(i).setData31(UniversalService.getInt(signal, 120 + 136 * i));
			list.get(i).setData32(UniversalService.getInt(signal, 124 + 136 * i));
			list.get(i).setData33(UniversalService.getInt(signal, 128 + 136 * i));
			list.get(i).setData34(UniversalService.getInt(signal, 132 + 136 * i));
			list.get(i).setData35(UniversalService.getInt(signal, 136 + 136 * i));
		}
		
		return list;
	}
}
