package com.peas.web.controller;

import com.peas.web.bean.Account;
import com.peas.web.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/")
public class LoginAction extends BaseAction {

    @Autowired
    private LoginService loginService;

    @RequestMapping(value = "login.form", method = {RequestMethod.POST})
    public String login(String name, String password) {
        if (name == null || password == null)
            return "index.jsp";

        Account account = loginService.getPassword(name);
        if (password.equals(account.getPassword()))
            return "welcome.jsp?name=" + account.getName();

        return "index.jsp";
    }

    /*@SuppressWarnings("unchecked")
    @RequestMapping(value = "login.form", method = {RequestMethod.POST})
    public @ResponseBody Map<String, Object> login(String name, String password) {
        Map<String, Object> resultMap = new HashMap<>();

        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> requestMap = new HashMap<>();
        try {
            requestMap = mapper.readValue(body, HashMap.class);
        } catch (IOException e) {
            e.printStackTrace();
        }

        for (Map.Entry<String, Object> entry : requestMap.entrySet()) {
            System.out.println(entry.getKey() + ": " + entry.getValue());
        }

        Account account = loginService.getPassword((String) requestMap.get("name"));
        if
        if (account == null) {
            requestMap.put("isSuccess", false);
        }
        requestMap.put("isSuccess", true);
        requestMap.put("account", account);

        return requestMap;
    }*/

}
