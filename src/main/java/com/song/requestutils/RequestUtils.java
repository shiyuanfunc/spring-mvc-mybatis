package com.song.requestutils;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Administrator on 2017/8/21.
 */
public class RequestUtils {


    private static ThreadLocal<HttpServletRequest> httpServletRequest = new ThreadLocal<HttpServletRequest>();

    private static ThreadLocal<HttpServletResponse> httpServletResponse = new ThreadLocal<HttpServletResponse>();


    public static void setRequest(HttpServletRequest request  ){
        httpServletRequest.set(request);

    }

    public static void setResponse( HttpServletResponse response){
        httpServletResponse.set(response);
    }

    public static HttpServletRequest getRequest(){
        return httpServletRequest.get();
    }

    public static HttpServletResponse getResponse(){
        return httpServletResponse.get();
    }
}
