package indi.zx.mall.mapper;

import indi.zx.mall.pojo.Admin;
import indi.zx.mall.pojo.Category;
import indi.zx.mall.pojo.Product;
import indi.zx.mall.pojo.Query;
import indi.zx.mall.utils.Page;

import java.util.List;

public interface ProductMapper {
    List<Product> getPageInfo(Query query);

    int getCount(Query query);
    void  deleteProductByid(String id);

    List<Category> getfromType();

    Product getProductById(String id);

    List getPicturePathById(String id);

    void insertPicture(String s,String id);

    void updateProduct(Product product);

    void deletePictureByName(String name);

    void addProduct(Product product);
}
