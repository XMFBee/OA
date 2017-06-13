/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : ht_oa

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2017-01-10 14:59:56
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
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8;

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
INSERT INTO `t_authority` VALUES ('65', 'com.oa.action.EmpCheckAction.showCheck', '显示上司界面巡查');
INSERT INTO `t_authority` VALUES ('66', 'com.oa.action.EmpCheckAction.seeCheck', '显示自己界面巡查');
INSERT INTO `t_authority` VALUES ('67', 'com.oa.action.EmpCheckAction.pager', '分页查询巡查记录');
INSERT INTO `t_authority` VALUES ('68', 'com.oa.action.EmpCheckAction.save', '添加巡查记录');
INSERT INTO `t_authority` VALUES ('69', 'com.oa.action.EmpCheckAction.update', '修改巡查记录');
INSERT INTO `t_authority` VALUES ('70', 'com.oa.action.EmpCheckAction.delete', '冻结巡查记录');
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
INSERT INTO `t_authority` VALUES ('84', 'com.oa.action.EmployeeAction.save', '添加员工');
INSERT INTO `t_authority` VALUES ('85', 'com.oa.action.EmployeeAction.delete', '冻结员工');
INSERT INTO `t_authority` VALUES ('86', 'com.oa.action.EmployeeAction.update', '更新员工信息');
INSERT INTO `t_authority` VALUES ('87', 'com.oa.action.EmployeeAction.pager', '分页员工');
INSERT INTO `t_authority` VALUES ('88', 'com.oa.action.EmployeeAction.updStatus', '更新员工状态');
INSERT INTO `t_authority` VALUES ('89', 'com.oa.action.EmployeeAction.showEmployee', '显示所有员工页面');
INSERT INTO `t_authority` VALUES ('90', 'com.oa.action.EmployeeAction.seeEmployee', '显示员工自身信息页面');
INSERT INTO `t_authority` VALUES ('91', 'com.oa.action.EmployeeAction.seeUpdPwd', '显示员工自身修改密码页面');
INSERT INTO `t_authority` VALUES ('92', 'com.oa.action.EmployeeAction.seeUpdInfo', '显示员工自身修改信息页面');
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
INSERT INTO `t_authority` VALUES ('127', 'com.oa.action.SystemAction.noticeTypeActivate', '公告类型状态激活');
INSERT INTO `t_authority` VALUES ('128', 'com.oa.action.SystemAction.noticeTypeDisable', '公告类型状态禁用');
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
INSERT INTO `t_authority` VALUES ('204', 'com.oa.action.GoodsTypeAction.pager', '分页显示用品类型');
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
INSERT INTO `t_authority` VALUES ('222', 'com.oa.action.StudentAction.showPurpose', '转发到意向学生页面');
INSERT INTO `t_authority` VALUES ('223', 'com.oa.action.StudentAction.stuPurposePager', '分页查询所有意向学生');
INSERT INTO `t_authority` VALUES ('224', 'com.oa.action.StudentAction.stuPurposeSave', '添加意向学生');
INSERT INTO `t_authority` VALUES ('225', 'com.oa.action.StudentAction.stuPurposeUpdate', '更新意向学生');

