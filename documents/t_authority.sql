/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : ht_oa

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2017-01-09 16:39:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_authority
-- ----------------------------
DROP TABLE IF EXISTS `t_authority`;
CREATE TABLE `t_authority` (
  `autid` int(11) NOT NULL AUTO_INCREMENT,
  `classname` varchar(500) NOT NULL,
  `des` varchar(500) NOT NULL,
  PRIMARY KEY (`autid`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_authority
-- ----------------------------
INSERT INTO `t_authority` VALUES ('1', 'com.oa.action.CourseAction.courseByPage   ', '分页查询全部课程');
INSERT INTO `t_authority` VALUES ('2', 'com.oa.action.CourseAction.courseDisable   ', '禁用某个课程');
INSERT INTO `t_authority` VALUES ('3', 'com.oa.action.CourseAction.courseEnabled  ', '启用某个课程');
INSERT INTO `t_authority` VALUES ('4', 'com.oa.action.CourseAction.courseUpdate', '更新课程     ');
INSERT INTO `t_authority` VALUES ('5', 'com.oa.action.StudentAction.stuReserveSave', '添加预定学生');
INSERT INTO `t_authority` VALUES ('6', 'com.oa.action.StudentAction.stuReserveUpdate', '修改预定学生');
INSERT INTO `t_authority` VALUES ('7', 'com.oa.action.StudentAction.showOfficial', '转发到正式学生页面');
INSERT INTO `t_authority` VALUES ('8', 'com.oa.action.StudentAction.stuOfficialPager', '分页显示所有正式学生');
INSERT INTO `t_authority` VALUES ('9', 'com.oa.action.StudentAction.stuOfficialSave', '添加正式学生');
INSERT INTO `t_authority` VALUES ('10', 'com.oa.action.StudentAction.stuOfficialUpdate', '更新正式学生');
INSERT INTO `t_authority` VALUES ('11', 'com.oa.action.StudentAction.stuByIdPager', '学生详情');
INSERT INTO `t_authority` VALUES ('12', 'com.oa.action.StudentAction.stuGradeById', '分页显示在那个班的学生');
INSERT INTO `t_authority` VALUES ('13', 'com.oa.action.StudentAction.stuRoomNullById', '分页显示没有宿舍的学生');
INSERT INTO `t_authority` VALUES ('14', 'com.oa.action.StudentAction.stuRoomById', '分页显示在那个宿舍的学生');
INSERT INTO `t_authority` VALUES ('15', 'com.oa.action.StudentAction.stuGradeNullById', '分页显示没有班级的学生');
INSERT INTO `t_authority` VALUES ('16', 'com.oa.action.StudentAction.addStuOnGrade', '批量添加学生到班级');
INSERT INTO `t_authority` VALUES ('17', 'com.oa.action.StudentAction.addStuOnRoom', '批量添加学生到宿舍');
INSERT INTO `t_authority` VALUES ('18', 'com.oa.action.StudentAction.comitUpdatePay', '转为预定学生');
INSERT INTO `t_authority` VALUES ('19', 'com.oa.action.StudentAction.comitOfficialPay', '转为正式学生');
INSERT INTO `t_authority` VALUES ('20', 'com.oa.action.StudentAction.stuPurposeDisable', '禁用学生');
INSERT INTO `t_authority` VALUES ('21', 'com.oa.action.StudentAction.stuPurposeActivate', '启用学生');
INSERT INTO `t_authority` VALUES ('22', 'com.oa.action.StudentAction.pagerByStuName', '根据学生姓名模糊查询');
INSERT INTO `t_authority` VALUES ('23', 'com.oa.action.GradeAction.showGrade', '转发到班级页面');
INSERT INTO `t_authority` VALUES ('24', 'com.oa.action.GradeAction.gradePager', '分页显示所有班级');
INSERT INTO `t_authority` VALUES ('25', 'com.oa.action.GradeAction.pagerByName', '根据班级名称模糊查询');
INSERT INTO `t_authority` VALUES ('26', 'com.oa.action.GradeAction.gradeSave', '添加班级');
INSERT INTO `t_authority` VALUES ('27', 'com.oa.action.GradeAction.gradeUpdate', '更新班级');
INSERT INTO `t_authority` VALUES ('28', 'com.oa.action.RoomAction.showRoom', '转发到宿舍页面');
INSERT INTO `t_authority` VALUES ('29', 'com.oa.action.RoomAction.roomSave', '添加宿舍');
INSERT INTO `t_authority` VALUES ('30', 'com.oa.action.RoomAction.roomDisable', '禁用宿舍');
INSERT INTO `t_authority` VALUES ('31', 'com.oa.action.RoomAction.roomActivate', '启用宿舍');
INSERT INTO `t_authority` VALUES ('32', 'com.oa.action.RoomAction.roomUpdate', '更新宿舍');
INSERT INTO `t_authority` VALUES ('33', 'com.oa.action.RoomAction.roomPager', '分页显示所有宿舍');
INSERT INTO `t_authority` VALUES ('34', 'com.oa.action.RoomAction.pagerByName', '根据宿舍名称模糊查询');
INSERT INTO `t_authority` VALUES ('35', 'com.oa.action.ScoreAction.showScore', '转发到成绩页面');
INSERT INTO `t_authority` VALUES ('36', 'com.oa.action.ScoreAction.gradeByPager', '根据班级ID查询该班下的考试');
INSERT INTO `t_authority` VALUES ('37', 'com.oa.action.ScoreAction.pagerByCourse', '根据课程名称模糊查询');
INSERT INTO `t_authority` VALUES ('38', 'com.oa.action.StudentLeaveAction.showStuLeave', '转发到学生请假页面');
INSERT INTO `t_authority` VALUES ('39', 'com.oa.action.StudentLeaveAction.gradeByPager', '根据班级ID查询该班下的请假');
INSERT INTO `t_authority` VALUES ('40', 'com.oa.action.JobAction.showJob', '转发到学生就业页面');
INSERT INTO `t_authority` VALUES ('41', 'com.oa.action.JobAction.gradeByPager', '根据班级ID查询该班下的就业');
INSERT INTO `t_authority` VALUES ('42', 'com.oa.action.JobAction.jobDisable', '禁用就业');
INSERT INTO `t_authority` VALUES ('43', 'com.oa.action.JobAction.jobActivate', '启用就业');
INSERT INTO `t_authority` VALUES ('44', 'com.oa.action.StudentCheckingAction.showStuChecking', '转发到学生考勤页面');
INSERT INTO `t_authority` VALUES ('45', 'com.oa.action.StudentCheckingAction.gradeByPager', '根据班级id查询该班下的考勤');
INSERT INTO `t_authority` VALUES ('49', 'com.oa.action.DepartmentAction.delete', '删除部门');
INSERT INTO `t_authority` VALUES ('50', 'com.oa.action.DepartmentAction.update', '更新部门');
INSERT INTO `t_authority` VALUES ('51', 'com.oa.action.DepartmentAction.save', '新增部门');
INSERT INTO `t_authority` VALUES ('52', 'com.oa.action.DepartmentAction.updStatus', '更新状态');
INSERT INTO `t_authority` VALUES ('53', 'com.oa.action.DepartmentAction.pager', '分页显示部门');
INSERT INTO `t_authority` VALUES ('54', 'com.oa.action.DepartmentAction.showDepartment', '显示部门页面');
INSERT INTO `t_authority` VALUES ('55', 'com.oa.action.DutyAction.showDuty', '显示值班页面');
INSERT INTO `t_authority` VALUES ('56', 'com.oa.action.DutyAction.update', '更新值班');
INSERT INTO `t_authority` VALUES ('57', 'com.oa.action.DutyAction.allDuty', '所有值班分页');
INSERT INTO `t_authority` VALUES ('58', 'com.oa.action.DutyAction.saveAdd', '添加值班地址');
INSERT INTO `t_authority` VALUES ('59', 'com.oa.action.DutyAction.updAdd', '修改值班地址');
INSERT INTO `t_authority` VALUES ('60', 'com.oa.action.EmpAppealAction.doAppeal', '显示处理申诉页面');
INSERT INTO `t_authority` VALUES ('61', 'com.oa.action.EmpAppealAction.seeAppeal', '显示用户本身的申诉');
INSERT INTO `t_authority` VALUES ('62', 'com.oa.action.EmpAppealAction.pager', '查申诉');
INSERT INTO `t_authority` VALUES ('63', 'com.oa.action.EmpAppealAction.save', '提交申诉');
INSERT INTO `t_authority` VALUES ('64', 'com.oa.action.EmpAppealAction.update', '更新申诉状态');
INSERT INTO `t_authority` VALUES ('65', 'com.oa.action.EmpCheckAction.showCheck', '显示上司界面值班');
INSERT INTO `t_authority` VALUES ('66', 'com.oa.action.EmpCheckAction.seeCheck', '显示自己界面值班');
INSERT INTO `t_authority` VALUES ('67', 'com.oa.action.EmpCheckAction.pager', '分页查值班记录');
INSERT INTO `t_authority` VALUES ('68', 'com.oa.action.EmpCheckAction.save', '添加值班记录');
INSERT INTO `t_authority` VALUES ('69', 'com.oa.action.EmpCheckAction.update', '修改值班记录');
INSERT INTO `t_authority` VALUES ('70', 'com.oa.action.EmpCheckAction.delete', '冻结值班记录');
INSERT INTO `t_authority` VALUES ('71', 'com.oa.action.ExcelPOIAction.showEmpCheckingInfo', '显示考勤详情页面');
INSERT INTO `t_authority` VALUES ('72', 'com.oa.action.EmpCheckingAction.showEmpChecking', '显示考勤总结页面');
INSERT INTO `t_authority` VALUES ('73', 'com.oa.action.ExcelPOIAction.seeEmpCheckingInfo', '显示自己考勤详情页面');
INSERT INTO `t_authority` VALUES ('74', 'com.oa.action.EmpCheckingAction.seeEmpChecking', '显示自己考勤总结页面');
INSERT INTO `t_authority` VALUES ('75', 'com.oa.action.EmpCheckingAction.pager', '分页查考勤总结');
INSERT INTO `t_authority` VALUES ('76', 'com.oa.action.info.EmpCheckingInfoAction.pagerInfo', '分页考勤详情页面');
INSERT INTO `t_authority` VALUES ('77', 'com.oa.action.ExcelPOIAction.excelIn', '导入excel,保存考勤记录');
INSERT INTO `t_authority` VALUES ('78', 'com.oa.action.ExcelPOIAction.excelOut', '导出excel');
INSERT INTO `t_authority` VALUES ('79', 'com.oa.action.EmpleaveAction.doEmpleave', '显示审核请假页面');
INSERT INTO `t_authority` VALUES ('80', 'com.oa.action.EmpleaveAction.seeEmpleave', '显示自己请假页面');
INSERT INTO `t_authority` VALUES ('81', 'com.oa.action.EmpleaveAction.save', '添加请假单');
INSERT INTO `t_authority` VALUES ('82', 'com.oa.action.EmpleaveAction.update', '审核请假单');
INSERT INTO `t_authority` VALUES ('83', 'com.oa.action.EmpleaveAction.pager', '请假单分页');
INSERT INTO `t_authority` VALUES ('84', 'com.oa.action.Employee.save', '添加员工');
INSERT INTO `t_authority` VALUES ('85', 'com.oa.action.Employee.delete', '冻结员工');
INSERT INTO `t_authority` VALUES ('86', 'com.oa.action.Employee.update', '更新员工信息');
INSERT INTO `t_authority` VALUES ('87', 'com.oa.action.Employee.pager', '分页员工');
INSERT INTO `t_authority` VALUES ('88', 'com.oa.action.Employee.updStatus', '更新员工状态');
INSERT INTO `t_authority` VALUES ('89', 'com.oa.action.Employee.showEmployee', '显示所有员工页面');
INSERT INTO `t_authority` VALUES ('90', 'com.oa.action.Employee.seeEmployee', '显示员工自身信息页面');
INSERT INTO `t_authority` VALUES ('91', 'com.oa.action.Employee.seeUpdPwd', '显示员工自身修改密码页面');
INSERT INTO `t_authority` VALUES ('92', 'com.oa.action.Employee.seeUpdInfo', '显示员工自身修改信息页面');
INSERT INTO `t_authority` VALUES ('93', 'com.oa.action.GoodsUseAction.seeGoodsUse', '显示用户本身的物品领用');
INSERT INTO `t_authority` VALUES ('94', 'com.oa.action.GoodsUseAction.showGoodsUse', '显示领用');
INSERT INTO `t_authority` VALUES ('95', 'com.oa.action.GoodsUseAction.save', '添加物品领用');
INSERT INTO `t_authority` VALUES ('96', 'com.oa.action.GoodsUseAction.update', '归还物品');
INSERT INTO `t_authority` VALUES ('97', 'com.oa.action.GoodsUseAction.pager', '分页物品领用记录');
INSERT INTO `t_authority` VALUES ('98', 'com.oa.action.GoodsUseAction.pagerById', '分页用户自身领用记录');
INSERT INTO `t_authority` VALUES ('112', 'com.oa.action.salaryInfoPager', '基本工资信息分页');
INSERT INTO `t_authority` VALUES ('113', 'com.oa.action.updataSalary', '更新基本工资');
INSERT INTO `t_authority` VALUES ('114', 'com.oa.action.addSalary', '添加基本工资');
INSERT INTO `t_authority` VALUES ('115', 'com.oa.action.doSearch', '根据姓名搜索基本工资');
INSERT INTO `t_authority` VALUES ('116', 'com.oa.action.SalaryAction.salaryPager', '工资管理分页');
INSERT INTO `t_authority` VALUES ('117', 'com.oa.action.SalaryAction.addSalary', '添加工资');
INSERT INTO `t_authority` VALUES ('118', 'com.oa.action.SalaryAction.updataSalary', '更新工资');
INSERT INTO `t_authority` VALUES ('119', 'com.oa.action.IncomeTypeAction.incomeTypePager', '收入类型分页');
INSERT INTO `t_authority` VALUES ('120', 'com.oa.action.IncomeTypeAction.addIncomeType', '添加收入类型');
INSERT INTO `t_authority` VALUES ('121', 'com.oa.action.IncomeTypeAction.updataIncomeType', '更新收入类型');
INSERT INTO `t_authority` VALUES ('122', 'com.oa.action.IncomeAction.incomePager', '收入管理分页');
INSERT INTO `t_authority` VALUES ('124', 'com.oa.action.SystemAction.noticeTypePager', '公告类型分页');
INSERT INTO `t_authority` VALUES ('125', 'com.oa.action.SystemAction.addNoticeType', '公告类型添加');
INSERT INTO `t_authority` VALUES ('126', 'com.oa.action.SystemAction.updateNoticeType', '公告类型更新');
INSERT INTO `t_authority` VALUES ('127', 'com.oa.action.SystemAction.noticeTypeActivate', '公告状态激活');
INSERT INTO `t_authority` VALUES ('128', 'com.oa.action.SystemAction.noticeTypeDisable', '公告状态禁用');
INSERT INTO `t_authority` VALUES ('129', 'com.oa.action.SystemAction.type', '公告类型返回到公告表');
INSERT INTO `t_authority` VALUES ('130', 'com.oa.action.SystemAction.showNoticeType', '显示公告类型');
INSERT INTO `t_authority` VALUES ('131', 'com.oa.action.NoticeAction.noticePager', '公告分页');
INSERT INTO `t_authority` VALUES ('132', 'com.oa.action.NoticeAction.addNotice', '公告添加');
INSERT INTO `t_authority` VALUES ('133', 'com.oa.action.NoticeAction.updateNotice', '公告更新');
INSERT INTO `t_authority` VALUES ('134', 'com.oa.action.NoticeAction.noticeActivate', '公告状态激活');
INSERT INTO `t_authority` VALUES ('135', 'com.oa.action.NoticeAction.noticeDisable', '公告状态禁用');
INSERT INTO `t_authority` VALUES ('136', 'com.oa.action.NoticeAction.pagerByName', '模糊分页查询');
INSERT INTO `t_authority` VALUES ('137', 'com.oa.action.NoticeAction.showNotice', '显示公告表页面');
INSERT INTO `t_authority` VALUES ('138', 'com.oa.action.RoleAction.rolePager', '分页显示角色');
INSERT INTO `t_authority` VALUES ('139', 'com.oa.action.RoleAction.addRole', '角色添加');
INSERT INTO `t_authority` VALUES ('140', 'com.oa.action.RoleAction.updateRole', '角色更新');
INSERT INTO `t_authority` VALUES ('141', 'com.oa.action.RoleAction.roleActivate', '角色状态激活');
INSERT INTO `t_authority` VALUES ('142', 'com.oa.action.RoleAction.roleDisable', '角色禁用');
INSERT INTO `t_authority` VALUES ('143', 'com.oa.action.RoleAction.showRole', '显示角色页面');
INSERT INTO `t_authority` VALUES ('144', 'com.oa.action.CheckingAction.checkingPager', '打卡时间分页查询');
INSERT INTO `t_authority` VALUES ('145', 'com.oa.action.CheckingAction.addChecking', '打卡添加');
INSERT INTO `t_authority` VALUES ('146', 'com.oa.action.CheckingAction.updateChecking', '打卡时间更新');
INSERT INTO `t_authority` VALUES ('147', 'com.oa.action.TalkAction.showTalk', '显示打卡时间页面');
INSERT INTO `t_authority` VALUES ('148', 'com.oa.action.PayAction.query_page', '支出管理分页');
INSERT INTO `t_authority` VALUES ('149', 'com.oa.action.PayAction.save', '支出管理添加');
INSERT INTO `t_authority` VALUES ('150', 'com.oa.action.PayAction.update', '支出管理更新');
INSERT INTO `t_authority` VALUES ('151', 'com.oa.action.info.PayInfoAction.showPayInfo', '显示支出管理页面');
INSERT INTO `t_authority` VALUES ('152', 'com.oa.action.PayTypeAction.pager', '支出类型分页');
INSERT INTO `t_authority` VALUES ('153', 'com.oa.action.PayTypeAction.type', '支出类新下拉框提示');
INSERT INTO `t_authority` VALUES ('154', 'com.oa.action.PayTypeAction.addPayType', '支出类型添加');
INSERT INTO `t_authority` VALUES ('155', 'com.oa.action.PayTypeAction.updatePayType', '支出类型更新');
INSERT INTO `t_authority` VALUES ('156', 'com.oa.action.PayTypeAction.payTypeDisable', '支出类型禁用');
INSERT INTO `t_authority` VALUES ('157', 'com.oa.action.PayTypeAction.payTypeActivate', '支出类型启用');
INSERT INTO `t_authority` VALUES ('158', 'com.oa.action.PayTypeAction.showPayType', '显示支出类型页面');
INSERT INTO `t_authority` VALUES ('159', 'com.oa.action.TalkAction.pager', '谈心分页');
INSERT INTO `t_authority` VALUES ('160', 'com.oa.action.TalkAction.addTalk', '谈心添加');
INSERT INTO `t_authority` VALUES ('161', 'com.oa.action.TalkAction.updateTalk', '谈心更新');
INSERT INTO `t_authority` VALUES ('162', 'com.oa.action.TalkAction.talkDisable', '谈心禁用');
INSERT INTO `t_authority` VALUES ('163', 'com.oa.action.TalkAction.talkActivate', '谈心启用');
INSERT INTO `t_authority` VALUES ('164', 'com.oa.action.TalkAction.showTalk', '显示谈心页面');
INSERT INTO `t_authority` VALUES ('165', 'com.oa.action.CourseAction.pagerByName', '模糊查询');
INSERT INTO `t_authority` VALUES ('166', 'com.oa.action.EmpfeedbackAction.showEmpfeedbackPager', '转发页面');
INSERT INTO `t_authority` VALUES ('167', 'com.oa.action.EmpfeedbackAction.empfeedbackByPage', '分页查询反馈');
INSERT INTO `t_authority` VALUES ('168', 'com.oa.action.EmpfeedbackAction.empfeedbackSave', '添加反馈');
INSERT INTO `t_authority` VALUES ('169', 'com.oa.action.EmpfeedbackAction.empfeedbackUpdate', '更新反馈');
INSERT INTO `t_authority` VALUES ('170', 'com.oa.action.EmpfeedbackAction.empfeedbackDisable', '禁用反馈');
INSERT INTO `t_authority` VALUES ('171', 'com.oa.action.EmpfeedbackAction.empfeedbackEnabled', '启用反馈');
INSERT INTO `t_authority` VALUES ('172', 'com.oa.action.EmpfeedbackInfoAction.queryPager', '分页查询全部反馈');
INSERT INTO `t_authority` VALUES ('173', 'com.oa.action.EmpfeedbackInfoAction.pagerByName', '模糊查询');
INSERT INTO `t_authority` VALUES ('174', 'com.oa.actiom.MeettingAction.meettingByPage', '分页查询全部研讨会');
INSERT INTO `t_authority` VALUES ('175', 'com.oa.actiom.MeettingAction.meettingSave', '添加会议');
INSERT INTO `t_authority` VALUES ('176', 'com.oa.actiom.MeettingAction.meettingUpdate', '修改会议');
INSERT INTO `t_authority` VALUES ('177', 'com.oa.actiom.MeettingAction.meettingDisable', '禁用会议');
INSERT INTO `t_authority` VALUES ('178', 'com.oa.actiom.MeettingAction.meettingEnabled', '启用会议');
INSERT INTO `t_authority` VALUES ('179', 'com.oa.actiom.MeettingAction.showMeetting', '转发页面');
INSERT INTO `t_authority` VALUES ('180', 'com.oa.action.info.MeettingInfoAction.meettingPager', '分页查询全部研讨');
INSERT INTO `t_authority` VALUES ('181', 'com.oa.action.info.MeettingInfoAction.showMeettingInfo', '转发页面');
INSERT INTO `t_authority` VALUES ('182', 'com.oa.action.info.MeettingInfoAction.pagerByName', '模糊查询');
INSERT INTO `t_authority` VALUES ('183', 'com.oa.actiom.ProgressAction.showProgressPager', '转发页面');
INSERT INTO `t_authority` VALUES ('184', 'com.oa.actiom.ProgressAction.progressByPage', '分页查询全部课程进度');
INSERT INTO `t_authority` VALUES ('185', 'com.oa.actiom.ProgressAction.progressSave', '添加进度');
INSERT INTO `t_authority` VALUES ('186', 'com.oa.actiom.ProgressAction.progressUpdate', '修改进度');
INSERT INTO `t_authority` VALUES ('187', 'com.oa.actiom.ProgressAction.progressDisable', '禁用课程');
INSERT INTO `t_authority` VALUES ('188', 'com.oa.actiom.ProgressAction.progressEnabled', '启用课程');
INSERT INTO `t_authority` VALUES ('189', 'com.oa.actiom.ProgressAction.pagerByName', '模糊查询');
INSERT INTO `t_authority` VALUES ('190', 'com.oa.action.StudentFeedbackAction.stuSave', '添加学生反馈');
INSERT INTO `t_authority` VALUES ('191', 'com.oa.action.StudentFeedbackAction.feedbackDisable', '禁用学生反馈');
INSERT INTO `t_authority` VALUES ('192', 'com.oa.action.StudentFeedbackAction.feedbackActivate', '启用学生反馈');
INSERT INTO `t_authority` VALUES ('193', 'com.oa.action.StudentFeedbackAction.stuFeedbackPager', '分页显示学生反馈信息');
INSERT INTO `t_authority` VALUES ('194', 'com.oa.action.StudentFeedbackAction.showStuFeedback', '转发到显示学生反馈信息页面');
INSERT INTO `t_authority` VALUES ('195', 'com.oa.action.CourseAction.courseSave', '添加课程');
INSERT INTO `t_authority` VALUES ('196', 'com.oa.action.EmpCheckingAction.pagerById', '分页查自己考勤总结');
INSERT INTO `t_authority` VALUES ('197', 'com.oa.action.info.EmpCheckingInfoAction.pagerInfoById', '分页自己考勤详情页面');
INSERT INTO `t_authority` VALUES ('198', 'com.oa.action.EmpAppealAction.pagerById', '查自己申诉');
INSERT INTO `t_authority` VALUES ('199', 'com.oa.action.EmpCheckAction.pagerById', '分页查自己值班记录');
INSERT INTO `t_authority` VALUES ('200', 'com.oa.action.EmpleaveAction.pagerById', '自己请假单分页');
INSERT INTO `t_authority` VALUES ('201', 'com.oa.action.Employee.pagerById', '自己详细信息');
INSERT INTO `t_authority` VALUES ('202', 'com.oa.action.GoodsTypeAction.save', '添加用品类型');
INSERT INTO `t_authority` VALUES ('203', 'com.oa.action.GoodsTypeAction.update', '更新用品类型');
INSERT INTO `t_authority` VALUES ('204', 'com.oa.action.GoodsTypeAction.pager', '分页显示用品');
INSERT INTO `t_authority` VALUES ('205', 'com.oa.action.GoodsTypeAction.gtDisable', '禁用用品类型');
INSERT INTO `t_authority` VALUES ('206', 'com.oa.action.GoodsTypeAction.gtActivate', '启用用品类型');
INSERT INTO `t_authority` VALUES ('207', 'com.oa.action.GoodsTypeAction.comboBox', '用品页面添加用品下拉列表显示用品类型\r\n');
INSERT INTO `t_authority` VALUES ('208', 'com.oa.action.GoodsTypeAction.gtype', '跳转到用品类型页面\r\n');
INSERT INTO `t_authority` VALUES ('209', 'com.oa.action.GoodsAction.update', '更新用品');
INSERT INTO `t_authority` VALUES ('210', 'com.oa.action.GoodsAction.queryAll', '分页显示用品');
INSERT INTO `t_authority` VALUES ('211', 'com.oa.action.GoodsAction.queryNameByAll', '用品页面根据name模糊查询');
INSERT INTO `t_authority` VALUES ('212', 'com.oa.action.GoodsAction.gtDisable', '禁用用品');
INSERT INTO `t_authority` VALUES ('213', 'com.oa.action.GoodsAction.gtActivate', '启用用品');
INSERT INTO `t_authority` VALUES ('214', 'com.oa.action.GoodsAction.goodsPager', '跳转用品页面');
INSERT INTO `t_authority` VALUES ('215', 'com.oa.action.GoodsAppAction.saveGoodsApp', '添加用品申购');
INSERT INTO `t_authority` VALUES ('216', 'com.oa.action.GoodsAction.updateGoodsApp', '更新用品申购');
INSERT INTO `t_authority` VALUES ('217', 'com.oa.action.GoodsAction.queryAll', '分页显示用品申购');
INSERT INTO `t_authority` VALUES ('218', 'com.oa.action.GoodsAction.gtDisable', '禁用用品申购');
INSERT INTO `t_authority` VALUES ('219', 'com.oa.action.GoodsAction.gtActivate', '启用用品申购');
INSERT INTO `t_authority` VALUES ('220', 'com.oa.action.GoodsAction.goodsAppPager', '跳转用品申购页面');
INSERT INTO `t_authority` VALUES ('221', 'com.oa.action.GoodsAction.save', '添加用品');
