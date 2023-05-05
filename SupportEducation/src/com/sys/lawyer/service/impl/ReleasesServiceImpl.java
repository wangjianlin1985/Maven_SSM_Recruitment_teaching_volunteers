/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2019年01月23日 13时36分09秒
 */
package com.sys.lawyer.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.sys.lawyer.base.*;
import com.sys.lawyer.po.*;
import com.sys.lawyer.service.ReleasesService;
import java.util.*;

import com.sys.lawyer.po.*;
import com.sys.lawyer.mapper.*;
import com.sys.lawyer.service.*;

/**
 * @ClassName:  
 * @Description: 
 * @author  - - admin
 * @date - 2019年01月23日 13时36分09秒
 */

@Service
public class ReleasesServiceImpl extends BaseServiceImpl<Releases> implements ReleasesService{
	 
	
	@Autowired
	private ReleasesMapper releasesMapper;
	@Override
	public BaseDao<Releases> getBaseDao() {
		return releasesMapper;
	}

}
