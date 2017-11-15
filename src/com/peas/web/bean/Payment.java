package com.peas.web.bean;

public class Payment {

    private long paymentId;
    private long accountId;
    private int inOut;
    private String comsumptionPurpose;
    private String paymentMethod;
    private String comsumptionType;
    private double money;
    private String backup;

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

    public int getInOut() {
        return inOut;
    }

    public void setInOut(int inOut) {
        this.inOut = inOut;
    }

    public String getComsumptionPurpose() {
        return comsumptionPurpose;
    }

    public void setComsumptionPurpose(String comsumptionPurpose) {
        this.comsumptionPurpose = comsumptionPurpose;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getComsumptionType() {
        return comsumptionType;
    }

    public void setComsumptionType(String comsumptionType) {
        this.comsumptionType = comsumptionType;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public String getBackup() {
        return backup;
    }

    public void setBackup(String backup) {
        this.backup = backup;
    }
}
