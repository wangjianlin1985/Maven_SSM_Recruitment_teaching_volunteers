package com.sys.lawyer.po;

import java.io.Serializable;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2018年12月18日 16时17分49秒
 */
public class Type implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** 
	 *  @Fields Id : id
	 * 
	 * */
	private Integer id;
	/** 
	 *  @Fields Name : name
	 * 
	 * */
	private String name;
	/** 
	 *  @Fields IdDelete : idDelete
	 * 
	 * */
	private Integer idDelete;

	public Integer getId() {
		return this.id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getName() {
		return this.name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public Integer getIdDelete() {
		return this.idDelete;
	}
	
	public void setIdDelete(Integer idDelete) {
		this.idDelete = idDelete;
	}
	
	
    public Type() {
		
	}

	public Type(Integer id ,String name ,Integer idDelete ){
	super();
	this.id=id;
	this.name=name;
	this.idDelete=idDelete;
	}
	
	@Override
	public String toString() {
		return "Type [id="+ id + ",name="+ name + ",idDelete="+ idDelete +  "]";
	}


}

