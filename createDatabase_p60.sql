-- 1.
create database production_manager_system
on primary(
	name='production_manager_system',--数据文件的逻辑名称
	filename='E:\code\ExamSQLJZXU\data\production_manager_system.mdf',
	size=30mb,
	maxsize=unlimited,
	filegrowth=10%
),(
	name='production_manager_system_b',--数据文件的逻辑名称
	filename='E:\code\ExamSQLJZXU\data\production_manager_system_b.ndf',
	size=30mb,
	maxsize=unlimited,
	filegrowth=2mb
)
log on(
	name='production_manager_system_log',--数据文件的逻辑名称
	filename='E:\code\ExamSQLJZXU\log\production_manager_system_log.ldf',
	size=10mb,
	maxsize=unlimited,
	filegrowth=5mb
)
go

--2
alter database production_manager_system
add file(
	name='production_manager_system_b_2',--数据文件的逻辑名称
	filename='E:\code\ExamSQLJZXU\data\production_manager_system_b_2.ndf',
	size=10mb,
	maxsize=100mb,
	filegrowth=10%
)
go

--3
alter database production_manager_system
modify file(
	name='production_manager_system',--数据文件的逻辑名称
	size=50mb
)
go

