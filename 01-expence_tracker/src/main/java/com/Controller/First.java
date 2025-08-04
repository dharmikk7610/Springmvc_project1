package com.Controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Bean.user;
import com.Dao.userdao;
import com.service.Mailservice;

import jakarta.servlet.http.HttpSession;


@Controller
public class First {
	
	@Autowired
	userdao d1 ;
	
	@Autowired
	HttpSession sp ;
	
	@Autowired
	Mailservice mailservice ;
	
	@Autowired
	PasswordEncoder encoder ;

	@GetMapping("index")
	public String getweb()
	{
		return "index" ;
	}
	
	@GetMapping("login")
	public String loginuser() {
		return "login";
	}
	
	@GetMapping("signup")
	public String signupuser() {
		return "signup";
	}
	
	@PostMapping("signupdata")
	public String signupuser1(@Validated user u , BindingResult result , Model model) {
		
		if(result.hasErrors())
		{
			model.addAttribute("error", result);
			System.out.println("saw error");
			return "index";
		}
		
		else {
			model.addAttribute("data",u);
			
			String pass = encoder.encode(u.getPassword());
			u.setPassword(pass);
			
			d1.adduser(u);
			return "login" ;
			
			
		}
		
		
	
	}
	
	@PostMapping("logindata")
	public String loginuser1(String email ,String  password)
	{
		user u1  = d1.searchUser(email);
			if (u1.getEmail() != null && encoder.matches( password ,u1.getPassword())) {
					sp.setAttribute("user1", u1);
		 
					return "userdeshboard";
			}

	else 	
	{
			 return "index";
	}
	
		
	}
	
	
	@GetMapping("logout")
	public String logout()
	{
		sp.removeAttribute("user1");
		 sp.invalidate();
		return "login" ;
	}
	
	@GetMapping("changepass")
	public String changePassword(String useremail , user u , Model model)
	{
		System.out.println(useremail);
		user user1 = (user)sp.getAttribute("user1");
		   int otp1 = (int)(Math.random() * 900000) + 100000;
		   String otp = String.valueOf(otp1);
		   System.out.println("otp-->"+otp);
		mailservice.mailSend(otp, u.getName(), useremail);
		sp.setAttribute("uotp", otp);
		return "checkotp" ;
	}
	
	@PostMapping("verifyotp")
	public String verifyOtp(@RequestParam String otp ,Model model )
	{
		String uotp = (String) sp.getAttribute("uotp");
		if(otp.equals(uotp))
		{
			return "changePassword" ;
		}
		else {
			System.out.println("change otp not match ..>");
			return "userdeshboard" ;
			
		}
	}
	
	@PostMapping("changepassfinal")
	public String setPassword(String password , user u)
	{
		//user user1 = (user)sp.getAttribute("user1");
		String encodedPassword = encoder.encode(password);
	    d1.changepassword(encodedPassword, u.getEmail());
		
		return "login" ;
	}
	

}
