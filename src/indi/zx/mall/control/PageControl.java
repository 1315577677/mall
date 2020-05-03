package indi.zx.mall.control;

import indi.zx.mall.pojo.Product;
import indi.zx.mall.pojo.Query;
import indi.zx.mall.service.PageService;
import indi.zx.mall.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
public class PageControl {
    @Autowired
    private PageService pageService;

    @RequestMapping("getPageInfo")
    public String getPageInfo(Model model, Query query) {

        Page pages = pageService.getPageInfo(query);
        model.addAttribute("page", pages);
        model.addAttribute("fromType", pageService.getfromType());
        return "/jsp/home.jsp";
    }

    @RequestMapping("deleteProductByids")
    @ResponseBody
    public String deleteProductByid(String str) {

        String[] a = str.split(",");
        for (int b = 0; b < a.length; b++) {
            pageService.deleteProductByid(a[b]);
        }

        return "s";
    }

    @RequestMapping("editpage")
    @ResponseBody
    public Product editpage(String id) {
        Product data = pageService.getProductById(id);
        return data;
    }


    @RequestMapping(value = "updateProduct")
    @ResponseBody
    public String updateProduct(Product product) {

        pageService.updateProduct(product);
        List<String> names = product.getPictureList();
        if (names != null && names.size() > 0) {

            for (String name : names
            ) {
                pageService.deletePictureByName(name);
            }

        }
        return "success";
    }

    @RequestMapping("uploadPhoto")
    @ResponseBody
    public String uploadPhoto(@RequestParam MultipartFile[] file,String id) throws IOException {

        if (file != null && file.length > 0) {
            for (MultipartFile m : file
            ) {
                String newname = UUID.randomUUID().toString();
                String oldname = m.getOriginalFilename();
                String name = newname + oldname.substring(oldname.lastIndexOf("."));
                File pfile = new File("/Users/zhangxiang/Desktop/img/" + name);
                m.transferTo(pfile);
                pageService.insertPicture(name,id);
            }

        }
         return "{'success'}";
    }


    @RequestMapping("addProductInfo")
    @ResponseBody
    public String addProductInfo(@RequestParam MultipartFile[] file,Product product) throws IOException {
        String id =UUID.randomUUID().toString();
        product.setProduct_ID(id);
        pageService.addProduct(product);
        if (file != null && file.length > 0) {
            for (MultipartFile m : file
            ) {
                String newname = UUID.randomUUID().toString();
                String oldname = m.getOriginalFilename();
                String name = newname + oldname.substring(oldname.lastIndexOf("."));
                File pfile = new File("/Users/zhangxiang/Desktop/img/" + name);
                m.transferTo(pfile);
                pageService.insertPicture(name,id);
            }

        }
        return  "success";
    }
}