package project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import project.dto.ExamDto;
import project.service.ExamService;

@RestController
@RequestMapping("/professor")
@CrossOrigin
public class ProfessorController {

	@Autowired
	private ExamService examService;

	@RequestMapping(method = RequestMethod.GET)
	public List<ExamDto> allExams() {
		return examService.getExams();
	}

	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<?> addExam(@RequestBody ExamDto examDto) {
		examService.save(examDto);
		return new ResponseEntity<>(HttpStatus.CREATED);
	}

	@RequestMapping(method = RequestMethod.PUT)
	public ResponseEntity<?> updateExam(@RequestBody ExamDto examDto) {
		examService.save(examDto);
		return new ResponseEntity<>(HttpStatus.OK);
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<?> deleteExam(@PathVariable("id") int id) {
		try {
			examService.deleteExam(id);
			return new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

}
