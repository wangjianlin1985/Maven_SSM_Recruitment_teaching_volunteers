package com.sys.lawyer.mapper;
/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2019年01月16日 09时01分39秒
 */
import com.sys.lawyer.base.BaseDao;
import com.sys.lawyer.po.*;
import com.sys.lawyer.utils.Pager;
import java.util.*;

import com.sys.lawyer.po.*;
import com.sys.lawyer.mapper.*;
import com.sys.lawyer.service.*;
import org.apache.ibatis.annotations.Param;

/**
 * @ClassName:  
 * @Description: 
 * @author  - - admin
 * @date - 2019年01月16日 09时01分39秒
 */


public interface UsersMapper extends BaseDao<Users>{

    List<Users> findByTypeToEntity(@Param(value="typeId")Integer typeId);
}
