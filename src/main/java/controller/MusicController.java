package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import domain.Music;
import domain.MusicRepository;

@Controller
public class MusicController {

	@Autowired
	MusicRepository musicRepo;

	@RequestMapping("/allMusic")
	public ModelAndView getMusicListAll(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView model = new ModelAndView("musicList");
		List<Music> listMusic = loadAllMusic();

		model.addObject("listMusic", listMusic);

		return model;
	}

	@RequestMapping(value = "/loadSong/{id}", method = RequestMethod.GET, produces = {
			MediaType.APPLICATION_OCTET_STREAM_VALUE })
	public HttpEntity<byte[]> downloadMusicFile(@PathVariable("id") Long id, ModelMap model,
			HttpServletResponse response) throws IOException, ServletException {

		System.out.println("mapped - load song, id: " + id);
		byte[] music = loadMusicById(id).getContent();

		HttpHeaders header = new HttpHeaders();
		header.setContentType(new MediaType("audio", "mp3"));
		header.setContentLength(music.length);
		return new HttpEntity<byte[]>(music, header);
	}

	@RequestMapping(value = "/likeSong/{id}", method = RequestMethod.GET)
	public ModelAndView likeSong(@PathVariable("id") Long id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String remoteUser = request.getRemoteUser();
		String songName = loadMusicById(id).getName();

		System.out.println("Like song, id - " + id);
		System.out.println("User - " + remoteUser);
		System.out.println("Song name - " + songName);

		ModelAndView model = new ModelAndView("likeSong");
		model.addObject("songName", songName);
		return model;
	}

	@RequestMapping(value = "/songSave", method = RequestMethod.POST)
	public ModelAndView addMusicFromForm(@RequestParam(value = "song", required = false) MultipartFile song,
			@RequestParam(value = "name", required = false) String name) {

		Music music = new Music();
		music.setName(name);
		if (!song.isEmpty()) {
			try {
				validateSong(song);

			} catch (RuntimeException re) {
				System.err.println(re.getMessage());
				return new ModelAndView("403");
			}

		}

		try {
			music.setContent(song.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("music for save - " + music);
		saveSong(music);

		ModelAndView model = new ModelAndView("musicList");
		List<Music> listMusic = loadAllMusic();

		model.addObject("listMusic", listMusic);
		return model;
	}

	private void validateSong(MultipartFile song) {
		System.err.println("file name: " + song.getName());
		if (!song.getContentType().equals("audio/mp3")) {
			System.err.println("current type - " + song.getContentType());
			throw new RuntimeException("Only MP3 are accepted");
		}
	}

	private void saveSong(Music music) {
		musicRepo.save(music);

	}

	private Music loadMusicById(Long id) {
		return musicRepo.findOne(id);
	}

	private List<Music> loadAllMusic() {
		return (List<Music>) musicRepo.findAll();
	}
}
