package project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import project.dto.UserExamDto;
import project.service.UserExamService;

@RestController
@RequestMapping("/student")
@CrossOrigin
public class StudentController {

	@Autowired
	private UserExamService userExamService;	
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public List<UserExamDto> allExams(@PathVariable("id") int id) {
		return userExamService.getStudentExams(id);
	}
}
