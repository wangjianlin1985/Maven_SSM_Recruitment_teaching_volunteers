package com.sys.lawyer.controller;

import com.alibaba.fastjson.JSONObject;
import com.sys.lawyer.base.BaseController;
import com.sys.lawyer.po.Releases;
import com.sys.lawyer.po.Users;
import com.sys.lawyer.service.ReleasesService;
import com.sys.lawyer.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName:  
 * @Description: 
 * @author  - - admin
 * @date - 2018年10月17日 14时41分30秒
 */


@Controller
@RequestMapping("/")
public class LoginController extends BaseController {


	/**
	 * 依赖注入 start dao/service/===
	 */
	@Autowired
	private UsersService usersService;
	@Autowired
	private ReleasesService releasesService;


	/**
	 *  【不分页=》查询列表=>有条件】
	* @Title: listByEntity
	* @Description: TODO(这里用一句话描述这个方法的作用)
	* @param @return 设定文件
	* @author
	* @return String 返回类型
	* @throws
	 */

	private static Map<String, String> map = new HashMap<>();


	@RequestMapping(value = "/login.json", method = RequestMethod.POST)
	@ResponseBody
	public String login(Users users, String captcha, HttpServletRequest request) {
		JSONObject jsonObject = new JSONObject();
		String code = (String) request.getSession().getAttribute("randomString");
		if (empty(captcha) || !code.toLowerCase().equals(captcha.toLowerCase())) {
			jsonObject.put("message", "验证码错误");
			jsonObject.put("flag", false);
			return jsonObject.toJSONString();
		}

		if (notEmpty(users)) {
			users.setPhone(null);
			Users users1 = usersService.getByEntity(users);
			if (notEmpty(users1)) {
				if (users1.getRole() > 1){
					jsonObject.put("message", "权限不足不能登录后台管理");
					jsonObject.put("flag", false);
					return jsonObject.toJSONString();
				}
				jsonObject.put("flag", true);
				jsonObject.put("message", "登录成功");
				request.getSession().setAttribute("user", users1);
			} else {
				jsonObject.put("message", "用户信息错误");
			}
		}
		return jsonObject.toJSONString();
	}

	@RequestMapping(value = "indexs.do")
	public String indexs(){
		Users users = usersService.getUser();
		if (empty(users)){
			return "login";
		}
		return "indexs";
	}

	@RequestMapping(value = "/")
	public String toLogin(){
		Users users = usersService.getUser();
		if (empty(users)){
			return "login";
		}
		return "indexs";
	}

	@RequestMapping(value = "open.do")
	public String open(Model model){
		Users users = usersService.getUser();
		if (empty(users)){
			return "login";
		}
		Users users1 = new Users();
		users1.setIsDelete(0);
		List<Users> usersList = usersService.listAllByEntity(users1);
		List<Releases> releasesList = releasesService.listAll();
		Integer xx = 0;
		Integer ls = 0;
		Integer gly = 0;
		for (Users u : usersList){
			if (u.getRole() == 0 || u.getRole() == 1){
				gly += 1;
			} else if (u.getRole() == 3){
				ls += 1;
			} else if (u.getRole() == 2){
				xx += 1;
			}
		}
		model.addAttribute("gly", gly);
		model.addAttribute("xx", xx);
		model.addAttribute("ls", ls);
		model.addAttribute("zw", releasesList.size());
		return "open";
	}

	@RequestMapping(value = "/login.do")
	public String login(){
		Users users = usersService.getUser();
		if (empty(users)){
			return "login";
		}
		return "indexs";
	}

	@RequestMapping(value = "loginOut")
	public String loginOut(HttpServletRequest request){
		request.getSession().removeAttribute("user");
		return "login";
	}
}
