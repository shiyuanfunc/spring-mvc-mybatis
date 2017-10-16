package com.song.dao.impl;

import com.song.bean.User;
import com.song.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/8/18.
 */
@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public int saveUser(User user) throws Exception {

        String sql = "insert into songyh_user(id,username,password,tel,email,img,createTime,imgpath)" +
                " values (songyh_user_seq.nextval ,?,?,?,?,?,sysdate,?)";

         int len = jdbcTemplate.update(sql, new PreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps) throws SQLException {
                ps.setString(1,user.getUserName());
                ps.setString(2,user.getPassWord());
                ps.setString(3,user.getTel());
                ps.setString(4,user.getEmail());
                ps.setBytes(5,user.getImg());
                ps.setString(6,user.getImgPath());
            }
        });
        return len;
    }

    @Override
    public List<Map<String, Object>> checkName(String name) throws Exception {

        String sql = "select * from songyh_user where username=?";

        return jdbcTemplate.queryForList(sql, name);
    }

    @Override
    public User login(String userName) throws Exception {

        String sql = "select * from songyh_user where username = ?";
        User u = null;
         /*User user1 = jdbcTemplate.queryForObject(sql, User.class, userName);
       jdbcTemplate.query(sql, userName, new ResultSetExtractor<User>() {
            @Override
            public User extractData(ResultSet rs) throws SQLException, DataAccessException {
                User u = null;
                while(rs.next()){
                    u.setId(rs.getInt(1));
                    u.setUserName(rs.getString(2));
                    u.setPassWord(rs.getString(3));
                    u.setTel(rs.getString(4));
                    u.setImgPath(rs.getString(10));
                }

                return u;
            }
        });*/
        User user =  jdbcTemplate.queryForObject(sql,new RowMapper<User>() {
            @Override
            public User mapRow(ResultSet rs, int i) throws SQLException {
                User u = new User();
                System.out.println(rs.getInt(1)+" " +rs.next());
                if (rs.next()){
                u.setId(rs.getInt(1));
                u.setUserName(rs.getString(2));
                u.setPassWord(rs.getString(3));
                u.setTel(rs.getString(4));
                u.setImgPath(rs.getString(10));
                    System.out.println(u);
            }else {
                    u = null;
                }
                return u;
            }
        },userName.trim());
        System.out.println(user);
        return user;
    }

    @Override
    public List<User> queryUsers() throws Exception {
        return null;
    }

    @Override
    public List<Map<String, Object>> ztree() throws Exception {
        return null;
    }
}
