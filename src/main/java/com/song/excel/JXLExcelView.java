package com.song.excel;

import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.document.AbstractJExcelView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/9/8.
 */
@Component("downexcelJXL")
public class JXLExcelView extends AbstractJExcelView {

    @Override
    protected void buildExcelDocument(Map<String, Object> map, WritableWorkbook writableWorkbook,
                                      HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse)
            throws Exception {

        httpServletResponse.setHeader("Content-Disposition", "inline;filename=" + new String("测试2.xls".getBytes(), "iso8859-1"));
        List<Map<String, Object>> list = new ArrayList<>();
        Map<String, Object> map1 = new HashMap<>();
        map1.put("ID", 1);
        map1.put("NAME", "张三");
        map1.put("SEX", "男");
        list.add(map1);

        Map<String, Object> map2 = new HashMap<>();
        map2.put("ID", 2);
        map2.put("NAME", "李四");
        map2.put("SEX", "女");
        list.add(map2);
        String[] titles = {"ID", "NAME", "SEX"};

        WritableSheet sheet = writableWorkbook.createSheet("测试表格2", 0);

        for (int i = 0 ; i < list.get(0).size(); i++){
            //创建单元格
            Label label = new Label(i,0,titles[i]);
            sheet.addCell(label);
        }
        for (int i = 0; i < list.size(); i++){
            for (int j = 0 ; j < list.get(i).size(); j ++){
                Label label = new Label(j,i+1,String.valueOf(list.get(i).get(titles[j])));
                sheet.addCell(label);
            }
        }

    }
}
