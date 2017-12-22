package com.metro.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import com.metro.service.SystemService;
import com.metro.udp.UdpServer;

/**  
 * @author Deng Ran
 * @since 2017/11/29
 * @version 1.0 the first version that just loads the system bean
 */
public class PowerOnLoadListener implements ServletContextListener{
	UdpServer udpServer;
	
	@Override
	public void contextInitialized(ServletContextEvent servletContextEvent) {
		ServletContext servletContext = servletContextEvent.getServletContext();
		WebApplicationContext webApplicationContext = 
					WebApplicationContextUtils.getRequiredWebApplicationContext(servletContext);
		SystemService systemService = webApplicationContext.getBean(com.metro.service.SystemService.class);
		this.udpServer = webApplicationContext.getBean(com.metro.udp.UdpServer.class);
		 
		try {
			systemService.loadFaultTypeConfig();
			systemService.loadSignalTypeConfig();
			systemService.loadStationConfig();
			systemService.loadMetroConfig();
			
			udpServer.initUdpServer();
		} catch (Exception exception) {
			exception.printStackTrace();
		}
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent servletContextEvent) {
		this.udpServer.disposeUdpServer();
	}
}
