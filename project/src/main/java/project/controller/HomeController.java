package project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import project.dto.UserDto;
import project.service.UserService;

@RestController
@RequestMapping("/login")
@CrossOrigin
public class HomeController {
	
	@Autowired
	private UserService userService;

	@RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<?> checkForLogin(@RequestBody UserDto userDto) {
		UserDto user=userService.checkLogin(userDto);
		if(user!=null){
			 return new ResponseEntity<>(user, HttpStatus.OK);
		} else{
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
    }
}
