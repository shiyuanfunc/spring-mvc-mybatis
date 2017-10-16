package com.song.controller;

import com.song.annotion.Token;
import com.song.annotion.TokenType;
import com.song.bean.User;
import com.song.requestutils.RequestUtils;
import com.song.service.UserService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.net.InetAddress;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * Created by Administrator on 2017/8/18.
 */
@RequestMapping("/user")
@Controller
@Scope("prototype")
public class UserController {


    @Autowired
    private User user;
    @Autowired
    private UserService userService;


    @RequestMapping("/checkname")
    public @ResponseBody Map<String,Object> checkName(@RequestParam("userName") String name) throws Exception{
        Map<String,Object> map =  userService.checkName(name);
        return map;
    }

    @Token(value = TokenType.save)
    @RequestMapping("/regist")
    public String registUser(@RequestParam("upload")MultipartFile[] file,User user/*,HttpServletRequest request*/) throws Exception{

        System.out.println(file[0].getOriginalFilename());
        System.out.println(file[1].getOriginalFilename());
        System.out.println(file[2].getOriginalFilename());
       // File fil = new File();
        System.out.println(file.length);
        /*HttpServletRequest request = RequestUtils.getRequest();
        byte[] bytes = file.getBytes();
        //user.setImg(bytes);
        String ext =  file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);
        UUID uuid = UUID.randomUUID();
        InetAddress localHost = InetAddress.getLocalHost();
        String hostAddress = localHost.getHostAddress();
        user.setIp(hostAddress);
        String realPath = request.getSession().getServletContext().getRealPath("/UserImg");
        File file1 = new File(realPath,uuid+"."+ext);
        user.setImgPath("/UserImg/"+uuid+"."+ext);
        if (!file1.exists()){
            file1.mkdirs();
        }
        file.transferTo(file1);
        Map<String, Object> stringObjectMap = userService.saveUser(user);*/
        return "error";
    }

    @RequestMapping("/login")
    public ModelAndView login(User user,HttpSession session) throws Exception{
        ModelAndView mav = new ModelAndView("index");
        Map<String, Object> map = userService.login(user);
        String status = String.valueOf(map.get("status"));
        if ("success".equals(status)){
            map.put("falg",true);

        }else{
            map.put("falg",false);
        }
        session.setAttribute("user",map.get("user"));

        mav.addAllObjects(map);
        return mav;
    }
    @RequestMapping("/download")
    public ResponseEntity<byte[]> download(HttpServletRequest request/*,HttpServletResponse response*/) throws Exception{

        /*File file = new File("F:\\upload\\ddb8513a-e10e-401e-b4a4-47afe748aa1d.jpg");
        FileInputStream inputStream = new FileInputStream(file);
        FileOutputStream outputStream = new FileOutputStream("F:\\download22\\test.jpg");
        int len = 0;
        byte[] b = new byte[1024];
        while ((len = inputStream.read(b))!= -1){
            outputStream.write(b,0,len);
        }*/

        /*File file = new File("F:\\upload\\ddb8513a-e10e-401e-b4a4-47afe748aa1d.jpg");
        File file1 = new File("F:\\download22\\test1.jpg");
        FileUtils.copyFile(file,file1);*/

        File file = new File("F:\\upload\\ddb8513a-e10e-401e-b4a4-47afe748aa1d.jpg");

        HttpHeaders headers = new HttpHeaders();
        //通知浏览器 以 attachment 方式下载
        headers.setContentDispositionFormData("attachment","songTest");

        //设置 二进制流 下载
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers, HttpStatus.CREATED);

    }


    @RequestMapping("/exit")
    public String exit(HttpSession session) throws Exception{
        session.invalidate();
        return "index";
    }
}
