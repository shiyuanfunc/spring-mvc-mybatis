package com.song.test;

import com.song.bean.TestMybatis;
import com.song.bean.User;
import com.song.dao.UserDao;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;



public class Test {


    public void test() throws Exception {
        InputStream inputStream = Test.class.getResourceAsStream("/mybatis-config.xml");
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession sqlSession = sqlSessionFactory.openSession();

        UserDao userDao = sqlSession.getMapper(UserDao.class);
        User users = userDao.login("song0720");
        System.out.println(users);

        List<User> users1 = userDao.queryUsers();
        System.out.println(users1);
        sqlSession.commit();
        sqlSession.close();


    }
}
