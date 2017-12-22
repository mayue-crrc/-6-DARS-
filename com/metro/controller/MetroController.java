package com.metro.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.metro.bean.MetroBean;
import com.metro.service.MetroService;

@Controller
@RequestMapping(value="/metro")
public class MetroController {
	@Autowired
	private MetroService metroService;
	
	@RequestMapping(value="/page.do", method=RequestMethod.GET)
	public String page() {
		return "/metroManage";
	}
	
	@RequestMapping(value="/add.do", method=RequestMethod.POST)
	@ResponseBody
	public boolean addMetro(MetroBean metroBean) {
		this.metroService.insertMetro(metroBean);
		
		return this.metroService.isMetroExists(metroBean.getMetroCode());
	}
	
	@RequestMapping(value="/delete.do", method=RequestMethod.POST)
	@ResponseBody
	public boolean deleteMetro(@RequestParam(value="metroCode")String metroCode) {
		this.metroService.deleteMetro(metroCode);
		
		return this.metroService.isMetroExists(metroCode) == false;
	}
	
	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	@ResponseBody
	public boolean updateMetro(MetroBean metroBean) {
		if (this.metroService.isMetroExists(metroBean.getMetroCode()) == false) {
			return false;
		} else {
			this.metroService.updateMetro(metroBean);
			
			return true;
		}
	}
	
	@RequestMapping(value="/allMetroInfo.do", method=RequestMethod.POST)
	@ResponseBody
	public List<MetroBean> getAllMetroInfo() {
		return this.metroService.selectAllMetro();
	}
	
	@RequestMapping(value="/allMetroCode.do", method=RequestMethod.POST)
	@ResponseBody
	public List<String> getAllMetroCode(@RequestParam(value="metroCode")String metroCode) {
		return this.metroService.selectAllMetroCode();
	}
}