package com.swz.entity;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

/**
 * Kc entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "kc", catalog = "banjims")
@Component
public class Kc implements java.io.Serializable
{

	// Fields
	private Integer kcid;
	private String kcname;
	private String kcxz;
	private Double kcxf;
	private Set<Scor> scors = new HashSet<Scor>(0);

	// Constructors

	/** default constructor */
	public Kc()
	{
	}

	/** minimal constructor */
	public Kc(String kcname, String kcxz)
	{
		this.kcname = kcname;
		this.kcxz = kcxz;
	}

	/** full constructor */
	public Kc(String kcname, String kcxz, Double kcxf, Set<Scor> scors)
	{
		this.kcname = kcname;
		this.kcxz = kcxz;
		this.kcxf = kcxf;
		this.scors = scors;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "KCID", unique = true, nullable = false)
	public Integer getKcid()
	{
		return this.kcid;
	}

	public void setKcid(Integer kcid)
	{
		this.kcid = kcid;
	}

	@Column(name = "KCName", nullable = false, length = 100)
	public String getKcname()
	{
		return this.kcname;
	}

	public void setKcname(String kcname)
	{
		this.kcname = kcname;
	}

	@Column(name = "KCXZ", nullable = false, length = 100)
	public String getKcxz()
	{
		return this.kcxz;
	}

	public void setKcxz(String kcxz)
	{
		this.kcxz = kcxz;
	}

	@Column(name = "KCXF", precision = 22, scale = 0)
	public Double getKcxf()
	{
		return this.kcxf;
	}

	public void setKcxf(Double kcxf)
	{
		this.kcxf = kcxf;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "kc")
	public Set<Scor> getScors()
	{
		return this.scors;
	}

	public void setScors(Set<Scor> scors)
	{
		this.scors = scors;
	}

}