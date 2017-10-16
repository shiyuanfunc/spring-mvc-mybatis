package com.song.dao;

import com.song.bean.User;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/8/18.
 */
public interface UserDao {

    public int saveUser(User user) throws Exception;

    public List<Map<String, Object>> checkName(String name)throws Exception;

    public User login(String userName) throws Exception;

    public List<User> queryUsers() throws Exception;

    public List<Map<String,Object>> ztree() throws Exception;

}
