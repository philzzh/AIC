package com.phil.aic.dao;

import com.phil.aic.bean.Case;

public interface CaseMapper {
    int deleteByPrimaryKey(String caseId);

    int insert(Case record);

    int insertSelective(Case record);

    Case selectByPrimaryKey(String caseId);

    int updateByPrimaryKeySelective(Case record);

    int updateByPrimaryKey(Case record);
}