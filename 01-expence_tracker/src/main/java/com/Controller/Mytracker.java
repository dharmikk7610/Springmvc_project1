package com.Controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Bean.Product;
import com.Bean.user;
import com.Dao.mydatadao;

import jakarta.servlet.http.HttpSession;

@Controller
public class Mytracker {
	
	@Autowired 
	mydatadao d1 ;
	
	@Autowired
	HttpSession session ;

	 
	

	@GetMapping("add-tracker")
	public String addTracker()
	{
		return "add-tracker";
	}
	
	@GetMapping("userdashboard")
	public String dashboard() {
	    return "userdeshboard"; 
	}
	
	@PostMapping("save-expense")
	public String saveExpence(@Validated Product p1 , BindingResult result , Model model)
	{
		if(result.hasErrors())
		{
			model.addAttribute("error", result);
			System.out.println("saw error");
			System.out.println(result);
			return "add-tracker";
		}
		
		model.addAttribute("data1", p1);
		d1.addExpense(p1);
		
		return "userdeshboard";
	}
	
	@GetMapping("list-tracker")
	public String listtracker(Product p , Model model)
	{
		user u  = (user)session.getAttribute("user1");
		
		  if (u == null) {
		        return "redirect:/login"; // or handle unauthorized access
		    }
		  int userid = u.getId();
		
		List<Product> list = d1.sawlist(userid);
		model.addAttribute("list",list);
		return "listtracker";
	}
	
	@GetMapping("list-category")
	public String searchcategory()
	{
		return "search-category";
	}
	
	@PostMapping("listcategory")
	public String listcategory(String category ,Product p , Model model )
	{
		user u  = (user)session.getAttribute("user1");
		int userid = u.getId();
		List<Product> list = d1.listcategory(category,userid);
		
		if(list==null)
		{
			System.out.println("list is null error here..");
			return "userdeshboard";
		}
		
		model.addAttribute("expenses", list);
		return "search-category";
	}
	
	@GetMapping("deleteUser")
	public String deleteuser(@RequestParam int id , Product p)
	{
		d1.deleteuser(id);
//		return "listtracker";
		 return "redirect:/list-tracker"; // Use redirect to avoid re-submitting on refresh
	}
	
	@GetMapping("chart")
	public String sawChart()
	{
		return "chart";
	}
	
	@GetMapping("/item-date-chart-data")
	@ResponseBody
	public List<Map<String, Object>> getItemDateChartData(HttpSession session) {
	    // get logged-in user object from session
		user loggedInUser = (user) session.getAttribute("user1");


	    if (loggedInUser == null) {
	        // user not logged in, return empty list or error
	        return Collections.emptyList();
	    }

	    Integer userid = loggedInUser.getId();

	    List<Map<String, Object>> result = d1.getChartData(userid);
	    List<Map<String, Object>> dataList = new ArrayList<>();

	    for (Map<String, Object> row : result) {
	        Map<String, Object> data = new HashMap<>();
	        data.put("date", row.get("DATE").toString());
	        data.put("title", (String) row.get("TITLE"));
	        data.put("amount", ((Number) row.get("AMOUNT")).doubleValue());
	        dataList.add(data);
	    }
	    return dataList;
	}
	
	@GetMapping("category-summary")
	public String getdata(Product p ,HttpSession session,Model model)
	{
		user loggedInUser = (user) session.getAttribute("user1");
		Integer userid = loggedInUser.getId();
		System.out.println(userid);
		List<Product> list = d1.getCategoryData(userid);
		System.out.println(list);

		model.addAttribute("list",list);
		return "sawcategorydata";
	}




}
