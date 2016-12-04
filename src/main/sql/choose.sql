--创建数据库
create database choosecouse;

use choosecouse;
--创建表

create table student(
'sid' int not null auto_increment comment '学生学号',
'sname' varchar(20) not null comment '学生姓名',
'password' varchar(50) not null comment '登陆密码',
primary key(sid),
key idx_name(sname)

)engine=MyISAM default charset=utf8 comment='学生信息表'


--初始化数据
insert into student(sname,password)
values ('wangdong','550965989')

--创建课程列表

create table course(
'cid' int not null auto_increment comment '课程id',
'cname' varchar(20) not null comment '课程名称',
'number' int not null comment '课程最大人数',
'start_time' TIMESTAMP not null comment '选课开始时间',
'end_time' TIMESTAMP  not null comment '选课结束时间',
'create_time' TIMESTAMP not null default CURRENT_TIMESTAMP  on UPDATE  CURRENT_TIMESTAMP  comment '创建时间'，
PRIMARY KEY(cid),
  key idx_start_time(start_time),
  key idx_end_time(end_time),
  key idx_create_time(create_time)
)engine=InnoDB default charset=utf8 comment='选课库存表'

--初始化数据

insert into course(cname,number,start_time,end_time)
values

('数据结构',90,'2016-07-25 00:00:00','2017-07-26 00:00:00'),
('哲学通论',170,'2016-07-25 00:00:00','2017-07-26 00:00:00'),
('线性代数与空间几何4',300,'2016-07-25 00:00:00','2017-07-26 00:00:00'),
('数据库原理',400 ,'2016-07-25 00:00:00','2017-07-26 00:00:00')


--选课明细表
CREATE TABLE success_choose(
'cid' int not null comment '选择课程id',
'sid' int not null comment '学生学号',
'state' int not null default -1 comment '状态表示，-1代表无效，0代表成功',
'create_time' TIMESTAMP not NULL comment  '创建时间',
PRIMARY KEY (cid,sid),
KEY idx_create_time(create_time)
)engine=InnoDB DEFAULT charset=utf8 comment='选课明细表'
