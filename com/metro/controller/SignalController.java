package com.metro.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.metro.service.SignalService;

/**  
 * @author Deng Ran
 * @since 2017/12/07
 * @version 1.2
 */
@Controller
@RequestMapping(value="/signal")
public class SignalController {
	@Autowired
	SignalService signalService;
	
	@RequestMapping(value="/page.do", method=RequestMethod.GET)
	@ResponseBody
	public String page() {
		return "/signalCheck";
	}
	
	@RequestMapping(value="/type.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> getSignalType() {
		return this.signalService.selectAllSingalNameAndDevice();
	}
	
	@RequestMapping(value="/historySignal.do", method=RequestMethod.POST)
	@ResponseBody
	public List<String> getHistorySignalByName(String signalName, 
										String metroCode, 
										Date from,
										Date to) {
		return this.signalService.getHistorySignalByName(signalName, metroCode, from, to);
	}
	
	@RequestMapping(value="/test.do", method=RequestMethod.GET)
	@ResponseBody
	public boolean test() {
		byte[] signal = new byte[560];
		
		for (int i = 0; i < signal.length; i ++) {
			signal[i] = (byte)i;
		}
		
		this.signalService.insertSignalGroup("002", 
											 new Timestamp(System.currentTimeMillis()), 
											 signal);
		
		return true;
	}
}
