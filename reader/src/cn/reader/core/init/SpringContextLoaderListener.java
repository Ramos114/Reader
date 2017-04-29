package cn.reader.core.init;

import javax.servlet.ServletContextEvent;

import org.apache.log4j.Logger;
import org.springframework.web.context.ContextLoaderListener;

/**
 * Spring容器初始化获取
 * @author ozy
 *
 */
public class SpringContextLoaderListener extends ContextLoaderListener{
	
	private static Logger log = Logger.getLogger(SpringContextLoaderListener.class);
	

	@Override
	public void contextInitialized(ServletContextEvent event) {
		super.contextInitialized(event);
		SpringContext.setApplicationContext(getCurrentWebApplicationContext());
		log.info("Spring容器获取成功:");
	}
}
