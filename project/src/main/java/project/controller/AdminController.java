
package project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import project.dto.ErrorMessage;
import project.dto.UserDto;
import project.service.UserService;

@RestController
@RequestMapping("/admin")
@CrossOrigin
public class AdminController {

	@Autowired
	private UserService userService;

	@RequestMapping(method = RequestMethod.GET)
	public List<UserDto> allStudents() {
		return userService.getAllDtoStudents();
	}

	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<?> createStudent(@RequestBody UserDto userDto) {
		boolean userExists = false;
		for (UserDto user : userService.getAllUsers()) {
			if (userDto.getUsername().compareTo(user.getUsername()) == 0) {
				userExists = true;
			}
		}
		if (userExists != true) {
			userDto.setRole(userService.findRole("ROLE_STUDENT"));
			userService.save(userDto);
			return new ResponseEntity<>(HttpStatus.CREATED);
		} else {
			return new ResponseEntity<>(new ErrorMessage("Username already exists"), HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(method = RequestMethod.PUT)
	public ResponseEntity<?> updateStudent(@RequestBody UserDto userDto) {
		boolean userExists = false;
		for (UserDto user : userService.getAllUsers()) {
			if (userDto.getUsername().compareTo(user.getUsername()) == 0) {
				userExists = true;
			}
		}
		for (UserDto user : userService.getAllUsers()) {
			if (user.getUserid() == userDto.getUserid() && user.getUsername().equals(userDto.getUsername())) {
				userDto.setRole(userService.findRole("ROLE_STUDENT"));
				userService.save(userDto);
				return new ResponseEntity<>(HttpStatus.CREATED);
			}
			if (user.getUserid() == userDto.getUserid() && userExists == false) {
				userDto.setRole(userService.findRole("ROLE_STUDENT"));
				userService.save(userDto);
				return new ResponseEntity<>(HttpStatus.CREATED);
			}
		}
		return new ResponseEntity<>(new ErrorMessage("Username already exists"), HttpStatus.BAD_REQUEST);
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<?> deleteStudentOrProfessor(@PathVariable("id") int id) {
		try {
			userService.delete(id);
			return new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = "/professors", method = RequestMethod.GET)
	public List<UserDto> allProfessors() {
		return userService.getAllDtoProfessors();
	}

	@RequestMapping(value = "/professors", method = RequestMethod.POST)
	public ResponseEntity<?> createProfessor(@RequestBody UserDto userDto) {
		boolean userExists = false;
		for (UserDto user : userService.getAllUsers()) {
			if (userDto.getUsername().compareTo(user.getUsername()) == 0) {
				userExists = true;
			}
		}
		if (userExists != true) {
			userDto.setRole(userService.findRole("ROLE_PROFESSOR"));
			userService.save(userDto);
			return new ResponseEntity<>(HttpStatus.CREATED);
		} else {
			return new ResponseEntity<>(new ErrorMessage("Username already exists"), HttpStatus.BAD_REQUEST);
		}
	}

	@RequestMapping(value = "/professors", method = RequestMethod.PUT)
	public ResponseEntity<?> updateProfessor(@RequestBody UserDto userDto) {
		boolean userExists = false;
		for (UserDto user : userService.getAllUsers()) {
			if (userDto.getUsername().compareTo(user.getUsername()) == 0) {
				userExists = true;
			}
		}
		for (UserDto user : userService.getAllUsers()) {
			if (user.getUserid() == userDto.getUserid() && user.getUsername().equals(userDto.getUsername())) {
				userDto.setRole(userService.findRole("ROLE_PROFESSOR"));
				userService.save(userDto);
				return new ResponseEntity<>(HttpStatus.CREATED);
			}
			if (user.getUserid() == userDto.getUserid() && userExists == false) {
				userDto.setRole(userService.findRole("ROLE_PROFESSOR"));
				userService.save(userDto);
				return new ResponseEntity<>(HttpStatus.CREATED);
			}
		}
		return new ResponseEntity<>(new ErrorMessage("Username already exists"), HttpStatus.BAD_REQUEST);
	}

}