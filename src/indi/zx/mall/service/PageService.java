package indi.zx.mall.service;

import indi.zx.mall.mapper.ProductMapper;
import indi.zx.mall.pojo.Category;
import indi.zx.mall.pojo.Product;
import indi.zx.mall.pojo.Query;
import indi.zx.mall.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PageService {
    @Autowired
    private ProductMapper productMapper;

    public Page getPageInfo(Query query){
      Page pages=new Page();
      pages.setPage(query.getPage());
      query.setPage((query.getPage()-1)*query.getSize());
      pages.setSize(query.getSize());
      pages.setRows(productMapper.getPageInfo( query));
      pages.setTotal(productMapper.getCount(query));
      return pages;
    }

    public List<Category> getfromType() {
      return   productMapper.getfromType();
    }

    public void deleteProductByid(String id) { productMapper.deleteProductByid(id); }

    public Product getProductById(String id) {
        Product product = productMapper.getProductById(id);
        product.setPictureList(productMapper.getPicturePathById(id));
        return product;

    }

    public void insertPicture(String s,String id) {
        productMapper.insertPicture(s,id);
    }

    public void updateProduct(Product product) {
        productMapper.updateProduct(product);
    }

    public void deletePictureByName(String name) {
        productMapper.deletePictureByName(name);

    }

    public void addProduct(Product product) {
        productMapper.addProduct(product);
    }
}
