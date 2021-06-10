package com.news.controller;
import static org.quartz.CronScheduleBuilder.cronSchedule;
import static org.quartz.JobBuilder.newJob;
import static org.quartz.TriggerBuilder.newTrigger;

import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.Trigger;
import org.quartz.impl.StdSchedulerFactory;

public class NewsScheduler {
	
	public void scheduler() 	{/*throws SchedulerExceptio*/ 

/*SchedulerFactory schedulerFactory = new StdSchedulerFactory();
Scheduler scheduler=null;
        
        try {
        	scheduler  = schedulerFactory.getScheduler();
            
            JobDetail job = newJob(NewsJob.class).build();
            
            Trigger trigger = newTrigger()
                .withIdentity("triggerName", Scheduler.DEFAULT_GROUP)
                .withSchedule(cronSchedule("1 * * * * ?"))
                .build();
                        
            scheduler.start();
            scheduler.scheduleJob(job, trigger);
        } catch(Exception e) {
            e.printStackTrace();
            if(scheduler !=null) {
            	try {
            		scheduler.shutdown(false);
            	}catch(SchedulerException e1) {
            		e1.printStackTrace();
            	}
            	
            }
            scheduler=null;
        }        
    }*/
}
}

