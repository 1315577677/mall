package indi.zx.mall.mapper;

import indi.zx.mall.pojo.Query;
import indi.zx.mall.utils.Page;
import org.apache.logging.log4j.core.config.Order;

import java.util.List;

public interface OrderMapper {
   List<Order> getOrderInfo(Query query);

    int getCount(Query query);


    void changeStutas(String s, int i);

    int getCountByStutas(int i);
}
