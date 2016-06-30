package com.phil.aic.dao;

import com.phil.aic.bean.Business;

public interface BusinessMapper {
    int deleteByPrimaryKey(String regId);

    int insert(Business record);

    int insertSelective(Business record);

    Business selectByPrimaryKey(String regId);

    int updateByPrimaryKeySelective(Business record);

    int updateByPrimaryKey(Business record);
}