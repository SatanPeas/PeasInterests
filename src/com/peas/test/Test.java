package com.peas.test;

import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;

public class Test {

    class GrandFather {
        void think() {
            System.out.println("i am grandfather");
        }
    }

    class Father {
        void think() {
            System.out.println("i am father");
        }
    }

    class Son extends Father {
        void think() {
            try {
                MethodType mt = MethodType.methodType(void.class);
                MethodHandle mh = MethodHandles.lookup().findSpecial(GrandFather.class, "think", mt, getClass());
                mh.invoke(this);
            } catch (Throwable t) {
                t.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        (new Test()).new Son().think();
    }

}
