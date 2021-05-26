package com.common.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.common.AESEncrypt;

/**
 * Application Lifecycle Listener implementation class AESEncryptListener
 *
 */
@WebListener
public class AESEncryptListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public AESEncryptListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    	new AESEncrypt();
    }
	
}
