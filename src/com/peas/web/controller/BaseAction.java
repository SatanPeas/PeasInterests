package com.peas.web.controller;

import java.util.concurrent.ConcurrentHashMap;

public class BaseAction{

    public static ConcurrentHashMap<String, Long> AllSession = new ConcurrentHashMap<>();
}
