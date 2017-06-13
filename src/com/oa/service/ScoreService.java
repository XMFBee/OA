package com.oa.service;

import java.io.Serializable;

import com.oa.bean.Score;
import com.oa.common.bean.Pager4EasyUI;

public interface ScoreService extends BaseService<Score>{
	public Pager4EasyUI<Score> queryPagerByGradeId(Pager4EasyUI<Score> pager, Serializable gradeId);
	public Pager4EasyUI<Score> queryBySearch(Pager4EasyUI<Score> pager, String course);
}
