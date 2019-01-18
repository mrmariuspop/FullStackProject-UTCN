package project.dto.mapper;

import project.dto.RoleDto;
import project.model.Role;

public class RoleMapper {
	public RoleDto mapToDTO(Role role) {
		RoleDto roleDTO = new RoleDto();
		roleDTO.setRoleId(role.getRoleId());
		roleDTO.setName(role.getName());
		return roleDTO;
	}

	public Role mapToModel(RoleDto roleDTO) {
		Role role = new Role();
		role.setRoleId(roleDTO.getRoleId());
		role.setName(roleDTO.getName());
		return role;
	}
}
