package com.peas.web.service;

import com.peas.web.bean.ConsumptionType;
import com.peas.web.bean.Payment;
import com.peas.web.bean.PaymentMethod;
import com.peas.web.mapper.FinanceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FinanceService {

    @Autowired
    private FinanceMapper financeMapper;

    public List<PaymentMethod> getPaymentMethods() {
        return financeMapper.getPaymentMethods();
    }

    public void addPayment(Payment payment) {
        financeMapper.addPayment(payment);
    }

}
