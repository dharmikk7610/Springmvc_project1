package com.Dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.Bean.Groupbean;
import com.Bean.Groupmember;

@Repository
public class Groupdao {

	@Autowired
	JdbcTemplate stmt ;
	
	public void addGroup(Groupbean gb)
	{
		 String sql = "INSERT INTO TRAVEL_GROUPS (GROUPNAME) VALUES (?)";
	        stmt.update(sql, gb.getGroupName());
	       // System.out.println("group"+gb.getId());
	        
	       
	}
	public Groupbean showData()
	{
		String sql = "SELECT * FROM  TRAVEL_GROUPS" ;
		Groupbean gb = (Groupbean) stmt.query(sql, new BeanPropertyRowMapper(Groupbean.class));
		return gb;
	}
	
	public void addmember(int groupid , Groupmember gm)
	{
		 String sql = "INSERT INTO MEMBERS (MEMBERNAME, GROUPID) VALUES (?, ?)";
	        stmt.update(sql, gm.getMembername(), groupid);
	}
	
	
	

}
