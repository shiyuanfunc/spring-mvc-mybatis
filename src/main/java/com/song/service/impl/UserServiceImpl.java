package com.song.service.impl;

import com.song.bean.User;
import com.song.dao.UserDao;
import com.song.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;


    @Override
    public Map<String, Object> saveUser(User user) throws Exception {
        Map<String,Object> map = new HashMap<String,Object>();
        int len = userDao.saveUser(user);

        if (len == 1){
            map.put("status","success");
        }else{
            map.put("status","error");
        }
        return map;
    }

    @Override
    public Map<String, Object> checkName(String name) throws Exception {

        Map<String,Object> map = new HashMap<>();
        List<Map<String, Object>> maps = userDao.checkName(name);
        if(maps.isEmpty() || maps == null){
            map.put("status","success");
        }else {
            map.put("status","error");
        }
        return map;
    }

    @Override
    public Map<String, Object> login(User user) throws Exception {
        Map<String, Object> map = new HashMap<>();
        User u = (User)userDao.login(user.getUserName());
        if (u != null){
            if (u.getPassWord().equals(user.getPassWord())){
                map.put("status","success");
                map.put("message","登陆成功");
                map.put("user",u);
            }else{
                map.put("status","error");
                map.put("message","密码错误");
                map.put("user",null);
            }
        }else{
            map.put("status","error");
            map.put("message","账号不存在");
            map.put("user",null);
        }
        return map;
    }
}
