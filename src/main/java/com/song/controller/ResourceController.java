package com.song.controller;

import com.song.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.*;

/**
 * Created by Administrator on 2017/8/17.
 */
@Controller
@RequestMapping("/resource")
@Scope("prototype")
public class ResourceController {

    @Autowired
    private UserDao userDao;

    @RequestMapping("/upload")
    public ModelAndView upload(@RequestParam("upload") MultipartFile file) throws Exception{
        ModelAndView mav = new ModelAndView("upload");
        System.out.println("------");
        String ext =  file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
        UUID uuid = UUID.randomUUID();
        file.transferTo(new File("C:\\Users\\Administrator\\Desktop\\upload",uuid+ext));
        return mav;
    }

    @RequestMapping("/getjson")
    public @ResponseBody
    Map<String,Object> getJson(@RequestParam("page")int page,@RequestParam("rows") int size){
        List<Map<String,Object>> list = new ArrayList<>();
        Map<String,Object> map = new HashMap<>();
        map.put("name","宋应会");
        map.put("code",1);
        list.add(map);
        Map<String,Object> map1 = new HashMap<>();
        Map<String,Object> map2  =new HashMap<>();
        map2.put("rows",list);
        map2.put("total",20);
        map1.put("name","宋应22会");
        map1.put("code",12);
        list.add(map1);
        return map2;
    }
        @RequestMapping("/abc")
        public ModelAndView abc(@RequestParam("ids[]") String[] ids){
            ModelAndView mav = new ModelAndView("a");
            return mav;
        }

    @RequestMapping("/form")
    public String form(){

        return "";
    }
    @RequestMapping("/getcombobox")
    public @ResponseBody List<Map<String,Object>> getcombobox() {
        List<Map<String,Object>> list = new ArrayList<>();
        Map<String,Object> map  = new HashMap<>();
            map.put("id",1);
        map.put("text","diyige ");
        System.out.println(map);
        list.add(map ) ;
        return list ;
    }

    @RequestMapping("/ztree")
    public @ResponseBody List<Map<String,Object>> ztree() throws Exception {

        List<Map<String, Object>> ztree = userDao.ztree();
        System.out.println(ztree);
        return ztree;
    }


   /* public void tezx(HttpServletRequest request,HttpServletResponse response) throws Exception
    {
        request.getRequestDispatcher().forward();

    }*/
}
