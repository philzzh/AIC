package com.phil.aic.dao;

import com.phil.aic.bean.TeamKey;

public interface TeamMapper {
    int deleteByPrimaryKey(TeamKey key);

    int insert(TeamKey record);

    int insertSelective(TeamKey record);
}