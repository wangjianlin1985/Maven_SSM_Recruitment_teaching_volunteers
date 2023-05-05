package com.sys.lawyer.po;

import java.io.Serializable;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2019年01月28日 13时26分48秒
 */
public class Message implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** 
	 *  @Fields Id : id
	 * 
	 * */
	private Integer id;
	/** 
	 *  @Fields Time : time
	 * 
	 * */
	private java.util.Date time;
	/** 
	 *  @Fields Title : title
	 * 
	 * */
	private String title;
	/** 
	 *  @Fields Nr : nr
	 * 
	 * */
	private String nr;

	private Integer userId;

	private Users users;

	public Integer getId() {
		return this.id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public java.util.Date getTime() {
		return this.time;
	}
	
	public void setTime(java.util.Date time) {
		this.time = time;
	}	
	
	public String getTitle() {
		return this.title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getNr() {
		return this.nr;
	}
	
	public void setNr(String nr) {
		this.nr = nr;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Message() {
		
	}

	public Message(Integer id ,java.util.Date time ,String title ,String nr ,Integer userId){
	super();
	this.id=id;
	this.time=time;
	this.title=title;
	this.nr=nr;
	this.userId=userId;
	}
	
	@Override
	public String toString() {
		return "Message [id="+ id + ",time="+ time + ",title="+ title + ",nr="+ nr + ",userId="+ userId + "]";
	}


}

