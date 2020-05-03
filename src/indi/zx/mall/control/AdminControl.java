package indi.zx.mall.control;

import indi.zx.mall.service.AdminService;
import indi.zx.mall.service.PageService;
import indi.zx.mall.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class AdminControl {
    @Autowired
    private AdminService adminService;
    @RequestMapping("login")
    public String login(Model model, String password, HttpSession session, String username)  {

        if (adminService.login(username,password)){
            session.setAttribute("username",username);
            return "getPageInfo.action";
        }
        model.addAttribute("msg","账户或密码错误请重新输入！！！");
        return "login.jsp";
    }
    @RequestMapping("logout")
    public String login(HttpSession session)  {
        session.setAttribute("username",null);
        return "login.jsp";
    }

}
