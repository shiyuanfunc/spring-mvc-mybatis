package com.song.controller;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017/9/8.
 */
@RequestMapping("/excel")
@Controller
@Scope("prototype")
public class ExcelController {

    @RequestMapping("/down")
    public String downloadExcel() throws Exception{
        return "downexcelJXL";
    }
}
