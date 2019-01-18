package project.dto.mapper;

import project.dto.UserExamDto;
import project.model.UserExam;


public class UserExamMapper {
	private UserMapper userMapper=new UserMapper();
	private ExamMapper examMapper=new ExamMapper();
	
	public UserExamDto mapToDTO(UserExam userExam) {
		UserExamDto userExamDto = new UserExamDto();
		userExamDto.setId(userExam.getId());
		userExamDto.setUser(userMapper.mapToDTO(userExam.getUser()));
		userExamDto.setExam(examMapper.mapToDTO(userExam.getExam()));
		userExamDto.setGrade(userExam.getGrade());
		return userExamDto;
	}

	public UserExam mapToModel(UserExamDto userExamDto) {
		UserExam userExam = new UserExam();
		userExam.setId(userExamDto.getId());
		userExam.setUser(userMapper.mapToModel(userExamDto.getUser()));
		userExam.setExam(examMapper.mapToModel(userExamDto.getExam()));
		userExam.setGrade(userExamDto.getGrade());
		return userExam;
	}
}
