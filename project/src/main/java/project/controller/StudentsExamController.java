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

import project.dto.UserDto;
import project.dto.UserExamDto;
import project.service.UserExamService;
import project.service.UserService;

@RestController
@RequestMapping("studentsExam")
@CrossOrigin
public class StudentsExamController {
	@Autowired
	private UserExamService userExamService;

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public List<UserExamDto> allStudentsForOneExam(@PathVariable("id") int id) {
		return userExamService.getStudentsForOneExam(id);
	}

	@RequestMapping(value = "/students_not_attend/{examid}", method = RequestMethod.GET)
	public List<UserDto> allStudentsWhichNotAttendTheExam(@PathVariable("examid") int examid) {
		return userService.getStudentsWhichNotAttendTheExam(examid);
	}
	
	@RequestMapping(value = "/{examid}", method = RequestMethod.POST)
	public ResponseEntity<?> addStudentToExam(@PathVariable("examid") int examid, @RequestBody UserDto user) {
		userExamService.addStudentToExam(user, examid);
		return new ResponseEntity<>(HttpStatus.OK);
	}

	@RequestMapping(method = RequestMethod.PUT)
	public ResponseEntity<?> updateStudentGrade(@RequestBody UserExamDto userExamDto) {
		userExamService.updateStudentGrade(userExamDto);
		return new ResponseEntity<>(HttpStatus.OK);
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<?> deleteStudentFromExam(@PathVariable("id") int id) {
		try {
			userExamService.deleteStudentFromExam(id);
			return new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = "/grades/{examid}", method = RequestMethod.GET)
	public List<Double> getGrades(@PathVariable("examid") int examid) {
		return userExamService.getGrades(examid);
	}

}
