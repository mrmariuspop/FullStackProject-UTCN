package project.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeoutException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.dao.ExamDao;
import project.dao.UserExamDao;
import project.dto.UserDto;
import project.dto.UserExamDto;
import project.dto.mapper.UserExamMapper;
import project.dto.mapper.UserMapper;
import project.model.Exam;
import project.model.User;
import project.model.UserExam;

@Service
public class UserExamService {

	@Autowired
	private UserExamDao userExamDao;
	private UserExamMapper userExamMapper = new UserExamMapper();
	private UserMapper userMapper = new UserMapper();
	
	@Autowired
	private ExamDao examDao;

	public List<UserExamDto> getStudentsForOneExam(int id) {
		List<UserExamDto> userExams = new ArrayList<>();
		for (UserExam userExam : userExamDao.findAll()) {
			if (userExam.getExam().getExamId() == id) {
				UserExamDto userExamDto = userExamMapper.mapToDTO(userExam);
				userExams.add(userExamDto);
			}
		}
		return userExams;
	}

	public List<UserExamDto> getStudentExams(int id) {
		List<UserExamDto> userExams = new ArrayList<>();
		for (UserExam userExam : userExamDao.findAll()) {
			if (userExam.getUser().getUserid() == id) {
				UserExamDto userExamDto = userExamMapper.mapToDTO(userExam);
				userExams.add(userExamDto);
			}
		}
		return userExams;
	}

	public UserExamDto findStudent(int id) {
		UserExam userExam = userExamDao.findOne(id);
		UserExamDto userExamDto = userExamMapper.mapToDTO(userExam);
		return userExamDto;
	}

	public void save(UserExamDto userExamDto) {
		UserExam userExam = userExamMapper.mapToModel(userExamDto);
		userExamDao.save(userExam);
	}

	public void deleteStudentFromExam(int id) {
		userExamDao.delete(id);
	}

	public void updateStudentGrade(UserExamDto userExamDto) {
		UserExam userExamDb = userExamDao.findOne(userExamDto.getId());
		userExamDb.setGrade(userExamDto.getGrade());
		userExamDao.save(userExamDb);
		RabbitMQ rabbitMQ;
		try {
			rabbitMQ = new RabbitMQ();
			rabbitMQ.publish(userExamDb.getUser().getUsername(),"Grade updated!", "The new grade is "+userExamDb.getGrade());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TimeoutException e) {
			e.printStackTrace();
		}

	}
	public int findExamId(int userExamDtoId){
		UserExam userExamDb = userExamDao.findOne(userExamDtoId);
		return userExamDb.getExam().getExamId();
	}

	public void addStudentToExam(UserDto user2, int examid) {
		User user=userMapper.mapToModel(user2);
		Exam exam=examDao.findOne(examid);
		UserExam userExam=new UserExam();
		userExam.setUser(user);
		userExam.setExam(exam);
		userExamDao.save(userExam);
	}
	
	public List<Double> getGrades(int examId){
		return userExamDao.getGrades(examId);
	}

}
