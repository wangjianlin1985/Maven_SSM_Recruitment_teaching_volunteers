# Maven_SSM_Recruitment_teaching_volunteers
Maven基于SSM支教志愿者招聘管理系统毕业源码案例设计

## 开发工具： Eclipse或Idea 数据库：mysql

角色：超级管理员，系统管理员，支教学校，志愿者

### 前端：（bootstrap实现）
1、实现支教学校和志愿者的注册模块
2、登录模块,实现支教学校和志愿者登录成功后进入各自的界面，如支教学校管理界面以及志愿者管理界面(两个登录界面入口，一个为支教学校，一个为志愿者，验证码登录) 
3、支教学校管理界面的功能清单，比如修改资料，发布职位，已发布职位，联系管理员
4、 联系管理员模块，联系后台的管理员，类似于留言功能
5、实现志愿者登录后的个人空间管理功能：个人空间管理界面的功能清单，比如修改资料，参与职位，我的评价，我的支教服务时长
6、实现前端首页的内容展示（未登录以游客身份浏览首页，首页以同类的志愿者网站作为参考即可，访问限制。不能通过修改url直接访问到登录后的管理界面；实现志愿者和支教学校注册登录的入口；首页轮播图，由后台系统进行更换（图片、链接、简介。点击图片跳转到链接；首页有按最新发布时间的职位信息；实现志愿者报名支教学校的界面，显示支教学校的基本信息以及该职位的详细信息，未登录用户点击报名提示未登录，不能报名，跳转至登录页面，若登录，参与人数未满，则提示报名成功，否则提示参与人数已满（需要提示志愿者报名成功后，无法取消比如报名后无法取消哦，这样的话）；实现志愿者搜索职位的功能，根据支教学校，发布职位来查询；首页展示志愿者总服务时长排名，比如前五名服务时长最多的志愿者

### 后台(SSM框架实现)：
7、后台管理员的注册登录模块，实现管理员用户的权限分配（权限分配只能由超级管理员进行操作）；登录角色有两个：超级管理员和系统管理员，在管理员账号管理方面只由超级管理员进行添加，无法通过注册的系统管理员进行管理员身份获取）
8、实现后台数据管理模块：管理员用户管理模块，角色管理模块，志愿者信息管理模块（与前端志愿者个人空间管理相关联的表）
9.职位管理（对职位增删该查，支教管理员发布职位的时候，下拉框选择）

学校账号密码：admin2/1

志愿者账号密码： 111/111

管理员账号密码：admin/111111
