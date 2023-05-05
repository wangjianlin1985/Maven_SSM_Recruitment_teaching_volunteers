package com.sys.lawyer.vo;

import com.sys.lawyer.po.Apply;
import com.sys.lawyer.po.Releases;
import com.sys.lawyer.po.Type;
import com.sys.lawyer.po.Users;

public class ApplyVo {
    
    private Releases releases;

    private Apply apply;
    private Users users;
    private Users zjr;
    private Type type;
    private Integer fwsc;


    public Releases getReleases() {
        return releases;
    }

    public void setReleases(Releases releases) {
        this.releases = releases;
    }

    public Apply getApply() {
        return apply;
    }

    public void setApply(Apply apply) {
        this.apply = apply;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    public Integer getFwsc() {
        return fwsc;
    }

    public void setFwsc(Integer fwsc) {
        this.fwsc = fwsc;
    }

    public Users getZjr() {
        return zjr;
    }

    public void setZjr(Users zjr) {
        this.zjr = zjr;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }
}
