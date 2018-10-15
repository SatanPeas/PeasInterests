package com.peas.web.bean;

public class Payment {

    private long paymentId;
    private long accountId;
    private int inOutId;
    private int paymentMethodId;
    private double money;
    private String keywords;
    private String date;
    private int status;

    public Payment() {

    }

    public Payment(long paymentId) {
        this.paymentId = paymentId;
    }

    public long getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(long paymentId) {
        this.paymentId = paymentId;
    }

    public long getAccountId() {
        return accountId;
    }

    public void setAccountId(long accountId) {
        this.accountId = accountId;
    }

    public int getInOutId() {
        return inOutId;
    }

    public void setInOutId(int inOutId) {
        this.inOutId = inOutId;
    }

    public int getPaymentMethodId() {
        return paymentMethodId;
    }

    public void setPaymentMethodId(int paymentMethodId) {
        this.paymentMethodId = paymentMethodId;
    }


    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
