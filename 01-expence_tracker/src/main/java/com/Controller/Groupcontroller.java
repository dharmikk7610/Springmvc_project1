package com.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.Bean.Groupbean;
import com.Bean.Groupmember;
import com.Dao.Groupdao;


@Controller
public class Groupcontroller {
	
	@Autowired 
	Groupdao groupdao ;
	
	

	
	@GetMapping("creategroup")
	public String createGroup() {
		return "creategroup" ;
	}
	
	@PostMapping("createGroup")
	public String addmember(Groupbean gb , Groupmember gm ,BindingResult result ,Model model )
	{
		
		if(result.hasErrors())
		{
			System.out.println("something errors");
			return "creategroup";
		}
		else {
			
		 groupdao.addGroup(gb);
		 model.addAttribute("group",gb);
			System.out.println(gb);
		Integer groupid = gb.getId();
		groupdao.addmember(groupid, gm);
		
		System.out.println("sucess to add group and members...");
		}
		
		
		return null;
	}
	
	
	

}
