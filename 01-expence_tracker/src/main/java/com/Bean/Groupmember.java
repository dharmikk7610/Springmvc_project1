package com.Bean;

import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;

@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Groupmember {

	Integer id ;
	Integer group_id ;
	String membername ;

}
