package com.sys.lawyer.po;

import java.io.Serializable;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2019年01月16日 12时33分43秒
 */
public class Users implements Serializable {
    private static final long serialVersionUID = 3148176768559230877L;
    

	/** 
	 *  @Fields Id : id
	 * 
	 * */
	private Integer id;
	/** 
	 *  @Fields Name :
	 * 
	 * */
	private String name;
	/** 
	 *  @Fields RealName : realName
	 * 
	 * */
	private String realName;
	/** 
	 *  @Fields IsDelete : isDelete
	 * 
	 * */
	private Integer isDelete;
	/** 
	 *  @Fields Role : role
	 * 
	 * */
	private Integer role;
	/** 
	 *  @Fields Phone : phone
	 * 
	 * */
	private String phone;
	/** 
	 *  @Fields Pass : pass
	 * 
	 * */
	private String pass;
	/** 
	 *  @Fields Photo : photo
	 * 
	 * */
	private String photo;
	/** 
	 *  @Fields Sfz : sfz
	 * 
	 * */
	private String sfz;
	/** 
	 *  @Fields Address : address
	 * 
	 * */
	private String address;
	/** 
	 *  @Fields SchoolJs : schoolJs
	 * 
	 * */
	private String schoolJs;
	/** 
	 *  @Fields SchoolName : schoolName
	 * 
	 * */
	private String schoolName;

	private Integer isSh;

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
	
	public String getRealName() {
		return this.realName;
	}
	
	public void setRealName(String realName) {
		this.realName = realName;
	}
	
	public Integer getIsDelete() {
		return this.isDelete;
	}
	
	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}
	
	public Integer getRole() {
		return this.role;
	}
	
	public void setRole(Integer role) {
		this.role = role;
	}
	
	public String getPhone() {
		return this.phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getPass() {
		return this.pass;
	}
	
	public void setPass(String pass) {
		this.pass = pass;
	}
	
	public String getPhoto() {
		return this.photo;
	}
	
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	public String getSfz() {
		return this.sfz;
	}
	
	public void setSfz(String sfz) {
		this.sfz = sfz;
	}
	
	public String getAddress() {
		return this.address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getSchoolJs() {
		return this.schoolJs;
	}
	
	public void setSchoolJs(String schoolJs) {
		this.schoolJs = schoolJs;
	}
	
	public String getSchoolName() {
		return this.schoolName;
	}
	
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public Integer getIsSh() {
		return isSh;
	}

	public void setIsSh(Integer isSh) {
		this.isSh = isSh;
	}

	public Users() {
		
	}

	public Users(Integer id, String name, String realName, Integer isDelete, Integer role, String phone, String pass, String photo, String sfz, String address, String schoolJs, String schoolName, Integer isSh) {
		this.id = id;
		this.name = name;
		this.realName = realName;
		this.isDelete = isDelete;
		this.role = role;
		this.phone = phone;
		this.pass = pass;
		this.photo = photo;
		this.sfz = sfz;
		this.address = address;
		this.schoolJs = schoolJs;
		this.schoolName = schoolName;
		this.isSh = isSh;
	}

	@Override
	public String toString() {
		return "Users [id="+ id + ",name="+ name + ",realName="+ realName + ",isDelete="+ isDelete + ",role="+ role + ",phone="+ phone + ",pass="+ pass + ",photo="+ photo + ",sfz="+ sfz + ",address="+ address + ",schoolJs="+ schoolJs + ",schoolName="+ schoolName +",isSh="+ isSh +  "]";
	}


}

