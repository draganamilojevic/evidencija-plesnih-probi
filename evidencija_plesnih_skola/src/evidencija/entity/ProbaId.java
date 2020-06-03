package evidencija.entity;

import java.io.Serializable;
import java.sql.Date;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;


@Embeddable
public class ProbaId implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int grupaID;
	
	private int instruktorID;
	
	@NotNull(message = "Obavezno polje")
	@Column(name = "datum")
	private Date datum;
	
	public ProbaId() {
	
	}
	public ProbaId(int grupaID, int instruktorID, Date datum) {
		this.grupaID = grupaID;
		this.instruktorID = instruktorID;
		this.datum = datum;
	}
	
	public int getGrupaID() {
		return grupaID;
	}
	public void setGrupaID(int grupaID) {
		this.grupaID = grupaID;
	}
	public int getInstruktorID() {
		return instruktorID;
	}
	public void setInstruktorID(int instruktorID) {
		this.instruktorID = instruktorID;
	}
	public Date getDatum() {
		return datum;
	}
	public void setDatum(Date datum) {
		this.datum = datum;
	}
	@Override
	public int hashCode() {
		return Objects.hash(getGrupaID(), getInstruktorID(), getDatum());
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof ProbaId)) return false;
        ProbaId that = (ProbaId) obj;
        return Objects.equals(getGrupaID(), that.getGrupaID()) &&
                Objects.equals(getInstruktorID(), that.getInstruktorID()) &&
                Objects.equals(getDatum(), that.getDatum());
	}
	
	
	
}
