USE [db.hrms.netragenix.com]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[attendanceid] [int] IDENTITY(1,1) NOT NULL,
	[employeeid] [int] NULL,
	[employeecode] [nvarchar](50) NULL,
	[january] [int] NULL,
	[february] [int] NULL,
	[march] [int] NULL,
	[april] [int] NULL,
	[may] [int] NULL,
	[june] [int] NULL,
	[july] [int] NULL,
	[august] [int] NULL,
	[september] [int] NULL,
	[october] [int] NULL,
	[november] [int] NULL,
	[december] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[employeeid] [int] IDENTITY(1,1) NOT NULL,
	[employeecode] [nvarchar](50) NULL,
	[firstname] [nvarchar](50) NULL,
	[lastname] [nvarchar](50) NULL,
	[dateofbirth] [datetime] NULL,
	[joiningdate] [datetime] NULL,
	[mobile] [nvarchar](50) NULL,
	[emailid] [nvarchar](50) NULL,
	[gender] [nvarchar](50) NULL,
	[maritalstatus] [nvarchar](50) NULL,
	[employeetype] [nvarchar](50) NULL,
	[departmentid] [int] NULL,
	[positionid] [int] NULL,
	[imagename] [nvarchar](50) NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[usertype] [nvarchar](50) NULL,
	[address] [nvarchar](250) NULL,
	[status] [nvarchar](50) NULL,
	[isactive] [bit] NULL,
	[isdeleted] [bit] NULL,
	[createdby] [int] NULL,
	[createddate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vwGetAttendanceDetails]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwGetAttendanceDetails]
AS
SELECT        dbo.Employee.employeecode, dbo.Employee.firstname, dbo.Employee.lastname, dbo.Attendance.january, dbo.Attendance.february, dbo.Attendance.march, dbo.Attendance.april, dbo.Attendance.may, dbo.Attendance.june, 
                         dbo.Attendance.july, dbo.Attendance.august, dbo.Attendance.september, dbo.Attendance.october, dbo.Attendance.november, dbo.Attendance.december, dbo.Employee.isactive, dbo.Employee.isdeleted, 
                         dbo.Attendance.employeeid
FROM            dbo.Attendance LEFT OUTER JOIN
                         dbo.Employee ON dbo.Attendance.employeeid = dbo.Employee.employeeid
WHERE        (dbo.Employee.isactive = 1) AND (dbo.Employee.isdeleted = 0) AND (dbo.Employee.employeecode <> N'ADMIN-1000-JAN2018')

