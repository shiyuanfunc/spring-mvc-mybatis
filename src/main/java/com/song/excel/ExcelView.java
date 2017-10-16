package com.song.excel;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/9/8.
 */
@Component("downloadExcel")
public class ExcelView extends AbstractExcelView {

    @Override
    protected void buildExcelDocument(Map<String, Object> map, HSSFWorkbook workbook,
                                      HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        response.setHeader("Content-Disposition","inline;filename="+new String("测试.xls".getBytes(),"iso8859-1"));
        List<Map<String,Object>> list = new ArrayList<>();
        Map<String,Object> map1 = new HashMap<>();
        map1.put("ID",1);
        map1.put("NAME","张三");
        map1.put("SEX","男");
        list.add(map1);

        Map<String,Object> map2 = new HashMap<>();
        map2.put("ID",2);
        map2.put("NAME","李四");
        map2.put("SEX","女");
        list.add(map2);
        String[] titles = {"ID","NAME","SEX"};
        HSSFSheet sheet = workbook.createSheet("测试表1");
        for(int i = 0 ;i < list.size(); i++){
            HSSFRow row = sheet.createRow(i);
            for (int j = 0 ; j< list.get(i).size(); j ++){
                row.createCell((short) j).setCellValue(String.valueOf(list.get(i).get(titles[j])));
            }
        }
    }
}
