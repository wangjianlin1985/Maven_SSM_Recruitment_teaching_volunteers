package com.sys.lawyer.po;

import javax.transaction.Transactional;
import java.beans.Transient;
import java.io.Serializable;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2019年01月23日 13时36分08秒
 */
public class Apply implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** 
	 *  @Fields Id : id
	 * 
	 * */
	private Integer id;
	/** 
	 *  @Fields Sqr : sqr
	 * 
	 * */
	private Integer sqr;
	/** 
	 *  @Fields SqTime : sqTime
	 * 
	 * */
	private java.util.Date sqTime;
	/** 
	 *  @Fields ReleaseId : releaseId
	 * 
	 * */
	private Integer releaseId;
	/** 
	 *  @Fields IsDelete : isDelete
	 * 
	 * */
	private Integer isDelete;

	private String typeName;
	private String sbrName;
	private Releases releases;

	public Integer getId() {
		return this.id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Integer getSqr() {
		return this.sqr;
	}
	
	public void setSqr(Integer sqr) {
		this.sqr = sqr;
	}
	
	public java.util.Date getSqTime() {
		return this.sqTime;
	}
	
	public void setSqTime(java.util.Date sqTime) {
		this.sqTime = sqTime;
	}	
	
	public Integer getReleaseId() {
		return this.releaseId;
	}
	
	public void setReleaseId(Integer releaseId) {
		this.releaseId = releaseId;
	}
	
	public Integer getIsDelete() {
		return this.isDelete;
	}
	
	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getSbrName() {
		return sbrName;
	}

	public void setSbrName(String sbrName) {
		this.sbrName = sbrName;
	}


	public Releases getReleases() {
		return releases;
	}

	public void setReleases(Releases releases) {
		this.releases = releases;
	}

	public Apply() {
	}

	public Apply(Integer id , Integer sqr , java.util.Date sqTime , Integer releaseId , Integer isDelete ){
	super();
	this.id=id;
	this.sqr=sqr;
	this.sqTime=sqTime;
	this.releaseId=releaseId;
	this.isDelete=isDelete;
	}
	
	@Override
	public String toString() {
		return "Apply [id="+ id + ",sqr="+ sqr + ",sqTime="+ sqTime + ",releaseId="+ releaseId + ",isDelete="+ isDelete  + "]";
	}


}

