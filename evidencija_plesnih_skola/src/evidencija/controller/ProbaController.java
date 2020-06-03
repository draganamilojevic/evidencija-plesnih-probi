package evidencija.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import evidencija.entity.Instruktor;
import evidencija.entity.PlesnaGrupa;
import evidencija.entity.Proba;
import evidencija.service.ProbaService;

@Controller
@RequestMapping("/proba")
public class ProbaController {

	@Autowired
	private ProbaService probaService;
	
	@RequestMapping("/lista")
	public String lista(Model model) {
		List<Proba> probe = probaService.getProbe();
		model.addAttribute("probe", probe);
		return "proba-lista";
	}
	
	@RequestMapping("/prikaziFormuZaProbu")
	public String prikaziFormuZaProbu(Model model) {
		Proba p = new Proba();
		model.addAttribute("proba",p);
		
		return "proba-forma";
	}
	
	@RequestMapping("/obradiFormu")
	public String sacuvaj(@Valid @ModelAttribute("proba") Proba proba, BindingResult br) {
		
		System.out.println(br);
		if(br.hasErrors()) {
			return "proba-forma";
		}
		
		probaService.save(proba);
		return "redirect:/proba/lista";
	}

	@RequestMapping("/prikaziFormuIzmena")
	public String prikaziFormuIzmena(@RequestParam("grupaid") int grupaid, 
			                         @RequestParam("instruktorid") int instruktorid,
			                         @RequestParam("datum") Date datum, Model model) {
		Proba p = probaService.getProba(grupaid, instruktorid, datum);
		model.addAttribute("proba",p);
		return "proba-forma";
	}
	
	@ModelAttribute("grupe")
	public HashMap<Integer, String> popuniGrupe(){
		List<PlesnaGrupa> plesneGrupe = probaService.getPlesneGrupe();
		HashMap<Integer, String> grupeMapa = new HashMap<>();
		for (PlesnaGrupa pg : plesneGrupe) {
			grupeMapa.put(pg.getGrupaID(), pg.getNazivGrupe());
		}
		return grupeMapa;
	}
	
	@ModelAttribute("instruktori")
	public HashMap<Integer, String> popuniInstruktore(){
		List<Instruktor> instruktori = probaService.getInstruktori();
		HashMap<Integer, String> instruktoriMapa = new HashMap<>();
		for (Instruktor i : instruktori) {
			instruktoriMapa.put(i.getInstruktorID(), i.getIme());
		}
		return instruktoriMapa;
	}
	
	@RequestMapping("/obrisi")
	public String obrisi(@RequestParam("grupaid") int grupaid,
			             @RequestParam("instruktorid") int instruktorid,
                         @RequestParam("datum") Date datum) {
		probaService.delete(grupaid, instruktorid, datum);
		return "redirect:/proba/lista";
	}
}
