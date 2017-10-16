package com.song.bean;

/**
 * Created by Administrator on 2017/8/22.
 */
public class TestMybatis2 {

    private Integer id ;

    private String score ;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return "TestMybatis2{" +
                "id=" + id +
                ", score='" + score + '\'' +
                '}';
    }
}
