package com.song.service;

import com.song.bean.User;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 * Created by Administrator on 2017/8/18.
 */
public interface UserService {

    public Map<String ,Object> saveUser(User user) throws Exception;

    public Map<String,Object> checkName(String name) throws Exception;

    //登陆
    public Map<String,Object> login(User user) throws Exception;
}
