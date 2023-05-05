package com.sys.lawyer.vo;

import com.sys.lawyer.po.Releases;
import com.sys.lawyer.po.Users;

import java.io.Serializable;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2019年01月23日 13时36分09秒
 */
public class ReleasesVo implements Serializable {

	private Integer rs;

	private String zw;

	private Integer zwId;

	private Users users;

	private Releases releases;

	public Integer getRs() {
		return rs;
	}

	public void setRs(Integer rs) {
		this.rs = rs;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public String getZw() {
		return zw;
	}

	public void setZw(String zw) {
		this.zw = zw;
	}

	public Integer getZwId() {
		return zwId;
	}

	public void setZwId(Integer zwId) {
		this.zwId = zwId;
	}

	public Releases getReleases() {
		return releases;
	}

	public void setReleases(Releases releases) {
		this.releases = releases;
	}
}