GO
/****** Object:  View [dbo].[vwGetAuthenticationDetails]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwGetAuthenticationDetails]
AS
SELECT        employeeid, firstname, lastname, username, password, usertype, imagename, isactive, isdeleted
FROM            dbo.Employee
WHERE        (isactive = 1) AND (isdeleted = 0)


GO
/****** Object:  Table [dbo].[Department]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[departmentid] [int] IDENTITY(1,1) NOT NULL,
	[departmentname] [nvarchar](50) NULL,
	[isactive] [bit] NULL,
	[isdeleted] [bit] NULL,
	[createdby] [int] NULL,
	[createddate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Position]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[positionid] [int] IDENTITY(1,1) NOT NULL,
	[positionname] [nvarchar](50) NULL,
	[isactive] [bit] NULL,
	[isdeleted] [bit] NULL,
	[createdby] [int] NULL,
	[createddate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vwGetBusinessDeskEmployees]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwGetBusinessDeskEmployees]
AS
SELECT        dbo.Employee.employeecode, dbo.Employee.firstname, dbo.Employee.lastname, dbo.Department.departmentname, dbo.Position.positionname, dbo.Employee.status, dbo.Employee.isactive, dbo.Employee.isdeleted
FROM            dbo.Employee LEFT OUTER JOIN
                         dbo.Position ON dbo.Employee.positionid = dbo.Position.positionid LEFT OUTER JOIN
                         dbo.Department ON dbo.Employee.departmentid = dbo.Department.departmentid
WHERE        (dbo.Employee.isdeleted = 0) AND (dbo.Employee.isactive = 1) AND (dbo.Employee.employeecode <> 'ADMIN-1000-JAN2018')


GO
/****** Object:  Table [dbo].[Document]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document](
	[documentid] [int] IDENTITY(1,1) NOT NULL,
	[documentname] [nvarchar](150) NULL,
	[documenttype] [nvarchar](50) NULL,
	[uploadeddate] [datetime] NULL,
	[uploadedby] [int] NULL,
	[departmentid] [int] NULL,
	[isactive] [bit] NULL,
	[createdby] [int] NULL,
	[createddate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vwGetDocumentDetails]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwGetDocumentDetails]
AS
SELECT        dbo.[Document].documentname, dbo.[Document].documenttype, dbo.[Document].uploadeddate, dbo.Department.departmentname, dbo.Employee.employeecode, dbo.Employee.firstname, dbo.Employee.lastname, 
                         dbo.Employee.isactive, dbo.Employee.isdeleted
FROM            dbo.[Document] LEFT OUTER JOIN
                         dbo.Department ON dbo.[Document].departmentid = dbo.Department.departmentid LEFT OUTER JOIN
                         dbo.Employee ON dbo.[Document].uploadedby = dbo.Employee.employeeid
WHERE        (dbo.Employee.isactive = 1) AND (dbo.Employee.isdeleted = 0)

GO
/****** Object:  Table [dbo].[Event]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[eventid] [int] IDENTITY(1,1) NOT NULL,
	[eventname] [nvarchar](150) NULL,
	[eventdescription] [text] NULL,
	[createdby] [int] NULL,
	[scheduledon] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[vwGetEventDetails]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwGetEventDetails]
AS
SELECT        dbo.Event.eventid, dbo.Event.eventname, dbo.Event.eventdescription, dbo.Event.scheduledon, dbo.Employee.firstname, dbo.Employee.lastname, dbo.Employee.isactive, dbo.Employee.isdeleted
FROM            dbo.Event INNER JOIN
                         dbo.Employee ON dbo.Event.createdby = dbo.Employee.employeeid
WHERE        (dbo.Employee.isactive = 1) AND (dbo.Employee.isdeleted = 0)


GO
/****** Object:  Table [dbo].[Leave]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leave](
	[leaveid] [int] IDENTITY(1,1) NOT NULL,
	[appliedon] [datetime] NULL,
	[appliedby] [int] NULL,
	[leavefrom] [datetime] NULL,
	[leaveto] [datetime] NULL,
	[reason] [nvarchar](150) NULL,
	[status] [nvarchar](50) NULL,
	[createdby] [int] NULL,
	[createddate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vwGetLeaveDetails]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwGetLeaveDetails]
AS
SELECT        dbo.Leave.leaveid, dbo.Leave.appliedon, dbo.Employee.employeecode, dbo.Employee.firstname, dbo.Employee.lastname, dbo.Leave.leavefrom, dbo.Leave.leaveto, dbo.Leave.status, dbo.Employee.employeeid, 
                         dbo.Leave.reason
FROM            dbo.Leave LEFT OUTER JOIN
                         dbo.Employee ON dbo.Leave.appliedby = dbo.Employee.employeeid


GO
/****** Object:  Table [dbo].[Message]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[messageid] [int] IDENTITY(1,1) NOT NULL,
	[sentto] [int] NULL,
	[messagecontents] [nvarchar](200) NULL,
	[sentby] [int] NULL,
	[sentdate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vwGetMessageDetails]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwGetMessageDetails]
AS
SELECT        dbo.Message.messageid, dbo.Message.sentto, dbo.Employee.employeecode AS senttoemployeecode, dbo.Employee.firstname AS senttofirstname, dbo.Employee.lastname AS senttolastname, dbo.Message.messagecontents, 
                         dbo.Message.sentdate, dbo.Message.sentby, Employee_1.employeecode AS sentbyemployeecode, Employee_1.firstname AS sentbyfirstname, Employee_1.lastname AS sentbylastname
FROM            dbo.Message LEFT OUTER JOIN
                         dbo.Employee AS Employee_1 ON dbo.Message.sentby = Employee_1.employeeid LEFT OUTER JOIN
                         dbo.Employee ON dbo.Message.sentto = dbo.Employee.employeeid


GO
/****** Object:  Table [dbo].[Payroll]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payroll](
	[payrollid] [int] IDENTITY(1,1) NOT NULL,
	[employeeid] [int] NULL,
	[grosssalary] [float] NULL,
	[netsalary] [float] NULL,
	[status] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vwGetPayrollDetails]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwGetPayrollDetails]
AS
SELECT        dbo.Employee.employeecode, dbo.Employee.firstname, dbo.Employee.lastname, dbo.Attendance.october, dbo.Payroll.grosssalary, dbo.Payroll.netsalary, dbo.Payroll.status, dbo.Employee.isactive, dbo.Employee.isdeleted, 
                         dbo.Employee.employeeid
FROM            dbo.Payroll LEFT OUTER JOIN
                         dbo.Attendance ON dbo.Payroll.employeeid = dbo.Attendance.employeeid LEFT OUTER JOIN
                         dbo.Employee ON dbo.Payroll.employeeid = dbo.Employee.employeeid
WHERE        (dbo.Employee.isactive = 1) AND (dbo.Employee.isdeleted = 0) AND (dbo.Employee.employeecode <> N'ADMIN-1000-JAN2018')

GO
/****** Object:  Table [dbo].[Performance]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Performance](
	[performanceid] [int] IDENTITY(1,1) NOT NULL,
	[employeeid] [int] NULL,
	[communication] [int] NULL,
	[conflictresolution] [int] NULL,
	[planning] [int] NULL,
	[problemsolving] [int] NULL,
	[management] [int] NULL,
	[employeecode] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vwGetPerformanceDetails]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwGetPerformanceDetails]
AS
SELECT        dbo.Employee.employeecode, dbo.Employee.firstname, dbo.Employee.lastname, dbo.Performance.communication, dbo.Performance.conflictresolution, dbo.Performance.planning, dbo.Performance.problemsolving, 
                         dbo.Performance.management, dbo.Employee.isactive, dbo.Employee.isdeleted, dbo.Employee.employeeid
FROM            dbo.Performance LEFT OUTER JOIN
                         dbo.Employee ON dbo.Performance.employeeid = dbo.Employee.employeeid
WHERE        (dbo.Employee.isactive = 1) AND (dbo.Employee.isdeleted = 0) AND (dbo.Employee.employeecode <> N'ADMIN-1000-JAN2018')

GO
/****** Object:  Table [dbo].[Recruitment]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recruitment](
	[recruitmentid] [int] IDENTITY(1,1) NOT NULL,
	[candidatename] [nvarchar](150) NULL,
	[interviewdate] [datetime] NULL,
	[confirmationdate] [datetime] NULL,
	[takenby] [int] NULL,
	[status] [nvarchar](50) NULL,
	[isactive] [bit] NULL,
	[isdeleted] [bit] NULL,
	[createdby] [int] NULL,
	[createddate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vwGetRecruitmentDetails]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwGetRecruitmentDetails]
AS
SELECT        dbo.Recruitment.candidatename, dbo.Recruitment.interviewdate, dbo.Recruitment.confirmationdate, dbo.Employee.firstname, dbo.Employee.lastname, dbo.Recruitment.status, dbo.Employee.isactive, 
                         dbo.Employee.isdeleted
FROM            dbo.Recruitment LEFT OUTER JOIN
                         dbo.Employee ON dbo.Recruitment.takenby = dbo.Employee.employeeid
WHERE        (dbo.Employee.isactive = 1) AND (dbo.Employee.isdeleted = 0)


GO
/****** Object:  Table [dbo].[Task]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[taskid] [int] IDENTITY(1,1) NOT NULL,
	[taskname] [nvarchar](150) NULL,
	[createdon] [datetime] NULL,
	[createdby] [int] NULL,
	[assignedto] [int] NULL,
	[status] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vwGetTaskDetails]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwGetTaskDetails]
AS
SELECT        dbo.Task.taskid, dbo.Task.taskname, dbo.Task.createdon, dbo.Task.createdby, dbo.Employee.employeecode AS createdbyemployeecode, dbo.Employee.firstname AS createdbyfirstname, 
                         dbo.Employee.lastname AS createdbylastname, dbo.Task.assignedto, Employee_1.employeecode AS assignedtoemployeecode, Employee_1.firstname AS assignedtofirstname, Employee_1.lastname AS assignedtolastname, 
                         dbo.Task.status
FROM            dbo.Task LEFT OUTER JOIN
                         dbo.Employee AS Employee_1 ON dbo.Task.assignedto = Employee_1.employeeid LEFT OUTER JOIN
                         dbo.Employee ON dbo.Task.createdby = dbo.Employee.employeeid


GO
/****** Object:  Table [dbo].[Training]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Training](
	[trainingid] [int] IDENTITY(1,1) NOT NULL,
	[trainingdate] [datetime] NULL,
	[scheduledate] [datetime] NULL,
	[particulars] [nvarchar](150) NULL,
	[raisedby] [int] NULL,
	[employeeid] [int] NULL,
	[createdby] [int] NULL,
	[createddate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vwGetTrainingDetails]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwGetTrainingDetails]
AS
SELECT        dbo.Employee.employeecode, dbo.Employee.firstname, dbo.Employee.lastname, dbo.Training.trainingdate, dbo.Training.scheduledate, dbo.Training.particulars, Employee_1.firstname AS raisedbyfirstname, 
                         Employee_1.lastname AS raisedbylastname, dbo.Employee.isactive, dbo.Employee.isdeleted, dbo.Employee.employeeid
FROM            dbo.Training LEFT OUTER JOIN
                         dbo.Employee AS Employee_1 ON dbo.Training.raisedby = Employee_1.employeeid LEFT OUTER JOIN
                         dbo.Employee ON dbo.Training.employeeid = dbo.Employee.employeeid
WHERE        (dbo.Employee.isactive = 1) AND (dbo.Employee.isdeleted = 0) AND (dbo.Employee.employeecode <> N'ADMIN-1000-JAN2018')

GO
/****** Object:  View [dbo].[vwGetWorkforceEmployees]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwGetWorkforceEmployees]
AS
SELECT        dbo.Employee.employeecode, dbo.Employee.firstname, dbo.Employee.lastname, dbo.Department.departmentname, dbo.Position.positionname, dbo.Employee.status, dbo.Employee.isactive, dbo.Employee.isdeleted, 
                         dbo.Employee.employeeid
FROM            dbo.Employee LEFT OUTER JOIN
                         dbo.Position ON dbo.Employee.positionid = dbo.Position.positionid LEFT OUTER JOIN
                         dbo.Department ON dbo.Employee.departmentid = dbo.Department.departmentid
WHERE        (dbo.Employee.isactive = 1) AND (dbo.Employee.isdeleted = 0) AND (dbo.Employee.employeecode <> N'ADMIN-1000-JAN2018')

GO
/****** Object:  View [dbo].[vwGetWorkforceEmployeesRawData]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwGetWorkforceEmployeesRawData]
AS
SELECT        employeeid, employeecode, firstname, lastname, dateofbirth, joiningdate, mobile, emailid, gender, maritalstatus, employeetype, departmentid, positionid, imagename, username, password, usertype, address, status, isactive, 
                         isdeleted, createdby, createddate
FROM            dbo.Employee
WHERE        (isactive = 1) AND (isdeleted = 0) AND (employeecode <> N'ADMIN-1000-JAN2018')


GO
/****** Object:  Table [dbo].[AttendanceLog]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttendanceLog](
	[attendancelogid] [int] IDENTITY(1,1) NOT NULL,
	[employeecode] [nvarchar](50) NULL,
	[loggeddate] [datetime] NULL,
	[status] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalaryStructure]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalaryStructure](
	[salaryid] [int] NOT NULL,
	[basic] [float] NULL,
	[hra] [float] NULL,
	[transportallowance] [float] NULL,
	[medicalexpenses] [float] NULL,
	[telephoneexpenses] [float] NOT NULL,
	[foodcoupons] [float] NULL,
	[giftvouchars] [float] NULL,
	[lta] [float] NULL,
	[flexipay] [float] NULL,
	[pf] [float] NULL,
	[incometax] [float] NULL,
	[loan] [float] NULL,
	[advances] [float] NULL,
	[employeecode] [nvarchar](50) NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Attendance] ON 

GO
INSERT [dbo].[Attendance] ([attendanceid], [employeeid], [employeecode], [january], [february], [march], [april], [may], [june], [july], [august], [september], [october], [november], [december]) VALUES (1, 1, N'NEN-0001-APR2018', 22, 21, 22, 22, 21, 20, 18, 22, 22, 10, 0, 0)
GO
INSERT [dbo].[Attendance] ([attendanceid], [employeeid], [employeecode], [january], [february], [march], [april], [may], [june], [july], [august], [september], [october], [november], [december]) VALUES (2, 3, N'REM-0002-MAY2018', 20, 22, 21, 21, 22, 22, 22, 21, 21, 11, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[Attendance] OFF
GO
SET IDENTITY_INSERT [dbo].[AttendanceLog] ON 

GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (1, N'NEN-0001-APR2018', CAST(N'2018-10-09T07:05:13.687' AS DateTime), N'1')
GO
SET IDENTITY_INSERT [dbo].[AttendanceLog] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

GO
INSERT [dbo].[Department] ([departmentid], [departmentname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (1, N'Information Technology', 1, 0, 1, CAST(N'2018-04-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Department] ([departmentid], [departmentname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (2, N'HR', 1, 0, 1, CAST(N'2018-04-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Department] ([departmentid], [departmentname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (3, N'Production', 1, 0, 1, CAST(N'2018-04-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Department] ([departmentid], [departmentname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (4, N'Compliance', 1, 0, 1, CAST(N'2018-04-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Department] ([departmentid], [departmentname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (5, N'Finance', 1, 0, 1, CAST(N'2018-04-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Department] ([departmentid], [departmentname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (6, N'Performance', 1, 0, 1, CAST(N'2018-04-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Department] ([departmentid], [departmentname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (7, N'Marketing', 1, 0, 1, CAST(N'2018-04-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Department] ([departmentid], [departmentname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (8, N'Accounts', 1, 0, 1, CAST(N'2018-04-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Department] ([departmentid], [departmentname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (9, N'Purchase', 1, 0, 1, CAST(N'2018-04-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Department] ([departmentid], [departmentname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (10, N'Reasearch&Development', 1, 0, 1, CAST(N'2018-04-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Department] ([departmentid], [departmentname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (11, N'Administration', 1, 0, 1, CAST(N'2018-04-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Department] ([departmentid], [departmentname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (12, N'Sales', 1, 0, 1, CAST(N'2018-04-22T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Document] ON 

GO
INSERT [dbo].[Document] ([documentid], [documentname], [documenttype], [uploadeddate], [uploadedby], [departmentid], [isactive], [createdby], [createddate]) VALUES (1, N'HRPolicy.docx', N'Word', CAST(N'2018-05-26T00:00:00.000' AS DateTime), 4, 1, 1, 1, CAST(N'2018-05-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Document] ([documentid], [documentname], [documenttype], [uploadeddate], [uploadedby], [departmentid], [isactive], [createdby], [createddate]) VALUES (2, N'HolidayList.docx', N'Word', CAST(N'2018-05-26T00:00:00.000' AS DateTime), 4, 1, 1, 1, CAST(N'2018-05-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Document] ([documentid], [documentname], [documenttype], [uploadeddate], [uploadedby], [departmentid], [isactive], [createdby], [createddate]) VALUES (3, N'ComplianceManual.docx', N'Word', CAST(N'2018-05-26T00:00:00.000' AS DateTime), 4, 1, 1, 1, CAST(N'2018-05-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Document] ([documentid], [documentname], [documenttype], [uploadeddate], [uploadedby], [departmentid], [isactive], [createdby], [createddate]) VALUES (4, N'CodeOfConduct.docx', N'Word', CAST(N'2018-05-26T00:00:00.000' AS DateTime), 4, 1, 1, 1, CAST(N'2018-05-30T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Document] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

GO
INSERT [dbo].[Employee] ([employeeid], [employeecode], [firstname], [lastname], [dateofbirth], [joiningdate], [mobile], [emailid], [gender], [maritalstatus], [employeetype], [departmentid], [positionid], [imagename], [username], [password], [usertype], [address], [status], [isactive], [isdeleted], [createdby], [createddate]) VALUES (1, N'NEN-0001-APR2018', N'Ninad', N'Manjrekar', CAST(N'1975-04-04T00:00:00.000' AS DateTime), CAST(N'2018-01-01T00:00:00.000' AS DateTime), N'7083738738', N'ninad.manjrekar@outlook.com', N'Male', N'Married', N'Full-Time', 1, 1, N'CorporateProfilePhoto.jpg', N'ninad.manjrekar@outlook.com', N'Pass@123', N'Employee', N'Vasai', N'Employed', 1, 0, 1, CAST(N'2018-04-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([employeeid], [employeecode], [firstname], [lastname], [dateofbirth], [joiningdate], [mobile], [emailid], [gender], [maritalstatus], [employeetype], [departmentid], [positionid], [imagename], [username], [password], [usertype], [address], [status], [isactive], [isdeleted], [createdby], [createddate]) VALUES (3, N'REM-0002-MAY2018', N'Ritesh', N'Varma', CAST(N'1987-01-01T00:00:00.000' AS DateTime), CAST(N'2018-01-01T00:00:00.000' AS DateTime), N'9819223344', N'ritesh.varma@gmail.com', N'Male', N'Married', N'Full-Time', 1, 3, N'NoImage.png', N'ritesh.varma@gmail.com', N'Pass@123', N'Employee', N'Mira Road, Thane.', N'Employed', 1, 0, 1, CAST(N'2018-10-06T16:06:19.480' AS DateTime))
GO
INSERT [dbo].[Employee] ([employeeid], [employeecode], [firstname], [lastname], [dateofbirth], [joiningdate], [mobile], [emailid], [gender], [maritalstatus], [employeetype], [departmentid], [positionid], [imagename], [username], [password], [usertype], [address], [status], [isactive], [isdeleted], [createdby], [createddate]) VALUES (4, N'ADMIN-1000-JAN2018', N'Administrator', N'Supervisor', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2018-01-01T00:00:00.000' AS DateTime), N'1111111111', N'crm@netragenix.com', N'Male', N'Single', N'Full-Time', 1, 1, N'Admin.png', N'crm@netragenix.com', N'admin', N'Administrator', N'Mumbai', N'Employed', 1, 0, 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([employeeid], [employeecode], [firstname], [lastname], [dateofbirth], [joiningdate], [mobile], [emailid], [gender], [maritalstatus], [employeetype], [departmentid], [positionid], [imagename], [username], [password], [usertype], [address], [status], [isactive], [isdeleted], [createdby], [createddate]) VALUES (6, N'SEP-0003-JUN2018', N'Salim', N'Pathan', CAST(N'1991-01-01T00:00:00.000' AS DateTime), CAST(N'2018-01-01T00:00:00.000' AS DateTime), N'9819123456', N'salim.patha@gmail.com', N'Male', N'Single', N'Full-Time', 1, 1, N'NoImage.png', N'salim.pathan@gmail.com', N'Pass@123', N'Employee', N'Rawal Pada, Dahisar', N'Employed', 1, 0, 4, CAST(N'2018-10-13T17:06:01.933' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Event] ON 

GO
INSERT [dbo].[Event] ([eventid], [eventname], [eventdescription], [createdby], [scheduledon]) VALUES (1, N'Annual Bash at Head Office on 31st December 2017', N'Annual Bash at Head Office on 31st December 2017', 4, CAST(N'2017-12-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Event] ([eventid], [eventname], [eventdescription], [createdby], [scheduledon]) VALUES (2, N'Aadhar Card drive on 01-01-2018', N'Aadhar Card drive on 01-01-2018', 4, CAST(N'2018-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Event] ([eventid], [eventname], [eventdescription], [createdby], [scheduledon]) VALUES (3, N'Picnic at Vikramgadh by January 2019', N'Picnic at Vikramgadh by January 2019', 4, CAST(N'2018-01-25T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Event] OFF
GO
SET IDENTITY_INSERT [dbo].[Leave] ON 

GO
INSERT [dbo].[Leave] ([leaveid], [appliedon], [appliedby], [leavefrom], [leaveto], [reason], [status], [createdby], [createddate]) VALUES (1, CAST(N'2018-09-23T00:00:00.000' AS DateTime), 1, CAST(N'2018-10-01T00:00:00.000' AS DateTime), CAST(N'2018-10-05T00:00:00.000' AS DateTime), N'Family Function', N'Approved', 4, CAST(N'2018-09-23T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Leave] ([leaveid], [appliedon], [appliedby], [leavefrom], [leaveto], [reason], [status], [createdby], [createddate]) VALUES (2, CAST(N'2018-10-09T02:23:43.613' AS DateTime), 1, CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2018-02-02T00:00:00.000' AS DateTime), N'No Reason', N'Approved', 1, CAST(N'2018-10-09T02:23:43.613' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Leave] OFF
GO
SET IDENTITY_INSERT [dbo].[Message] ON 

GO
INSERT [dbo].[Message] ([messageid], [sentto], [messagecontents], [sentby], [sentdate]) VALUES (1, 1, N'You need to submit previous certificates by 10-10-2018', 4, CAST(N'2018-10-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Message] ([messageid], [sentto], [messagecontents], [sentby], [sentdate]) VALUES (2, 1, N'Common Department Meetings on Weekends', 4, CAST(N'2018-10-10T07:15:59.787' AS DateTime))
GO
INSERT [dbo].[Message] ([messageid], [sentto], [messagecontents], [sentby], [sentdate]) VALUES (3, 1, N'Meeting with HR regarding Performance', 4, CAST(N'2018-10-10T07:16:38.233' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Message] OFF
GO
SET IDENTITY_INSERT [dbo].[Payroll] ON 

GO
INSERT [dbo].[Payroll] ([payrollid], [employeeid], [grosssalary], [netsalary], [status]) VALUES (1, 1, 80000, 74000, N'Pending')
GO
INSERT [dbo].[Payroll] ([payrollid], [employeeid], [grosssalary], [netsalary], [status]) VALUES (2, 3, 60000, 56000, N'Pending')
GO
SET IDENTITY_INSERT [dbo].[Payroll] OFF
GO
SET IDENTITY_INSERT [dbo].[Performance] ON 

GO
INSERT [dbo].[Performance] ([performanceid], [employeeid], [communication], [conflictresolution], [planning], [problemsolving], [management], [employeecode]) VALUES (1, 1, 75, 66, 56, 87, 77, N'NEN-0001-APR2018')
GO
INSERT [dbo].[Performance] ([performanceid], [employeeid], [communication], [conflictresolution], [planning], [problemsolving], [management], [employeecode]) VALUES (2, 3, 54, 75, 45, 75, 65, N'REM-0002-MAY2018')
GO
SET IDENTITY_INSERT [dbo].[Performance] OFF
GO
SET IDENTITY_INSERT [dbo].[Position] ON 

GO
INSERT [dbo].[Position] ([positionid], [positionname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (1, N'Manager', 1, 0, 1, CAST(N'2018-04-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Position] ([positionid], [positionname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (2, N'Executive', 1, 0, 1, CAST(N'2018-04-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Position] ([positionid], [positionname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (3, N'Developer', 1, 0, 1, CAST(N'2018-04-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Position] ([positionid], [positionname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (4, N'Vice President', 1, 0, 1, CAST(N'2018-04-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Position] ([positionid], [positionname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (5, N'President', 1, 0, 1, CAST(N'2018-04-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Position] ([positionid], [positionname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (6, N'Managing Director', 1, 0, 1, CAST(N'2018-04-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Position] ([positionid], [positionname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (7, N'CEO', 1, 0, 1, CAST(N'2018-04-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Position] ([positionid], [positionname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (8, N'Secretary', 1, 0, 1, CAST(N'2018-04-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Position] ([positionid], [positionname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (9, N'Team Leader', 1, 0, 1, CAST(N'2018-04-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Position] ([positionid], [positionname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (10, N'COO', 1, 0, 1, CAST(N'2018-04-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Position] ([positionid], [positionname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (11, N'CFO', 1, 0, 1, CAST(N'2018-04-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Position] ([positionid], [positionname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (12, N'Receptionist', 1, 0, 1, CAST(N'2018-04-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Position] ([positionid], [positionname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (13, N'Accountant', 1, 0, 1, CAST(N'2018-04-22T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Position] OFF
GO
SET IDENTITY_INSERT [dbo].[Recruitment] ON 

GO
INSERT [dbo].[Recruitment] ([recruitmentid], [candidatename], [interviewdate], [confirmationdate], [takenby], [status], [isactive], [isdeleted], [createdby], [createddate]) VALUES (1, N'Vishal Bhatia', CAST(N'2018-05-07T00:00:00.000' AS DateTime), CAST(N'2018-05-25T00:00:00.000' AS DateTime), 1, N'Confirmed', 1, 0, 1, CAST(N'2018-05-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Recruitment] ([recruitmentid], [candidatename], [interviewdate], [confirmationdate], [takenby], [status], [isactive], [isdeleted], [createdby], [createddate]) VALUES (2, N'Prakash Jain', CAST(N'2015-06-02T00:00:00.000' AS DateTime), CAST(N'2018-06-07T00:00:00.000' AS DateTime), 1, N'Confirmed', 1, 0, 1, CAST(N'2018-06-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Recruitment] ([recruitmentid], [candidatename], [interviewdate], [confirmationdate], [takenby], [status], [isactive], [isdeleted], [createdby], [createddate]) VALUES (3, N'Aftab Sheikh', CAST(N'2015-06-05T00:00:00.000' AS DateTime), CAST(N'2018-06-10T00:00:00.000' AS DateTime), 1, N'Confirmed', 1, 0, 1, CAST(N'2018-06-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Recruitment] ([recruitmentid], [candidatename], [interviewdate], [confirmationdate], [takenby], [status], [isactive], [isdeleted], [createdby], [createddate]) VALUES (4, N'Sahil Bakshi', CAST(N'2015-06-23T00:00:00.000' AS DateTime), CAST(N'2018-06-29T00:00:00.000' AS DateTime), 1, N'Rejected', 1, 0, 1, CAST(N'2018-06-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Recruitment] ([recruitmentid], [candidatename], [interviewdate], [confirmationdate], [takenby], [status], [isactive], [isdeleted], [createdby], [createddate]) VALUES (5, N'John Dsouza', CAST(N'2015-07-01T00:00:00.000' AS DateTime), CAST(N'2018-08-15T00:00:00.000' AS DateTime), 1, N'Decision Pending', 1, 0, 1, CAST(N'2018-08-15T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Recruitment] OFF
GO
SET IDENTITY_INSERT [dbo].[Task] ON 

GO
INSERT [dbo].[Task] ([taskid], [taskname], [createdon], [createdby], [assignedto], [status]) VALUES (1, N'Submission of Documents of Past Experiences', CAST(N'2018-10-10T00:00:00.000' AS DateTime), 4, 1, N'Pending')
GO
INSERT [dbo].[Task] ([taskid], [taskname], [createdon], [createdby], [assignedto], [status]) VALUES (2, N'Installation of SmartStore on Server on 25-09-2018', CAST(N'2018-10-10T06:23:31.540' AS DateTime), 4, 1, N'Pending')
GO
INSERT [dbo].[Task] ([taskid], [taskname], [createdon], [createdby], [assignedto], [status]) VALUES (3, N'Commissioning of New Project on 01-01-2018', CAST(N'2018-10-10T07:09:06.150' AS DateTime), 4, 1, N'Pending')
GO
SET IDENTITY_INSERT [dbo].[Task] OFF
GO
SET IDENTITY_INSERT [dbo].[Training] ON 

GO
INSERT [dbo].[Training] ([trainingid], [trainingdate], [scheduledate], [particulars], [raisedby], [employeeid], [createdby], [createddate]) VALUES (1, CAST(N'2018-09-01T00:00:00.000' AS DateTime), CAST(N'2018-08-30T00:00:00.000' AS DateTime), N'Interpersonal Skills', 1, 1, 1, CAST(N'2018-09-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Training] ([trainingid], [trainingdate], [scheduledate], [particulars], [raisedby], [employeeid], [createdby], [createddate]) VALUES (7, CAST(N'2018-10-25T00:00:00.000' AS DateTime), CAST(N'2018-10-25T00:00:00.000' AS DateTime), N'MVC Advance Training Held by Microsoft Training Partners', 4, 3, 4, CAST(N'2018-10-13T19:48:34.670' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Training] OFF
GO
/****** Object:  StoredProcedure [dbo].[spApplyLeave]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spApplyLeave] 
	@appliedon datetime NULL,
	@appliedby int NULL,
	@leavefrom datetime NULL,
	@leaveto datetime NULL,
	@reason nvarchar(150) NULL,
	@status nvarchar(50) NULL,
	@createdby int NULL,
	@createddate datetime NULL
AS
BEGIN
	INSERT INTO [dbo].[Leave]
           ([appliedon]
           ,[appliedby]
           ,[leavefrom]
           ,[leaveto]
           ,[reason]
           ,[status]
           ,[createdby]
           ,[createddate])
     VALUES
           (@appliedon
           ,@appliedby
           ,@leavefrom
           ,@leaveto
           ,@reason
           ,@status
           ,@createdby
           ,@createddate)
END


GO
/****** Object:  StoredProcedure [dbo].[spApproveLeave]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spApproveLeave] 
	@leaveid int NULL
AS
BEGIN
	UPDATE [dbo].[Leave]
	SET [status] = 'Approved'
	WHERE [leaveid] = @leaveid
END



GO
/****** Object:  StoredProcedure [dbo].[spInsertEvent]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertEvent] 
	@eventname nvarchar(150) NULL,
	@eventdescription text NULL,
	@createdby int NULL,
	@scheduledon datetime NULL
AS
BEGIN
	INSERT INTO [dbo].[Event]
           ([eventname]
           ,[eventdescription]
           ,[createdby]
           ,[scheduledon])
     VALUES
           (@eventname
           ,@eventdescription
           ,@createdby
           ,@scheduledon)
END


GO
/****** Object:  StoredProcedure [dbo].[spInsertMessage]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertMessage] 
	@sentto int NULL,
	@employeecode nvarchar(50) NULL,
	@messagecontents nvarchar(200) NULL,
	@sentby int NULL,
	@sentdate datetime NULL
AS
BEGIN
	SET @sentto = (SELECT COUNT(*) FROM Employee WHERE employeecode=@employeecode)
	INSERT INTO [dbo].[Message]
           ([sentto]
           ,[messagecontents]
           ,[sentby]
           ,[sentdate])
     VALUES
           (@sentto
           ,@messagecontents
           ,@sentby
           ,@sentdate)
END



GO
/****** Object:  StoredProcedure [dbo].[spInsertTask]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertTask] 
	@employeecode varchar(50) NULL,
	@taskname varchar(150) NULL,
	@createdon datetime NULL,
	@createdby int NULL,
	@assignedto int NULL,
	@status nvarchar(50) NULL
AS
BEGIN
	SET @assignedto = (SELECT COUNT(*) FROM Employee WHERE employeecode=@employeecode)
	INSERT INTO [dbo].[Task]
           ([taskname]
           ,[createdon]
           ,[createdby]
           ,[assignedto]
           ,[status])
     VALUES
           (@taskname
           ,@createdon
           ,@createdby
           ,@assignedto
           ,@status)
END


GO
/****** Object:  StoredProcedure [dbo].[spInsertWorkforceEmployees]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertWorkforceEmployees] 
	@employeecode varchar(50) NULL,
	@firstname nvarchar(50) NULL,
	@lastname nvarchar(50) NULL,
	@dateofbirth datetime NULL,
	@joiningdate datetime NULL,
	@mobile nvarchar(50) NULL,
	@emailid nvarchar(50) NULL,
	@gender nvarchar(50) NULL,
	@maritalstatus nvarchar(50) NULL,
	@employeetype nvarchar(50) NULL,
	@departmentid int NULL,
	@positionid int NULL,
	@imagename nvarchar(50) NULL,
	@username nvarchar(50) NULL,
	@password nvarchar(50) NULL,
	@usertype nvarchar(50) NULL,
	@address nvarchar(250) NULL,
	@status nvarchar(50) NULL,
	@isactive bit NULL,
	@isdeleted bit NULL,
	@createdby int NULL,
	@createddate datetime NULL
AS
BEGIN
	INSERT INTO [dbo].[Employee]
           ([employeecode]
           ,[firstname]
           ,[lastname]
           ,[dateofbirth]
           ,[joiningdate]
           ,[mobile]
           ,[emailid]
           ,[gender]
           ,[maritalstatus]
           ,[employeetype]
           ,[departmentid]
           ,[positionid]
           ,[imagename]
           ,[username]
           ,[password]
		   ,[usertype]
           ,[address]
           ,[status]
           ,[isactive]
           ,[isdeleted]
           ,[createdby]
           ,[createddate])
     VALUES
           (@employeecode,
			@firstname,
			@lastname,
			@dateofbirth,
			@joiningdate,
			@mobile,
			@emailid,
			@gender,
			@maritalstatus,
			@employeetype,
			@departmentid,
			@positionid,
			@imagename,
			@username,
			@password,
			@usertype,
			@address,
			@status,
			@isactive,
			@isdeleted,
			@createdby,
			@createddate)
END


GO
/****** Object:  StoredProcedure [dbo].[spLogAttendance]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLogAttendance] 
	@employeecode nvarchar(50) NULL,
	@status nvarchar(50) NULL
AS
BEGIN
	INSERT INTO [dbo].[AttendanceLog]
           ([employeecode]
           ,[loggeddate]
           ,[status])
     VALUES
           (@employeecode
           ,GETDATE()
           ,@status)

	UPDATE [dbo].[Attendance]
	SET [october] = [october] + 1
	WHERE [employeecode] = @employeecode
END


GO
/****** Object:  StoredProcedure [dbo].[spLogDocuments]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLogDocuments] 
		@documentname nvarchar(150)
        ,@documenttype nvarchar(50)
        ,@uploadeddate datetime
        ,@uploadedby int
        ,@departmentid int
        ,@isactive bit
        ,@createdby int
        ,@createddate datetime
AS
BEGIN
	INSERT INTO [dbo].[Document]
           ([documentname]
           ,[documenttype]
           ,[uploadeddate]
           ,[uploadedby]
           ,[departmentid]
           ,[isactive]
           ,[createdby]
           ,[createddate])
     VALUES
           (@documentname
           ,@documenttype
           ,@uploadeddate
           ,@uploadedby
           ,@departmentid
           ,@isactive
           ,@createdby
           ,@createddate)
END




GO
/****** Object:  StoredProcedure [dbo].[spLogPerformance]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLogPerformance] 
		@employeeid int
        ,@communication int
        ,@conflictresolution int
        ,@planning int
        ,@problemsolving int
        ,@management int
        ,@employeecode nvarchar(50)
AS
BEGIN
	SET @employeeid = (SELECT employeeid FROM Employee WHERE employeecode=@employeecode)
	INSERT INTO [dbo].[Performance]
           ([employeeid]
           ,[communication]
           ,[conflictresolution]
           ,[planning]
           ,[problemsolving]
           ,[management]
           ,[employeecode])
     VALUES
           (@employeeid
		   ,@communication
           ,@conflictresolution
           ,@planning
           ,@problemsolving
           ,@management
           ,@employeecode)
END



GO
/****** Object:  StoredProcedure [dbo].[spLogRecruitment]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLogRecruitment] 
	@candidatename nvarchar(150) NULL,
	@interviewdate datetime NULL,
	@confirmationdate datetime NULL,
	@takenby int NULL,
	@status nvarchar(50) NULL,
	@createdby int NULL
AS
BEGIN
	INSERT INTO [dbo].[Recruitment]
           ([candidatename]
           ,[interviewdate]
           ,[confirmationdate]
           ,[takenby]
           ,[status]
           ,[isactive]
           ,[isdeleted]
           ,[createdby]
           ,[createddate])
     VALUES
           (@candidatename
           ,@interviewdate
           ,@confirmationdate
           ,@takenby
           ,@status
           ,1
           ,0
           ,@createdby
           ,GETDATE())
END



GO
/****** Object:  StoredProcedure [dbo].[spLogTraining]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLogTraining] 
		@trainingdate datetime
        ,@scheduledate datetime
        ,@particulars nvarchar(150)
        ,@raisedby int
        ,@employeeid int
        ,@createdby int
		,@employeecode nvarchar(50)
AS
BEGIN
	SET @employeeid = (SELECT employeeid FROM Employee WHERE employeecode=@employeecode)
	INSERT INTO [dbo].[Training]
           ([trainingdate]
           ,[scheduledate]
           ,[particulars]
           ,[raisedby]
           ,[employeeid]
           ,[createdby]
           ,[createddate])
     VALUES
           (@trainingdate
           ,@scheduledate
           ,@particulars
           ,@raisedby
           ,@employeeid
           ,@createdby
           ,GETDATE())
END




GO
/****** Object:  StoredProcedure [dbo].[spRemoveEvent]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRemoveEvent] 
	@eventid int NULL
AS
BEGIN
	DELETE [dbo].[Event]
	WHERE [eventid] = @eventid
END


GO
/****** Object:  StoredProcedure [dbo].[spRemoveLeave]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRemoveLeave] 
	@leaveid int NULL,
	@appliedon datetime NULL,
	@appliedby datetime NULL,
	@leavefrom datetime NULL,
	@leaveto datetime NULL,
	@status nvarchar(50) NULL,
	@createdby int NULL,
	@createddate datetime NULL
AS
BEGIN
	DELETE [dbo].[Leave]
	WHERE [leaveid] = @leaveid
END


GO
/****** Object:  StoredProcedure [dbo].[spRemoveMessage]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRemoveMessage]
	@messageid int NULL, 
	@sentto int NULL,
	@messagecontents nvarchar(200) NULL,
	@sentby int NULL,
	@sentdate datetime NULL
AS
BEGIN
	DELETE [dbo].[Message]
	WHERE [messageid] = @messageid
END



GO
/****** Object:  StoredProcedure [dbo].[spRemoveTask]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRemoveTask]
	@taskid int NULL
AS
BEGIN
	DELETE [dbo].[Task]
	WHERE [taskid] = @taskid
END


GO
/****** Object:  StoredProcedure [dbo].[spRemoveWorkforceEmployees]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRemoveWorkforceEmployees] 
	@employeecode varchar(50) NULL
AS
BEGIN
		UPDATE [dbo].[Employee]
		   SET [isdeleted] = 1
		 WHERE [employeecode] = @employeecode
END



GO
/****** Object:  StoredProcedure [dbo].[spUpdateEvent]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateEvent] 
	@eventid int NULL,
	@eventname nvarchar(150) NULL,
	@eventdescription text NULL,
	@createdby int NULL,
	@scheduledon datetime NULL
AS
BEGIN
	UPDATE [dbo].[Event]
	SET [eventname] = @eventname
      ,[eventdescription] = @eventdescription
      ,[createdby] = @createdby
      ,[scheduledon] = @scheduledon
	WHERE [eventid] = @eventid
END


GO
/****** Object:  StoredProcedure [dbo].[spUpdateMessage]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateMessage]
	@messageid int NULL, 
	@sentto int NULL,
	@messagecontents nvarchar(200) NULL,
	@sentby int NULL,
	@sentdate datetime NULL
AS
BEGIN
	UPDATE [dbo].[Message]
	SET [sentto] = @sentto
      ,[messagecontents] = @messagecontents
      ,[sentby] = @sentby
      ,[sentdate] = @sentdate
	WHERE [messageid] = @messageid
END



GO
/****** Object:  StoredProcedure [dbo].[spUpdateTask]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateTask]
	@taskid int NULL,
	@taskname varchar(150) NULL,
	@createdon datetime NULL,
	@createdby int NULL,
	@assignedto int NULL,
	@status nvarchar(50) NULL
AS
BEGIN
	UPDATE [dbo].[Task]
	SET [taskname] = @taskname
      ,[createdon] = @createdon
      ,[createdby] = @createdby
      ,[assignedto] = @assignedto
      ,[status] = @status
	WHERE [taskid] = @taskid
END



GO
/****** Object:  StoredProcedure [dbo].[spUpdateWorkforceEmployees]    Script Date: 13-10-2018 20:08:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateWorkforceEmployees] 
	@employeecode varchar(50) NULL,
	@firstname nvarchar(50) NULL,
	@lastname nvarchar(50) NULL,
	@dateofbirth datetime NULL,
	@joiningdate datetime NULL,
	@mobile nvarchar(50) NULL,
	@emailid nvarchar(50) NULL,
	@gender nvarchar(50) NULL,
	@maritalstatus nvarchar(50) NULL,
	@employeetype nvarchar(50) NULL,
	@departmentid int NULL,
	@positionid int NULL,
	@imagename nvarchar(50) NULL,
	@username nvarchar(50) NULL,
	@password nvarchar(50) NULL,
	@usertype nvarchar(50) NULL,
	@address nvarchar(250) NULL,
	@status nvarchar(50) NULL,
	@isactive bit NULL
AS
BEGIN
		UPDATE [dbo].[Employee]
		   SET [firstname] = @firstname
			  ,[lastname] = @lastname
			  ,[dateofbirth] = @dateofbirth
			  ,[joiningdate] = @joiningdate
			  ,[mobile] = @mobile
			  ,[emailid] = @emailid
			  ,[gender] = @gender
			  ,[maritalstatus] = @maritalstatus
			  ,[employeetype] = @employeetype
			  ,[departmentid] = @departmentid
			  ,[positionid] = @positionid
			  ,[imagename] = @imagename
			  ,[username] = @username
			  ,[password] = @password
			  ,[usertype] = @usertype
			  ,[address] = @address
			  ,[status] = @status
			  ,[isactive] = @isactive
		 WHERE [employeecode] = @employeecode
END


GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Attendance"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 193
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employee"
            Begin Extent = 
               Top = 45
               Left = 422
               Bottom = 193
               Right = 592
            End
            DisplayFlags = 280
            TopColumn = 17
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwGetAttendanceDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwGetAttendanceDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[32] 2[9] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Employee"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 206
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwGetAuthenticationDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwGetAuthenticationDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[48] 4[12] 2[26] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Employee"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 288
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 23
         End
         Begin Table = "Position"
            Begin Extent = 
               Top = 61
               Left = 502
               Bottom = 191
               Right = 672
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Department"
            Begin Extent = 
               Top = 188
               Left = 259
               Bottom = 318
               Right = 440
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwGetBusinessDeskEmployees'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwGetBusinessDeskEmployees'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Document"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 208
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Department"
            Begin Extent = 
               Top = 6
               Left = 458
               Bottom = 136
               Right = 639
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employee"
            Begin Extent = 
               Top = 37
               Left = 264
               Bottom = 216
               Right = 434
            End
            DisplayFlags = 280
            TopColumn = 16
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwGetDocumentDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwGetDocumentDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Event"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 156
               Right = 215
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employee"
            Begin Extent = 
               Top = 6
               Left = 253
               Bottom = 180
               Right = 423
            End
            DisplayFlags = 280
            TopColumn = 17
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwGetEventDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwGetEventDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Leave"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 206
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employee"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwGetLeaveDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwGetLeaveDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[32] 4[40] 2[10] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Message"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 219
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employee"
            Begin Extent = 
               Top = 107
               Left = 267
               Bottom = 237
               Right = 437
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Employee_1"
            Begin Extent = 
               Top = 6
               Left = 465
               Bottom = 136
               Right = 635
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1605
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwGetMessageDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwGetMessageDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[46] 4[16] 2[21] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Payroll"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 159
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Attendance"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 8
         End
         Begin Table = "Employee"
            Begin Extent = 
               Top = 9
               Left = 257
               Bottom = 227
               Right = 427
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwGetPayrollDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwGetPayrollDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Performance"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 202
               Right = 282
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "Employee"
            Begin Extent = 
               Top = 6
               Left = 320
               Bottom = 193
               Right = 490
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3810
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwGetPerformanceDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwGetPerformanceDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Recruitment"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 186
               Right = 219
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "Employee"
            Begin Extent = 
               Top = 2
               Left = 446
               Bottom = 187
               Right = 616
            End
            DisplayFlags = 280
            TopColumn = 16
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwGetRecruitmentDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwGetRecruitmentDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[30] 4[31] 2[21] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Task"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employee_1"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employee"
            Begin Extent = 
               Top = 38
               Left = 256
               Bottom = 168
               Right = 426
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1680
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwGetTaskDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwGetTaskDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Training"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 198
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Employee_1"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 191
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employee"
            Begin Extent = 
               Top = 63
               Left = 681
               Bottom = 249
               Right = 851
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwGetTrainingDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwGetTrainingDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[51] 4[25] 2[9] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Employee"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 221
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Position"
            Begin Extent = 
               Top = 61
               Left = 502
               Bottom = 191
               Right = 672
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Department"
            Begin Extent = 
               Top = 188
               Left = 259
               Bottom = 318
               Right = 440
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwGetWorkforceEmployees'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwGetWorkforceEmployees'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Employee"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 206
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 15
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwGetWorkforceEmployeesRawData'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwGetWorkforceEmployeesRawData'
GO
