package indi.zx.mall;

import indi.zx.mall.service.PageService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test {
    @org.junit.Test
    public void  test(){
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("ApplicationContext.xml");
        PageService pageService= (PageService) applicationContext.getBean("pageService");
        String str="7,8,";

        String[] a = str.split(",");
        for (int b = 0; b < a.length; b++) {
            pageService.deleteProductByid(a[b]);
        }

    }
}
