package com.sys.lawyer.po;

import java.io.Serializable;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2019年01月17日 14时14分08秒
 */
public class Photo implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** 
	 *  @Fields Id : id
	 * 
	 * */
	private Integer id;
	/** 
	 *  @Fields Address : address
	 * 
	 * */
	private String address;

	public Integer getId() {
		return this.id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getAddress() {
		return this.address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	
    public Photo() {
		
	}

	public Photo(Integer id ,String address ){
	super();
	this.id=id;
	this.address=address;
	}
	
	@Override
	public String toString() {
		return "Photo [id="+ id + ",address="+ address +  "]";
	}


}