-- ----------------------------
-- Table structure for t_check
-- ----------------------------
DROP TABLE IF EXISTS `t_check`;
CREATE TABLE `t_check` (
  `checkid` varchar(32) NOT NULL COMMENT '巡查编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `checktime` datetime DEFAULT NULL COMMENT '巡查时间',
  `weekday` varchar(10) DEFAULT NULL COMMENT '周几',
  `gradeid` varchar(32) DEFAULT NULL COMMENT '班级编号',
  `roomid` varchar(32) DEFAULT NULL COMMENT '宿舍编号',
  `des` varchar(500) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`checkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_check
-- ----------------------------
INSERT INTO `t_check` VALUES ('2028da1b592568aa015925803c1faaoi', '2028da1b592568aa015925803c1faa21', '2017-01-06 11:45:07', '周一', '4028da1b592568aa015925803c1f0002', null, '查看睡觉');

-- ----------------------------
-- Table structure for t_course
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course` (
  `courseid` varchar(32) NOT NULL COMMENT '课程编号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `des` varchar(255) DEFAULT NULL COMMENT '描述',
  `totalhour` int(11) DEFAULT NULL COMMENT '总课时数',
  `term` int(11) DEFAULT NULL COMMENT '学期',
  `courseorder` int(11) DEFAULT NULL COMMENT '课程顺序',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_course
-- ----------------------------
INSERT INTO `t_course` VALUES ('402880a05943161f015943177c450000', 'HTML', 'HTML', '1', '2', '3', '1');
INSERT INTO `t_course` VALUES ('402880a05943161f0159431976190001', 'c语言', '编程', '2', '1', '1', '1');

-- ----------------------------
-- Table structure for t_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept` (
  `depid` varchar(32) NOT NULL COMMENT '部门编号',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `empid` varchar(32) DEFAULT NULL COMMENT '负责人编号',
  `des` varchar(500) DEFAULT NULL COMMENT '描述',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认可用',
  PRIMARY KEY (`depid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES ('402880a05971b07d015971bdb2430000', '总裁部', null, '管理层', '1');
INSERT INTO `t_dept` VALUES ('4028da1b592568aa015925803c1f3221', '教务部', '4028da1b592568aa015925803c1f3001', '教务', '1');
INSERT INTO `t_dept` VALUES ('4028da1b594ec23901594ec51d040000', '行政部', '4028da1b5976b929015976f78c3f000f', '不知道', '1');
INSERT INTO `t_dept` VALUES ('4028da1b5973050f0159739840250001', '后勤部', '402881e859838ae70159838c94df0000', '管理物品', '1');
INSERT INTO `t_dept` VALUES ('4028da1b5976b929015976e2c5d20000', '招生部', null, '招学生', '1');
INSERT INTO `t_dept` VALUES ('4028da1b5976b929015976e3ea4f0001', '财务部', '4028da1b5976b929015976f949ee0010', '管理钱', '1');

-- ----------------------------
-- Table structure for t_duty
-- ----------------------------
DROP TABLE IF EXISTS `t_duty`;
CREATE TABLE `t_duty` (
  `dutyid` varchar(32) NOT NULL COMMENT '值班编号',
  `weekday` varchar(10) DEFAULT NULL COMMENT '周几',
  `empid1` varchar(32) DEFAULT NULL COMMENT '员工1',
  `add1` varchar(20) DEFAULT NULL COMMENT '地点1',
  `empid2` varchar(32) DEFAULT NULL,
  `add2` varchar(32) DEFAULT NULL,
  `empid3` varchar(32) DEFAULT NULL,
  `add3` varchar(20) DEFAULT NULL,
  `empid4` varchar(32) DEFAULT NULL,
  `add4` varchar(20) DEFAULT NULL,
  `empid5` varchar(32) DEFAULT NULL,
  `add5` varchar(20) DEFAULT NULL,
  `empid6` varchar(32) DEFAULT NULL,
  `add6` varchar(20) DEFAULT NULL,
  `empid7` varchar(32) DEFAULT NULL,
  `add7` varchar(20) DEFAULT NULL,
  `empid8` varchar(32) DEFAULT NULL,
  `add8` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`dutyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_duty
-- ----------------------------
INSERT INTO `t_duty` VALUES ('4028da1b592568aa015925803c1fjkfj', '周一', '2028da1b592568aa015925803c1faa21', '三楼', '4028da1b592568aa015925803c1f3001', '三楼', null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for t_edu
-- ----------------------------
DROP TABLE IF EXISTS `t_edu`;
CREATE TABLE `t_edu` (
  `eduid` varchar(32) NOT NULL COMMENT '教育经历编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号，来源于员工表',
  `school` varchar(50) DEFAULT NULL COMMENT '毕业学校',
  `startday` datetime DEFAULT NULL COMMENT '开始时间',
  `endday` datetime DEFAULT NULL COMMENT '结束时间',
  `des` varchar(500) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`eduid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_edu
-- ----------------------------

-- ----------------------------
-- Table structure for t_emp
-- ----------------------------
DROP TABLE IF EXISTS `t_emp`;
CREATE TABLE `t_emp` (
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `depid` varchar(32) NOT NULL COMMENT '部门编号，来源于部门表',
  `roleid` varchar(32) NOT NULL COMMENT '角色编号',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `pwd` varchar(50) NOT NULL COMMENT '密码',
  `idcard` varchar(18) NOT NULL COMMENT '身份证号',
  `nation` varchar(10) DEFAULT NULL COMMENT '籍贯',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `fingerno` varchar(10) NOT NULL COMMENT '指纹编号',
  `birthday` datetime NOT NULL COMMENT '出生日期',
  `email` varchar(100) NOT NULL COMMENT '邮箱',
  `phone` varchar(11) NOT NULL COMMENT '手机号',
  `qq` varchar(15) DEFAULT NULL COMMENT 'qq号',
  `wechat` varchar(50) DEFAULT NULL COMMENT '微信号',
  `address` varchar(255) DEFAULT NULL COMMENT '家庭地址',
  `married` varchar(4) DEFAULT NULL COMMENT '是否结婚',
  `contactname` varchar(20) DEFAULT NULL COMMENT '联系人姓名',
  `contactphone` varchar(11) DEFAULT NULL COMMENT '联系人手机号',
  `college` varchar(20) DEFAULT NULL COMMENT '毕业院校',
  `major` varchar(20) DEFAULT NULL COMMENT '专业',
  `eduback` varchar(5) DEFAULT NULL COMMENT '学历',
  `bankname` varchar(50) DEFAULT NULL COMMENT '开户行名称',
  `accountname` varchar(20) DEFAULT NULL COMMENT '银行卡姓名',
  `accountno` varchar(30) DEFAULT NULL COMMENT '银行账号',
  `alipay` varchar(100) DEFAULT NULL COMMENT '支付宝账号',
  `hireday` datetime NOT NULL COMMENT '入职时间',
  `resignday` datetime DEFAULT NULL COMMENT '离职时间',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态，默认可用',
  PRIMARY KEY (`empid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_emp
-- ----------------------------
INSERT INTO `t_emp` VALUES ('2028da1b592568aa015925803c1faa21', '4028da1b592568aa015925803c1f3221', '4028da1b592568aa015925803c1faa21', '王老师', '4QrcOUm6Wau+VuBX8g+IPg==', '8375834758', '汉族', '男', 'a002', '2016-12-26 11:10:37', 'xiao@qq.com', '123456', null, null, null, null, 'null', 'null', null, null, null, null, 'null', 'null', 'null', '2016-12-26 11:10:50', null, '1');
INSERT INTO `t_emp` VALUES ('40246a1b592568aa0159258aaa1f3221', '4028da1b592568aa015925803c1f3221', '4028da1b592568aa015925803c1bac21', '朱老师', '4QrcOUm6Wau+VuBX8g+IPg==', '893975894357', '汉族', '男', 'a003', '2016-12-26 11:11:44', 'zhu@qq.com', '123456789', null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-12-26 11:12:18', null, '1');
INSERT INTO `t_emp` VALUES ('402881e859838ae70159838c94df0000', '4028da1b5973050f0159739840250001', '4028da1b5976b929015976e786590002', '李主任', '4QrcOUm6Wau+VuBX8g+IPg==', '343545465656565657', null, '男', '002', '2017-01-09 00:00:00', 'li@123.com', '12345678913', null, null, 'nullnullnull', null, null, null, null, null, null, '未知', '李主任', '3454554545454545445', null, '2017-01-09 22:05:45', null, '1');
INSERT INTO `t_emp` VALUES ('4028da1b592568aa015925803c1f3001', '4028da1b592568aa015925803c1f3221', '4028da1b592568aa015925803c1faa21', '赖老师', '4QrcOUm6Wau+VuBX8g+IPg==', '360782199808127019', '汉族', '男', 'a001', '2016-12-26 11:09:19', 'wang@qq.com', '1234567', null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-12-26 11:08:51', null, '1');
INSERT INTO `t_emp` VALUES ('4028da1b5976b929015976f1e4a40009', '402880a05971b07d015971bdb2430000', '4028da1b5976b929015976e992840005', '陈老师', '4QrcOUm6Wau+VuBX8g+IPg==', '666666666666666666', null, '男', '223434324', '2001-02-06 00:00:00', '666@QQ.com', '16666666666', null, null, 'nullnullnull', null, 'null', '12345678910', null, null, null, '未知', '陈老师', '8888888888888888888', 'null', '2017-01-07 11:21:21', null, '1');
INSERT INTO `t_emp` VALUES ('4028da1b5976b929015976f78c3f000f', '4028da1b594ec23901594ec51d040000', '4028da1b5976b929015976e8f3c70004', '廖校长', '4QrcOUm6Wau+VuBX8g+IPg==', '237283728372837283', null, '男', '343', '2017-01-07 00:00:00', 'liao@12.com', '12345678911', null, null, 'nullnullnull', null, null, null, null, null, null, '未知', '廖校长', '2343432545343434343', null, '2017-01-07 11:27:32', null, '1');
INSERT INTO `t_emp` VALUES ('4028da1b5976b929015976f949ee0010', '4028da1b5976b929015976e3ea4f0001', '4028da1b5976b929015976e81bf90003', '赖老师', '4QrcOUm6Wau+VuBX8g+IPg==', '232322343432433333', null, '女', '123', '2017-01-07 00:00:00', 'lai@12.com', '12345678912', null, null, 'nullnullnull', null, null, null, null, null, null, '未知', '赖老师', '1232324343434343336', null, '2017-01-07 11:29:26', null, '1');

-- ----------------------------
-- Table structure for t_empappeal
-- ----------------------------
DROP TABLE IF EXISTS `t_empappeal`;
CREATE TABLE `t_empappeal` (
  `appealid` varchar(32) NOT NULL COMMENT '请假编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `appealday` datetime DEFAULT NULL COMMENT '提交时间',
  `des` varchar(255) DEFAULT NULL COMMENT '请假描述',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  `firstlevel` int(11) DEFAULT '0' COMMENT '直属上司审核，默认为不通过',
  `secondlevel` int(11) DEFAULT '0' COMMENT '老板审核，默认为不通过',
  `pass` int(11) DEFAULT '0' COMMENT '通过状态，默认为不通过',
  PRIMARY KEY (`appealid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_empappeal
-- ----------------------------

-- ----------------------------
-- Table structure for t_empchecking
-- ----------------------------
DROP TABLE IF EXISTS `t_empchecking`;
CREATE TABLE `t_empchecking` (
  `checkingid` varchar(32) NOT NULL COMMENT '考勤编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `checkingday` datetime DEFAULT NULL COMMENT '打卡日期',
  `time1` datetime DEFAULT NULL COMMENT '时间点1',
  `time2` datetime DEFAULT NULL,
  `time3` datetime DEFAULT NULL,
  `time4` datetime DEFAULT NULL,
  `time5` datetime DEFAULT NULL,
  `time6` datetime DEFAULT NULL,
  `time7` datetime DEFAULT NULL,
  `time8` datetime DEFAULT NULL,
  PRIMARY KEY (`checkingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_empchecking
-- ----------------------------

-- ----------------------------
-- Table structure for t_empcheckinginfo
-- ----------------------------
DROP TABLE IF EXISTS `t_empcheckinginfo`;
CREATE TABLE `t_empcheckinginfo` (
  `checkinginfoid` varchar(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `checkingtime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`checkinginfoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_empcheckinginfo
-- ----------------------------

-- ----------------------------
-- Table structure for t_empfeedback
-- ----------------------------
DROP TABLE IF EXISTS `t_empfeedback`;
CREATE TABLE `t_empfeedback` (
  `feedbackid` varchar(32) NOT NULL COMMENT '反馈编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `feedbackday` datetime DEFAULT NULL COMMENT '反馈时间',
  `des` varchar(500) DEFAULT NULL COMMENT '反馈详情',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`feedbackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_empfeedback
-- ----------------------------

-- ----------------------------
-- Table structure for t_empleave
-- ----------------------------
DROP TABLE IF EXISTS `t_empleave`;
CREATE TABLE `t_empleave` (
  `leaveid` varchar(32) NOT NULL COMMENT '请假编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `starttime` datetime DEFAULT NULL COMMENT '开始时间',
  `endtime` datetime DEFAULT NULL COMMENT '结束时间',
  `leaveday` datetime DEFAULT NULL COMMENT '提交时间',
  `des` varchar(255) DEFAULT NULL COMMENT '请假描述',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  `firstlevel` int(11) DEFAULT '0' COMMENT '直属上司审核，默认为不通过',
  `secondlevel` int(11) DEFAULT '0' COMMENT '老板审核，默认为不通过',
  `pass` int(11) DEFAULT '0' COMMENT '通过状态，默认为不通过',
  PRIMARY KEY (`leaveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_empleave
-- ----------------------------

-- ----------------------------
-- Table structure for t_exp
-- ----------------------------
DROP TABLE IF EXISTS `t_exp`;
CREATE TABLE `t_exp` (
  `expid` varchar(32) NOT NULL COMMENT '工作经历编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号，来源于员工表',
  `company` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `startday` datetime DEFAULT NULL COMMENT '入职时间',
  `endday` datetime DEFAULT NULL COMMENT '离职时间',
  `jobtitle` varchar(50) DEFAULT NULL COMMENT '职位',
  `des` varchar(500) DEFAULT NULL COMMENT '工作描述',
  PRIMARY KEY (`expid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_exp
-- ----------------------------

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `goodsid` varchar(32) NOT NULL COMMENT '物品编号',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `quantity` int(11) NOT NULL COMMENT '总数',
  `des` varchar(255) DEFAULT NULL COMMENT '描述',
  `unitprice` double DEFAULT NULL COMMENT '单价',
  `buyday` datetime DEFAULT NULL COMMENT '购买时间',
  `goodstypeid` varchar(32) NOT NULL COMMENT '物品类型编号，来源于物品类型表',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态，默认可用',
  PRIMARY KEY (`goodsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES ('4028da1b5973050f0159739a6a590004', '篮球', '1', '没有', '199', '2017-01-06 19:46:57', '4028da1b5973050f0159739967fc0002', '1');
INSERT INTO `t_goods` VALUES ('4028da1b5973050f0159739b8f580005', '圆珠笔', '200', '写字用的', '2', '2017-01-06 19:48:12', '4028da1b5973050f01597399a9210003', '1');

-- ----------------------------
-- Table structure for t_goodsapp
-- ----------------------------
DROP TABLE IF EXISTS `t_goodsapp`;
CREATE TABLE `t_goodsapp` (
  `goodsappid` varchar(32) NOT NULL COMMENT '物品申购编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `appday` datetime DEFAULT NULL COMMENT '申购时间',
  `goodsname` varchar(50) DEFAULT NULL COMMENT '申购的物品名称',
  `quantity` int(11) DEFAULT NULL COMMENT '申购物品的数量',
  `des` varchar(500) DEFAULT NULL COMMENT '申购原因',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认可用',
  `appstatus` int(11) DEFAULT NULL COMMENT '申购状态，成功则为1，失败则为0',
  PRIMARY KEY (`goodsappid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goodsapp
-- ----------------------------

-- ----------------------------
-- Table structure for t_goodstype
-- ----------------------------
DROP TABLE IF EXISTS `t_goodstype`;
CREATE TABLE `t_goodstype` (
  `goodstypeid` varchar(32) NOT NULL COMMENT '物品类型编号',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `des` varchar(500) DEFAULT NULL COMMENT '描述',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态，默认可用',
  PRIMARY KEY (`goodstypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goodstype
-- ----------------------------
INSERT INTO `t_goodstype` VALUES ('4028da1b5973050f0159739967fc0002', '体育用品', '玩的', '1');
INSERT INTO `t_goodstype` VALUES ('4028da1b5973050f01597399a9210003', '学习用品', '学习用的', '1');

-- ----------------------------
-- Table structure for t_goodsuse
-- ----------------------------
DROP TABLE IF EXISTS `t_goodsuse`;
CREATE TABLE `t_goodsuse` (
  `useid` varchar(32) NOT NULL COMMENT '领用编号',
  `goodsid` varchar(32) NOT NULL COMMENT '物品编号，来源于物品表',
  `empid` varchar(32) NOT NULL COMMENT '员工编号，来源于员工表',
  `quantity` int(11) DEFAULT NULL COMMENT '领用的物品数量',
  `useday` datetime DEFAULT NULL COMMENT '信用时间',
  `ereturnday` datetime DEFAULT NULL COMMENT '预估归还时间',
  `returnday` datetime DEFAULT NULL COMMENT '归还时间',
  PRIMARY KEY (`useid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goodsuse
-- ----------------------------

-- ----------------------------
-- Table structure for t_grade
-- ----------------------------
DROP TABLE IF EXISTS `t_grade`;
CREATE TABLE `t_grade` (
  `gradeid` varchar(32) NOT NULL COMMENT '班级编号',
  `name` varchar(20) DEFAULT NULL COMMENT '班级名称',
  `empid1` varchar(32) NOT NULL COMMENT '班主任',
  `empid2` varchar(32) NOT NULL COMMENT '任课老师',
  `empid3` varchar(32) NOT NULL COMMENT '辅导老师',
  `des` varchar(500) DEFAULT NULL COMMENT '描述',
  `quantity` int(11) NOT NULL COMMENT '班级最大人数',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`gradeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_grade
-- ----------------------------
INSERT INTO `t_grade` VALUES ('2028da1b592568aa015925803c1f3784', '15春2班', '2028da1b592568aa015925803c1faa21', '4028da1b592568aa015925803c1f3001', '2028da1b592568aa015925803c1faa21', '哎。。。。', '5', '1');
INSERT INTO `t_grade` VALUES ('4028da1b592568aa015925803c1f0002', '宏图15秋2班', '40246a1b592568aa0159258aaa1f3221', '4028da1b592568aa015925803c1f3001', '2028da1b592568aa015925803c1faa21', '这个班好听话', '5', '1');
INSERT INTO `t_grade` VALUES ('4028da1b594a913301594a95f8cf0001', '16秋', '4028da1b592568aa015925803c1f3001', '2028da1b592568aa015925803c1faa21', '40246a1b592568aa0159258aaa1f3221', '767', '30', '1');
INSERT INTO `t_grade` VALUES ('4028da1b59642ced0159645660880000', '17秋', '2028da1b592568aa015925803c1faa21', '4028da1b592568aa015925803c1f3001', '2028da1b592568aa015925803c1faa21', 'adf', '12', '1');

-- ----------------------------
-- Table structure for t_income
-- ----------------------------
DROP TABLE IF EXISTS `t_income`;
CREATE TABLE `t_income` (
  `incomeid` varchar(32) NOT NULL COMMENT '收入编号',
  `incometypeid` varchar(32) NOT NULL COMMENT '收入类型编号',
  `incomeday` datetime DEFAULT NULL COMMENT '收入时间',
  `des` varchar(255) DEFAULT NULL COMMENT '收入详情',
  `income` double DEFAULT NULL COMMENT '收入金额',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `stuid` varchar(32) DEFAULT NULL COMMENT '学生编号',
  PRIMARY KEY (`incomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_income
-- ----------------------------
INSERT INTO `t_income` VALUES ('402880a35986601f01598660808f0000', '402880a059696b510159696cacc80000', '2017-01-10 11:16:28', '交了预定报名费为300.0', '300', '4028da1b5976b929015976f949ee0010', '402880a0596dcc1f01596dce31390000');
INSERT INTO `t_income` VALUES ('402880a3598673030159867440070000', '402880a059696b510159696cacc80000', '2017-01-10 11:38:03', '交了预定报名费为300.0', '300', '4028da1b5976b929015976f949ee0010', '402880a359866f500159867021890000');
INSERT INTO `t_income` VALUES ('402880a3598673030159867492be0002', '402880a059696b510159696cacc80000', '2017-01-10 11:38:24', '交了预定报名费为300.0', '300', '4028da1b5976b929015976f949ee0010', '402880a35986730301598674923e0001');
INSERT INTO `t_income` VALUES ('402880a3598676e6015986776d3c0000', '4028da1b596c13a101596c140bd70000', '2017-01-10 11:41:31', '交了正式报名费为6000.0', '6000', '4028da1b5976b929015976f949ee0010', '402880a0596dcc1f01596dce31390000');
INSERT INTO `t_income` VALUES ('402880a3598676e60159867a1d620002', '4028da1b596c13a101596c140bd70000', '2017-01-10 11:44:27', '交了正式报名费为6000.0', '6000', '4028da1b5976b929015976f949ee0010', '402880a3598676e60159867a1d0d0001');
INSERT INTO `t_income` VALUES ('402881e8596ef58701596ef7f3ed0001', '4028da1b596c13a101596c140bd70000', '2017-01-05 22:11:01', '交了正式报名费为6000.0', '6000', '2028da1b592568aa015925803c1faa21', '402881e8596ef58701596ef7f3440000');
INSERT INTO `t_income` VALUES ('4028da1b59698f350159698fc74c0000', '402880a059696b510159696cacc80000', '2017-01-04 20:59:07', '交了预定报名费为300.0', '300', '2028da1b592568aa015925803c1faa21', '4028da1b596c0a1b01596c0b026f0000');
INSERT INTO `t_income` VALUES ('4028da1b596c0a1b01596c0b62cd0001', '402880a059696b510159696cacc80000', '2017-01-05 08:33:23', '交了预定报名费为300.0', '300', '2028da1b592568aa015925803c1faa21', '4028da1b596c0a1b01596c0b026f0000');
INSERT INTO `t_income` VALUES ('4028da1b596c1add01596c1b3b020000', '4028da1b596c13a101596c140bd70000', '2017-01-05 08:50:41', '交了正式报名费为6000.0', '6000', '2028da1b592568aa015925803c1faa21', '4028da1b596c0a1b01596c0b026f0000');
INSERT INTO `t_income` VALUES ('4028da1b596c1add01596c1dbf040001', '4028da1b596c13a101596c140bd70000', '2017-01-05 08:53:26', '交了正式报名费为6000.0', '6000', '2028da1b592568aa015925803c1faa21', '4028da1b596c0a1b01596c0b026f0000');
INSERT INTO `t_income` VALUES ('4028da1b596c38fa01596c3b4f4e0001', '402880a059696b510159696cacc80000', '2017-01-05 09:25:43', '交了预定报名费为500.0', '500', '2028da1b592568aa015925803c1faa21', '4028da1b596c38fa01596c3b4ec70000');
INSERT INTO `t_income` VALUES ('4028da1b596c464701596c4713320001', '4028da1b596c13a101596c140bd70000', '2017-01-05 09:38:34', '交了正式报名费为4000.0', '4000', '2028da1b592568aa015925803c1faa21', '4028da1b596c464701596c4712160000');

-- ----------------------------
-- Table structure for t_incometype
-- ----------------------------
DROP TABLE IF EXISTS `t_incometype`;
CREATE TABLE `t_incometype` (
  `incometypeid` varchar(32) NOT NULL COMMENT '收入类别编号',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `des` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`incometypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_incometype
-- ----------------------------
INSERT INTO `t_incometype` VALUES ('402880a059696b510159696cacc80000', '预定报名费', '9999', '1');
INSERT INTO `t_incometype` VALUES ('4028da1b596c13a101596c140bd70000', '正式报名费', '66666', '1');

-- ----------------------------
-- Table structure for t_job
-- ----------------------------
DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job` (
  `jobid` varchar(32) NOT NULL COMMENT '工作编号',
  `stuid` varchar(32) NOT NULL COMMENT '学生编号',
  `company` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `jobtitle` varchar(50) DEFAULT NULL COMMENT '职位',
  `salary` double DEFAULT NULL COMMENT '月薪',
  `welfare` varchar(255) DEFAULT NULL COMMENT '福利待遇',
  `address` varchar(255) DEFAULT NULL COMMENT '公司地址',
  `comphone` varchar(11) DEFAULT NULL COMMENT '公司联系方式',
  `hireday` datetime DEFAULT NULL COMMENT '入职时间',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用状态',
  PRIMARY KEY (`jobid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_job
-- ----------------------------
INSERT INTO `t_job` VALUES ('4028da1b592568aa015925803c1f4541', '4028da1b592568aa015925803c1f0001', '华为', '程序员', '5000', '200', '深圳', '0021', '2016-12-30 10:20:48', '1');

-- ----------------------------
-- Table structure for t_meetting
-- ----------------------------
DROP TABLE IF EXISTS `t_meetting`;
CREATE TABLE `t_meetting` (
  `meettingid` varchar(32) NOT NULL COMMENT '研讨会编号',
  `empid` varchar(32) NOT NULL COMMENT '主持人编号（员工编号）',
  `meettingday` datetime DEFAULT NULL COMMENT '研讨会时间',
  `createdday` datetime DEFAULT NULL COMMENT '添加时间',
  `des` varchar(500) DEFAULT NULL COMMENT '研讨会详情',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`meettingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_meetting
-- ----------------------------
INSERT INTO `t_meetting` VALUES ('402880a05973a584015973aaa45d0000', '4028da1b592568aa015925803c1f3001', '2017-01-06 20:04:24', '2017-01-06 20:04:28', '不会啊', '1');
INSERT INTO `t_meetting` VALUES ('402880a05973a584015973ab9bb20001', '40246a1b592568aa0159258aaa1f3221', '2017-01-06 20:05:36', '2017-01-06 20:05:38', 'uuuu', '1');
INSERT INTO `t_meetting` VALUES ('402880a05973a584015973ac9c540002', '2028da1b592568aa015925803c1faa21', '2017-01-16 20:06:39', '2017-01-11 20:06:45', '玩玩', '1');

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `noticeid` varchar(32) NOT NULL COMMENT '公告编号',
  `name` varchar(50) DEFAULT NULL COMMENT '公告标题',
  `des` varchar(500) DEFAULT NULL COMMENT '公告详情',
  `typeid` varchar(32) NOT NULL COMMENT '公告类型',
  `noticeday` datetime DEFAULT NULL COMMENT '发布时间',
  `empid` varchar(32) NOT NULL COMMENT '发布人',
  `status` int(11) DEFAULT NULL COMMENT '状态 默认为1',
  PRIMARY KEY (`noticeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('4028da1b596d7e5101596d850db90002', '元旦放假', '1号放假到3号', '4028da1b596d7e5101596d8292060000', '2017-01-05 15:24:08', '40246a1b592568aa0159258aaa1f3221', '0');

-- ----------------------------
-- Table structure for t_noticetype
-- ----------------------------
DROP TABLE IF EXISTS `t_noticetype`;
CREATE TABLE `t_noticetype` (
  `noticetypeid` varchar(32) NOT NULL COMMENT '公告类型编号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `des` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`noticetypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_noticetype
-- ----------------------------
INSERT INTO `t_noticetype` VALUES ('402880a0596d585d01596d596ac30000', '5678', 'qwerty', '1');
INSERT INTO `t_noticetype` VALUES ('4028da1b594ec23901594ed3be7a0001', 'haha', 'dfdfdf', '1');
INSERT INTO `t_noticetype` VALUES ('4028da1b596d7e5101596d8292060000', '放假通知', '这是一个放假通知', '1');

-- ----------------------------
-- Table structure for t_pay
-- ----------------------------
DROP TABLE IF EXISTS `t_pay`;
CREATE TABLE `t_pay` (
  `payid` varchar(32) NOT NULL COMMENT '支出编号',
  `paytypeid` varchar(32) NOT NULL COMMENT '支出类别编号',
  `payday` datetime DEFAULT NULL COMMENT '支出时间',
  `des` varchar(255) DEFAULT NULL COMMENT '描述',
  `pay` double DEFAULT NULL COMMENT '支出金额',
  `empid` varchar(32) DEFAULT NULL COMMENT '员工编号',
  `toname` varchar(50) DEFAULT NULL COMMENT '收款人姓名',
  `tophone` varchar(11) DEFAULT NULL COMMENT '收款人联系方式',
  PRIMARY KEY (`payid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pay
-- ----------------------------

-- ----------------------------
-- Table structure for t_paytype
-- ----------------------------
DROP TABLE IF EXISTS `t_paytype`;
CREATE TABLE `t_paytype` (
  `paytypeid` varchar(32) NOT NULL COMMENT '支出类别编号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `des` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`paytypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_paytype
-- ----------------------------
INSERT INTO `t_paytype` VALUES ('402880a0595f017e01595f02a23d0000', '水电费地方', '宿舍', '1');
INSERT INTO `t_paytype` VALUES ('402880a0595f017e01595f0e7f220001', '啊啊啊', 'ghhghh ', '1');
INSERT INTO `t_paytype` VALUES ('402880a0595f017e01595f0ea1660002', '都是', '多方的', '1');

-- ----------------------------
-- Table structure for t_progress
-- ----------------------------
DROP TABLE IF EXISTS `t_progress`;
CREATE TABLE `t_progress` (
  `progressid` varchar(32) NOT NULL COMMENT '课程进度编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `gradeid` varchar(32) NOT NULL COMMENT '班级编号',
  `des` varchar(500) DEFAULT NULL COMMENT '进度详情',
  `progressday` datetime DEFAULT NULL COMMENT '添加进度的时间',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`progressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_progress
-- ----------------------------
INSERT INTO `t_progress` VALUES ('402880a05967818a015967825e1a0000', '40246a1b592568aa0159258aaa1f3221', '4028da1b594a913301594a95f8cf0001', '非凡哥', '2017-01-04 11:25:11', '1');

-- ----------------------------
-- Table structure for t_report
-- ----------------------------
DROP TABLE IF EXISTS `t_report`;
CREATE TABLE `t_report` (
  `reportid` varchar(32) NOT NULL COMMENT '工作日志编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `reportday` datetime DEFAULT NULL COMMENT '日志时间',
  `des` varchar(500) DEFAULT NULL COMMENT '描述',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`reportid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_report
-- ----------------------------

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `roleid` varchar(32) NOT NULL COMMENT '角色编号',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `des` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('402880a05980c08f015980ce4a200000', '学生', '学生描述', '1');
INSERT INTO `t_role` VALUES ('4028da1b592568aa015925803c1bac21', '辅导老师', '辅导', '1');
INSERT INTO `t_role` VALUES ('4028da1b592568aa015925803c1faa21', '任课老师', '专业', '1');
INSERT INTO `t_role` VALUES ('4028da1b592568aa0159258aaa1f3221', '班主任', '班主任', '1');
INSERT INTO `t_role` VALUES ('4028da1b5976b929015976e786590002', '后勤部主任', '管理东西', '1');
INSERT INTO `t_role` VALUES ('4028da1b5976b929015976e81bf90003', '财务部主任', '管理钱', '1');
INSERT INTO `t_role` VALUES ('4028da1b5976b929015976e8f3c70004', '行政部主任', '管理层', '1');
INSERT INTO `t_role` VALUES ('4028da1b5976b929015976e992840005', '总经理', '老大', '1');
INSERT INTO `t_role` VALUES ('4028da1b5976b929015976e9f58e0006', '招生老师', '招生', '1');
INSERT INTO `t_role` VALUES ('4028da1b5976b929015976ea96bf0007', '教务部主任', '教课', '1');
INSERT INTO `t_role` VALUES ('4028da1b5976b929015976edf2770008', '招生部主任', '招生', '1');

-- ----------------------------
-- Table structure for t_roleaut
-- ----------------------------
DROP TABLE IF EXISTS `t_roleaut`;
CREATE TABLE `t_roleaut` (
  `autrolid` int(11) NOT NULL AUTO_INCREMENT,
  `autid` int(11) DEFAULT NULL,
  `roleid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`autrolid`)
) ENGINE=InnoDB AUTO_INCREMENT=672 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_roleaut
-- ----------------------------
INSERT INTO `t_roleaut` VALUES ('1', '131', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('2', '132', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('3', '133', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('4', '134', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('5', '135', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('6', '136', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('7', '137', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('8', '84', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('9', '85', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('10', '86', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('11', '87', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('12', '88', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('13', '89', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('14', '202', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('15', '203', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('16', '204', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('17', '205', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('18', '206', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('19', '207', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('20', '208', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('21', '209', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('22', '210', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('23', '211', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('24', '212', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('25', '213', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('26', '214', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('27', '215', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('28', '216', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('29', '217', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('30', '218', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('31', '219', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('32', '220', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('33', '221', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('34', '93', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('35', '94', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('36', '95', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('37', '96', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('38', '97', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('39', '98', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('40', '79', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('41', '80', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('42', '81', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('43', '82', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('44', '83', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('45', '57', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('46', '66', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('47', '68', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('48', '69', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('49', '70', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('50', '74', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('51', '81', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('52', '80', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('53', '224', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('54', '33', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('55', '24', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('56', '41', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('57', '159', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('58', '7', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('59', '8', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('60', '9', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('61', '222', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('62', '35', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('63', '36', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('64', '1', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('65', '174', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('66', '181', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('67', '183', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('68', '184', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('69', '166', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('70', '167', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('71', '168', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('72', '169', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('73', '170', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('74', '171', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('75', '165', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('76', '173', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('77', '190', '402880a05980c08f015980ce4a200000');
INSERT INTO `t_roleaut` VALUES ('78', '191', '402880a05980c08f015980ce4a200000');
INSERT INTO `t_roleaut` VALUES ('79', '192', '402880a05980c08f015980ce4a200000');
INSERT INTO `t_roleaut` VALUES ('80', '131', '402880a05980c08f015980ce4a200000');
INSERT INTO `t_roleaut` VALUES ('81', '131', '402880a05980c08f015980ce4a200000');
INSERT INTO `t_roleaut` VALUES ('82', '93', '402880a05980c08f015980ce4a200000');
INSERT INTO `t_roleaut` VALUES ('83', '95', '402880a05980c08f015980ce4a200000');
INSERT INTO `t_roleaut` VALUES ('84', '96', '402880a05980c08f015980ce4a200000');
INSERT INTO `t_roleaut` VALUES ('85', '184', '402880a05980c08f015980ce4a200000');
INSERT INTO `t_roleaut` VALUES ('86', '189', '402880a05980c08f015980ce4a200000');
INSERT INTO `t_roleaut` VALUES ('87', '36', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('88', '35', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('89', '129', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('90', '130', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('91', '131', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('92', '136', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('93', '137', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('94', '215', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('95', '216', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('96', '217', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('97', '218', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('98', '219', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('99', '220', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('100', '81', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('101', '80', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('102', '83', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('103', '57', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('104', '68', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('105', '69', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('106', '70', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('107', '66', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('108', '71', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('109', '72', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('110', '73', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('111', '74', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('112', '75', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('113', '76', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('114', '78', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('115', '63', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('116', '62', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('117', '26', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('118', '23', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('119', '27', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('120', '32', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('121', '24', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('122', '25', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('123', '33', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('124', '30', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('125', '31', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('126', '40', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('127', '43', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('128', '9', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('129', '10', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('130', '16', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('131', '17', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('132', '11', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('133', '12', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('134', '13', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('135', '14', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('136', '15', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('137', '20', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('138', '21', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('139', '22', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('140', '38', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('141', '39', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('142', '44', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('143', '45', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('144', '168', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('145', '169', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('146', '167', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('147', '172', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('148', '173', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('149', '170', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('150', '171', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('151', '184', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('152', '183', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('153', '189', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('154', '179', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('155', '180', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('156', '181', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('157', '182', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('158', '1', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('159', '37', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('160', '45', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('161', '193', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('162', '194', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('163', '210', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('164', '211', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('165', '214', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('166', '93', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('167', '95', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('168', '96', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('169', '53', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('170', '98', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('171', '139', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('172', '145', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('173', '140', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('174', '146', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('175', '143', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('176', '141', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('177', '142', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('178', '144', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('179', '147', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('180', '132', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('181', '134', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('182', '135', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('183', '79', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('184', '65', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('185', '67', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('186', '124', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('187', '125', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('188', '126', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('189', '127', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('190', '128', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('191', '129', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('192', '130', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('193', '131', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('194', '136', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('195', '137', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('196', '84', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('197', '85', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('198', '86', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('199', '87', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('200', '88', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('201', '89', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('202', '90', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('203', '91', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('204', '92', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('205', '215', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('206', '216', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('207', '217', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('208', '220', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('209', '218', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('210', '219', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('211', '81', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('212', '80', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('213', '83', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('214', '82', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('215', '55', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('216', '68', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('217', '59', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('218', '56', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('219', '57', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('220', '58', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('221', '69', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('222', '70', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('223', '66', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('224', '71', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('225', '72', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('226', '73', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('227', '74', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('228', '75', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('229', '76', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('230', '78', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('231', '63', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('232', '62', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('233', '64', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('234', '26', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('235', '23', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('236', '29', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('237', '27', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('238', '32', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('239', '24', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('240', '25', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('241', '33', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('242', '34', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('243', '30', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('244', '31', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('245', '40', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('246', '41', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('247', '42', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('248', '43', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('249', '9', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('250', '10', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('251', '16', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('252', '17', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('253', '11', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('254', '12', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('255', '13', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('256', '14', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('257', '15', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('258', '22', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('259', '20', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('260', '21', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('261', '38', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('262', '39', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('263', '44', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('264', '45', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('265', '168', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('266', '169', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('267', '167', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('268', '172', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('269', '173', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('270', '170', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('271', '171', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('272', '184', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('273', '183', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('274', '189', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('275', '179', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('276', '180', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('277', '181', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('278', '182', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('279', '1', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('280', '37', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('281', '45', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('282', '193', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('283', '194', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('284', '210', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('285', '211', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('286', '214', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('287', '96', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('288', '98', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('289', '93', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('290', '95', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('291', '53', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('292', '54', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('293', '22', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('294', '36', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('295', '35', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('296', '1', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('297', '2', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('298', '3', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('299', '4', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('300', '5', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('301', '6', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('302', '7', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('303', '8', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('304', '9', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('305', '11', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('306', '12', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('307', '13', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('308', '14', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('309', '15', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('310', '22', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('311', '23', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('312', '24', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('313', '25', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('314', '28', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('315', '33', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('316', '34', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('317', '36', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('318', '37', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('319', '40', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('320', '41', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('321', '44', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('322', '45', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('323', '53', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('324', '54', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('325', '55', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('326', '57', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('327', '60', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('328', '61', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('329', '62', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('330', '63', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('331', '64', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('332', '65', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('333', '66', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('334', '67', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('335', '71', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('336', '72', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('337', '73', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('338', '74', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('339', '75', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('340', '76', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('341', '79', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('342', '80', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('343', '81', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('344', '82', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('345', '83', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('346', '84', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('347', '85', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('348', '86', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('349', '87', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('350', '88', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('351', '89', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('352', '90', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('353', '93', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('354', '94', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('355', '95', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('356', '97', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('357', '98', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('358', '112', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('359', '115', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('360', '116', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('361', '131', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('362', '132', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('363', '133', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('364', '134', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('365', '135', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('366', '136', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('367', '137', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('368', '159', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('369', '165', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('370', '166', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('371', '167', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('372', '168', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('373', '169', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('374', '170', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('375', '171', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('376', '172', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('377', '173', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('378', '174', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('379', '175', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('380', '176', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('381', '177', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('382', '178', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('383', '179', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('384', '180', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('385', '181', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('386', '182', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('387', '183', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('388', '184', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('389', '185', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('390', '186', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('391', '187', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('392', '188', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('393', '189', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('394', '193', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('395', '194', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('396', '196', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('397', '197', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('398', '198', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('399', '199', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('400', '200', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('401', '201', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('402', '210', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('403', '207', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('404', '211', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('405', '214', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('406', '215', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('407', '216', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('408', '217', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('409', '218', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('410', '219', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('411', '22', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('412', '224', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('413', '225', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('414', '226', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('415', '227', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('416', '1', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('417', '2', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('418', '3', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('419', '4', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('420', '5', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('421', '6', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('422', '7', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('423', '8', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('424', '9', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('425', '10', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('426', '11', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('427', '12', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('428', '13', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('429', '14', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('430', '15', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('431', '22', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('432', '23', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('433', '24', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('434', '25', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('435', '28', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('436', '33', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('437', '34', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('438', '35', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('439', '36', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('440', '37', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('441', '38', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('442', '39', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('443', '40', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('444', '41', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('445', '44', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('446', '45', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('447', '53', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('448', '54', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('449', '55', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('450', '57', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('451', '61', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('452', '62', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('453', '63', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('454', '64', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('455', '65', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('456', '66', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('457', '67', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('458', '71', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('459', '72', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('460', '73', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('461', '74', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('462', '75', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('463', '76', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('464', '80', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('465', '81', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('466', '83', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('467', '90', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('468', '91', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('469', '92', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('470', '93', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('471', '94', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('472', '95', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('473', '96', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('474', '97', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('475', '98', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('476', '112', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('477', '116', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('478', '131', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('479', '136', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('480', '137', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('481', '164', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('482', '165', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('483', '166', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('484', '167', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('485', '168', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('486', '169', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('487', '170', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('488', '171', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('489', '172', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('490', '173', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('491', '174', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('492', '179', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('493', '180', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('494', '182', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('495', '183', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('496', '184', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('497', '185', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('498', '186', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('499', '187', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('500', '188', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('501', '189', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('502', '193', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('503', '194', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('504', '196', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('505', '197', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('506', '198', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('507', '199', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('508', '200', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('509', '201', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('510', '210', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('511', '211', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('512', '214', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('513', '215', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('514', '216', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('515', '217', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('516', '218', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('517', '219', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('518', '220', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('519', '224', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('520', '225', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('521', '226', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('522', '227', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('523', '1', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('524', '5', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('525', '6', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('526', '8', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('527', '11', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('528', '12', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('529', '13', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('530', '14', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('531', '15', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('532', '22', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('533', '23', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('534', '24', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('535', '25', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('536', '28', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('537', '33', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('538', '34', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('539', '35', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('540', '36', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('541', '37', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('542', '38', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('543', '39', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('544', '40', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('545', '41', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('546', '44', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('547', '45', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('548', '53', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('549', '54', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('550', '55', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('551', '57', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('552', '61', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('553', '62', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('554', '63', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('555', '64', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('556', '65', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('557', '66', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('558', '67', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('559', '71', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('560', '72', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('561', '73', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('562', '74', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('563', '75', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('564', '76', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('565', '80', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('566', '81', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('567', '83', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('568', '90', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('569', '91', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('570', '92', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('571', '93', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('572', '94', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('573', '95', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('574', '96', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('575', '97', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('576', '98', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('577', '112', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('578', '115', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('579', '116', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('580', '131', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('581', '136', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('582', '137', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('583', '159', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('584', '164', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('585', '165', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('586', '166', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('587', '167', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('588', '168', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('589', '169', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('590', '170', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('591', '171', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('592', '172', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('593', '173', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('594', '174', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('595', '179', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('596', '180', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('597', '181', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('598', '182', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('599', '183', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('600', '184', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('601', '189', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('602', '193', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('603', '194', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('604', '196', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('605', '197', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('606', '198', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('607', '199', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('608', '200', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('609', '201', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('610', '210', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('611', '211', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('612', '214', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('613', '215', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('614', '216', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('615', '217', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('616', '218', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('617', '219', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('618', '220', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('619', '224', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('620', '225', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('621', '226', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('622', '227', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('623', '132', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('624', '133', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('625', '131', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('626', '134', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('627', '135', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('628', '53', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('629', '84', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('630', '86', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('631', '87', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('632', '88', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('633', '210', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('634', '95', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('635', '96', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('636', '215', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('637', '216', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('638', '217', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('639', '218', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('640', '219', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('641', '81', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('642', '86', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('643', '83', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('644', '82', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('645', '57', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('646', '76', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('647', '24', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('648', '23', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('649', '39', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('650', '159', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('651', '193', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('652', '9', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('653', '8', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('654', '36', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('655', '45', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('656', '1', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('657', '174', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('658', '184', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('659', '168', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('660', '169', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('661', '172', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('662', '170', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('663', '171', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('664', '112', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('665', '116', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('666', '224', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('667', '225', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('668', '5', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('669', '223', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('670', '18', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('671', '19', '4028da1b5976b929015976edf2770008');

-- ----------------------------
-- Table structure for t_room
-- ----------------------------
DROP TABLE IF EXISTS `t_room`;
CREATE TABLE `t_room` (
  `roomid` varchar(32) NOT NULL COMMENT '宿舍编号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `stuid` varchar(32) DEFAULT NULL COMMENT '宿舍长编号',
  `quantity` int(11) NOT NULL COMMENT '宿舍最大人数',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`roomid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_room
-- ----------------------------
INSERT INTO `t_room` VALUES ('402880a05938a44b015938a5a3820000', '8栋301', null, '4', '1');
INSERT INTO `t_room` VALUES ('4028da1b592568aa015925803c1f0001', '8栋201', null, '8', '1');
INSERT INTO `t_room` VALUES ('4028da1b592581fa015925839df90001', '8栋202', null, '10', '1');
INSERT INTO `t_room` VALUES ('4028da1b596d472c01596d5739d90000', '303', null, '12', '1');

-- ----------------------------
-- Table structure for t_salary
-- ----------------------------
DROP TABLE IF EXISTS `t_salary`;
CREATE TABLE `t_salary` (
  `salaryid` varchar(32) NOT NULL COMMENT '工资发放编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `extrasalary` double DEFAULT NULL COMMENT '奖励',
  `subsalary` double DEFAULT NULL COMMENT '扣罚',
  `salaryday` datetime DEFAULT NULL COMMENT '发放时间',
  `totalsalary` double DEFAULT NULL COMMENT '总工资',
  PRIMARY KEY (`salaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_salary
-- ----------------------------
INSERT INTO `t_salary` VALUES ('402880a05976548e0159765936f40000', '40246a1b592568aa0159258aaa1f3221', '1', '1', '2017-01-07 08:34:35', '0');

-- ----------------------------
-- Table structure for t_salaryinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_salaryinfo`;
CREATE TABLE `t_salaryinfo` (
  `salaryinfoid` varchar(32) NOT NULL COMMENT '工资情况编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `basicsalary` double NOT NULL COMMENT '基本工资',
  `jobsalary` double NOT NULL COMMENT '岗位工资',
  PRIMARY KEY (`salaryinfoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_salaryinfo
-- ----------------------------
INSERT INTO `t_salaryinfo` VALUES ('402880a0596c49b401596c90f3df0000', '2028da1b592568aa015925803c1faa21', '0', '0');

-- ----------------------------
-- Table structure for t_score
-- ----------------------------
DROP TABLE IF EXISTS `t_score`;
CREATE TABLE `t_score` (
  `scoreid` varchar(32) NOT NULL COMMENT '成绩编号',
  `stuid` varchar(32) NOT NULL COMMENT '学生编号',
  `courseid` varchar(32) NOT NULL COMMENT '课程编号',
  `score` float DEFAULT NULL COMMENT '成绩',
  `testday` datetime DEFAULT NULL COMMENT '考试时间',
  PRIMARY KEY (`scoreid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_score
-- ----------------------------
INSERT INTO `t_score` VALUES ('4028da1b592568aa015925803c1f0qwe', '4028da1b592568aa015925803c1f0001', '402880a05943161f0159431976190001', '90', '2016-12-28 15:08:20');
INSERT INTO `t_score` VALUES ('4028da1b592568aa015925803c1fjkfj', '4028da1b592568aa015925803c1f0001', '402880a05943161f015943177c450000', '80', '2017-01-06 10:25:03');

-- ----------------------------
-- Table structure for t_stu
-- ----------------------------
DROP TABLE IF EXISTS `t_stu`;
CREATE TABLE `t_stu` (
  `stuid` varchar(32) NOT NULL COMMENT '学生编号',
  `stuno` varchar(20) DEFAULT NULL COMMENT '学号',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `pwd` varchar(50) DEFAULT NULL COMMENT '密码',
  `idcard` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `phone` varchar(11) NOT NULL COMMENT '手机号',
  `qq` varchar(20) DEFAULT NULL COMMENT 'qq号',
  `wechat` varchar(50) DEFAULT NULL COMMENT '微信号',
  `school` varchar(50) DEFAULT NULL COMMENT '毕业学校',
  `age` int(11) NOT NULL COMMENT '年龄',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `gender` varchar(5) NOT NULL COMMENT '性别',
  `address` varchar(255) DEFAULT NULL COMMENT '家庭地址',
  `nation` varchar(20) DEFAULT NULL COMMENT '籍贯',
  `residence` varchar(10) DEFAULT NULL COMMENT '户口性质',
  `gradeid` varchar(32) DEFAULT NULL COMMENT '班级编号',
  `roomid` varchar(32) DEFAULT NULL COMMENT '宿舍编号',
  `parentname` varchar(20) DEFAULT NULL COMMENT '家长姓名',
  `parentphone` varchar(11) DEFAULT NULL COMMENT '家长手机号',
  `startday` datetime DEFAULT NULL COMMENT '入学时间',
  `empid` varchar(32) DEFAULT '' COMMENT '招生老师',
  `des` varchar(500) DEFAULT NULL COMMENT '描述',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  `stustatus` varchar(10) DEFAULT NULL COMMENT '学生状态，包括"意向","预定","正式"',
  `role` varchar(25) DEFAULT NULL COMMENT '班干部角色',
  PRIMARY KEY (`stuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_stu
-- ----------------------------
INSERT INTO `t_stu` VALUES ('402880a058fb297e0158fb29afa20000', '1232', '小米', null, '333333333330000000', '12324354767', '11111111', '1243', '11111', '0', null, '男', 'null', null, null, '4028da1b592568aa015925803c1f0002', '4028da1b592568aa015925803c1f0001', '变电', '77787878787', '2017-01-09 08:07:14', null, null, '1', '正式', null);
INSERT INTO `t_stu` VALUES ('402880a0592b89d701592b8a3eb30000', '999', '熊海', null, '345656656565565653', '12323232343', '234', '不告诉', '水电费水电费', '0', null, '男', '不告诉', null, null, '4028da1b592568aa015925803c1f0002', '402880a05938a44b015938a5a3820000', '你猜', '不告诉', '2017-01-06 00:00:00', null, null, '1', '正式', null);
INSERT INTO `t_stu` VALUES ('402880a0596dcc1f01596dce31390000', null, '小哈', null, null, '23', '1233434', null, '243', '12', null, '女', null, null, null, null, null, null, null, null, null, null, '1', '正式', null);
INSERT INTO `t_stu` VALUES ('402880a35986431201598650bf810001', null, '礼物', null, null, '123434', '12324', null, '问问', '12', null, '男', null, null, null, null, null, null, null, null, null, null, '1', '预定', null);
INSERT INTO `t_stu` VALUES ('402880a35986601f015986614be10001', null, '去问问', null, null, '123243', '12', null, '1232', '123', null, '男', null, null, null, null, null, null, null, null, null, null, '1', '意向', null);
INSERT INTO `t_stu` VALUES ('402880a35986691e01598669d89f0000', null, '小号', null, null, '34343', '12334334', null, '请问', '15', null, '男', null, null, null, null, null, null, null, null, null, null, '1', '意向', null);
INSERT INTO `t_stu` VALUES ('402880a359866f500159867021890000', null, '肥嘟嘟', null, null, '23334', '1234545', null, '热热', '15', null, '男', null, null, null, null, null, null, null, null, '2028da1b592568aa015925803c1faa21', null, '1', '预定', null);
INSERT INTO `t_stu` VALUES ('402880a35986730301598674923e0001', null, '哦写入', null, null, '123434', '12354', null, '耳热', '15', null, '男', null, null, null, null, null, null, null, null, '2028da1b592568aa015925803c1faa21', null, '1', '预定', null);
INSERT INTO `t_stu` VALUES ('402880a3598676e60159867a1d0d0001', '23434', '耳热', '4QrcOUm6Wau+VuBX8g+IPg==', '12434', '1234344', '13454', null, '5454545', '16', null, '男', '人人通', null, null, null, null, null, null, null, '2028da1b592568aa015925803c1faa21', null, '1', '正式', null);
INSERT INTO `t_stu` VALUES ('402881e8596eefae01596ef4747b0000', '23232', '太君', null, '323232343434455433', '12323311123', '234343', '的对待', '地方大幅度', '0', null, '男', '打发打发', null, null, '4028da1b592568aa015925803c1f0002', '4028da1b592568aa015925803c1f0001', '宿舍', '宿舍', '2017-01-09 08:08:50', null, null, '1', '正式', null);
INSERT INTO `t_stu` VALUES ('402881e8596ef58701596ef7f3440000', '123', '太君', '4QrcOUm6Wau+VuBX8g+IPg==', '33434', '3434', '12', null, '打发打发', '12', null, '男', '23', null, null, '4028da1b592568aa015925803c1f0002', '4028da1b592568aa015925803c1f0001', null, null, null, null, null, '1', '正式', null);
INSERT INTO `t_stu` VALUES ('4028da1b592568aa015925803c1f0001', '1223', '郭昶', null, '12234', '12334', '1233435', 'null', 'dfddfd', '0', null, '男', '地方撒旦', null, null, '2028da1b592568aa015925803c1f3784', '4028da1b592568aa015925803c1f0001', '奥斯卡好地方', '12234234', '2016-12-27 00:00:00', null, null, '1', '正式', null);
INSERT INTO `t_stu` VALUES ('4028da1b592581fa015925839df90000', '12343', '小啊', null, 'wef', '12323423434', '12324', '12323', 'we', '0', null, '女', 'ewf', null, null, '2028da1b592568aa015925803c1f3784', '4028da1b592568aa015925803c1f0001', 'ef', 'efw', '2016-12-27 00:00:00', null, null, '1', '正式', null);
INSERT INTO `t_stu` VALUES ('4028da1b593f73aa01593f761d600000', '56564', '小明', null, '423445455', '11111', '124234354', 'null', '11111', '0', null, '男', '123', null, null, '2028da1b592568aa015925803c1f3784', null, 'dfd', '12432', '2016-12-27 00:00:00', null, null, '1', '正式', null);
INSERT INTO `t_stu` VALUES ('4028da1b5961a403015961a60d880000', '12323', '啊啊太君', null, '39438493484', '1234455455', '34324', 'null', '东风快递反馈', '0', null, '男', '多方的', null, null, '2028da1b592568aa015925803c1f3784', '4028da1b592581fa015925839df90001', 'null', 'null', '2017-01-03 00:00:00', null, null, '1', '正式', null);
INSERT INTO `t_stu` VALUES ('4028da1b5961a403015961a6cdf90001', null, '小艾', '4QrcOUm6Wau+VuBX8g+IPg==', '343545454', '1232324', '1322323', null, '收到第三方', '20', null, '女', '对方是否', null, null, '2028da1b592568aa015925803c1f3784', '4028da1b592581fa015925839df90001', null, null, null, null, null, '1', '正式', null);
INSERT INTO `t_stu` VALUES ('4028da1b5961dc0f015961de7c6f0000', null, '哈哈', '4QrcOUm6Wau+VuBX8g+IPg==', '4545454', '1123', '12323', null, '发顺丰v', '23', null, '男', '二恶', null, null, '4028da1b594a913301594a95f8cf0001', '4028da1b596d472c01596d5739d90000', null, null, null, null, null, '1', '正式', null);
INSERT INTO `t_stu` VALUES ('4028da1b596c464701596c4712160000', '123232', '张三', '4QrcOUm6Wau+VuBX8g+IPg==', '3454545', '1232321', '122', null, '驱蚊器翁', '23', null, '男', '阿诗丹顿', null, null, '4028da1b594a913301594a95f8cf0001', '4028da1b596d472c01596d5739d90000', null, null, null, null, null, '1', '正式', null);

-- ----------------------------
-- Table structure for t_stuchecking
-- ----------------------------
DROP TABLE IF EXISTS `t_stuchecking`;
CREATE TABLE `t_stuchecking` (
  `checkingid` varchar(32) NOT NULL COMMENT '学生考勤编号',
  `stuid` varchar(32) NOT NULL COMMENT '学生编号',
  `checkingday` datetime DEFAULT NULL COMMENT '考勤日期',
  `checking1` varchar(20) DEFAULT NULL COMMENT '上午',
  `checking2` varchar(20) DEFAULT NULL COMMENT '中午',
  `checking3` varchar(20) DEFAULT NULL COMMENT '下午',
  PRIMARY KEY (`checkingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_stuchecking
-- ----------------------------
INSERT INTO `t_stuchecking` VALUES ('4028da1b593f73aa01593f761d600023', '4028da1b592581fa015925839df90000', '2016-12-29 20:43:59', '5', '5', '5');

-- ----------------------------
-- Table structure for t_stufeedback
-- ----------------------------
DROP TABLE IF EXISTS `t_stufeedback`;
CREATE TABLE `t_stufeedback` (
  `feedbackid` varchar(32) NOT NULL COMMENT '反馈编号',
  `stuid` varchar(32) NOT NULL COMMENT '学生编号',
  `feedbackday` datetime DEFAULT NULL COMMENT '反馈时间',
  `des` varchar(500) DEFAULT NULL COMMENT '反馈详情',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认可用',
  PRIMARY KEY (`feedbackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_stufeedback
-- ----------------------------
INSERT INTO `t_stufeedback` VALUES ('4028da1b592581fa015925839df90044', '4028da1b592581fa015925839df90000', '2016-12-27 21:59:16', '。。。。', '1');
INSERT INTO `t_stufeedback` VALUES ('4028da1b592581fa015925839df94545', '4028da1b592581fa015925839df90000', '2016-12-27 22:46:14', '565656', '0');

-- ----------------------------
-- Table structure for t_stuleave
-- ----------------------------
DROP TABLE IF EXISTS `t_stuleave`;
CREATE TABLE `t_stuleave` (
  `leaveid` varchar(32) NOT NULL COMMENT '学生请假编号',
  `stuid` varchar(32) NOT NULL COMMENT '学生编号',
  `starttime` datetime DEFAULT NULL COMMENT '开始时间',
  `endtime` datetime DEFAULT NULL COMMENT '结束时间',
  `leaveday` datetime DEFAULT NULL COMMENT '提交时间',
  `des` varchar(255) DEFAULT NULL COMMENT '请假说明',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  `firlevel` int(11) DEFAULT '0' COMMENT '任课老师审核，默认不通过',
  `secondlevel` int(11) DEFAULT '0' COMMENT '班主任审核，默认不通过',
  `pass` int(11) DEFAULT '0' COMMENT '通过状态，默认为不通过',
  PRIMARY KEY (`leaveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_stuleave
-- ----------------------------
INSERT INTO `t_stuleave` VALUES ('4028da1b5961a403015961a6cdfjkjlk', '4028da1b5961a403015961a6cdf90001', '2017-01-04 19:52:42', '2017-01-04 19:52:45', '2017-01-04 19:52:48', '客户刷卡机东方红', '1', '0', '0', '0');

-- ----------------------------
-- Table structure for t_talk
-- ----------------------------
DROP TABLE IF EXISTS `t_talk`;
CREATE TABLE `t_talk` (
  `talkid` varchar(32) NOT NULL COMMENT '谈心编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `stuid` varchar(32) NOT NULL COMMENT '学生编号',
  `talkday` datetime DEFAULT NULL COMMENT '谈心时间',
  `des` varchar(500) DEFAULT NULL COMMENT '谈心详情',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用状态',
  PRIMARY KEY (`talkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_talk
-- ----------------------------
INSERT INTO `t_talk` VALUES ('4028da1b592568aa015925803c1fdhfj', '2028da1b592568aa015925803c1faa21', '4028da1b592568aa015925803c1f0001', '2016-12-30 11:32:20', '郭昶上体育课不和我打球', '1');
