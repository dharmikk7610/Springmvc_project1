package com.Dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.Bean.Product;

@Repository
public class mydatadao {

	@Autowired
	JdbcTemplate stmt ;
	
	public void addExpense(Product p)
	{
		stmt.update("INSERT INTO MYDATA (TITLE,DATE , CATEGORY , AMOUNT , USERID) VALUES (?,?,?,?,?)",p.getTitle(),
		p.getDate(),p.getCategory(),p.getAmount(),p.getUserid());
	}
	
	public List<Product> sawlist(int userid)
	{
		List<Product> list = stmt.query("SELECT * FROM MYDATA WHERE USERID = ?",new BeanPropertyRowMapper<>(Product.class)
				,userid);
		
		return list ;
	}
	
	public List<Product> listcategory(String category,int userid)
	{
		List<Product> list = stmt.query("SELECT * FROM MYDATA WHERE CATEGORY = ? AND USERID=?"
				,new BeanPropertyRowMapper(Product.class),category,userid);
		
		return list;
	}
	
	public void deleteuser(int id)
	{
		
		stmt.update("DELETE FROM MYDATA WHERE ID = ?",id);
	}
	
	public List<Map<String, Object>> getChartData(Integer userid)
	{
		return stmt.queryForList("SELECT DATE, TITLE, AMOUNT FROM MYDATA WHERE USERID = ? ORDER BY DATE", userid);

	
	}
	
	
	public List<Product> getCategoryData(int id)
	{
	 List<Product> list = 	stmt.query("SELECT CATEGORY , SUM(AMOUNT) AS AMOUNT FROM MYDATA WHERE USERID = ?  GROUP BY CATEGORY" ,
			 new BeanPropertyRowMapper(Product.class),id);
		return list;
	}

	
	

}
