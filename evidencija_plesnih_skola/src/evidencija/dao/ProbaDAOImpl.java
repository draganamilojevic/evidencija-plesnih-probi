package evidencija.dao;

import java.sql.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import evidencija.entity.Instruktor;
import evidencija.entity.PlesnaGrupa;
import evidencija.entity.Proba;

@Repository
public class ProbaDAOImpl implements ProbaDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Proba> getProbe() {
		Session currentS = sessionFactory.getCurrentSession();
		Query<Proba> q = currentS.createQuery("from Proba", Proba.class);
		List<Proba> probe = q.getResultList();
		return probe;
	}

	@Override
	public List<PlesnaGrupa> getPlesneGrupe() {
		Session currentS = sessionFactory.getCurrentSession();
		Query<PlesnaGrupa> q = currentS.createQuery("from PlesnaGrupa", PlesnaGrupa.class);
		List<PlesnaGrupa> plesneGrupe = q.getResultList();
		return plesneGrupe;
	}

	@Override
	public List<Instruktor> getInstruktori() {
		Session currentS = sessionFactory.getCurrentSession();
		Query<Instruktor> q = currentS.createQuery("from Instruktor", Instruktor.class);
		List<Instruktor> instruktori = q.getResultList();
		return instruktori;
	}

	@Override
	public void save(Proba proba) {
		
		PlesnaGrupa pGrupa = getPlesnaGrupa(proba.getId().getGrupaID());
		Instruktor in = getInstruktor(proba.getId().getInstruktorID());
		
		proba.setPlesnaGrupa(pGrupa);
		proba.setInstruktor(in);
		
		Session currentS = sessionFactory.getCurrentSession();
		currentS.saveOrUpdate(proba);
		
	}

	private Instruktor getInstruktor(int instruktorID) {
		Session currentS = sessionFactory.getCurrentSession();
		Instruktor i = currentS.get(Instruktor.class, instruktorID);
		return i;
	}

	private PlesnaGrupa getPlesnaGrupa(int grupaID) {
		Session currentS = sessionFactory.getCurrentSession();
		PlesnaGrupa plesnaG = currentS.get(PlesnaGrupa.class, grupaID);
		return plesnaG;
	}

	@Override
	public Proba getProba(int grupaid, int instruktorid, Date datum) {
		Session currentS = sessionFactory.getCurrentSession();
		Query<Proba> q = currentS.createQuery("from Proba where grupaID="+grupaid+" and instruktorID="+instruktorid+" and datum='"+datum+"'", Proba.class);
		Proba p = (Proba) q.getSingleResult();
		return p;
	}

	@Override
	public void delete(int grupaid, int instruktorid, Date datum) {
		Session currentS = sessionFactory.getCurrentSession();
		Query q = currentS.createQuery("delete from Proba where grupaID="+grupaid+" and instruktorID="+instruktorid+" and datum='"+datum+"'");
		q.executeUpdate();
	}

	

}
