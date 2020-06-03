package evidencija.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import evidencija.dao.ProbaDAO;
import evidencija.entity.Instruktor;
import evidencija.entity.PlesnaGrupa;
import evidencija.entity.Proba;

@Service
public class ProbaServiceImpl implements ProbaService {

	@Autowired
	private ProbaDAO probaDAO;
	
	@Override
	@Transactional
	public List<Proba> getProbe() {
		List<Proba> probe = probaDAO.getProbe();
		return probe;
	}

	@Override
	@Transactional
	public List<PlesnaGrupa> getPlesneGrupe() {
		List<PlesnaGrupa> plesneGrupe = probaDAO.getPlesneGrupe();
		return plesneGrupe;
	}

	@Override
	@Transactional
	public List<Instruktor> getInstruktori() {
		List<Instruktor> instruktori = probaDAO.getInstruktori();
		return instruktori;
	}

	@Override
	@Transactional
	public void save(Proba proba) {
		probaDAO.save(proba);
		
	}

	@Override
	@Transactional
	public Proba getProba(int grupaid, int instruktorid, Date datum) {
		Proba p = probaDAO.getProba(grupaid, instruktorid, datum);
		return p;
	}

	@Override
	@Transactional
	public void delete(int grupaid, int instruktorid, Date datum) {
		probaDAO.delete(grupaid, instruktorid, datum);
	}

}
