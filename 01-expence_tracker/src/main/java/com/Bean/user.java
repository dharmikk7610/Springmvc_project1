package com.Bean;

import jakarta.validation.constraints.NotBlank;
import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;

@Data
@FieldDefaults(level=AccessLevel.PRIVATE)
public class user {

	Integer id ;
	@NotBlank(message = "name requried")
	String name ;
	@NotBlank(message = "email requried")
	String email ;
	@NotBlank(message = "password requried")
	String password ;
	

}
