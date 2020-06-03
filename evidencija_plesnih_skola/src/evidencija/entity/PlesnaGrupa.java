package evidencija.entity;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="plesna_grupa")
public class PlesnaGrupa {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "grupaID")
	private int grupaID;
	@Column(name = "naziv_grupe")
	private String nazivGrupe;
	@Column(name = "max_broj_clanova")
	private int maxBrojClanova;
	@Column(name = "datum_osnivanja")
	private Date datumOsnivanja;
	@Column(name = "broj_nagrada")
	private int brojNagrada;
	@OneToMany(mappedBy = "plesnaGrupa",cascade = {CascadeType.REMOVE, CascadeType.MERGE,CascadeType.REFRESH })
	private List<Proba> probe;
	
	
	public PlesnaGrupa() {
		probe = new ArrayList<>();
	}
	
	public PlesnaGrupa(int grupaID, String nazivGrupe, int maxBrojClanova, Date datumOsnivanja, int brojNagrada) {
		this.grupaID = grupaID;
		this.nazivGrupe = nazivGrupe;
		this.maxBrojClanova = maxBrojClanova;
		this.datumOsnivanja = datumOsnivanja;
		this.brojNagrada = brojNagrada;
		
	}

	public int getGrupaID() {
		return grupaID;
	}
	public void setGrupaID(int grupaID) {
		this.grupaID = grupaID;
	}
	public String getNazivGrupe() {
		return nazivGrupe;
	}
	public void setNazivGrupe(String nazivGrupe) {
		this.nazivGrupe = nazivGrupe;
	}
	public int getMaxBrojClanova() {
		return maxBrojClanova;
	}
	public void setMaxBrojClanova(int maxBrojClanova) {
		this.maxBrojClanova = maxBrojClanova;
	}
	public Date getDatumOsnivanja() {
		return datumOsnivanja;
	}
	public void setDatumOsnivanja(Date datumOsnivanja) {
		this.datumOsnivanja = datumOsnivanja;
	}
	public int getBrojNagrada() {
		return brojNagrada;
	}
	public void setBrojNagrada(int brojNagrada) {
		this.brojNagrada = brojNagrada;
	}
	
	public List<Proba> getProbe() {
		return probe;
	}

	public void setProbe(List<Proba> probe) {
		this.probe = probe;
	}

	@Override
	public String toString() {
		return nazivGrupe;
	}
	
	
	
	
}
