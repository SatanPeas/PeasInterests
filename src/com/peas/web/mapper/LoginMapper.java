package com.peas.web.mapper;

import com.peas.web.bean.Account;
import org.apache.ibatis.annotations.Param;

public interface LoginMapper {

    Account getPassword(@Param("name") String name);
}
