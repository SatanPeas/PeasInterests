package com.peas.web.service;

import com.peas.web.bean.Account;
import com.peas.web.mapper.LoginMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

    @Autowired
    private LoginMapper loginMapper;

    public Account getPassword(String name) {
        return loginMapper.getPassword(name);
    }
}
