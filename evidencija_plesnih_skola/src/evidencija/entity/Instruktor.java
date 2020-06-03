package evidencija.entity;


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
@Table(name = "instruktor")
public class Instruktor {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "instruktorID")
	private int instruktorID;
	@Column(name = "ime")
	private String ime;
	@Column(name = "prezime")
	private String prezime;
	@Column(name = "godineIskustva")
	private double godineIskustva;
	@OneToMany(mappedBy = "instruktor",  cascade = {CascadeType.REMOVE, CascadeType.MERGE,CascadeType.REFRESH })
	private List<Proba> probe;
	
	public Instruktor() {
		probe = new ArrayList<>();
	}
	
	public Instruktor(int instruktorID, String ime, String prezime, double godineIskustva,
			List<Proba> probe) {
		this.instruktorID = instruktorID;
		this.ime = ime;
		this.prezime = prezime;
		this.godineIskustva = godineIskustva;
		this.probe = probe;
	}


	public int getInstruktorID() {
		return instruktorID;
	}
	public void setInstruktorID(int instruktorID) {
		this.instruktorID = instruktorID;
	}
	public String getIme() {
		return ime;
	}
	public void setIme(String ime) {
		this.ime = ime;
	}
	public String getPrezime() {
		return prezime;
	}
	public void setPrezime(String prezime) {
		this.prezime = prezime;
	}
	public double getGodineIskustva() {
		return godineIskustva;
	}
	public void setGodineIskustva(double godineIskustva) {
		this.godineIskustva = godineIskustva;
	}

	public List<Proba> getProbe() {
		return probe;
	}

	public void setInstruktori(List<Proba> probe) {
		this.probe = probe;
	}

	@Override
	public String toString() {
		return ime;
	}
	
	
}
