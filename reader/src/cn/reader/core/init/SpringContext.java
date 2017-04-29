package cn.reader.core.init;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;

/**
 * Spring容器管理
 * @author ozy
 *
 */
public class SpringContext {
	//Spring上下文
	private static ApplicationContext applicationContext;


	public static void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		SpringContext.applicationContext = applicationContext;
	}

	public static ApplicationContext getApplicationContext() {
		return applicationContext;
	}
	
	/** 
     * 获取容器管理对象 
     * @param beanName 
     * @return Object 
     * @throws BeansException 
     */
	public static <T> T getBean(Class<T> clazz) {
		return applicationContext.getBean(clazz);
	}
}
