package com.finnetwork.models;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "topic_mdl_prospectus", catalog = "fin_network")
public class prospectus {
	@Id
	private String PID;
	private String year;
	private String Prospectus;
	private String biggest_weight;
	private String associated_topic;
	public String getPID() {
		return PID;
	}
	public void setPID(String pID) {
		PID = pID;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getProspectus() {
		return Prospectus;
	}
	public void setProspectus(String prospectus) {
		Prospectus = prospectus;
	}
	public String getBiggest_weight() {
		return biggest_weight;
	}
	public void setBiggest_weight(String biggest_weight) {
		this.biggest_weight = biggest_weight;
	}
	public String getAssociated_topic() {
		return associated_topic;
	}
	public void setAssociated_topic(String associated_topic) {
		this.associated_topic = associated_topic;
	}
	
}
