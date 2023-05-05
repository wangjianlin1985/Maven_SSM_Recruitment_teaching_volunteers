/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2018年12月18日 16时17分49秒
 */
package com.sys.lawyer.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.sys.lawyer.base.*;
import com.sys.lawyer.po.*;
import com.sys.lawyer.service.TypeService;
import java.util.*;

import com.sys.lawyer.po.*;
import com.sys.lawyer.mapper.*;
import com.sys.lawyer.service.*;

/**
 * @ClassName:  
 * @Description: 
 * @author  - - admin
 * @date - 2018年12月18日 16时17分49秒
 */

@Service
public class TypeServiceImpl extends BaseServiceImpl<Type> implements TypeService{
	 
	
	@Autowired
	private TypeMapper typeMapper;
	@Override
	public BaseDao<Type> getBaseDao() {
		return typeMapper;
	}

}
