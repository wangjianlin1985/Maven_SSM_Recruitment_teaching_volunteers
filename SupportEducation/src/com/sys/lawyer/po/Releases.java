package com.sys.lawyer.po;

import java.io.Serializable;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2019年01月23日 13时43分35秒
 */
public class Releases implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** 
	 *  @Fields Id : id
	 * 
	 * */
	private Integer id;
	/** 
	 *  @Fields TypeId : typeId
	 * 
	 * */
	private Integer typeId;
	/** 
	 *  @Fields Rs : rs
	 * 
	 * */
	private Integer rs;
	/** 
	 *  @Fields ZjTime : zjTime
	 * 
	 * */
	private java.util.Date zjTime;
	/** 
	 *  @Fields FwTime : fwTime
	 * 
	 * */
	private java.util.Date fwTime;
	/** 
	 *  @Fields Lxr : lxr
	 * 
	 * */
	private String lxr;
	/** 
	 *  @Fields Lxfs : lxfs
	 * 
	 * */
	private String lxfs;
	/** 
	 *  @Fields Bz : bz
	 * 
	 * */
	private String bz;
	/** 
	 *  @Fields IsFb : isFb
	 * 
	 * */
	private Integer isFb;
	/** 
	 *  @Fields FbTime : fbTime
	 * 
	 * */
	private java.util.Date fbTime;
	/** 
	 *  @Fields UsersId : usersId
	 * 
	 * */
	private Integer usersId;
	private Integer syrs;

	public Integer getId() {
		return this.id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Integer getTypeId() {
		return this.typeId;
	}
	
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	
	public Integer getRs() {
		return this.rs;
	}
	
	public void setRs(Integer rs) {
		this.rs = rs;
	}
	
	public java.util.Date getZjTime() {
		return this.zjTime;
	}
	
	public void setZjTime(java.util.Date zjTime) {
		this.zjTime = zjTime;
	}	
	
	public java.util.Date getFwTime() {
		return this.fwTime;
	}
	
	public void setFwTime(java.util.Date fwTime) {
		this.fwTime = fwTime;
	}	
	
	public String getLxr() {
		return this.lxr;
	}
	
	public void setLxr(String lxr) {
		this.lxr = lxr;
	}
	
	public String getLxfs() {
		return this.lxfs;
	}
	
	public void setLxfs(String lxfs) {
		this.lxfs = lxfs;
	}
	
	public String getBz() {
		return this.bz;
	}
	
	public void setBz(String bz) {
		this.bz = bz;
	}
	
	public Integer getIsFb() {
		return this.isFb;
	}
	
	public void setIsFb(Integer isFb) {
		this.isFb = isFb;
	}
	
	public java.util.Date getFbTime() {
		return this.fbTime;
	}
	
	public void setFbTime(java.util.Date fbTime) {
		this.fbTime = fbTime;
	}	
	
	public Integer getUsersId() {
		return this.usersId;
	}
	
	public void setUsersId(Integer usersId) {
		this.usersId = usersId;
	}

	public Integer getSyrs() {
		return syrs;
	}

	public void setSyrs(Integer syrs) {
		this.syrs = syrs;
	}

	public Releases() {
		
	}

	public Releases(Integer id ,Integer typeId ,Integer rs ,java.util.Date zjTime ,java.util.Date fwTime ,String lxr ,String lxfs ,String bz ,Integer isFb ,java.util.Date fbTime ,Integer usersId , Integer syrs){
	super();
	this.id=id;
	this.typeId=typeId;
	this.rs=rs;
	this.zjTime=zjTime;
	this.fwTime=fwTime;
	this.lxr=lxr;
	this.lxfs=lxfs;
	this.bz=bz;
	this.isFb=isFb;
	this.fbTime=fbTime;
	this.usersId=usersId;
	this.syrs=syrs;
	}
	
	@Override
	public String toString() {
		return "Releases [id="+ id + ",typeId="+ typeId + ",rs="+ rs + ",zjTime="+ zjTime + ",fwTime="+ fwTime + ",lxr="+ lxr + ",lxfs="+ lxfs + ",bz="+ bz + ",isFb="+ isFb + ",fbTime="+ fbTime + ",usersId="+ usersId + ",syrs="+ syrs + "]";
	}


}

