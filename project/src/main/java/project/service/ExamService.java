package project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.dao.ExamDao;
import project.dto.ExamDto;
import project.dto.mapper.ExamMapper;
import project.model.Exam;

@Service
public class ExamService {

	@Autowired
	private ExamDao examDao;
	
	private ExamMapper examMapper=new ExamMapper();
	
	public List<ExamDto> getExams() {
		List<ExamDto> exams = new ArrayList<>();
		for (Exam exam : examDao.findAll()) {
			ExamDto examDto=examMapper.mapToDTO(exam);
			exams.add(examDto);
		}
		return exams;
	}

	public void save(ExamDto examdto) {
		Exam exam=examMapper.mapToModel(examdto);
		examDao.save(exam);
	}

	public void deleteExam(int idExam) {
		examDao.delete(idExam);
	}

	public ExamDto findExam(int id) {
		Exam exam=examDao.findOne(id);
		ExamDto examDto=examMapper.mapToDTO(exam);
		return examDto;
	}
}
