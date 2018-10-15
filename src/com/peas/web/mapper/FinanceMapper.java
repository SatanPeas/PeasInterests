package com.peas.web.mapper;

import com.peas.web.bean.ConsumptionType;
import com.peas.web.bean.Payment;
import com.peas.web.bean.PaymentMethod;

import java.util.List;

public interface FinanceMapper {

    /**
     * 获取所有消费方式
     * @return
     */
    List<PaymentMethod> getPaymentMethods();

    /**
     * 插入消费记录
     * @param payment
     */
    void addPayment(Payment payment);

}
