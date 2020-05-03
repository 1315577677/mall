package indi.zx.mall.service;


import indi.zx.mall.mapper.AdminMapper;
import indi.zx.mall.pojo.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {
    @Autowired
    private AdminMapper adminMapper;

    public boolean login(String username, String password) {
        Admin admin = new Admin();
        admin.setAdmins(username);
        admin.setPassword(password);
        if (adminMapper.login(admin) != null) {
            return true;
        }
        ;
        return false;

    }
}