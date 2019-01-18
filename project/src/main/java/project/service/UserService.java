package project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.dao.RoleDao;
import project.dao.UserDao;
import project.dto.RoleDto;
import project.dto.UserDto;
import project.dto.mapper.RoleMapper;
import project.dto.mapper.UserMapper;
import project.model.User;
import project.model.UserExam;

@Service
public class UserService {
	@Autowired
	private UserDao userDao;

	@Autowired
	private RoleDao roleDao;

	private UserMapper userMapper = new UserMapper();
	private RoleMapper roleMapper = new RoleMapper();

	private List<User> getAllStudents() {
		List<User> users = new ArrayList<User>();
		for (User user : userDao.findAll()) {
			if (user.getRole().getName().equals("ROLE_STUDENT")) {
				users.add(user);
			}
		}
		return users;
	}

	public List<UserDto> getAllUsers() {
		List<UserDto> users = new ArrayList<UserDto>();
		for (User user : userDao.findAll()) {
			users.add(userMapper.mapToDTO(user));
		}
		return users;
	}

	public List<UserDto> getAllDtoStudents() {
		List<UserDto> users = new ArrayList<UserDto>();
		for (User user : getAllStudents()) {
			users.add(userMapper.mapToDTO(user));
		}
		return users;
	}

	public List<UserDto> getAllDtoProfessors() {
		List<UserDto> users = new ArrayList<UserDto>();
		for (User user : userDao.findAll()) {
			if (user.getRole().getName().equals("ROLE_PROFESSOR")) {
				users.add(userMapper.mapToDTO(user));
			}
		}
		return users;
	}

	public void save(UserDto userDto) {
		userDao.save(userMapper.mapToModel(userDto));
	}

	public int findIdByUsername(String username) {
		return userDao.findByUsername(username).getUserid();
	}

	public UserDto checkLogin(UserDto userDto) {
		for (User userDb : userDao.findAll()) {
			if (userDb.getUsername().equals(userDto.getUsername())
					&& userDb.getPassword().equals(userDto.getPassword())) {
				return userMapper.mapToDTO(userDb);
			}
		}
		return null;
	}

	public List<UserDto> getStudentsWhichNotAttendTheExam(int id) {
		boolean examFound = false;
		List<UserDto> users = new ArrayList<>();
		for (User user : getAllStudents()) {
			for (UserExam userExam : user.getUserExam()) {
				if (userExam.getExam().getExamId() == id) {
					examFound = true;
				}
			}
			if (!examFound) {
				users.add(userMapper.mapToDTO(user));
			}
			examFound = false;
		}
		return users;
	}

	public RoleDto findRole(String name) {
		return roleMapper.mapToDTO(roleDao.findByName(name));
	}

	public UserDto findUser(int id) {
		User user = userDao.findOne(id);
		return userMapper.mapToDTO(user);
	}

	public void delete(int id) {
		userDao.delete(id);
	}

}
