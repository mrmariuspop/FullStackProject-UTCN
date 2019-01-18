package project.dto.mapper;

import project.dto.ExamDto;
import project.model.Exam;

public class ExamMapper {
	public ExamDto mapToDTO(Exam exam) {
		ExamDto examDTO = new ExamDto();
		examDTO.setExamId(exam.getExamId());
		examDTO.setTitle(exam.getTitle());
		examDTO.setRoom(exam.getRoom());
		examDTO.setDate(exam.getDate());
		return examDTO;
	}

	public Exam mapToModel(ExamDto examDTO) {
		Exam exam = new Exam();
		exam.setExamId(examDTO.getExamId());
		exam.setTitle(examDTO.getTitle());
		exam.setRoom(examDTO.getRoom());
		exam.setDate(examDTO.getDate());
		return exam;
	}
}
