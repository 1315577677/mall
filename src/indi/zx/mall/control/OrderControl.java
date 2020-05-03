package indi.zx.mall.control;

import indi.zx.mall.mapper.OrderMapper;
import indi.zx.mall.pojo.Query;
import indi.zx.mall.service.OrderService;
import indi.zx.mall.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class OrderControl {
    @Autowired
    private OrderService orderService;
    @RequestMapping("getOrderInfo")
    public String getOrderInfo(Model model, Query query){
        Page pages = orderService.getOrderInfo(query);
        model.addAttribute("page", pages);
        if(query.getStutas()==1){
            return "jsp/order.jsp";
        }else if(query.getStutas()==2){
            return "jsp/outorder.jsp";
        }
        return "jsp/inorder.jsp";
    }
    @RequestMapping("backtodown")
    @ResponseBody
   public String backToDown(String str){

        String[] a = str.split(",");
       if (a!=null && a.length>0){
            for (int i=0;i<a.length;i++){
                orderService.changeStutas(a[i],3);
            }
            return "success";
        }
        return "error";
    }
    @RequestMapping("getCountByStutas")
    @ResponseBody
    public Map<String,Object> getCountByStutas(){
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("ordernum",orderService.getCountByStutas(1));
        map.put("outordernum",orderService.getCountByStutas(2));
        return map;
    }
}
