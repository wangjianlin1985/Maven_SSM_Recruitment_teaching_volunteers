/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2019年01月23日 13时36分08秒
 */
package com.sys.lawyer.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.sys.lawyer.base.*;
import com.sys.lawyer.po.*;
import com.sys.lawyer.service.ApplyService;
import java.util.*;

import com.sys.lawyer.po.*;
import com.sys.lawyer.mapper.*;
import com.sys.lawyer.service.*;

/**
 * @ClassName:  
 * @Description: 
 * @author  - - admin
 * @date - 2019年01月23日 13时36分08秒
 */

@Service
public class ApplyServiceImpl extends BaseServiceImpl<Apply> implements ApplyService{
	 
	
	@Autowired
	private ApplyMapper applyMapper;
	@Override
	public BaseDao<Apply> getBaseDao() {
		return applyMapper;
	}

}
