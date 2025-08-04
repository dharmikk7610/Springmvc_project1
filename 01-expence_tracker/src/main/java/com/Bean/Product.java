package com.Bean;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;

@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Product {

	Integer id ;
	@NotBlank(message = "title requried")
	String title ;
	@NotBlank(message = "date requried")
	String date ;
	@NotBlank(message = " category requried")
	String category ;
	@NotNull(message="amount enter please..")
	int amount ;
	Integer userid ;

}
