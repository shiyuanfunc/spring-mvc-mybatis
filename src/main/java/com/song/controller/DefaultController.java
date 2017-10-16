package com.song.controller;

import com.song.annotion.Token;
import com.song.annotion.TokenType;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017/8/17.
 */
@Controller
@Scope("prototype")
@RequestMapping("/view")
public class DefaultController {

    @RequestMapping("/{f}/{t}")
    public String defaultView(
            @PathVariable("f") String f,
            @PathVariable("t") String t
    ) throws Exception {

        return f + "/" + t;
    }

    @Token(TokenType.create)
    @RequestMapping("/{f}")
    public String defaultView2(@PathVariable("f") String f) throws Exception{
        return f;
    }

}
