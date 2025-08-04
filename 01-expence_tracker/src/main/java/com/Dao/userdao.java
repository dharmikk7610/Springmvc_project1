package com.Dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.Bean.user;

@Repository
public class userdao {

	@Autowired
	JdbcTemplate stmt ;
	
	public void adduser(user u) {
		stmt.update("INSERT INTO USER (name,email,password) VALUES (?,?,?)",u.getName(),u.getEmail(),u.getPassword());
	}
	
	public List<user> listuser(){
		
	List<user> list =  stmt.query("SELECT * FROM USER", new BeanPropertyRowMapper(user.class));
		
		return list ;
	}
	
	public user searchUser(String email) {
		user u1 = (user) stmt.queryForObject("SELECT * FROM USER WHERE EMAIL = ?",new BeanPropertyRowMapper(user.class),new Object[] {email});
		return u1;
	}
	
	public void changepassword(String password,String email)
	{
		stmt.update("UPDATE USER SET PASSWORD = ? WHERE EMAIL = ?",password,email);
	}

}
