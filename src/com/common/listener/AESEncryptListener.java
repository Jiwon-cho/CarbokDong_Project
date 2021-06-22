package com.common.listener;

import java.util.Collection;
import java.util.logging.Logger;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.impl.StdSchedulerFactory;

import com.common.AESEncrypt;
import com.news.controller.NewsScheduler;

/**
 * Application Lifecycle Listener implementation class AESEncryptListener
 *
 */
@WebListener
public class AESEncryptListener implements ServletContextListener {

	private Object contextLoader;

	/**
	 * Default constructor.
	 */
	public AESEncryptListener() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see ServletContextListener#contextDestroyed(ServletContextEvent)
	 */
	public void contextDestroyed(ServletContextEvent event) {
		// TODO Auto-generated method stub
		/*
		 * if (this.contextLoader != null && event!=null && event
		 * .getServletContext()!=null) { ServletContext context =
		 * event.getServletContext(); StdSchedulerFactory sch = (StdSchedulerFactory)
		 * context.getAttribute("org.quartz.impl.StdSchedulerFactory.KEY");
		 * 
		 * if(sch!=null){ try { logger.debug("call quartz Scheduler.shutdown()");
		 * Collection<Scheduler> col = sch.getAllSchedulers(); for(Scheduler s:col){
		 * s.shutdown(); } } catch (SchedulerException e) { e.printStackTrace(); } } }
		 */
	}

	/**
	 * @see ServletContextListener#contextInitialized(ServletContextEvent)
	 */
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		new AESEncrypt();

	
		

	}

}
