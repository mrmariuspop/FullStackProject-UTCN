package project.dto.mapper;

import project.dto.UserDto;
import project.model.User;

public class UserMapper {
	
	private RoleMapper roleMapper = new RoleMapper();
	
	public UserDto mapToDTO(User user) {
		UserDto userDTO = new UserDto();
		userDTO.setUserid(user.getUserid());
		userDTO.setFirstname(user.getFirstname());
		userDTO.setLastname(user.getLastname());
		userDTO.setGroup(user.getGroup());
		userDTO.setPassword(user.getPassword());
		userDTO.setUsername(user.getUsername());
		userDTO.setRole(roleMapper.mapToDTO(user.getRole()));
		return userDTO;
	}

	public User mapToModel(UserDto userDTO) {
		User user = new User();
		user.setUserid(userDTO.getUserid());
		user.setFirstname(userDTO.getFirstname());
		user.setLastname(userDTO.getLastname());
		user.setGroup(userDTO.getGroup());
		user.setPassword(userDTO.getPassword());
		user.setUsername(userDTO.getUsername());
		user.setRole(roleMapper.mapToModel(userDTO.getRole()));

		return user;
	}

}
