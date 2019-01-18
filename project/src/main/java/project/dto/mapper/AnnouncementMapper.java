package project.dto.mapper;

import project.dto.AnnouncementDto;
import project.model.Announcement;

public class AnnouncementMapper {
	public AnnouncementDto mapToDTO(Announcement announcement) {
		AnnouncementDto announcementDTO = new AnnouncementDto();
		announcementDTO.setAnnouncementId(announcement.getAnnouncementId());
		announcementDTO.setDescription(announcement.getDescription());
		announcementDTO.setTitle(announcement.getTitle());
		return announcementDTO;
	}

	public Announcement mapToModel(AnnouncementDto announcementDTO) {
		Announcement announcement = new Announcement();
		announcement.setAnnouncementId(announcementDTO.getAnnouncementId());
		announcement.setDescription(announcementDTO.getDescription());
		announcement.setTitle(announcementDTO.getTitle());
		return announcement;
	}

}
