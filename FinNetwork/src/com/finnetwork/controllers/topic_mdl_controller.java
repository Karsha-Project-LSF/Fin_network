package com.finnetwork.controllers;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.finnetwork.models.topic_mdl_issuers;
import com.finnetwork.persistence.hibernate_util;

//import test_abc.abc.bca.issuers;
//import test_abc.abc.bca.topic_mdl_securities;

public class topic_mdl_controller {
	
	public  topic_mdl_issuers get_issuers_given_id(int id) {
		topic_mdl_issuers ids=new topic_mdl_issuers();
		
		
	        
	        Configuration con=new Configuration().configure().addAnnotatedClass(topic_mdl_issuers.class);
	        SessionFactory sf=con.buildSessionFactory();
	        Session session =sf.openSession();
	        Transaction tx=session.beginTransaction();
	        
	        
	        ids=(topic_mdl_issuers)session. get(topic_mdl_issuers.class,id);
	        tx.commit();
	      
	        System.out.print("----->"+ids.getId()); 
	        return ids;
	}
}
