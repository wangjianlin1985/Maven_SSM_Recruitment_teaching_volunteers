package com.sys.lawyer.po;

import java.io.Serializable;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2019年01月23日 13时36分09秒
 */
public class Evaluate implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** 
	 *  @Fields Id : id
	 * 
	 * */
	private Integer id;
	/** 
	 *  @Fields Nr : nr
	 * 
	 * */
	private String nr;
	/** 
	 *  @Fields Pjr : pjr
	 * 
	 * */
	private Integer pjr;
	/** 
	 *  @Fields UsersId : usersId
	 * 
	 * */
	private Integer usersId;
	/** 
	 *  @Fields PjTime : pjTime
	 * 
	 * */
	private java.util.Date pjTime;
	private Integer releaseId;
	private String title;
	private Integer bpj;

	public Integer getId() {
		return this.id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getNr() {
		return this.nr;
	}
	
	public void setNr(String nr) {
		this.nr = nr;
	}
	
	public Integer getPjr() {
		return this.pjr;
	}
	
	public void setPjr(Integer pjr) {
		this.pjr = pjr;
	}
	
	public Integer getUsersId() {
		return this.usersId;
	}
	
	public void setUsersId(Integer usersId) {
		this.usersId = usersId;
	}
	
	public java.util.Date getPjTime() {
		return this.pjTime;
	}
	
	public void setPjTime(java.util.Date pjTime) {
		this.pjTime = pjTime;
	}

	public Integer getReleaseId() {
		return releaseId;
	}

	public void setReleaseId(Integer releaseId) {
		this.releaseId = releaseId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getBpj() {
		return bpj;
	}

	public void setBpj(Integer bpj) {
		this.bpj = bpj;
	}

	public Evaluate() {
		
	}

	public Evaluate(Integer id ,String nr ,Integer pjr ,Integer usersId ,java.util.Date pjTime ,Integer releaseId, String title){
	super();
	this.id=id;
	this.nr=nr;
	this.pjr=pjr;
	this.usersId=usersId;
	this.pjTime=pjTime;
	this.releaseId=releaseId;
	this.title=title;
	}
	
	@Override
	public String toString() {
		return "Evaluate [id="+ id + ",nr="+ nr + ",pjr="+ pjr + ",usersId="+ usersId + ",pjTime="+ pjTime +  ",releaseId="+ releaseId + ",title="+ title +"]";
	}


}

