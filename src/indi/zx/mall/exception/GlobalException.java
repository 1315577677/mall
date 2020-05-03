package indi.zx.mall.exception;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class GlobalException  implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {
        String msg ="未知错误";
        ModelAndView modelAndView =new ModelAndView();
        if(e instanceof MyException){
            msg=((MyException) e).getMsg();
        }
        modelAndView.addObject("msg",msg);
        modelAndView.setViewName("error.jsp");
        return modelAndView;
    }
}
