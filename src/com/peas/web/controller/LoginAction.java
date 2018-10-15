package com.peas.web.controller;

import com.peas.web.bean.Account;
import com.peas.web.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/")
public class LoginAction extends BaseAction {

    @Autowired
    private LoginService loginService;

    @RequestMapping(value = "login.form", method = {RequestMethod.GET})
    public String login(Model model) {
        model.addAttribute("account", new Account());
        return "index.jsp";
    }

    @RequestMapping(value = "login.form", method = {RequestMethod.POST})
    public String login(Account inAccount, Errors errors, HttpServletRequest request) {
        Account account = loginService.getPassword(inAccount.getName());
        if (account == null) {
            errors.rejectValue("name", null,"用户名不存在!");
        } else if (!inAccount.getPassword().equals(account.getPassword())) {
            errors.rejectValue("password", null,"用户名或密码错误!");
        } else {
            AllSession.put(request.getSession().getId(), account.getAccountId());
            return "welcome.jsp?name=" + account.getName();
        }
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
