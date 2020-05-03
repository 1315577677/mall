package indi.zx.mall.service;

import indi.zx.mall.mapper.OrderMapper;
import indi.zx.mall.pojo.Query;
import indi.zx.mall.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderService {
    @Autowired
    private  OrderMapper orderMapper;
    public Page getOrderInfo(Query query) {
        Page pages=new Page();
        pages.setPage(query.getPage());
        query.setPage((query.getPage()-1)*query.getSize());
        pages.setSize(query.getSize());
        pages.setRows(orderMapper.getOrderInfo( query));
        pages.setTotal(orderMapper.getCount(query));
        return pages;
    }

    public void changeStutas(String s, int i) {
        orderMapper.changeStutas(s,i);
    }

    public int getCountByStutas(int i) {
        return  orderMapper.getCountByStutas(i);
    }
}
