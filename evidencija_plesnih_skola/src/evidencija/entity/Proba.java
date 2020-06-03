package evidencija.entity;


import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;



@Entity
@Table(name="proba")
public class Proba{

	@EmbeddedId
	private ProbaId id;
	
	
	@NotBlank(message = "Unesite adresu")
	@Column(name = "adresa")
	private String adresa;
	
	@ManyToOne
	@JoinColumn(name = "grupaID",referencedColumnName="grupaID" ,insertable = false, updatable = false)
	private PlesnaGrupa plesnaGrupa;
	
	@ManyToOne
	@JoinColumn(name = "instruktorID",referencedColumnName="instruktorID" ,insertable = false, updatable = false)
	private Instruktor instruktor;
	
	
	public Proba() {
		
	}

	public Proba(ProbaId id, String adresa) {
		this.id = id;
		this.adresa = adresa;
	}


	public ProbaId getId() {
		return id;
	}


	public void setId(ProbaId id) {
		this.id = id;
	}


	public String getAdresa() {
		return adresa;
	}

	public void setAdresa(String adresa) {
		this.adresa = adresa;
	}

	

	public PlesnaGrupa getPlesnaGrupa() {
		return plesnaGrupa;
	}


	public void setPlesnaGrupa(PlesnaGrupa plesnaGrupa) {
		this.plesnaGrupa = plesnaGrupa;
	}


	public Instruktor getInstruktor() {
		return instruktor;
	}


	public void setInstruktor(Instruktor instruktor) {
		this.instruktor = instruktor;
	}


	@Override
	public String toString() {
		return "Proba [id=" + id + ", adresa=" + adresa + "]";
	}

	
	
	
	
}
