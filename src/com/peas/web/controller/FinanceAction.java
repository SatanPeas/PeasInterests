package com.peas.web.controller;

import com.peas.web.bean.ConsumptionType;
import com.peas.web.bean.Payment;
import com.peas.web.bean.PaymentMethod;
import com.peas.web.service.FinanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/finance")
public class FinanceAction extends BaseAction{

    @Autowired
    private FinanceService financeService;

    @RequestMapping(value = "/getBasicData.form", method = {RequestMethod.POST})
    public @ResponseBody Map<String, List> getBasicData() {
        Map<String, List> resultMap = new HashMap<>();

        List<PaymentMethod> paymentMethods = financeService.getPaymentMethods();

        resultMap.put("paymentMethods", paymentMethods);

        return resultMap;
    }

    @RequestMapping(value = "/addPayment.form", method = {RequestMethod.POST})
    public @ResponseBody Map<String, String> addPayment(Payment payment, HttpServletRequest request) {
        Map<String, String> resultMap = new HashMap<>();
        try {
            String[] contentType = request.getContentType().split(";");
            Long accountId = AllSession.get(contentType[contentType.length - 1].trim());
            if (accountId == null)
                resultMap.put("result", "session timeout");
            else {
                payment.setAccountId(accountId);
                if (payment.getDate() == null || payment.getDate() .equals("")) {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                    String date = sdf.format(new Date());
                    payment.setDate(date);
                }
                financeService.addPayment(payment);
                resultMap.put("result", "success");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("result", "exception");
            return resultMap;
        }
        return resultMap;
    }
}
