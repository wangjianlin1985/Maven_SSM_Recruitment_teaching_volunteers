package com.sys.lawyer.service;

import com.sys.lawyer.base.BaseService;
import com.sys.lawyer.po.Users;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @ClassName:  
 * @Description: 
 * @author  - - admin
 * @date - 2018年10月17日 14时41分30秒
 */
public interface UsersService extends BaseService<Users>{

    Users getUser();

    List<Users> findByTypeToEntity(@Param(value="typeId")Integer typeId);

    boolean importsave(@RequestParam(value = "file", required = false) MultipartFile file);

    void reportExcl(Users users, HttpServletResponse response);
}
