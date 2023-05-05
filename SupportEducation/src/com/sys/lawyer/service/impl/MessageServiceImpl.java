/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2019年01月28日 13时26分48秒
 */
package com.sys.lawyer.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.sys.lawyer.base.*;
import com.sys.lawyer.po.*;
import com.sys.lawyer.service.MessageService;
import java.util.*;

import com.sys.lawyer.po.*;
import com.sys.lawyer.mapper.*;
import com.sys.lawyer.service.*;

/**
 * @ClassName:  
 * @Description: 
 * @author  - - admin
 * @date - 2019年01月28日 13时26分48秒
 */

@Service
public class MessageServiceImpl extends BaseServiceImpl<Message> implements MessageService{
	 
	
	@Autowired
	private MessageMapper messageMapper;
	@Override
	public BaseDao<Message> getBaseDao() {
		return messageMapper;
	}

}
