package com.sys.lawyer.vo;

import com.sys.lawyer.po.Evaluate;
import com.sys.lawyer.po.Releases;
import com.sys.lawyer.po.Type;
import com.sys.lawyer.po.Users;

import java.util.List;

public class EvaluateVo {

    private Evaluate evaluate;

    private Users plr;

    private Releases releases;
    private Type type;

    public Evaluate getEvaluate() {
        return evaluate;
    }

    public void setEvaluate(Evaluate evaluate) {
        this.evaluate = evaluate;
    }

    public Users getPlr() {
        return plr;
    }

    public void setPlr(Users plr) {
        this.plr = plr;
    }

    public Releases getReleases() {
        return releases;
    }

    public void setReleases(Releases releases) {
        this.releases = releases;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }
}
