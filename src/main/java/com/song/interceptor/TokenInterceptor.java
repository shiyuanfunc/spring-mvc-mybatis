package com.song.interceptor;

import com.song.annotion.Token;
import com.song.annotion.TokenType;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.SoundbankResource;
import java.lang.reflect.Method;
import java.util.UUID;
import java.util.logging.Handler;

/**
 * Created by Administrator on 2017/8/25.
 */
public class TokenInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object handler) throws Exception {
        httpServletResponse.setCharacterEncoding("utf-8");
        httpServletResponse.setContentType("text/html;charset=utf-8");
        String requestURI = httpServletRequest.getRequestURI();
        System.out.println("rqwueatURI==="+requestURI);
        //String str= "";
        if (handler instanceof HandlerMethod){
            HandlerMethod m = (HandlerMethod) handler;
            Method method = m.getMethod();
            Token annotation = method.getAnnotation(Token.class);
            TokenType type = annotation.value();
            switch (type){
                case create:
                    String uuid = UUID.randomUUID().toString();
                    httpServletRequest.getSession().setAttribute("registToken",uuid);
                    System.out.println("设置registToken"+uuid);
                     return true;
                case save:
                    //检测服务器张是否有token
                    System.out.println(httpServletRequest.getSession().getAttribute("registToken"));
                    System.out.println("----"+httpServletRequest.getParameter("registToken"));
                    Object registToken = httpServletRequest.getSession().getAttribute("registToken");
                    if (registToken == null){
                        System.out.println("请刷新页面");

                        httpServletRequest.setAttribute("msg","请重新刷新");
                        String str = "请重新刷新";
                        httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+"/view/backpage");
                        //httpServletRequest.("/view/register").forward(httpServletRequest,httpServletResponse);
                        System.out.println("lalalalalla");
                        return false;
                    }
                    if (httpServletRequest.getParameter("registToken") == null){
                        System.out.println("请文明上网1111");
                        return false;
                    }
                    if (!httpServletRequest.getParameter("registToken").equals(registToken)){
                        System.out.println("请文明上网2222");
                        return false;
                    }
                    if (httpServletRequest.getParameter("registToken").equals(registToken)) {
                        System.out.println("Remove ");
                        httpServletRequest.getSession().removeAttribute("registToken");
                        return true;
                    }
            }
        }

        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
