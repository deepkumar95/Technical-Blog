/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.entities;

import java.sql.Timestamp;

/**
 *
 * @author Deep Kumar
 */
public class Post {
    private int pid;
    private String ptitle;
    private String pcontent;
    private String pcode;
    private String ppic;
    private Timestamp pdime;
    private int catId;
    private int userId;

    public Post(int pid, String ptitle, String pcontent, String pcode, String ppic, Timestamp pdime, int catId, int userId) {
        this.pid = pid;
        this.ptitle = ptitle;
        this.pcontent = pcontent;
        this.pcode = pcode;
        this.ppic = ppic;
        this.pdime = pdime;
        this.catId = catId;
        this.userId=userId;
    }

    public Post(String ptitle, String pcontent, String pcode, String ppic, Timestamp pdime, int catId, int userId) {
        this.ptitle = ptitle;
        this.pcontent = pcontent;
        this.pcode = pcode;
        this.ppic = ppic;
        this.pdime = pdime;
        this.catId = catId;
        this.userId=userId;
    }

    public int getPid() {
        return pid;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPtitle() {
        return ptitle;
    }

    public void setPtitle(String ptitle) {
        this.ptitle = ptitle;
    }

    public String getPcontent() {
        return pcontent;
    }

    public void setPcontent(String pcontent) {
        this.pcontent = pcontent;
    }

    public String getPcode() {
        return pcode;
    }

    public void setPcode(String pcode) {
        this.pcode = pcode;
    }

    public String getPpic() {
        return ppic;
    }

    public void setPpic(String ppic) {
        this.ppic = ppic;
    }

    public Timestamp getPdime() {
        return pdime;
    }

    public void setPdime(Timestamp pdime) {
        this.pdime = pdime;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    
    
}
