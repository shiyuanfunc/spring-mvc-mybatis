package com.song.bean;

import com.song.annotion.Token;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * Created by Administrator on 2017/8/17.
 */
public class Resource {
    private Integer id;
    private String name;
    private String type;
    private String keyWords;
    private String score;
    private String descp;
    private Date uploadTime;
    private String resour;
    private String ext;
    private String userName = "";
    private long resourcesize;
    private Integer userId;
    private Integer downNum = 0;
    private Integer star;
    private Integer status = 0;

    public long getResourcesize() {
        return resourcesize;
    }

    public void setResourcesize(long resourcesize) {
        this.resourcesize = resourcesize;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getExt() {
        return ext;
    }

    public void setExt(String ext) {
        this.ext = ext;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getKeyWords() {
        return keyWords;
    }

    public void setKeyWords(String keyWords) {
        this.keyWords = keyWords;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public String getDescp() {
        return descp;
    }

    public void setDescp(String descp) {
        this.descp = descp;
    }

    public Date getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(Date uploadTime) {
        this.uploadTime = uploadTime;
    }

    public String getResour() {
        return resour;
    }

    public void setResour(String resour) {
        this.resour = resour;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getDownNum() {
        return downNum;
    }

    public void setDownNum(Integer downNum) {
        this.downNum = downNum;
    }

    public Integer getStar() {
        return star;
    }

    public void setStar(Integer star) {
        this.star = star;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Resource{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", type='" + type + '\'' +
                ", keyWords='" + keyWords + '\'' +
                ", score='" + score + '\'' +
                ", descp='" + descp + '\'' +
                ", uploadTime=" + uploadTime +
                ", resour='" + resour + '\'' +
                ", ext='" + ext + '\'' +
                ", userName='" + userName + '\'' +
                ", resourcesize=" + resourcesize +
                ", userId=" + userId +
                ", downNum=" + downNum +
                ", star=" + star +
                ", status=" + status +
                '}';
    }
}
