package com.sys.lawyer.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sys.lawyer.base.BaseController;
import com.sys.lawyer.po.Evaluate;
import com.sys.lawyer.po.Message;
import com.sys.lawyer.po.Releases;
import com.sys.lawyer.po.Users;
import com.sys.lawyer.service.*;
import com.sys.lawyer.utils.Pager;
import com.sys.lawyer.vo.EvaluateVo;
import jdk.nashorn.internal.ir.IfNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName:  
 * @Description: 
 * @author  - - admin
 * @date - 2018年10月17日 14时41分30秒
 */


@Controller
@RequestMapping("/message")
public class MessageController extends BaseController {
	
	
	/**
	 * 依赖注入 start dao/service/===
	 */
	@Autowired
	private UsersService usersService;
	@Autowired
	private EvaluateService evaluateService;
	@Autowired
	private MessageService messageService;

	@RequestMapping(value = "listAll.json")
	@ResponseBody
	public String listAll(Integer userId, Integer pageIndex, Integer pageSize) {
		Message message = new Message();
		message.setUserId(userId);
//		Pager<Message> pagers = messageService.findByEntity(message);
		PageHelper.startPage(notEmpty(pageIndex) ? pageIndex : 0, 15);
		PageInfo<Message> page = new PageInfo<>(messageService.listAllByEntity(message));
		for (Message m : page.getList()){
			m.setUsers(usersService.getById(m.getUserId()));
		}
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("page", page);
		return jsonObject.toJSONString();
	}

	@RequestMapping(value = "userlist.json")
	@ResponseBody
	public String userlist(Users users) {
		users.setIsDelete(0);
		List<Users> list = usersService.listAllByEntity(users);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("list", list);
		return jsonObject.toJSONString();
	}

	@RequestMapping(value = "list.do")
	public String list(Model model) {
		return "message/list";
	}

	@RequestMapping(value = "delete.json")
	@ResponseBody
	public String delete(Integer id) {
		Users users = usersService.getUser();
		JSONObject jsonObject = new JSONObject();
		if (users.getRole() == 0 || users.getRole() == 1){
			messageService.deleteById(id);
			jsonObject.put("flag", true);
			jsonObject.put("message", "删除成功");
		} else {
			jsonObject.put("flag", false);
			jsonObject.put("message", "本账号无权限删除操作");
		}
		return jsonObject.toJSONString();
	}
}
