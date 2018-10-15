package com.peas.web.bean;

public class PaymentMethod {

    private int paymentMethodId;
    private String name;

    public PaymentMethod() {
    }

    public int getPaymentMethodId() {
        return paymentMethodId;
    }

    public void setPaymentMethodId(int paymentMethodId) {
        this.paymentMethodId = paymentMethodId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
