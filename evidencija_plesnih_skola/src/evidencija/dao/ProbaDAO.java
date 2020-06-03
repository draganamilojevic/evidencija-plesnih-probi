package evidencija.dao;

import java.sql.Date;
import java.util.List;

import evidencija.entity.Instruktor;
import evidencija.entity.PlesnaGrupa;
import evidencija.entity.Proba;

public interface ProbaDAO {

	public List<Proba> getProbe();

	public List<PlesnaGrupa> getPlesneGrupe();

	public List<Instruktor> getInstruktori();

	public void save(Proba proba);

	public Proba getProba(int grupaid, int instruktorid, Date datum);

	public void delete(int grupaid, int instruktorid, Date datum);

}
