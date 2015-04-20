package com.weborion.springservice.domain;

public class Ticket {
	
	private int ticket_id;
	 private String ticket_name;
	 private String ticket_description; 
	 private String ticket_priority;
	 private String ticket_status;
	 
	 public int getTicketId() {
	  return ticket_id;
	 }
	 public void setTicketId(int ticketId) {
	  this.ticket_id = ticketId;
	 }
	 public String getTicketName() {
	  return ticket_name;
	 }
	 public void setTicketName(String ticketName) {
	  this.ticket_name = ticketName;
	 }
	 public String getTicketDescription() {
	  return ticket_description;
	 }
	 public void setTicketDescription(String ticketDescription) {
	  this.ticket_description = ticketDescription;
	 }
	 
	 
	 public String getTicketPriority() {
	  return ticket_priority;
	 }
	 public void setTicketPriority(String ticketPriority) {
	  this.ticket_priority = ticketPriority;
	 }
	 
	 public String getTicketStatus() {
			return ticket_status;
		}
	 
	public void setTicketStatus(String ticketStatus) {
			this.ticket_status = ticketStatus;
		}
		
	 @Override
	 public String toString() {
	  return "Ticket [ticket_id=" + ticket_id + ", ticket_name=" + ticket_name
	    + ", ticket_description=" + ticket_description + ", ticket_priority="
	    + ticket_priority +",ticket_status="+ticket_status+ "]";
	 }
	  

}
