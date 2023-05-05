/**
 * @ClassName:
 * @Description:
 * @author administrator
 * @date - 2018年10月17日 14时41分30秒
 */
package com.sys.lawyer.service.impl;

import org.apache.ibatis.annotations.Param;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.sys.lawyer.base.*;
import com.sys.lawyer.po.*;
import com.sys.lawyer.service.UsersService;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.*;
import java.util.regex.Pattern;

import com.sys.lawyer.po.*;
import com.sys.lawyer.mapper.*;
import com.sys.lawyer.service.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;

/**
 * @ClassName:
 * @Description:
 * @author  - - admin
 * @date - 2018年10月17日 14时41分30秒
 */

@Service
public class UsersServiceImpl extends BaseServiceImpl<Users> implements UsersService {


    @Autowired
    private UsersMapper usersMapper;

    @Override
    public BaseDao<Users> getBaseDao() {
        return usersMapper;
    }

    @Override
    public Users getUser() {
        return (Users) ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest().getSession().getAttribute("user");
    }

    @Override
    public List<Users> findByTypeToEntity(@Param(value = "typeId") Integer typeId) {
        return usersMapper.findByTypeToEntity(typeId);
    }

    @Override
    public boolean importsave(MultipartFile file) {
        boolean flag = false;
        InputStream inputStream = null;
        try {
            inputStream = file.getInputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }
        HSSFWorkbook hssfWorkbook = null;
        try {
            hssfWorkbook = new HSSFWorkbook(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
        HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(0);
        //正则验证是否为数字
        Pattern pattern = Pattern.compile("[0-9]*");
        Integer ss = hssfSheet.getLastRowNum();
        for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
            HSSFRow hssfRow = hssfSheet.getRow(rowNum);
            Users users = new Users();
            if (hssfRow != null) {
                if (hssfRow.getCell(0) != null) {
                    hssfRow.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
                    String name = hssfRow.getCell(0).getStringCellValue().trim();
                    Users users1 = new Users();
                    users1.setName(name);
                    Users users2 = usersMapper.getByEntity(users1);
                    if (users2 == null){
                        users.setName(name);
                    } else {
                        return false;
                    }
                }
                if (hssfRow.getCell(1) != null) {
                    hssfRow.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
                    users.setRealName(hssfRow.getCell(1).getStringCellValue().trim());
                }
                if (hssfRow.getCell(2) != null) {
                    hssfRow.getCell(2).setCellType(Cell.CELL_TYPE_STRING);
                    String phone = hssfRow.getCell(2).getStringCellValue();
                    if (pattern.matcher(phone.trim()).matches()){
                        users.setRole(Integer.parseInt(phone));
                    }
                }
                if (hssfRow.getCell(3) != null) {
                    hssfRow.getCell(3).setCellType(Cell.CELL_TYPE_STRING);
                    users.setPhone(hssfRow.getCell(3).getStringCellValue().trim());
                }
                if (hssfRow.getCell(4) != null) {
                    hssfRow.getCell(4).setCellType(Cell.CELL_TYPE_STRING);
                    users.setPass(hssfRow.getCell(4).getStringCellValue().trim());
                }
                if (hssfRow.getCell(5) != null) {
                    hssfRow.getCell(5).setCellType(Cell.CELL_TYPE_STRING);
                    users.setSfz(hssfRow.getCell(5).getStringCellValue().trim());
                }
                if (hssfRow.getCell(6) != null) {
                    hssfRow.getCell(6).setCellType(Cell.CELL_TYPE_STRING);
                    users.setAddress(hssfRow.getCell(6).getStringCellValue().trim());
                }
                if (hssfRow.getCell(7) != null) {
                    hssfRow.getCell(7).setCellType(Cell.CELL_TYPE_STRING);
                    users.setSchoolJs(hssfRow.getCell(7).getStringCellValue().trim());
                }
                if (hssfRow.getCell(8) != null) {
                    hssfRow.getCell(8).setCellType(Cell.CELL_TYPE_STRING);
                    users.setSchoolName(hssfRow.getCell(8).getStringCellValue().trim());
                }
                if (users != null){
                    users.setIsDelete(0);
                    usersMapper.insert(users);
                }
            }
        }
        return true;
    }

    @Override
    public void reportExcl(Users users, HttpServletResponse response) {
        List<Users> list = usersMapper.listAllByEntity(users);
        // 创建工作簿
        HSSFWorkbook workbook = new HSSFWorkbook();
        // 创建工作表
        HSSFSheet sheet = workbook.createSheet();
        // 创建行
        HSSFRow row = sheet.createRow(0);
        // 创建列
        String title = "序号,登录名,真实姓名,权限0超级管理员 1普通 2支教 3教师,联系电话,密码,身份证,地址,学校介绍,学校名称";
        String titles[] = title.split(",");
        for (int i = 0; i < titles.length; i++) {
            HSSFCell cell = row.createCell(i);
            cell.setCellValue(titles[i]);
        }
        for (int i = 0; i < list.size(); i++) {
            // 创建行
            row = sheet.createRow(i + 1);
            HSSFCell cell0 = row.createCell(0);
            cell0.setCellValue(i + 1);

            HSSFCell cell1 = row.createCell(1);
            cell1.setCellValue(list.get(i).getName());
            HSSFCell cell2 = row.createCell(2);
            cell2.setCellValue(list.get(i).getRealName());
            HSSFCell cell3 = row.createCell(3);
            cell3.setCellValue(list.get(i).getRole());
            HSSFCell cell4 = row.createCell(4);
            cell4.setCellValue(list.get(i).getPhone());
            HSSFCell cell5 = row.createCell(5);
            cell5.setCellValue(list.get(i).getPass());
            HSSFCell cell6 = row.createCell(6);
            cell6.setCellValue(list.get(i).getSfz());
            HSSFCell cell7 = row.createCell(7);
            cell7.setCellValue(list.get(i).getAddress());
            HSSFCell cell8 = row.createCell(8);
            cell8.setCellValue(list.get(i).getSchoolJs());
            HSSFCell cell9 = row.createCell(9);
            cell9.setCellValue(list.get(i).getSchoolName());
        }

        OutputStream outputStream = null;
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-disposition", "attachment;filename=export.xls");
        try {
            outputStream = response.getOutputStream();
            workbook.write(outputStream);
            outputStream.flush();
            outputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
