package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import domain.Music;
import domain.MusicRepository;

@Controller
public class MusicController {

	@Autowired
	MusicRepository musicRepo;

	@RequestMapping("/allMusic")
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ModelAndView model = new ModelAndView("musicList");
		List<Music> listMusic = loadAllMusic();

		model.addObject("listMusic", listMusic);

		return model;
	}

	private List<Music> loadAllMusic() {
		return (List<Music>) musicRepo.findAll();
	}
}
