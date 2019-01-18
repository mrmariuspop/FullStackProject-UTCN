package project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.dao.AnnouncementDao;
import project.dto.AnnouncementDto;
import project.dto.mapper.AnnouncementMapper;
import project.model.Announcement;

@Service
public class AnnouncementService {

	@Autowired
	private AnnouncementDao announcementDao;
	
	AnnouncementMapper announcementMapper=new AnnouncementMapper();

	public List<AnnouncementDto> getAnnouncements() {
		List<AnnouncementDto> announcements = new ArrayList<>();
		for (Announcement announcement : announcementDao.findAll()) {
			announcements.add(announcementMapper.mapToDTO(announcement));
		}
		return announcements;
	}

	public void save(AnnouncementDto announcementDto) {
		Announcement announcement=announcementMapper.mapToModel(announcementDto);
		announcementDao.save(announcement);
	}

	public void deleteAnnouncement(int idAnnouncement) {
		announcementDao.delete(idAnnouncement);
	}
	public AnnouncementDto findAnnouncement(int id) {
		Announcement announcement=announcementDao.findOne(id);
		AnnouncementDto announcementDto=announcementMapper.mapToDTO(announcement);
		return announcementDto;
	}
}
