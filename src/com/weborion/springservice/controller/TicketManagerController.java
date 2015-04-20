package com.weborion.springservice.controller;

import java.text.ParseException;
import java.util.List;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.weborion.dao.TicketManagerService;
import com.weborion.springservice.domain.Ticket;


@RestController
public class TicketManagerController {
	
	TicketManagerService TicketManagerService=new TicketManagerService();
	
	 @RequestMapping(value="/tickets",method = RequestMethod.GET,headers="Accept=application/json")
	 public List<Ticket> getAllTickets() {	 
	  List<Ticket> tickets=TicketManagerService.getAllTickets();
	  return tickets;
	
	 }
	 
	 
	 @RequestMapping(value="/tickets/archive/{ticketIds}",method = RequestMethod.POST,headers="Accept=application/json")
	 public List<Ticket> archiveAllTickets(@PathVariable int[] ticketIds) {	
		 for(int i=0;i<ticketIds.length;i++){
			 TicketManagerService.archiveTicket(ticketIds[i]);	
			 
		 }
	  List<Ticket> tickets=TicketManagerService.getAllTickets();
	  return tickets;
	
	 }
	 
	 @RequestMapping(value="/tickets/{ticketId}/{ticketStatus}",method = RequestMethod.POST,headers="Accept=application/json")
	 public List<Ticket> changeTicketStatus(@PathVariable int ticketId,@PathVariable String ticketStatus) throws ParseException {	
		 TicketManagerService.changeTicketStatus(ticketId,ticketStatus);		 
		 return TicketManagerService.getAllTickets();
		 
	 }
	 
	 @RequestMapping(value="/tickets/insert/{ticketName}/{ticketDesc}/{ticketPriority}/{ticketStatus}",method = RequestMethod.POST,headers="Accept=application/json")
	 public List<Ticket> addTicket(@PathVariable String ticketName,@PathVariable String ticketDesc,@PathVariable String ticketPriority,@PathVariable String ticketStatus) throws ParseException {	
		Ticket ticket = new Ticket();
		ticket.setTicketName(ticketName);
		ticket.setTicketDescription(ticketDesc);
		ticket.setTicketPriority(ticketPriority);
		ticket.setTicketStatus(ticketStatus);
		TicketManagerService.addTicket(ticket);
		return TicketManagerService.getAllTickets();
		 
	 }	 	 	 	 
}