USE [db.hrms.netragenix.com]
GO
/****** Object:  Database [db.hrms.netragenix.com]    Script Date: 6/23/2021 4:52:04 PM ******/
CREATE DATABASE [db.hrms.netragenix.com]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db.hrms.netragenix.com', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\db.hrms.netragenix.com.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'db.hrms.netragenix.com_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\db.hrms.netragenix.com_log.ldf' , SIZE = 1792KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [db.hrms.netragenix.com] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db.hrms.netragenix.com].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db.hrms.netragenix.com] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db.hrms.netragenix.com] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db.hrms.netragenix.com] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db.hrms.netragenix.com] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db.hrms.netragenix.com] SET ARITHABORT OFF 
GO
ALTER DATABASE [db.hrms.netragenix.com] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db.hrms.netragenix.com] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [db.hrms.netragenix.com] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db.hrms.netragenix.com] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db.hrms.netragenix.com] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db.hrms.netragenix.com] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db.hrms.netragenix.com] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db.hrms.netragenix.com] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db.hrms.netragenix.com] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db.hrms.netragenix.com] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db.hrms.netragenix.com] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db.hrms.netragenix.com] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db.hrms.netragenix.com] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db.hrms.netragenix.com] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db.hrms.netragenix.com] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db.hrms.netragenix.com] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db.hrms.netragenix.com] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db.hrms.netragenix.com] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db.hrms.netragenix.com] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db.hrms.netragenix.com] SET  MULTI_USER 
GO
ALTER DATABASE [db.hrms.netragenix.com] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db.hrms.netragenix.com] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db.hrms.netragenix.com] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db.hrms.netragenix.com] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [db.hrms.netragenix.com]
GO
/****** Object:  User [IIS APPPOOL\DefaultAppPool]    Script Date: 6/23/2021 4:52:05 PM ******/
CREATE USER [IIS APPPOOL\DefaultAppPool] FOR LOGIN [IIS APPPOOL\DefaultAppPool] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_datareader] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSalaryStructureValues]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetSalaryStructureValues]

AS
BEGIN
 --SET NOCOUNT ON;
SELECT salarystructurevalue FROM SalaryStructure
END

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertSalary]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertSalary]
	@BASIC float,
	@DA float,
	@HRA float,
	@PF float,
	@LTA float,
	@Medical float,
	@EmployeeStateInsurance float,
	@ProfessionalTax float
AS
BEGIN

INSERT INTO Salary(BASIC,DA,HRA,PF,LTA,Medical,EmployeeStateInsurance,ProfessionalTax)
Values
(@BASIC,@DA,@HRA,@PF,@LTA,@Medical,@EmployeeStateInsurance,@ProfessionalTax)

END

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertSalaryStructure]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertSalaryStructure]
	@salarystructurename nvarchar(20),
	@salarystructurevalue float,
	@minvalue float,
	@maxvalue float

AS
BEGIN
INSERT INTO SalaryStructure(salarystructurename,salarystructurevalue,minvalue,maxvalue)
Values
(@salarystructurename,@salarystructurevalue,@minvalue,@maxvalue)

END

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateSalaryStructure]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateSalaryStructure] 
	-- Add the parameters for the stored procedure here
	@salarystructureid int,
	@salarystructurename nvarchar(20),
	@salarystructurevalue float,
	@minvalue float,
	@maxvalue float
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	 
	UPDATE SalaryStructure
	SET salarystructurename=@salarystructurename, salarystructurevalue=@salarystructurevalue, minvalue=@minvalue, maxvalue=@maxvalue
	WHERE salarystructureid=@salarystructureid
 
END

GO
/****** Object:  StoredProcedure [dbo].[spApplyLeave]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spApplyLeave] 
	@appliedon datetime,
	@appliedby int,
	@leavefrom datetime,
	@leaveto datetime,
	@reason nvarchar(150),
	@status nvarchar(50),
	--@createdby int,
	@createddate datetime
AS
BEGIN
	INSERT INTO [dbo].[Leave]
           ([appliedon]
           ,[appliedby]
           ,[leavefrom]
           ,[leaveto]
           ,[reason]
           ,[status]
           --,[createdby]
           ,[createddate])
     VALUES
           (@appliedon
           ,@appliedby
           ,@leavefrom
           ,@leaveto
           ,@reason
           ,@status
           --,@createdby
           ,@createddate)
END


GO
/****** Object:  StoredProcedure [dbo].[spApproveLeave]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spApproveLeave] 
	@leaveid int
AS
BEGIN
	UPDATE [dbo].[Leave]
	SET [status] = 'Approved'
	WHERE [leaveid] = @leaveid
END

GO
/****** Object:  StoredProcedure [dbo].[spGetAllEmployees]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllEmployees]

AS
BEGIN
SELECT [employeeid], [employeecode] FROM [Employee]
END

GO
/****** Object:  StoredProcedure [dbo].[spGetEventCount]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetEventCount]
@employeeid int,
@eventid int
--@isRead bit

AS
BEGIN
Declare @notifyid int
SET @notifyid =((select count(*) from Event) - (select count(distinct eventid) from Notification where employeeid=@employeeid))
IF(@notifyid >= 0)
BEGIN
SELECT @notifyid
END

ELSE
BEGIN 
SET @notifyid=0
SELECT @notifyid
END

Return @notifyid
	
END


GO
/****** Object:  StoredProcedure [dbo].[spGetMessageCount]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetMessageCount] 
@employeeid int
--@messageid int
--@isRead bit

AS
BEGIN
Declare @notifyid int
SET @notifyid =((select count(*) from Message where sentto=@employeeid) - (select count(distinct messageid) from Notification where employeeid=@employeeid))
IF(@notifyid >= 0)
BEGIN
SELECT @notifyid
END

ELSE
BEGIN 
SET @notifyid=0
SELECT @notifyid
END

Return @notifyid

--Declare @notifyid int
--SET @notifyid =((select count(*) from Message where sentto=1) - (select count(distinct 1) from Notification where employeeid=1))
--SELECT @notifyid
	
END


GO
/****** Object:  StoredProcedure [dbo].[spGetTaskCount]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetTaskCount] 
@employeeid int,
@taskid int
--@isRead bit

AS
BEGIN
Declare @notifyid int
SET @notifyid =((select count(*) from Task where assignedto=@employeeid) - (select count(distinct taskid) from Notification where employeeid=@employeeid))
IF(@notifyid >= 0)
BEGIN
SELECT @notifyid
END

ELSE
BEGIN 
SET @notifyid=0
SELECT @notifyid
END

Return @notifyid
	
END


GO
/****** Object:  StoredProcedure [dbo].[spInsertEvent]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertEvent] 
	@eventname nvarchar(150),
	@eventdescription text,
	@createdby int,
	@scheduledon datetime,
	@isRead bit
AS
BEGIN
	INSERT INTO [dbo].[Event]
           ([eventname]
           ,[eventdescription]		   
		   ,[isRead]
           ,[createdby]
           ,[scheduledon])
     VALUES
           (@eventname
           ,@eventdescription
		   ,@isRead
           ,@createdby
           ,@scheduledon)
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertMessage]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertMessage] 
	@sentto int,
	@employeecode nvarchar(50),
	@messagecontents nvarchar(200),
	@sentby int,
	@sentdate datetime,
	@isRead bit
AS
BEGIN
	SET @sentto = (SELECT employeeid FROM Employee WHERE employeecode=@employeecode)
	INSERT INTO [dbo].[Message]
           ([sentto]
           ,[messagecontents]
           ,[sentby]
           ,[sentdate]
		   ,[isRead])
     VALUES
           (@sentto
           ,@messagecontents
           ,@sentby
           ,@sentdate
		   ,@isRead)
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertNotificationDetails]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spInsertNotificationDetails]
	-- Add the parameters for the stored procedure here
	@employeeid int,
	@eventid int,
	@messageid int,
	@taskid int
AS
BEGIN

INSERT INTO Notification(employeeid, eventid, messageid, taskid) 
VALUES
(@employeeid, @eventid, @messageid, @taskid)

END

GO
/****** Object:  StoredProcedure [dbo].[spInsertTask]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertTask] 
	@employeecode varchar(50),
	@taskname varchar(150),
	@createdon datetime,
	@createdby int,
	@assignedto int,
	@status nvarchar(50),
	@isRead bit
AS
BEGIN
	--SET @assignedto = (SELECT COUNT(*) FROM Employee WHERE employeecode=@employeecode)
	SET @assignedto = (SELECT employeeid FROM Employee WHERE employeecode=@employeecode)
	INSERT INTO [dbo].[Task]
           ([taskname]
           ,[createdon]
           ,[createdby]
           ,[assignedto]
           ,[status]
		   ,[isRead])
     VALUES
           (@taskname
           ,@createdon
           ,@createdby
           ,@assignedto
           ,@status
		   ,@isRead)
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertWorkforceEmployees]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsertWorkforceEmployees] 
	@employeecode varchar(50),
	@firstname nvarchar(50),
	@lastname nvarchar(50),
	@dateofbirth datetime,
	@joiningdate datetime,
	@mobile nvarchar(50),
	@emailid nvarchar(50),
	@gender nvarchar(50),
	@maritalstatus nvarchar(50),
	@employeetype nvarchar(50),
	@departmentid int,
	@positionid int,
	@imagename nvarchar(50),
	@username nvarchar(50),
	@password nvarchar(50),
	@usertype nvarchar(50),
	@address nvarchar(250),
	@status nvarchar(50),
	@isactive bit,
	@isdeleted bit,
	@createdby int,
	@createddate datetime
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
/****** Object:  StoredProcedure [dbo].[spLogAttendance]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLogAttendance] 
	@employeecode nvarchar(50),
	@loggeddate datetime,
	@status nvarchar(50)
AS
BEGIN
	INSERT INTO [dbo].[AttendanceLog]
           ([employeecode]
           ,[loggeddate]
           ,[status])
     VALUES
           (@employeecode
           ,@loggeddate
           ,@status)

	DECLARE @month nvarchar(20)					
	SET @month = (SELECT DATENAME(MONTH, @loggeddate) FROM AttendanceLog WHERE employeecode=@employeecode and loggeddate = @loggeddate and status=1)
	SELECT @month

	IF(@month = 'January')
	BEGIN
		UPDATE [dbo].[Attendance]
		SET [January] = [January] + 1
		WHERE [employeecode] = @employeecode
	END

	IF(@month = 'February')
	BEGIN
		UPDATE [dbo].[Attendance]
		SET [February] = [February] + 1
		WHERE [employeecode] = @employeecode
	END

	IF(@month = 'March')
	BEGIN
		UPDATE [dbo].[Attendance]
		SET [March] = [March] + 1
		WHERE [employeecode] = @employeecode
	END

	IF(@month = 'April')
	BEGIN
		UPDATE [dbo].[Attendance]
		SET [April] = [April] + 1
		WHERE [employeecode] = @employeecode
	END

	IF(@month = 'May')
	BEGIN
		UPDATE [dbo].[Attendance]
		SET [May] = [May] + 1
		WHERE [employeecode] = @employeecode			
	END
		
	IF(@month = 'December')
	BEGIN
		UPDATE [dbo].[Attendance]
		SET [December] = [December] + 1
		WHERE [employeecode] = @employeecode
	END		
END

--BEGIN
--	SELECT * FROM Attendance
--END
GO
/****** Object:  StoredProcedure [dbo].[spLogDocuments]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLogDocuments] 
		@documentname nvarchar(150)
        ,@documenttype nvarchar(50)
		,@documentextension nvarchar(50)
        ,@uploadeddate datetime
		,@uploadedby int
		,@uploadfile varbinary(MAX)
		,@departmentid int       
        ,@createdby int        
		
AS
BEGIN
	INSERT INTO [dbo].[Document]
           ([documentname]
           ,[documenttype]
		   ,[documentextension]
           ,[uploadeddate]
           ,[uploadedby]
		   ,[uploadfile]
           ,[departmentid]           
           ,[createdby]
           
		   )
     VALUES
           (@documentname
           ,@documenttype
		   ,@documentextension
           ,@uploadeddate
           ,@uploadedby
		   ,@uploadfile
           ,@departmentid          
           ,@createdby)
		   
END

GO
/****** Object:  StoredProcedure [dbo].[spLogPayroll]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spLogPayroll] 
	-- Add the parameters for the stored procedure here
	@employeecode nvarchar(50),	
	@grosssalary float,
	@netsalary float,
	@status nvarchar(50)
AS
BEGIN
Declare @employeeid int
SET @employeeid = (SELECT employeeid FROM Employee WHERE employeecode=@employeecode)
	INSERT INTO [dbo].[Payroll]           
           ([employeeid]
           ,[grosssalary]
           ,[netsalary]
           ,[status])
     VALUES           
		   (@employeeid
           ,@grosssalary
           ,@netsalary
           ,@status)
END

GO
/****** Object:  StoredProcedure [dbo].[spLogPerformance]    Script Date: 6/23/2021 4:52:05 PM ******/
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
	--SET @employeeid = (SELECT COUNT(*) FROM Employee WHERE employeecode=@employeecode)
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
/****** Object:  StoredProcedure [dbo].[spLogRecruitment]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLogRecruitment] 
	@candidatename nvarchar(150),
	@interviewdate datetime,
	@confirmationdate datetime,
	@takenby int,
	@status nvarchar(50),
	@createdby int
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
/****** Object:  StoredProcedure [dbo].[spLogTraining]    Script Date: 6/23/2021 4:52:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[spmonthlyleave]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spmonthlyleave] 
	-- Add the parameters for the stored procedure here
	@appliedby int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT *, (p.grosssalary- (LEAVES*(p.grosssalary/30) + p.grosssalary*10/100)) AS 'Net Salary',(p.grosssalary*50/100) as 'Basic Pay', (p.grosssalary*10/100) as 'PF',
 ( p.grosssalary*5/100) as 'DA',((p.grosssalary*50/100)*50/100) as 'HRA'  FROM (
SELECT  [APPLIEDBY], e.employeecode, e.firstname, e.lastname,
 DATEPART(MM,LEAVEFROM) AS 'MONTH',
 SUM(DATEDIFF(DD,LEAVEFROM,LEAVETO)) AS 'LEAVES'
FROM LEAVE l inner join  Employee e on l.appliedby=e.employeeid
inner join Payroll p on appliedby=p.employeeid WHERE  APPLIEDBY=@appliedby
GROUP BY [APPLIEDBY], DATEPART(MM,LEAVEFROM), employeecode, firstname, lastname
) X inner join Payroll p on appliedby = p.employeeid

END

GO
/****** Object:  StoredProcedure [dbo].[spPdfDownload]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spPdfDownload] 
	-- Add the parameters for the stored procedure here
	@month int,
	--@employeecode nvarchar(50)
	@employeeid int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--Declare @employeeid int
	--SET @employeeid = (SELECT employeeid FROM Employee WHERE employeecode=@employeecode)
    -- Insert statements for procedure here
	
SELECT *, 
(p.grosssalary- (LEAVES*(p.grosssalary/30) + p.grosssalary*10/100)) AS 'Net Salary',
(p.grosssalary*50/100) as 'Basic Pay', 
(p.grosssalary*10/100) as 'PF',
( p.grosssalary*5/100) as 'DA',
((p.grosssalary*50/100)*50/100) as 'HRA'  
FROM ( 
		SELECT  [APPLIEDBY], e.employeecode, e.firstname, e.lastname,
		DATENAME(MM,LEAVEFROM) AS 'MONTH',
		DATEPART(YYYY,LEAVEFROM) AS 'YEAR',
		SUM(DATEDIFF(DD,LEAVEFROM,LEAVETO)) AS 'LEAVES'
		FROM LEAVE l inner join  Employee e on l.appliedby=e.employeeid
		inner join Payroll p on appliedby=p.employeeid 
		WHERE DATEPART(MM,LEAVEFROM)=@month and e.employeeid=@employeeid
		GROUP BY [APPLIEDBY], DATENAME(MM,LEAVEFROM),DATEPART(YYYY,LEAVEFROM), employeecode, firstname, lastname
) X inner join Payroll p on appliedby = p.employeeid


END

GO
/****** Object:  StoredProcedure [dbo].[spRemoveEvent]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRemoveEvent] 
	@eventid int
AS
BEGIN
	DELETE [dbo].[Event]
	WHERE [eventid] = @eventid
END
GO
/****** Object:  StoredProcedure [dbo].[spRemoveLeave]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRemoveLeave] 
	@leaveid int,
	@appliedon datetime,
	@appliedby datetime,
	@leavefrom datetime,
	@leaveto datetime,
	@status nvarchar(50),
	@createdby int,
	@createddate datetime
AS
BEGIN
	DELETE [dbo].[Leave]
	WHERE [leaveid] = @leaveid
END
GO
/****** Object:  StoredProcedure [dbo].[spRemoveMessage]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRemoveMessage]
	@messageid int, 
	@sentto int,
	@messagecontents nvarchar(200),
	@sentby int,
	@sentdate datetime
AS
BEGIN
	DELETE [dbo].[Message]
	WHERE [messageid] = @messageid
END
GO
/****** Object:  StoredProcedure [dbo].[spRemoveTask]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRemoveTask]
	@taskid int
AS
BEGIN
	DELETE [dbo].[Task]
	WHERE [taskid] = @taskid
END
GO
/****** Object:  StoredProcedure [dbo].[spRemoveWorkforceEmployees]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRemoveWorkforceEmployees] 
	@employeecode varchar(50)
AS
BEGIN
		UPDATE [dbo].[Employee]
		   SET [isdeleted] = 1
		 WHERE [employeecode] = @employeecode
END
GO
/****** Object:  StoredProcedure [dbo].[sptest]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sptest]
	-- Add the parameters for the stored procedure here
	--@appliedby int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT *, 
		(p.grosssalary- (LEAVES*(p.grosssalary/30) + p.grosssalary*10/100)) AS 'Net Salary',
		(p.grosssalary*45/100) as 'Basic Pay',
		( p.grosssalary*5/100) as 'DA',
		((p.grosssalary*40/100)*40/100) as 'HRA', 
		(p.grosssalary*12/100) as 'PF',
		(p.grosssalary*2/100) as 'LTA',
		(p.grosssalary*2/100) as 'Medical',
		(p.grosssalary*1.75/100) as 'ESI',
		(p.grosssalary*2/100) as 'PT'	 
	FROM (
	SELECT  [APPLIEDBY], e.employeecode, e.firstname, e.lastname,
		DATENAME(MM,LEAVEFROM) AS 'MONTH',
		DATEPART(YYYY,LEAVEFROM) AS 'Year',
		SUM(DATEDIFF(DD,LEAVEFROM,LEAVETO)) AS 'LEAVES'
	FROM LEAVE l inner join  Employee e on l.appliedby=e.employeeid
	inner join Payroll p on appliedby=p.employeeid
	GROUP BY [APPLIEDBY], DATENAME(MM,LEAVEFROM),DATEPART(YYYY,LEAVEFROM), employeecode, firstname, lastname
	) X inner join Payroll p on appliedby = p.employeeid

END

--	SELECT *, netsalary- LEAVES*(netsalary/30) AS 'SALARY After Deductions'  FROM (
--SELECT  [APPLIEDBY], e.employeecode, e.firstname, e.lastname,
-- DATEPART(MM,LEAVEFROM) AS 'MONTH',
-- SUM(DATEDIFF(DD,LEAVEFROM,LEAVETO)) AS 'LEAVES'
--FROM LEAVE l left join  Employee e on l.appliedby=e.employeeid
--GROUP BY [APPLIEDBY], DATEPART(MM,LEAVEFROM), employeecode, firstname, lastname
--) X inner join Payroll p on appliedby = p.employeeid

--SELECT *, netsalary- LEAVES*(netsalary/30) AS 'SALARY After Deductions' FROM (
--SELECT  [APPLIEDBY], e.employeecode, e.firstname, e.lastname,
-- DATEPART(MM,LEAVEFROM) AS 'MONTH',
-- SUM(DATEDIFF(DD,LEAVEFROM,LEAVETO)) AS 'LEAVES',st.basic,st.hra,st.pf,st.da
--FROM LEAVE l join  Employee e on l.appliedby=e.employeeid
--left join SalaryStructure st on st.employeecode = e.employeecode
--GROUP BY [APPLIEDBY], DATEPART(MM,LEAVEFROM), e.employeecode, firstname, lastname,st.basic,st.hra,st.pf,st.da
--) X inner join Payroll p on appliedby = p.employeeid


GO
/****** Object:  StoredProcedure [dbo].[spUpdateEvent]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateEvent] 
	@eventid int,
	@eventname nvarchar(150),
	@eventdescription text,
	@createdby int,
	@scheduledon datetime
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
/****** Object:  StoredProcedure [dbo].[spUpdateEventCount]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateEventCount] 
	-- Add the parameters for the stored procedure here
@eventid int
AS
BEGIN

UPDATE Event
SET isRead=1
WHERE eventid=@eventid

END


GO
/****** Object:  StoredProcedure [dbo].[spUpdateLeave]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateLeave] 
	@leaveid int,
	@appliedon datetime,
	@appliedby int,
	@leavefrom datetime,
	@leaveto datetime,
	@status nvarchar(50),
	@createdby int,
	@createddate datetime
AS
BEGIN
	UPDATE [dbo].[Leave]
	SET [appliedon] = @appliedon
		,[appliedby] = @appliedby
		,[leavefrom] = @leavefrom
		,[leaveto] = @leaveto
		,[status] = @status
		,[createdby] = @createdby
		,[createddate] = @createddate
	WHERE [leaveid] = @leaveid
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateMessage]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateMessage]
	@messageid int, 
	@sentto int,
	@messagecontents nvarchar(200),
	@sentby int,
	@sentdate datetime
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
/****** Object:  StoredProcedure [dbo].[spUpdateMessageCount]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateMessageCount]
@messageid int

AS
BEGIN

UPDATE Message
SET isRead=1
WHERE messageid=@messageid

END

GO
/****** Object:  StoredProcedure [dbo].[spUpdateTask]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateTask]
	@taskid int,
	@taskname varchar(150),
	@createdon datetime,
	@createdby int,
	@assignedto int,
	@status nvarchar(50)
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
/****** Object:  StoredProcedure [dbo].[spUpdateTaskCount]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateTaskCount] 
@taskid int

AS
BEGIN

UPDATE Task
SET isRead=1
WHERE taskid=@taskid

END

GO
/****** Object:  StoredProcedure [dbo].[spUpdateWorkforceEmployees]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateWorkforceEmployees] 
	@employeecode varchar(50),
	@firstname nvarchar(50),
	@lastname nvarchar(50),
	@dateofbirth datetime,
	@joiningdate datetime,
	@mobile nvarchar(50),
	@emailid nvarchar(50),
	@gender nvarchar(50),
	@maritalstatus nvarchar(50),
	@employeetype nvarchar(50),
	@departmentid int,
	@positionid int,
	@imagename nvarchar(50),
	@username nvarchar(50),
	@password nvarchar(50),
	@usertype nvarchar(50),
	@address nvarchar(250),
	@status nvarchar(50),
	@isactive bit
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
/****** Object:  Table [dbo].[Attendance]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[attendanceid] [int] IDENTITY(1,1) NOT NULL,
	[employeeid] [int] NULL,
	[employeecode] [nvarchar](50) NULL,
	[January] [int] NULL,
	[February] [int] NULL,
	[March] [int] NULL,
	[April] [int] NULL,
	[May] [int] NULL,
	[June] [int] NULL,
	[July] [int] NULL,
	[August] [int] NULL,
	[September] [int] NULL,
	[October] [int] NULL,
	[November] [int] NULL,
	[December] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AttendanceLog]    Script Date: 6/23/2021 4:52:05 PM ******/
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
/****** Object:  Table [dbo].[Department]    Script Date: 6/23/2021 4:52:05 PM ******/
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
/****** Object:  Table [dbo].[Document]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Document](
	[documentid] [int] IDENTITY(1,1) NOT NULL,
	[documentname] [nvarchar](150) NULL,
	[documenttype] [nvarchar](50) NULL,
	[documentextension] [nvarchar](50) NULL,
	[uploadeddate] [datetime] NULL,
	[uploadedby] [int] NULL,
	[uploadfile] [varbinary](max) NULL,
	[departmentid] [int] NULL,
	[isactive] [bit] NULL,
	[createdby] [int] NULL,
	[createddate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 6/23/2021 4:52:05 PM ******/
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
/****** Object:  Table [dbo].[Event]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[eventid] [int] IDENTITY(1,1) NOT NULL,
	[eventname] [nvarchar](150) NULL,
	[eventdescription] [text] NULL,
	[isRead] [bit] NULL,
	[createdby] [int] NULL,
	[scheduledon] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Leave]    Script Date: 6/23/2021 4:52:05 PM ******/
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
/****** Object:  Table [dbo].[Message]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[messageid] [int] IDENTITY(1,1) NOT NULL,
	[sentto] [int] NULL,
	[messagecontents] [nvarchar](200) NULL,
	[sentby] [int] NULL,
	[sentdate] [datetime] NULL,
	[isRead] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Notification]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[notificationid] [int] IDENTITY(1,1) NOT NULL,
	[employeeid] [int] NULL,
	[eventid] [int] NULL,
	[messageid] [int] NULL,
	[taskid] [int] NULL,
	[isRead] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payroll]    Script Date: 6/23/2021 4:52:05 PM ******/
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
/****** Object:  Table [dbo].[Performance]    Script Date: 6/23/2021 4:52:05 PM ******/
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
/****** Object:  Table [dbo].[Position]    Script Date: 6/23/2021 4:52:05 PM ******/
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
/****** Object:  Table [dbo].[Recruitment]    Script Date: 6/23/2021 4:52:05 PM ******/
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
/****** Object:  Table [dbo].[Salary]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salary](
	[salaryid] [int] IDENTITY(1,1) NOT NULL,
	[BASIC] [float] NULL,
	[DA] [float] NULL,
	[HRA] [float] NULL,
	[PF] [float] NULL,
	[LTA] [float] NULL,
	[Medical] [float] NULL,
	[EmployeeStateInsurance] [float] NULL,
	[ProfessionalTax] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalaryOld]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalaryOld](
	[salaryoldid] [int] NOT NULL,
	[basic] [float] NULL,
	[hra] [float] NULL,
	[da] [float] NULL,
	[transportallowance] [float] NULL,
	[professionaltax] [float] NULL,
	[medicalexpenses] [float] NULL,
	[telephoneexpenses] [float] NULL,
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
/****** Object:  Table [dbo].[SalaryStructure]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalaryStructure](
	[salarystructureid] [int] IDENTITY(1,1) NOT NULL,
	[salarystructurename] [nvarchar](50) NULL,
	[salarystructurevalue] [float] NULL,
	[minvalue] [float] NULL,
	[maxvalue] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Task]    Script Date: 6/23/2021 4:52:05 PM ******/
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
	[status] [nvarchar](50) NULL,
	[isRead] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Training]    Script Date: 6/23/2021 4:52:05 PM ******/
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
/****** Object:  View [dbo].[vwGetAttendanceDetails]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwGetAttendanceDetails]
AS
SELECT        dbo.Employee.employeecode, dbo.Employee.firstname, dbo.Employee.lastname, dbo.Attendance.january, dbo.Attendance.february, dbo.Attendance.march, dbo.Attendance.april, dbo.Attendance.may, dbo.Attendance.june, 
                         dbo.Attendance.july, dbo.Attendance.august, dbo.Attendance.september, dbo.Attendance.october, dbo.Attendance.november, dbo.Attendance.december, dbo.Employee.isactive, dbo.Employee.isdeleted, 
                         dbo.Employee.employeeid
FROM            dbo.Attendance LEFT OUTER JOIN
                         dbo.Employee ON dbo.Attendance.employeeid = dbo.Employee.employeeid
WHERE        (dbo.Employee.isactive = 1) AND (dbo.Employee.isdeleted = 0) AND (dbo.Employee.employeecode <> N'ADMIN-1000-JAN2018')

GO
/****** Object:  View [dbo].[vwGetAuthenticationDetails]    Script Date: 6/23/2021 4:52:05 PM ******/
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
/****** Object:  View [dbo].[vwGetBusinessDeskEmployees]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwGetBusinessDeskEmployees]
AS
SELECT        dbo.Employee.employeecode, dbo.Employee.firstname, dbo.Employee.lastname, dbo.Department.departmentname, dbo.Position.positionname, dbo.Employee.status, dbo.Employee.isactive, dbo.Employee.isdeleted, 
                         dbo.Employee.employeeid
FROM            dbo.Employee LEFT OUTER JOIN
                         dbo.Position ON dbo.Employee.positionid = dbo.Position.positionid LEFT OUTER JOIN
                         dbo.Department ON dbo.Employee.departmentid = dbo.Department.departmentid
WHERE        (dbo.Employee.isdeleted = 0) AND (dbo.Employee.isactive = 1) AND (dbo.Employee.employeecode <> 'ADMIN-1000-JAN2018')

GO
/****** Object:  View [dbo].[vwGetDocumentDetails]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwGetDocumentDetails]
AS
SELECT        dbo.[Document].documentname, dbo.[Document].documenttype, dbo.[Document].documentextension, dbo.[Document].uploadeddate, dbo.Department.departmentname, dbo.Employee.employeecode, dbo.Employee.firstname, 
                         dbo.Employee.lastname, dbo.Employee.isactive, dbo.Employee.isdeleted, dbo.Employee.employeeid, dbo.[Document].uploadfile
FROM            dbo.[Document] LEFT OUTER JOIN
                         dbo.Department ON dbo.[Document].departmentid = dbo.Department.departmentid LEFT OUTER JOIN
                         dbo.Employee ON dbo.[Document].uploadedby = dbo.Employee.employeeid
WHERE        (dbo.Employee.isactive = 1) AND (dbo.Employee.isdeleted = 0)

GO
/****** Object:  View [dbo].[vwGetEmployeeDetails]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwGetEmployeeDetails]
AS
SELECT        e.employeeid, e.employeecode, e.firstname, e.lastname, e.dateofbirth, e.joiningdate, e.mobile, e.emailid, e.gender, e.employeetype, d.departmentname, p.positionname, e.address
FROM            dbo.Employee AS e INNER JOIN
                         dbo.Department AS d ON e.departmentid = d.departmentid INNER JOIN
                         dbo.Position AS p ON e.positionid = p.positionid

GO
/****** Object:  View [dbo].[vwGetEventDetails]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwGetEventDetails]
AS
SELECT        dbo.Event.eventid, dbo.Event.eventname, dbo.Event.eventdescription, dbo.Event.scheduledon, dbo.Employee.firstname, dbo.Employee.lastname, dbo.Employee.isactive, dbo.Employee.isdeleted, 
                         dbo.Employee.employeeid
FROM            dbo.Event INNER JOIN
                         dbo.Employee ON dbo.Event.createdby = dbo.Employee.employeeid
WHERE        (dbo.Employee.isactive = 1) AND (dbo.Employee.isdeleted = 0)

GO
/****** Object:  View [dbo].[vwGetLeaveDetails]    Script Date: 6/23/2021 4:52:05 PM ******/
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
/****** Object:  View [dbo].[vwGetMessageDetails]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwGetMessageDetails]
AS
SELECT        dbo.Message.messageid, dbo.Message.sentto, dbo.Employee.employeecode AS senttoemployeecode, dbo.Employee.firstname AS senttofirstname, dbo.Employee.lastname AS senttolastname, dbo.Message.messagecontents, 
                         dbo.Message.sentdate, dbo.Message.sentby, Employee_1.employeecode AS sentbyemployeecode, Employee_1.firstname AS sentbyfirstname, Employee_1.lastname AS sentbylastname, dbo.Employee.employeeid
FROM            dbo.Message LEFT OUTER JOIN
                         dbo.Employee AS Employee_1 ON dbo.Message.sentby = Employee_1.employeeid LEFT OUTER JOIN
                         dbo.Employee ON dbo.Message.sentto = dbo.Employee.employeeid

GO
/****** Object:  View [dbo].[vwGetPayrollDetails]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vwGetPayrollDetails]
AS
SELECT DBO.EMPLOYEE.EMPLOYEECODE, DBO.EMPLOYEE.FIRSTNAME, DBO.EMPLOYEE.LASTNAME, 


[january]
      ,[february]
      ,[march]
      ,[april]
      ,[may]
      ,[june]
      ,[july]
      ,[august]
      ,[september]
	  ,DBO.ATTENDANCE.OCTOBER
      ,[november]
      ,[december],
 
DBO.PAYROLL.GROSSSALARY, 
DBO.PAYROLL.NETSALARY, DBO.PAYROLL.STATUS, 
DBO.EMPLOYEE.ISACTIVE, DBO.EMPLOYEE.ISDELETED, 
DBO.EMPLOYEE.EMPLOYEEID
FROM DBO.PAYROLL 
LEFT OUTER JOIN DBO.ATTENDANCE ON DBO.PAYROLL.EMPLOYEEID = DBO.ATTENDANCE.EMPLOYEEID 
LEFT OUTER JOIN DBO.EMPLOYEE ON DBO.PAYROLL.EMPLOYEEID = DBO.EMPLOYEE.EMPLOYEEID
WHERE (DBO.EMPLOYEE.ISACTIVE = 1) 
AND (DBO.EMPLOYEE.ISDELETED = 0) 
AND (DBO.EMPLOYEE.EMPLOYEECODE <> N'ADMIN-1000-JAN2018')


GO
/****** Object:  View [dbo].[vwGetPerformanceDetails]    Script Date: 6/23/2021 4:52:05 PM ******/
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
/****** Object:  View [dbo].[vwGetRecruitmentDetails]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwGetRecruitmentDetails]
AS
SELECT        dbo.Recruitment.candidatename, dbo.Recruitment.interviewdate, dbo.Recruitment.confirmationdate, dbo.Employee.firstname, dbo.Employee.lastname, dbo.Recruitment.status, dbo.Employee.isactive, dbo.Employee.isdeleted, 
                         dbo.Employee.employeeid
FROM            dbo.Recruitment LEFT OUTER JOIN
                         dbo.Employee ON dbo.Recruitment.takenby = dbo.Employee.employeeid
WHERE        (dbo.Employee.isactive = 1) AND (dbo.Employee.isdeleted = 0)

GO
/****** Object:  View [dbo].[vwGetTaskDetails]    Script Date: 6/23/2021 4:52:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwGetTaskDetails]
AS
SELECT        dbo.Task.taskid, dbo.Task.taskname, dbo.Task.createdon, dbo.Task.createdby, dbo.Employee.employeecode AS createdbyemployeecode, dbo.Employee.firstname AS createdbyfirstname, 
                         dbo.Employee.lastname AS createdbylastname, dbo.Task.assignedto, Employee_1.employeecode AS assignedtoemployeecode, Employee_1.firstname AS assignedtofirstname, Employee_1.lastname AS assignedtolastname, 
                         dbo.Task.status, dbo.Employee.employeeid
FROM            dbo.Task LEFT OUTER JOIN
                         dbo.Employee AS Employee_1 ON dbo.Task.assignedto = Employee_1.employeeid LEFT OUTER JOIN
                         dbo.Employee ON dbo.Task.createdby = dbo.Employee.employeeid

GO
/****** Object:  View [dbo].[vwGetTrainingDetails]    Script Date: 6/23/2021 4:52:05 PM ******/
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
/****** Object:  View [dbo].[vwGetWorkforceEmployees]    Script Date: 6/23/2021 4:52:05 PM ******/
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
/****** Object:  View [dbo].[vwGetWorkforceEmployeesRawData]    Script Date: 6/23/2021 4:52:05 PM ******/
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
SET IDENTITY_INSERT [dbo].[Attendance] ON 

GO
INSERT [dbo].[Attendance] ([attendanceid], [employeeid], [employeecode], [January], [February], [March], [April], [May], [June], [July], [August], [September], [October], [November], [December]) VALUES (1, 1, N'NEN-0001-APR2018', 24, 21, 22, 22, 39, 20, 18, 22, 22, 7, 0, 6)
GO
INSERT [dbo].[Attendance] ([attendanceid], [employeeid], [employeecode], [January], [February], [March], [April], [May], [June], [July], [August], [September], [October], [November], [December]) VALUES (2, 3, N'REM-0002-MAY2018', 20, 22, 21, 21, 24, 22, 22, 21, 21, 8, 0, 3)
GO
SET IDENTITY_INSERT [dbo].[Attendance] OFF
GO
SET IDENTITY_INSERT [dbo].[AttendanceLog] ON 

GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (1, N'NEN-0001-APR2018', CAST(N'2018-10-09 07:05:13.687' AS DateTime), N'1')
GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (2, N'NEN-0001-APR2018', CAST(N'2021-01-02 14:42:59.463' AS DateTime), N'1')
GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (1002, N'REM-0002-MAY2018', CAST(N'2021-05-08 14:02:03.470' AS DateTime), N'1')
GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (1003, N'NEN-0001-APR2018', CAST(N'2021-05-08 14:04:02.830' AS DateTime), N'1')
GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (1004, N'REM-0002-MAY2018', CAST(N'2021-05-08 14:12:20.287' AS DateTime), N'0')
GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (1005, N'NEN-0001-APR2018', CAST(N'2021-05-08 20:55:45.943' AS DateTime), N'1')
GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (1006, N'REM-0002-MAY2018', CAST(N'2021-05-08 21:00:53.990' AS DateTime), N'1')
GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (1007, N'NEN-0001-APR2018', CAST(N'2021-05-08 21:01:59.820' AS DateTime), N'1')
GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (1008, N'REM-0002-MAY2018', CAST(N'2021-05-08 21:04:51.667' AS DateTime), N'1')
GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (1010, N'NEN-0001-APR2018', CAST(N'2021-05-08 21:47:36.953' AS DateTime), N'1')
GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (1011, N'NEN-0001-APR2018', CAST(N'2021-05-08 21:49:04.030' AS DateTime), N'1')
GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (2002, N'NEN-0001-APR2018', CAST(N'2021-05-09 13:24:19.867' AS DateTime), N'1')
GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (2003, N'NEN-0001-APR2018', CAST(N'2021-05-09 13:25:37.450' AS DateTime), N'1')
GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (2004, N'NEN-0001-APR2018', CAST(N'2021-05-09 13:48:15.493' AS DateTime), N'1')
GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (2008, N'NEN-0001-APR2018', CAST(N'2021-05-09 14:02:52.487' AS DateTime), N'1')
GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (2012, N'NEN-0001-APR2018', CAST(N'2021-05-09 18:19:33.523' AS DateTime), N'1')
GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (3002, N'NEN-0001-APR2018', CAST(N'2021-05-11 12:55:00.260' AS DateTime), N'0')
GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (3003, N'NEN-0001-APR2018', CAST(N'2021-05-11 12:56:20.187' AS DateTime), N'1')
GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (3004, N'NEN-0001-APR2018', CAST(N'2021-05-11 13:00:52.150' AS DateTime), N'1')
GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (3008, N'NEN-0001-APR2018', CAST(N'2021-05-11 13:16:45.330' AS DateTime), N'1')
GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (3009, N'REM-0002-MAY2018', CAST(N'2021-05-11 13:16:55.483' AS DateTime), N'1')
GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (4002, N'NEN-0001-APR2018', CAST(N'2021-05-15 13:48:04.260' AS DateTime), N'1')
GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (1009, N'REM-0002-MAY2018', CAST(N'2021-05-08 21:32:27.693' AS DateTime), N'1')
GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (3006, N'NEN-0001-APR2018', CAST(N'2021-05-11 13:16:20.133' AS DateTime), N'1')
GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (2005, N'REM-0002-MAY2018', CAST(N'2021-05-09 13:51:06.100' AS DateTime), N'1')
GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (2006, N'NEN-0001-APR2018', CAST(N'2021-05-09 13:51:57.763' AS DateTime), N'1')
GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (2007, N'NEN-0001-APR2018', CAST(N'2021-05-09 14:01:45.430' AS DateTime), N'1')
GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (2009, N'NEN-0001-APR2018', CAST(N'2021-05-09 14:03:12.110' AS DateTime), N'1')
GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (2010, N'NEN-0001-APR2018', CAST(N'2021-05-09 14:04:56.093' AS DateTime), N'1')
GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (2011, N'NEN-0001-APR2018', CAST(N'2021-05-09 17:55:54.690' AS DateTime), N'1')
GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (2013, N'NEN-0001-APR2018', CAST(N'2021-05-09 18:23:38.210' AS DateTime), N'1')
GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (3005, N'NEN-0001-APR2018', CAST(N'2021-05-11 13:05:52.867' AS DateTime), N'1')
GO
INSERT [dbo].[AttendanceLog] ([attendancelogid], [employeecode], [loggeddate], [status]) VALUES (3007, N'NEN-0001-APR2018', CAST(N'2021-05-11 13:16:28.403' AS DateTime), N'1')
GO
SET IDENTITY_INSERT [dbo].[AttendanceLog] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

GO
INSERT [dbo].[Department] ([departmentid], [departmentname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (1, N'Information Technology', 1, 0, 1, CAST(N'2018-04-22 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Department] ([departmentid], [departmentname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (2, N'HR', 1, 0, 1, CAST(N'2018-04-22 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Department] ([departmentid], [departmentname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (3, N'Production', 1, 0, 1, CAST(N'2018-04-22 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Department] ([departmentid], [departmentname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (4, N'Compliance', 1, 0, 1, CAST(N'2018-04-22 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Department] ([departmentid], [departmentname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (5, N'Finance', 1, 0, 1, CAST(N'2018-04-22 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Department] ([departmentid], [departmentname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (6, N'Performance', 1, 0, 1, CAST(N'2018-04-22 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Department] ([departmentid], [departmentname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (7, N'Marketing', 1, 0, 1, CAST(N'2018-04-22 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Department] ([departmentid], [departmentname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (8, N'Accounts', 1, 0, 1, CAST(N'2018-04-22 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Department] ([departmentid], [departmentname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (9, N'Purchase', 1, 0, 1, CAST(N'2018-04-22 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Department] ([departmentid], [departmentname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (10, N'Reasearch&Development', 1, 0, 1, CAST(N'2018-04-22 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Department] ([departmentid], [departmentname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (11, N'Administration', 1, 0, 1, CAST(N'2018-04-22 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Department] ([departmentid], [departmentname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (12, N'Sales', 1, 0, 1, CAST(N'2018-04-22 00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Document] ON 

GO
INSERT [dbo].[Document] ([documentid], [documentname], [documenttype], [documentextension], [uploadeddate], [uploadedby], [uploadfile], [departmentid], [isactive], [createdby], [createddate]) VALUES (7037, N'Salim Docs', N'.docx', N'.docx', CAST(N'2021-06-10 00:00:00.000' AS DateTime), 4, 0x504B030414000600080000002100ADDD80D8E00100004C0B0000130008025B436F6E74656E745F54797065735D2E786D6C20A2040228A000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000CC96DF6BDB3010C7DF07FD1F8C5E47ACB41B6394387DD8D6C7B5B00CF62A4BE7449B7E215DDAE6BFDFD94E4C29499DD671E98BC1D2DDF7FB39494837BB7AB026BB8398B477053BCFA72C0327BDD26E59B0DF8BEBC9579625144E09E31D146C03895DCDCF3ECC169B0029A36C970AB6420C979C27B9022B52EE03389AA97CB402E9372E7910F29F5802BF984EBF70E91D82C309D61A6C3EFB0E95581BCC7E3CD0704B12DC9265DFDAB8DAAA60DAD6F9F538DF9B516AF724438460B41448D3FCCEA92758135F555A82F2726D2925F7066ECABF20F1807E04935E66B0AD39A7CC2626AD74481F29E080433D73D8609B77439B15B582EC5644FC292C45F17B1F15EF0A795EA67F216AB510BD8494E814589377335668B7E3DFC721D709BDFD630DD708F636FA90CE07E374A2B51E44D4D0ADE1910C17EF80E1D33B60F8FCD60CCDB9746B5B42A49374FA83D949F74224DC1848A7276875FBED019112C600D82AF722DC43F96B348A47E2BD2095F7E83C8EB11B9D742F04383512C34EF9A8758038FC7EDCBB0A107BFD5720D428FEADF091F50FBF9B5F5B7F45960B511A1883602BDD0B81D43041FB1DBE138DCC739614D93C04D480C55794BDEB67EAEC4938EA05E81C497A707D50B74A0AD44BBDDB57EB448FDF1E73DEF4C2F3FF000000FFFF0300504B03041400060008000000210099557E05FE000000E10200000B0008025F72656C732F2E72656C7320A2040228A000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000AC924D4B03311086EF82FF21CCBD3BDB2A22D2DD5E44E84D64FD014332FB819B0F92A9B6FFDE288A2ED4B5871E3379E7C93343D69BBD1DD52BC7347857C1B22841B1D3DE0CAEABE0B97958DC824A42CED0E81D5770E0049BFAF262FDC423496E4AFD1092CA14972AE845C21D62D23D5B4A850FECF24DEBA325C9C7D86120FD421DE3AA2C6F30FE66403D61AAADA9206ECD15A8E610F814B66FDB41F3BDD73BCB4E8E3C81BC177686CD22C4DC1F65C8D3A88662C75281F1FA31971352084546031E375A9D6EF4F7B46859C890106A1F79DEE7233127B43CE78AA6891F9B371F0D9AAFF29CCDF5396DF42E89B7FFACE733F3AD84938F59BF030000FFFF0300504B030414000600080000002100F1B8335493010000930900001C000801776F72642F5F72656C732F646F63756D656E742E786D6C2E72656C7320A2040128A0000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000BC944D4FC3300C86EF48FC872A779A761BE343EB7641483B21C190B8A68DDB069AA46A3C60FF9EB08936C016ED10EDE8378AFDE4B59DD9E25336D13B7446689591344E4804AAD05CA82A23CFABFB8B6B1219648AB3462BC8C8060C59CCCFCF668FD030B4974C2D5A13D92CCA64A4466C6F2935450D929958B7A0EC49A93BC9D0865D455B56BCB10AE82849A6B4737390F9AF9CD19267A45B725B7FB569E198DCBA2C450177BA584B50B8A704FD80FC0910EDE38C4DCBBA0A30238E18DB8C84EE0749C721494AAD11BA016217A73E80A0F58BB5412D5F6CB51E218E07950A0439F6D15C85A431FF9AF2A3783B320AC9A01B78C85FA1C00102640EFC7B159CD334CE853A4814D415B47761A0D9863BD13B27415D39664E46DE264DC3AE8DC215CB1BC7965EF2529CDA136F87825A6270D380BB39DBD86B46503784B4FFF9505E02176C27A671ABAA4310972119D4DA6E6A671775E0E825AF134129F6FFE9FEED48420280E2CA967486E147F1314C4EBD1B131FCD4DE88EFC71A497BC6D09EA490D8CBB73B18BFB1F82BA0466FE050000FFFF0300504B0304140006000800000021001CF00BD4E4070000EE1D000011000000776F72642F646F63756D656E742E786D6CD459DD72E23816BEDFAA7D0795F766B63601DB60F3B30313FED2939AA4434166BAF6AA4BD802D4B12D8F2C43E8AB7D8779C37D923D926C636820A493CCD676BAFC231D7DE7E89CCF4747E2C79F9EC200AD084F288B3A8655310D44228FF9345A748C5F1FAE2F9B064A048E7C1CB088748C0D498C9FBA7FFDCB8FEBB6CFBC34249140001125ED75EC758CA51071BB5A4DBC2509715209A9C759C2E6A2E2B1B0CAE673EA91EA9A71BF6A9B96A99E62CE3C9224A06F80A3154E8C0C2EFC168DC52482CE39E32116F0CA17D510F3C734BE04F4180B3AA301151BC036DD1C86758C9447ED0CE2B230480E696B83B25B3E829FA3570F19661E501AAB9C0460038B92258DB7D3F85E34E85CE620AB53935885412EB78EADFAEB6230E4780DB72DE039E6FB7A501868CB4F235AE619119110C588734CD8D5995B12621A6D157F976B4ACEB59C9701D8FB00F1E275C1F9C0591A6FD1E8EBD06EA2C7024B7ED92FC0CA825C9E5AF23A63A64B1CC317187AED9B45C4389E056011840C81D791A4B5D1858C3363FE46DEC52CC86E639E3D7C426BC914C734218341CB260680D813463513E8833E48731A46081682D40A071D43AA0F881C947CED1875F510630F862B248F050C52024E059358D57D3078BB65EC3147335D6DC09CF2444CD83A430970F94D750E58908651A97FA721623FF721EB424AD66FBFE56FF97C8624F1388D65C2C975DFE20D4B0512D27B5B5B0B177DE0D4978F0BB883AEDC614E5363EE34D76BA6BD85C8470A0EBDB054F813B0D26C0EEC46AD21CD934D0FBCD4A68533CDFC6742174B915B69D5CC7A0E9D8B78FA9ABFE5C16CD8B56D30FD279C0FCB04E3E3D64C86648ED340C81E7BE0F6DD41DE33964D83BED9345BCA4C85C4665F88272D0425F79C2EA4950DC79163FC4DD6D2322D0746ACDA89E4AAB4095188C8E727A09CF9593440DA63C08B847E056B6D0B8870A1AE0662C02830458AB076CCC99C70BD58AC40521808D6AE65C708AFEA574E0017CBBA6AE98BF304C49CD32020A0692E5762CE1EF5B3B244BDA22F8C4689D8C84F26A48270E9A6555BA6C71478A59E11F91D9845E728A01191293942317D22C12DBC7EA2BE5822331BA5259334445726B20E349BF077A5785834C377ECA32B1BC41569F6DA6B48B9412B54CA9E13D284396410987460B07B4473E3B46685D9CC6476277A60FC31A32CB38C50DD75BC8C2CC49C3C099ECA128B3DAA382E38F6292CF58A4AB24D4866782C8A80869AEE9CE8E4C5DA01F31ED14A62740CE25310C5490CBD5C561B72A8565BD0B2E068999FD4326DA09FC6FE5B99B41973D6D23D6DABE9C6E29F4B35D576AB517162651993128A7234C40BE26381116F4B787EE35B9614115428A19231D2F8FBDBD1BDFEB81E94EA513823B0B48F395BDC0C3BC6B80F7E813A47E57FD9B06BAE646A4F4DB6630C5824C06506D2784AD872AD96536F36EB50EF6DEDC93397FEAAD52357D7384B1FA7728ED95049E4AC9C53BB36478322B34CC62A05361CFB7AA09691FD44B42BAE1251D6A490330553198F3C59CA4963986C3457ABCFBAFDC5CBBB0232D7A12F8616D9591BD26A341C572F9C599E9D69F13CEB76EFE77335B7DC4525089538478ED3B34E01C0928E7ABECF6111DF075202B23CC85753C87B09E12B62742B97E80CB5BB93690EEDEBBECCBF8576B53017CBAED93007FA03DC9A7758FB74C962F49155ACD605BAE7DE92FA681CE0AFF8024D70887E49A335E6E861891F538E260CFB17E823819669FF06C11AFC788186784913CC7F18FDFD02DDA5E10CD3CB3A70D66D5676A7A509F7FF459991DB1AE9E5FB48C4EFD8ACF28250A3F6D150BF755CFFD1B24EF36A546B58C3D1CB54755B4EB3095906FEED41CFA0E893BBCFA9C05C560E32F9E8CA0D8760D7E70FAC8FBD471D815C7614F985A4EA781FDE77ABA8D5B42DCB36ED96F93C25F72A27ADB77F5DABB75A6752B29428BE979285F51183B581CD4B337A055B47977798062FE1EB99F95074FFF3EF3FDE18F70D029FD0458445CAC92C6615D866B5AE166FFFF975615B1DC84DDD016AC9164FDF745BB655DB215CDFB5EACDE1216EEDF6286E654D8A22EF8032709D7A6FB4E7FBBDC6F25E62275465E82D03BA967BDAE9DFAEAB2BC2452F80E0E58E4FD218F6976A83B7EF7DB13CC5A5CCF45354BCC31B24B9F17C66D823E64BFDF0C02EDE5847D9735A477F09E997A21EE58204E896CA0D90FFFE6AEF7080FD1F3E9144144500828C805421507F6FF5470A9B74868EAF809A7A43D7766CBB4CBDB4A09C3E07D9635B2F8E03EAA9734D041B9BDCD17D0E95D10CC37A36D09B16E8DFD7AC012AEF1E8B0728C710FC170CD1486EBED086C1AC08C29CA038203821BEECC430958D9A04D693981593885922620C9560B60593B3C502312801B12E6F61CF85E093443312B075FBDDE734BDF9F0B1F7F0EB6484FAE37B341D4D7EBB198CA6EFAFF6586DFCBF61F49905F9F3C6B56A66DFBEFE6EB71CAFF8FF0472C314E1CB44FF62E919DADC41DD6AB887B4EDF694B57DBB28BED2E66BF8C4FE4C02BFF9047AA958324E65DE98AA8A8AF1CD3B85FA6D6C7F1665A7F07839740239715C2C2567E24FD5B10D30CF721DD755FE9D3326089FC803501279727F909DB3684BCA873835AD7949B07F68843A422FCBAB33E5E31ABE917732A72DA65F913AF9B16CBBAE36704B78769AFAD9633E294EDDE3C51D964E102CEE180D5B097079520612752DAF7F5AE818B0CAEA737DD8DE6C7BF5648AB1DAD68ED174D5DE7F910AF59AED0DA1104F50F15B841CA29A7DE6C9E378894D2332A6C2037B6B6E5EA4EB48A947FD6B4975FB436DF7BF000000FFFF0300504B0304140006000800000021005FAFC877DA010000CB06000011000000776F72642F656E646E6F7465732E786D6CC4944D6EDB301085F7057A07817B9B92E1148160398BBA2DB22B92F6000C455944480E4152567DFB0EF5EBA64160C705BAA228CEFBE6CD8CC4CDDD2FAD9283705E822948B64C49220C87529A7D417EFEF8BAB825890FCC944C811105390A4FEEB61F3F6CDA5C98D240103E4184F1796B7941EA106C4EA9E7B5D0CC2FB5E40E3C5461C94153A82AC9056DC19574956669F7641D70E13DE6FBCCCC817932E0F4DF34B0C2E061054EB3805BB7A79AB9E7C62E906E59904F52C9704476FA69C440411A67F201B1980C4549DE1B1A9651E1CEC9DB4B76C01B2D4CE8325227147A00E36B69E732DE4BC3C37A841CDE2AE2A0D518D7DA6C7DDD0C768EB5B8CCC073EC97BD48ABDEF9DBC42C3D6322113129CEB1F067CED18966D2CC89DFD59A93E666379701562F01767FDD70BE3968EC4C93D7D1EECDF3C48A7FF605AC61C8A7A5F9EBCC3CD6CCE21FA8797EBF37E0D893424738B204BB9EC4CF9A6CE71B2769F370B418E085658E0570045FC9B2208BAC8BB3B8C51BAD7C28489ADEECD65FB2DB18D1BDDA898A352A9C9C748AEF2E2EDE328E6E30965541E04D90469D92B13FABF5B47968A23DD6042074BBA193BC678CA6FA23D7075C6EAB970F25BF563D0713A469BA3BE7F16527D2FFDF8857FDFDDBA6CCCF7EFB1B0000FFFF0300504B030414000600080000002100C90BBB17A00100003705000010000000776F72642F666F6F746572322E786D6CA494C16EDB300C86EF03FA0E86EE89ECA0DD06A34E0F0D32F456ACDB03A8B26CAB95448192EDE5ED473B7692AD40913617D326C58FBF448BB7777FAC493A8541832B58B64C59A29C8452BBBA60BF7F6D17DF5912A270A530E054C1762AB0BBF5D597DB3EAF222694ED42DE7B59B026469F731E64A3AC084BAB2542802A2E25580E55A5A5E23D60C95769968E6F1E41AA10A8D4BD709D086CC2D9B734F0CA51B002B422D227D6DC0A7C6DFD82E85E44FDAC8D8E3B62A75F670C14AC45974F88C541D09092EF054D66CEC073EAEE5336205BAB5C1C2B72548634800B8DF6C76D7C9646C1668674EF6DA2B3665ED7FBECFAB21E6C50F4648EC073E497FB246BF6CADF2766E9191D1910878C7324FC5B7356628576C7C29F3A9A93C3CD6E3E0658FD0FF0F565CDF981D0FA234D5F467B70AF07D670A93FC09A9A7CBAB5709998A74678BA8156E60FB50314CF861451CB123AF564F8ADD99A868D4FFA9C8654F9B36069FAED66B5BDBF66B36BA32AD19AF836F278E21A218F389AA7B8338AD674C2146C0B1015323E445EE4EC455D377170F2296DB0E393C6DEFA2F000000FFFF0300504B0304140006000800000021008E44C0A5B71B00003B5E000010000000776F72642F666F6F746572312E786D6CEC7C698FDB3A97E6F701E63F14AA81F9304E5DED5BE5CD6D68F326CB9BBCC9834143BB646BB376A9D1FF7D28C9AE54A52A4925F7F6CC8B9E72503249918F0E0FC9739E4331FEC7BF56817F575849EA45E1977BE40FF8FECE0A8DC8F442E7CBFD76337CA0EFEFD24C0B4DCD8F42EBCB7D6DA5F7FFFAE77FFF6FFF281FED2CB903ADC3F4B18C8D2FF76E96C58F10941AAE1568E91F816724511AD9D91F461440916D7B860595516242288CC05D2A4E22C34A53F0285E0B0B2DBDBFC205AFD1A2D80AC14D3B4A022D03D9C481022D39E7F103408FB5CCD33DDFCB6A800D933798E8CB7D9E848F5788872781DA268FBD40D7AF5B8BE43DCFED9B089191075698754F8412CB07324461EA7AF1D76EFC2E1AB8E9DE408A1F75A208FC5BBD3246F0BF360642A295E0EB2BE07BC437FB4681DF4BFE6344047EC788B4104F2DDE23C2CB67DE2409342FFCFAE0DF52CD33E522C4AF01A0DF02C4CE5F1B9C5112E5F15734EFAFA14DC2F31356BBA87F01EB3AC8CFBB96FE356114578BC10A0C8CC789134689A6FB402230647740EB77EDB4BEFF13189BF8AE7C0446CA5C7FB9876191207192BDBF150996ADE57ED6DE610982A2F9BEC532E9BE94ACF62D50B5D0FC2FF7C328CAACE41EFAF31FD0538DFED2A7C368994491DDDFEFCA805CAC0FDA845A66F151988155DA15F26E047A75B7B62EB997584007608CBBE75E970448C68F5A68B85172677A69B601E2DD7729EE2935031617C131F89A5D7FCDA65E10FBD6324ABBBABD7929ACB1E5392EE8274A2024C910307E7FA75BAE179AC07E7415FDC8385B669FD4EA28CF26216FF9A0DFC8FD9DE6FB51B900A6DED7E2AEA0D5ED55C2096883638488092C76BD61995ED616A3228D223C49B67D8B1F9FE4BAABBAA7D4ED15EA6EC551EAB53670FC24EE3089800D8C35C7EA1B6BBEE7847F1A40835602F47B2BE8924FAD5F60ED7E82A547591605DFC3DA7535ADAA1DB33B03084C5134CD20406C03C88D31044EE2CC557ACBB62D2313FBBA7ED7B7764201DD77571D680CA56E5D2D132D9E0377D8E7CCC85826779ED956B9BF0BB500CCDF6EBDDE81FC9FFFD05A096669765D2FDA6F98D5CE985D91EEF204ACFE7FE7111A13A821F9C0E10CFD80631CF6C0E034F7805028CD1128CB9222FE1F6D1BD3321EC11F5858AD1A6F428092F7ADDAAB24EDC2A5A0AF385F2D2399FE9A014188AB0181D23AB0AA674046ABC25F41BA992208B4FCDB5DC6AFFAAAF73AEA5F67255A80BD53312F062B884CCBC79EE4039D3BFF320A09795F5D8551D1BF014040080E19AE96645F07DBA8A8DF43C25E2391BF8784BE467AA78FFF1609798DF44EBAF12D12FC1A09FB2D24E63510FACB409D40E81BBD437E038A81E8D740BF8CF3ED44FA727F7FD7B975A4F3E89D7DBC7D038BDB7B83CE3C7786DA98172360B95DCF1826C04A2F13A8B5A94E5FF47798E72B94A0655A6FA6FF3AE56B05771E4B27EE135D176225EE646F0B9C3ED73EBDB293A0FD06B8DF78E7DE71FCC8036A8F86BBE8DBDD2808A8F0C0102871BB2DFE0402BA4900BD900BF0C3C732EDC44F5BF1AFAE92B879CA616259AD6EEF8896E87D1DBAE7CE6E384439421CE20F43907AC0610E7FE0449C7918A2182DA2D4904731B2737608F9682456178A4DCCDB8822BF6E22F06F9CC18793FB70721F4EEEC3C9FDBF7272ADD1F87766C82318C3910F0489910F388B710F2C4F620F140AF304C592188C12FFF17D4778B5BE4F86F8E636D27806A2C6B40B799FDF69332948DDE9A50C56D9977B2DCFA2CE44B766FE2E89407C84C034DC7EBAE2ABDF79E63F501466B06F1D10C5603471F31E2806639D8B7AF21EC0D5E46936B2A22EAD1540FCDE4D9B57B7E09857CFB1010FB1031F78ECFF09DDC177E51D4E5C9DD5D72AC8B32A2809DFB9EDF5DB4AE8CF71B01755DE44C19F5501086FE3103FC7217F2E0DF5BD5E41CFF4A4B937D51955782D03A93BADDDD9ED472CEEE3F8569175A7AC1E02D4FA4165B4AFDC8DEB4F2BE37DE5AE073FAD4CF695A9E795FBEFABF80908D1BF0DCE932E38D77B15C55AD6F6FA96BC038EB255DF9D0BE622D93F2C880A6B137535B2AF34E9ABFEBEDE3772DD3338AB795DFB3A66EF296AE57F81F3166A27E3B7203F2F7C1736D20FC11BF23DCDBDB715F10DB41FA5ED7E07D46BF629D15B97978B368D7CCF1C7ABEDF655AB367F17ED23375CD68F77F6E33ED454DBF9B1B61D4E6FBDB7DC95B8C9041504003514001499A7AC08738F1C05030FD00230CC79030CEE0C2B06784F8A3EB99A615CEBCF069F7E3BDFBC1CFAC327C654E604675A4F8753F13477FEA6567146F8A7C510D90FAD0ECB4EE5A9A295ED399E6F97D1A7A29F1F78D796B9A7B23AD47660DCC7461256051B851D2002993768F2FBDE45A0218963F69BD0883E078BB70BA0C4E00AF01D6CFF33BFAF33B611EF0D175E3B0DB22FC729FDD927CD66F8A19DDAB9759A8B4AF7F907E292769B6A9F65A12DFB549D008083D8FFA3DDEB6C2CDA0B7D3E7A9EEB54B7D47AE99A798E18DE0817C1D3CF423F2113C7C040F1FC1C347F0F0113C7C1B3C20348B93300B3F300C46B40E13040F188C3CA0224CF04358A4615CFC67081E8051467B8AF36CF3E9BF50F08082C8E0A7E1435BE9EF081FBE1B863C0F20BE8343FFBC5FCCFF3F61C8772BD37DE5DB0EE83F6FCC82DEC6EFBD85EF8A2EFA1620E47F0ED3665FC51C2DEA4754F4C3A808BD3EE3232AFA888A7E232A425EBD5379BCEB1E71D79DA1F9888E3EA2A38FE8E8233AFA888E5E47470241111825C00F242EC20FB848F10F0CCD0D1F4451E0451241458C44FFC95EAD1034C85D69D79BF11182911843FF6E7C644461987A9975781E27B5F824418268E09AFA2622B835529F370272E0288C81E8E09AFA4EA3C3F370AB8D387EF28C97D57F8AFE3C4E7B773F5E06772F9EF17B31CE73B5D62F1476A5973F0A369E6BEA79E377054CCF15F1BCF18D747E3F72F1BBC8257B57E472D3671BBDDC94D5DEFF368279AAD74FD4674AFD5AD30FBFF3E6A5E3C06FD5798EFA6DCDBF97AADFA4FDA0EA1F54BDA3EAEDB8B3C08ADB5E77F36DE2DE9D8CEACE72B5D6E3EB61B1E7F956254083A9D7586BCBFFEE616A502536B2BD6782A98C7483D5A23F2FBDE66F402F71BF7BB0BA47E80F9AFF89312F70AFA52F81775DFE7A8EBC4D7F3D000F3D1D93EF4ECC0F35DFD735E3FC677B2ADF330050013ADD9E932E5F1C44272958E01882EB7DF3D349EABB084C99B6E4DFAAB6BBFF9622304AB6FF39A96EFFC3C0EDCCF7A3A683E99A67D6E7404B1C2F7CF02D3B7B846FB92C8A41A66C15F44822D81F589C7D76BB6E3D6208F2070EB2CD83179A56F5F874C8FE7390460F5D9387D84ADAD5FFD86ABC2BEEDB3E95038575C537691E4097BC260A33CD7FECCFBD7FEFF6C36D3C1EDBA17859AB5D189E0120FAE3EE6FDF7C03E0DD32B72B0184224018A0A39E667C7A605A1ED116B7037D3DF6F7A93BEFD70E8563572698B95FEEB7622A70DC8AE51C76C282CF64C5A34EE3299003320B9103D74D5BBE87E7851EAE7DF067EFC67E793CCCCD59E866FA5459AFB6942073DCF07FFC4BC57E66E09351DA93FD744B522BD6F149558215988FC623EEBCA9A4D97154119B915B9C88053A8295F57E1E3510458739531AD579288FE60E79C9579719B9663B40382554D24B8822637C0199969C302917F2541AC7633F4E4846B2CDF1A9AE9420F1145B6D065B25DC2F558ACDEDF94433255216A772C5B0B100454207B8F0374994B807D41F8A9E1F180B746DCEB3134F54C29089F97C53AB1C47E81EA9AFF0B48EA698C3EC57700DECEFAC7108C9E40FBE343B15C69E66B00E50D92E2E87326C082171C27136DD548B74658BD264430981A06C79AD2AA9F525A4299A3AA6C15A662C74172C2D6E8EE717B5D8647BEA5478278799437507384D0F9631BBC097C15E20031AA85F80A052665F0F168B43CA1842DAC19AAEDAC19AB5E5076CEAEB63B9988553BF03D4C78BF3591E5ECA8695DD7C2014EA726D1F465A5979A78D3738C1A3221EA782EA05B2B687D51AB51354C6979C1C26FA5687560CEE4336E4CA1E7259F712EE2668BAC8C8EDD43107474F706C7B465BE7A13F54F4620747112EEABCDB8C2ADC66466B534789B19CAAEEC5E7CB11E127B30BA37BC773B55F7817B5034451D5DB241A7A56E51CF1916C256030A42F03AC2CD5395C21B4A3E3046BAEC0AD983841E9904337F07045ADE170331777D8898C18DB5A35498478FD28EF59041F068315AD211A3DE08A1C322153D6D1A94AE4DE527747D0390B71E332DA425682C54651F2DFD37307085646616E740C63B7606594C7767DB4378FE3693343B7B50EAF0BB526707DDFA47B1329D0465DD9D5A084F0F10A2F85E120599D2730BE9E626AD9032E52692A2FB53572F1F4FDA8BE0C873535DE44108553DB6C3D5633D3CA83A1396C18753ADED2986B1726B9596083663F3AF84E74AE88E5494F653A753AC0D98421CEB93E4BEDF10C324A59D84DF7739189AA5046E72E71D4F49A182C498A46E14A75089B562AD771F84DC15599478DAACB25F6E69CB7A5D54BD6016A8770C413BA5097DB8386C4DCAE2EC79EC6E9F88C5A7011E10B2B539FC5539E9E7ABBA95A5917C21EB99602ED673C3E08834A02F3214D442EF50FFDC43ED0276861E3CB594AC51A0F28DD3639ED9D8664BD703F97111756F5DD5C832354055352CB90919359F479870C8B25E2F0F45E33EAB370E1E7FA06EBE72171D6CB8D3244F62A89D6E4A4128913EA1D11AB118E8301C42DCEC28AC39AF3A8B6CE9ACD2B87A9C98D5DD3CB730F4DF2CB6E3BC897929061892AA8703FB1117C1BC4386518D884AFAD60BC39B9D5D8C867B8B9A1AA856666C2628CD63362EBE56E42AE9B75B6C6B843C1CD05B71CCE10433A98AB4B53F196EAF6F3701024157D3C4CD8C154DDB093F2C4D7A5B6AD8AB17CC2AA8C3CDBD3A060A503DE343AE397336922B0A7713346C841B8463C1611235E3AC82784D2FA7928F2883E23D63611EDA9A182AAE6888C295E62F0511A36ECFA345AEA225352A4BA3936D3828089F8DC68D3C09ADB63B9369559330D4FAE2F87C110263A402AE497E34182C08BBAF6B6046B10F670A63290C40C8B6263AB923A1A353303A2572BDE1DE19759B4E3E56ACCA93BFBB80B4EEEA6A40E765EA818364A3BC07A7840F50A56D7237C32F0A2F1E242F9758EA9FBE960819F9123B661731517072BCEBB60C764CBEABE4C463CC3D54681B87E8A71F4A8E2A73A5E0448079822A992C34B4FE0D17A52F0C5747499AA6C6AE08325AA2C8F35BD89CE13D91F585BA16AFC29355855D4749C23FC293A2F358CF5CE5936A512258EB2DE625B7B98D2B891B4D8C544B2607DCA75E0E9A2DE5B553A67EB9AE59DE58915862A8F07FE01A7150719ADF6CBC4978461744AD7DCAE2C81253CDAABD114EA00834C1AAE14DE6F88DD92472E2EE2016B9EFAA83EE256E7F9415DCDA0D3601A41E938CD252D421B73BD66B51CA106CBF9720287D462DE90A70BEF3964EFA456B01CD938B32C485355389F63D6E406C7E590D6B51D8F5D525F1FE8A129ECA266271E1816C7EBDD0657477BFF3056F6C35482034A3B07662C9FF3A603142438958F88795427F456E44EA3D448134C39338AD38C0E5BA222FCCB74B3AF053CF5507C2C12B0A08C708D230D98C6F092979A55B620627145E7B30EB05814C729A460948AECB5A35442823E0FD42389366906E287A15B4E63DE56D5ED7ABA8D4711B33476351638F1999CC08BA317C4F5DAB108923543A55F7AEA493922392AC5B17F01CE5AD11A61B7A942433E3327CDD7085B26376BF8B4D94E086EED13156D8ACEBE76B3EAAC13035C958EB1905655B592A809D377B9AAEC5AA542AE24E0F5D29E17CB34C0C8BA582C9D99E89DE6EA8025E75E621652BC95567B44986C58FD401C2AD19B28EEDE4B16045620D3B5386AF8DE382C056B4F12EB134EC02BC7A2B299E28C3569BEBD6C7276A15E181B4835D9C3517D718661C55C8C7A502E0BAD5C9B1796770979C2A05ECC14FCB834FB519E6B4C3A0F86877AA301FE0189077C5986CEC161E9EDF0C0F2A42730872000FE353C633BB540B9C61E4D4A3BE1757633391169E48E47F2585935683F0FE5B41E07529C9C58EA62A3F82ADB7812C45EA6D17E93D3A99AEF2FFB31AABB5B1973146A200FB9C5DAB96CEB25ED6DAC41BDA1113295E21A372C5CA03A4030A126FB4B7CE006FE657562EC0B1E15F9EEB4AEB6086365EA41A23873801E869EE84A6C988E15F200A9E1617DB8C0B8EDB8F1E54CE8D6209DA1154A76805B40A3D4314A1883C45DE647E270517756C91C6363BC9EB09E176D685197185D0A52748A9D19723BC7C4F4E42E8EEA8C1C5E30E15C91180527E522177B378A1670AD323585E075285563B39AEDB90A9E4F44148A447D353C4B0D9BCEA299EBCAA1EE0C2C687340465E4C056B263865599A44103C2B07A4B4EEA7CD68796E2C559CC5258D9BEB92A2F6B98DABBE3D2A536C8F01AF819F0EF044B48233718C8069A61D39B41B1EE8C6B21BCABF78E8452A20834DF68CDD7BBDCB7031D6748829CD689126C474D7AC66BE44CF4E48194E8EEE60EB7378483183D502DA1F369411CEA8B3A57B9B12D08B2504B125B7524A591CB2ECA80364D996F0B12E3BCA34F1021E053E9C23826BCB15B9B311CAC571C4603AE07FA6D752924A3ED1C802D0BF95BB6026C5648128F33A72F07D6FB125598907DCC858CCD9FD442516858829559E46A63F6B98C435F0D94CD144B5C1083DD1580BC5176B6A5DC6F9AE3A97B1AC1D433F1A8EA9FC1054754FE704E2228FDDDA7502084E253C9FC1B1390201A8A0503A3C9B6E5709B5E293685545D306C3D651B61B10A2E21356631EC747C9D80778606F13DFCCD99ECED5B502546FC1F0E2BC0E9B383D65C5513A9D44861C5003C00E029E69A0C2A16B30A428ACC52459E0060BA63C5B41EAE6749A624A24FACBEC7892AC5EC255A24C06632C3CC16ECCAEF712C1F184CC27E7021A2718FE9C7373AC07B3ADF29FF43ED384C574366833F84AECFD32CBC96DFEF567980980FFC2C73D011F9035618C76CD41E906058CAAC8CF562DA15459BEADCB8BEC6209F7CC0162D4B664CBAEC0B59D0A2F3F455BFE9CE9EBE3F99B8009B6453B408629412F8474041A0A5D4F5E7CF2B677AFD9ECDB52F6FC10899484E9441BB5D208AFA544DB063DE8BA3051A23E1ED4DC1A2129D0EB90EB85001377D503D22D80404FFBB65FBE7485F7ED4E43DABD096DF70F9EFF8FB3B73615A81F6C2A74BB096D7CFCB9DD4940D1DB5E42B7F3FEB493C0A018F23989B2EE6DE92342C39F0B2FBDFE44C96397F4AF117AA2C50FDDC31EFBBDAECFC543BBE1F4D0EF863C8287BC08C27182F8D49E45F871002E940C7EA120A04F7631795700DE6C1351E684714FE7F059210267A46BD158DC07244766E3E10EB655D10B74D341F9A3AF9A0C6499029DE34E641D073A442B8B78C764F150980FB30C8F731E4FC4C5D52FCF191D30296ABFA1B7262F529130A1ACB33A3165ADD66A3C238B55214E92D4942A5701219292BA44B4F2086632358A50A537F109100C47DF8E06D5B403C4FCCD2E3137D6F420C58A988EE6E3DD6C7C2017CAA6CA692866C5C03F8B2C3DC64DC96745594D0C6DAB5887B4990CF678E6AE8EB96995B83CB7A7DBAA77A34B4A4B87CD625855CC0CF2E3E8B43D1F4EA3E04894B57B52D6D315AD4AA3422A1079DF4CCE330CDBEDB78C3FB27D869E926E831B4728DF9E1A9B5AEA1DA03ECE4F83E32A0736656BB3F22B2BFC640884B17940C74A9B3995AD014EC11F671BC12E356A3A6FBF3B40835456E53E1164B61E51F8827198116398B130D2E60B1DDF594A6951BC9F4D37A3E56CCF1F338C220379E88EF4A6B80CA168405B109A357C1CE853BC033C39FA7EB3CAA5283884382A382456A9B6CA2B4E3676ABA92863A2EF60140A515B1C56351F9888E87CF1256FC4B933E5C8685E05C791A018D2FC38EF009BC6772E7BD932C52955AA63380E506C5130C16A663A978BDC9C274CCE0E627AC31C68B742E946690C9F3ED6F01C18F084F4B4D43E5892446C4FECB203DCB1353E93E912669A2D01F31003E63479DCAE450C3940E719BD01C35191E501B0E365AB3F08A20576C8CDD872F5C2D2C835DDEF2C85E756C12C7135196018D6B551338D361A82D5005602DF9AABBA4E3568025871A4D4F0A5499B658A6C6B4498AFB6E7D35CA189656D543D83CD90AD241CC69B6CC729124F4C1B319B3672B854A8DDEE722EB35D2261F860DB09F23DE9E6A2B7DED057F3056C97D6967776B097EEAC63663B0DD06EAD8ACA72B52FF815A7885479804A48120FE715C69FB579E2CD86ABCB681C397A35909D410778460554374F6605E230B34C87277A29DBF23C3513245E8BF60221D4DD8637A6FC62C693713CE3EC90B0F552C4578BBA4AD55A02144CA08A0C1FEDFBB022D0D5E5D29F62FC653F1197EA51BAB8BC26C8B1BD1BAD579B41353B8C613D538FC270446E83CBF8543AD8E958FA8A12CD11B73C48411327DACCB38BA8F7297C82E7218152BE74364FF634B64E4E4EE719ED2B05B2C81B4CAB786E50B032441950369910D0109DCE612EB7DBD5F2B4AA7AFF72D5E157E5D24B4BCA21B8D5A8D7FA17F1B57FE93EDFB38DFD5A6E476D35C9D8971B6715B6635CB85DC613FA69E3ECC587C7B9B7D732F22660332BF7D66A0532C2B92D6A53DF009EF91B3B3350D70544A05FCBFABEBCB9C4D75443584FCE5BA89BEF6857D452BC979FA095E13ADD7AC0E7730E749F5BB54C023CBB5D38CB6D2BCA94ED757975B177EDBBB42FF741EB9E8C4FDDA77556CF2E080ECAC0DDEE5259F777B6E7FB46E4B76F66FE05D7110661EEFE1786C2F8FF6EFD6F12753F646377BEBB7BBBA825495446E7EE354EF4D8BEBFB48C2CABE3F67D6D9E6651F0ACD88F8CF697733E5DCF087F863FC19FAF2FC73FB5B9DBD9E1AF2DB4D0F1DB5FF10135DB7FDD9BAF2B69F81E7B20DE640FF44FD9038AD11D7B78608867EC017FCE1EE00FF6F0C11E3ED8C3077BF8197B38A192E4FC167BC067907AF0F91932C1AC9855525C53B62E2BAD2EB087B9D4B10344D026A2B27C8519FAF630A0F7FC095EC8903CDF12CA294525679928D650290FA3D5C943F37C3F2A0FE313638FA715EB4E821C0ECF212794DB2863E6FDD273F410DD616488AF59FDACB086E1AF1D35AF6A693BCFEAD1501D4C701C58848159791B8ACB638B2A837C36AFFDFD2E2175C1CF467C19D1F10A3A1CFA790826871A3007A07CE8944A168642B59F26B9BF5042440624615EB3DEC91621686E5BDA6A970C66A8A2478281B59B1D1FECE1E7EC61C2785EB4FCBFC91E8A4F0F802DF47FC627106B777F9FD0976CE2E794C2B64D86243B4A41FCA7500A8CC62982A63EE318C1D0544B2C7E8962BC87643C3BC0FD16D760DEBF53D11E177C6BAFA23D7CF59FC336AE87B13EDD8E777DB08E0FD6F1C13AFE4BB00E79D31470823FB10EBD2DFF3EEB582F1B35E1658E1FF014218CE4911E7BC565E6231B513B781B7D438109DFA084DAEF089C9999B8CF208B9F48D8C07607474A3637FC9C24FDCADF1BE3C3929D72E130330D6DECCCE02C5CD6BCB1667475CFAB430193CA8DA19D0443D7B0C2EFDFBA41E6F6308994D243861C7980756510D667A726F33D3A6521B358E0F2A094C8559ECE295EB0E60771B3DEBB977421285B742E0DE2593DC0A29ADF4CA1FEAD1BBB5B34CB21892FCFBAEDC07593F9E665E1FA6851B3B460E3273BC9968BB4B24B2B3F18134E0EDB85F30DDBB8E9B307FC1BD8C68D68F4807F03DBB8118DB7007F8B6DDC884607F8F65E8548538CD4BD1641BBEEFF986DDCA65907F803B621BCCD36BEF150FEA74FB792E456F62DA9A009C334908E54907F1BA9B8D186EB89FD97BB15DF23102FC94389C0DDAFD25E0FB856D7139DD76C7DCDF64DBA3397DD49CDFE14667B4CF3EBD9CC36F7FA078FDB5F43EE9B74573B4BFEFC3F02000000FFFF0300504B030414000600080000002100B4461EB05E39000050F6000010000000776F72642F686561646572312E786D6CEC7D578FEB4896E6FB02FB1F12B9C03EAC564DEFB2FBF6805696F2FE65402B52A2139D280DE6BF6F9094F292E9A4BCB77A6AB65B05542515E63B614EC439E76304EB6FFF96B9CE536A8491ED7B3F9E91BFC0CF4F86A7F9BAED6D7F3CCF6752937E7E8A62C5D315C7F78C1FCF27237AFEB7BFFFCFFFF1B7E38BA5874FA0B617BD1C03EDC7B315C7C10B04459A65B84AF417D7D6423FF2CDF82F9AEF42BE69DA9A011DFD50875018818BA720F435238A80285EF152257ABEC0B9EFD1FCC0F040A6E987AE12839FE1167295709F044D801E28B1ADDA8E1D9F00364C5E61FC1FCF49E8BD5C209AAF0DCAABBC940DBAFCB9D608EF915B56117C2D710D2F2E2442A1E18036F85E64D9C1CF6EFC2A1AC8B4AE20E9579D485DE75AEE1820F8EFCD81102A47F0E727E03DCDD7CB4AAE53B6FC6B4404BE63467288D71AF734A12EF3DA1257B1BD9F827F69682A838B10DF0340DF0204DBDF9B9C56E827C14F34FBF7D03ADEFE152B5FD4DFC0BA4C72B56BD1EF35666A29015881AEF6D2D97A7EA8A80E681198B22730EA4FB95A3FFF1D6C36C1D3F1056C52FAE4C7330C3338490BD8F33549304C2571E23C87E7601A66CA1AA3B0F8338D4F8E018AA68AF3E3B96D28BA113E437FFF1BF45AA2FC4FF9ECF9A3D0F7CD32BF4803ED629DD8083D253678DF8BC12A2D1279CB07BD7A9A1887C40E0D3006608E0BB99725011E8317C5D32C3F7CD2ED289E81E63D174FDCEB531FECB8088EC1979F939F3F23DB0D1C63E44745D9727B498DB6616F2DD04F94404812C768FCF949352CDBD3C1FE5114747C6D6FE8E5A372F293B8E3F18603FA8D3C3F298EE31F8760AB7794A048C8C7F6D2C20EA88321382309127AC930743BCE93618A403096E1F3BE052FAFED7ACA0A29A7FCBF509115F8919DEF81EDD7E64AA10FF6C040D91A6565C5B1B7DEDF3530824608C6F79A503CBED6AE612D7E0B6B519434B27CCE9E34D0608AA2510403CDD640BB11A0CB0449A297E61BA66968B15816768ACEE51A0506BFF8AFFAB3A3C7500906C01896BF745F1B854FB65E0CA9A7B840798BC5FA8480862AB9F47E145FD68AF20B5B6AB1915D909E9210ACFCFFE0111A1328896C72384337718CC39A0C4E734D8442698E40599614F1FFCCEBE886F602FE058B2A1FC26B2340CA7D2BF6D2927CD152D04F9C9FBB22197D6FF34088CBE6014527D7C82A405A3E80DF41BA6E4310A8F9879B8BEFDAA97B8DF4F73D12C5C5EE1C98DA64B9BE6E38D86BFB40E7F6DF462121FBA799D032FA17000808C121CD52C2F8E7646B19F56B48D87B24F2D790D0F74877DAF7B748C87BA43B5D8DB748F07B24EC979098F740E8B7818A06A11FF40EF9052806A2DF037D1BE7AD22FD787E7E2A4C3A5258F3627FBCFE053B6E69098ACDB9D8A6B541DA02FBB6656B520836E95108E57BEAB64CFA23B6E70B94A0C44AB94DFFBEBB97377CFB72DC06E543D185601A146DCF13B6E5AF5C7A66866EFE17E0BEB1CCA5E1F8D2FA292F9A35FCA0A26689B7AA4257D150AD41C0297C394645BBA3BCDD170B89125713298586918FEA1359B192752B274928478812DE94C053138739BCC98938D394508C16514AE2518C2CAC1C42BE68A151C45F1DFD3A95C8F7F706FC8D157858B787757B58B78775FBB3AC5BBE69FC8788B2188C307893C01009EC82ACD4E430816CF238C663148F4AAC28FEE7E716F0B2FBBE6EC4577B11057D102A46459C5BCDC97F44E0E9493DCA6095FD785692D82FB6E8FB2C0C85E279F89A9B098CCAE78CAC5909605392286E197EF1ACA4A099A51DD62FDBFF56BF18881940315D0798E4FF033DC14FC7279ABAD8AA9F45905A11EB0927B0B745D0DB2858A50840F81807AF14A2A98F81884A190CF9A44164A51002D31F23519542288D7F8C44579130EC6324A68A44D01F2321D5B12668E493D1AE0E37857E02551D7000F2095475CC3F85AA8FF96750D551FF64CC91EAA07FA64BD531AFE04015E554ACABBE6A997749034F4F4ACE95C3C52A094A6624D7DE53A1A1250428F54561B42C7C95F77561BC2C4CDC55982C0B537715A6CBC2CC5D85739D297A785F1773BD288ADFD7C97CEE8BE2F775339FE0A278ADA3E5DFCB3C8586F68ED6090B5A472D552150E27C7AAF8F4FC0DDCAD5E4C9FAF19CAB429EEEFAA931F38B12F19B3D10AAE66A896A6B9C717E5FF65539EF4DCCFB5043FB081BC5CA2A703117D754A21C72AC8E4E53652A726DF66D78A69C0CAC0E8F809F7932CAD4F0C19E5626D3F8DD0290CBFCA15431DDAFC979B890279746E435192BBB0BB6B3FB47082F5B85E0B5C6E2F9CB22907CDD0E2E0347973D2B53EFC22F34E51DD03DA9DF82BF98DB7B13DF613BDEE7EA7BCDD31C3FCAA94DA85C07AF0FA5479123FE34E091EFD8BA643B4EF12377750CDE09CBB05CD17272F6DAC75A49A758CB9E9FFFBE0ACF533E8A02190478141C0AC23E92A69AB884134D8682E926F089388684710617A4320AC45F2C5BD70DAF6F7BAF54E7BD2F7E2A9E187C8996C0FA6708A081EFFB196ED5D75EC2C53F1F751244F09E5ECC8C6528BA78798E15DB299FA17A8B3F77E07277AC74CC545F3F01D72C3542B085597E7806AD0C73323F3A244A08A22AA7937B8E0C82E3F93657FCC009E08681DDAE9AA35673BCC4E5FDCB1B82E25DC08FE7F8FAC8C725F9AD15EF58FBDE347FCF5BF2DA4118C5B36CA984C153FE082A81460FFCF2654E5EE0EADCE5EAF35AF6D2A5B223971FAF3CC1478401FA963078792A443CA1557ABDAE320FE2E0411C3C88830771F0AF4D1C0822CB223C4A36598A609B380EB64256A28526418822F0FE481AF844FF65C4C153E8C7856F589ACB27D3B183F6D594D418051CA311E20DAD8050188D52E4857DA61912A5AF26F7BBB482E67B5E64C7C6AA1AF22200902EC2DEABA44BED3795D6B54A344350741E29565AF491A46AD88C50304C6179287B4352AD12C990349347C9372455636F0423E19C13B821A75E852862F11B52AAB17B1E4CDF90502F7E13BD1AF4DF815E2D8EA10C88246E8BA83206080326FFB6981AB543004177F4A4C6F4103049C1C46D41B54A34962BD96D4955EA02213006C6EF98F95A259AC4612C67876E48AA714EF7AE9A5AA58F56CDAF712CD5A57CAA2DD212F24BCAA0BA3AAB95EF6233AA0BAE5AF935A0BBAB7219C556D6C9772A97217965197CA77219565794FB3B95CB88B9A2B0DFA95C920F151DFC4EE53284AFA855A5F2875C8F53703DF15D5CCFAB8DB17E9A983CFF2DE773D1FA924D2895F9D28EAFF91F8442489C29FB8FD03485D5990884028BFD42B420140556639DF328ED46995D9A836BEF6F920738D8122E5C0D8EE0185993CB600C5E2A228351589DE0C92D482931370C1FCABB8750F8A84CB9557F59B0D899CBC2C586FBA6F087635CEEB297312E36CF5A877E29FBAE3146088421F3D0BAA88BE31451A37C100225AFC41842131459B26F3FB38B3DFB925D6CC5DF904CD208FEAA570C55A7FB108261C85CAD4B75A589376CDDA7DAFC46F21F4A0A5DC7F50E52E89F9001C93BC902E7D8B48BCCEFF121F8A77C4849513FF890071FF2E0431E7CC8830F79CB87709820700245820D50909A384F4A4D1AB8464D11C3509C61089A40E1FF867C0841BDA343509C4491FCBD774E87A0244D20E41F4A87A0184C019F010476574997DA5FD121A01D384EE447152A2DBA4587A0380CFCC03CFEBE21E94D258C2C888A1B92AADC068163F9598B1B62EA35D09C4BB821E32D197243C05B32E406FA5B32E4067AB538980B94B8A303556683C0C9FC68CB0D29D51A380902889CA1B821A54A6B600482DF31E5D52AC033A7B13B66BC766E06442D087387A05A258201D39E9F01BA21A9CA69A0080DD3F81DEBA55689C440C470479F6A2778EE5D99B54A1FADCC07E5F2A05CEEA8FC15E572B33253AF5C3B57F4DB7CCDAB11B47EDAC03CFF2D5F73593245532E2BE1D28EAFF91A14C7108CBC9C6501E6066CA797B694D9044A10E8259B40D0FCCC4835BB346C657669AFAEBDBFCDD700C917C1388E22643163D74C0A278852112960D16AFC456EE24A97016C611F4AFB55B6A6B4255F16CC4D4759B6B0086FCA7E485CA0583E7D79153AE7A56AC307A2F472CA7086A24AD1D7BCC27C94FD2CACC2DDE37A310897292BF6F9BACC5FC9BE533281E57A57EA1282E2D78DFB9A4D02FDB9666330513FEF74312FD7ECDC6ADC2F19451106BB4253A0DD75689424AF230D16070DA6B996FDE9DAF947B243D7717DB043970EDECD0EE504F1C7EC10F6382DF360871EECD0831D7AB0431FB343F98B115C64A5260F3370131779B1C9B118DCE4519AE42504137986FC33AED9E46FA4C89C213AE5D609C91DB1D242BF9E8D812918C698920C620818C5AE1EFE1F7334A684CF5FF25F045D6A7FC505E5CCC6CFA6DC2281EE1651AD54C2DF945325748AD3245F4BA816FF40C23F65D0FCDB91D8AB065AAF0A9867BF7B717E2D56093A7E9679F3EEB752B636FC5F45291F167C9C667F9C66FFEFEAADBF7E2FE69DB75EAEE287B7FEF0D61FDEFAC35B7F78EB6FBD7584A6699491C4A680B074136771B449E302D9C46992C25958A4294CFC33BCF5FCFC144196741B8DD20C8E168C79C55B671884064E4A79929DA248B4F4E7FF3077BDC4CF3DDD8BA44F3CDDB7EE7AA52D37FDF57B65D45EDA62348DE7EFD56E08AA9D47BF5750B512D00B84416E0BAABE8965500287EF9053AD7381BF2DE8DD81F6AF65548B7F28E39F3208B959F91FF6E6EEF7C39FEB92B67EAEE83CFF5DFC732D774FFC53295BAE9C2FE39F6AF152FFBF2C5EAA7B51BAAE575F45571F97FCD398FF4778F508AFBE0EAFC877E1D513FD08AB1E61D523AC7A84558FB0EAC3B04A025B1E49485853E071104C1194D46444966DF234260822C3F32C4BFD292F416060BC2F2F416894A25EBDEDD7B08AA41822FF6650115691388803AFEEE56F7D770C296E373285C3582D530B87E8E2101FF2EE8B52F550A6B891F91EE9DD81D0F738B58880C13FC679FB15AC0F706A574B3FC3A91E86C43E01A2EF01AA9E40C48A0395EF816ADF1D4398323A7A3FD8D5D1C6984FA0AAA35D5EB0FE00A916C031F9CB9D8FA0AA038EE6A7863F82AA0E3858539F40D5C6FC3365AADFC4AD68D3AF857A8F6F8FBD2D7EE9E3FF57DF1E2B2E835AF9E92FF4E370F27A69EFAA2937AE9F3265045DBF777833B108E16E5E41BCDC5B7D03732BF15BD8D887385FA57E0FBE7EF3F59A5ABFC4794DBDFFE0DF752CB1FA45D3CB31C22B09744D2DB5BA7C3B7D17FCF542305303BA27F53EF88B8A3197F7E597D4B2996819C85E53AF4761CB6FC4DD3738978385D76DB3C6365CB7C94F94FD1F79FEF04A0F3D5888070BF10B9F2CCBD7C7C7AF75D1FCFF4BF3E01F1EFCC3837F78F00F0FFEE13DFFC0E11C858A38DBE4391469E21C83375986839B2429A1BC443024CBFDD75DD1CDFF5EF807020166872A2FAB50F9359BABEF73E51F5012264806B9DCC8251002A5FFD0539828C12054F189EFABA44BED5BAF752B6DB9F55AF7827C5B46B5D21D32AA81F9DD326AD13C859165ACFEB5A06A707FB7A0DAC7DF110426EF1054E307089CA1C9E26EEED782AA95709AA0E1E26EEED7826A5F1DC37102CB3F2076434E8D97005518BCB8F9F9B5A02A4D81D23405E7A4CE0D41B53A048C51D41DCA50BB6B4B216471ECF786A0FAFDDC02FEB6A02A47452370718AE0869C6A95BBE554692E9C21A9E292F9D7726A7773710680DFB352AB2B3BBF0177C76650AB83A224059757B56F48AA6D0AF76E3CB55A6FFAF36B345675233CD5B6B812F25FF6C4C2CDCA8FBBC6F5BBC6B795E48D8AFDFC36FE7DD5DF2A594DCBCABFBF71C0E4D5B9B07EFA1679FEBB9BCEE55AAD116C37EE385F91AF35BE9F7117D353AD555AF3CF30EFCDFDBE589A44CADBAB1FE6021B5EFF245B35B7F40BEE175B99071C2398EBD734AFB914F8E772B99984E9FAF7D82EEE44995B7809778B2D1D8492522BED7E15F85772EF138BC1047521FF708AA6893AEB889064CED814B90C829514FC6B6F0B57A3CC2D3D880FC5D68F23956EC3A552D5C67C7C7AA930FE77972E4CF8B5B9B9657E53FAA31168523473AD831160F6AB5D6CA2F9D5EF3217C3111AAB8D7B61C8CBCCD23CFF9292BDD1AF7B33DECBF94369D4ABE63EAE715F3A78FFC925FC7172E9C11C3E98C30773F8600EEF640E299A92581C6C7B1CC7B34D9C129926CB225853226829FFFA3186A1C29F73728926F12B7348014FE9FDC925862089CBB7FC1E27971E27971E27971E27971E2797AAC51F2797BE847F9C5C7A9C5CBA84DCD71EFC6B86DC9F04D9E069FB72DCE64FC028814E59B62628B152FD9D0F0282BF44F6D998184EFB29341C1028A78614FAEE8FE740D9E6828B2281162F6D1DCC14529CA2CAD1ABA997DF57A03AEEE26BDCB6616FADF81DF025B98EBC287EBF9463993FBF5CBC64F0EC6A2FBCE503CFF9EF7F038F92E238AAA2ED819C97C0D600500A7AED27C1D311C095001DE042C3282C722CC6960E75AB280126CE074A9227FC7B96B7EADF23044681F247F1C9010E00302476CE27BC282A50B92436FEEA2AE1D6F69A8E61C62FF0F557EC07E0C7311FA0171241FF421141FC57ABE8D60BC5A07F21F2DFE7A6EDE946F682120849E2188DFFD58DFC6651A9191861AEDE2FF9D014C965E5F7E9D7063541A7ECB3EFC58AF3929730C2CFB29BD72979C967A35E2A5F0DB6F609C435F30380FB1B9DEBBF1FEAF9A4E6F1018D22FF17249304990FFCD6CC74A0A73F9EE7622470DC98E5B66C8705FF74C63CBA3DDB53680B7E0CC1ACB1EC2C4F5FC28354F5260EF8D75CB49DE36635D0FB9E15ABDDE9643CA70499E3A4FFFDBF32F6AF0CBCD38E6667D99D93D498DD3AE4BA074F61DE6FB7B8FD2CEBF537AD8C98B5AC74470CD1163C9D2C07FE19A2682F618E5AB697E4D6604B1E92F1A14F4ED802108E88356987441A338E80748F9CD0390EE56EAF1DB49D2024999EA9B777A76CEA86F6D45C9F1BF3A9B71CAD293631071D45EF91B2D89533860D04C8170AC0A1330BFDD05AA18E24DA8EAB0DD1893E88773C91091213F0C9ECB4E63842B549758C4727BF8B6D99E5183EB98ADD3F6F899ECEAF9C5E7F976A4B9AC10AC0E97C78581DBD3321845BAF1D7767D9301A9B62AF33A3045798CE79253B5293834783487213B9139931D0853B32B8019E1CD6E92C5E52BBD4DE6D9901742A00BBD1CAD0FA07F8D0580AA44B83E11720E828B3EF278BC5A1691B42F2C9EA8EF3C9EAE7E92BACEBA86D39ED7B5DA70054DBC3FD5E960EC7332B5B494348D7A389B96A29C7CCDECDECC60E6EA5413B12D6B62B2B4B787D42CD1095F111277BA13A57A131833B900959B28D1C26650B171D341AC6E4BCBBD51B1B5BD89A669F36F692234DD57401FB3E2EAABC756E65B8C9B426BA8A126D395A5B07873FB60827EC1F18D5DEECB3E5D03EAC0B40145DDBB35041F76B39411C241E0B180CA923173B1ED7033843E8AD8A13AC3E065901B18322894367B034A626B0371B880B6C47FA8C698CCFA18FD8E52C2F590497DCC6985610856E706902E9902EAB68774D24F648B55AD03EF670EDD09A434688055A7AE43F1BE702100C3613DB81C98DC184F4BA7ABE3EF2CC4DBB7BEEA3F3930A4FD2F589C0D5E5395AB590B475D6A69047B1D0DA904616B93522CF492D07B177876E01681C17A774DC1FE0466FA4A04ECC9FF4509F46C4CC0B7D9362BCE170DA033B34120F87DB9912D0766FA16BFEFADC6EF70CEB04914C188D0674EA9B3A92148052841D367CAF614FF549BAF1119A5E1D4877760A29DD83D1CE5455D585E2E0B18B2C183975D6EA4935537317AE28925966D02A0A9DC44987E46ECAED0BC078E63696042387A1A932667B022F37E84A67E62EDA507415E34F74E2A60AF835088CB686A9E4969AAAC4A62DFBE4D9A712D7532075E36CD281B7230B40DB61862B7747388489A8A37474A2E341BA4697DD6C08AB4A0AA9D00A92A01904AFE3F4D01886B113987D54715BFA7CB6F4A4597FB119A3BE432E9668580092FD8D3EE23824226CE4AC2804D6C6CF0A4A0EDD28ED67CA7939885845D41B67C237D06481844B921C5224B5F436E916F5E28611F6D7E81C4A4D94DC1580D9246306B8B344C628396D25034B503C28E4988871A76B732772299606537BBA809CCD60872C363369715AEE4FFDC5221B5A4BA22F12B3868961E832450AC0D6D943A70373CAAC21A0D8667B6999C86E44E1632A6D6C4CE46C637D18EF1CA0BDB21E390D7800AD17677FDB208333818EE6CBD81D4A9667E9D3EE70372E0175BC9B892D65B3E9501AA60CDA1E33D6562A631C8E07374A0EFA724871311A8B1B57F54C19F31A2ABD22C95057304A97E521AC91AB83B96A2C17E9AA549B213119C45B6E839AA7411B6182C3C66B089305ADB88A17124BC29CC8DD6811BA9B06E388DE123E4AAD36E4A8E66996EE091A23CFE680126895DC09690128ACB08D2F66B0661AA38D4FB1871689ED96C47CC942CE3C5ABA16D1D1E00DE2746D2B62742FDEA4B180193B30DDF86EE66D8FE73D26AE346430EE93A54D71E444ED6AAA83E1A43DEC1FFA767C861905EFF8B11668161A0C86D211E59693552019BDB533E3B89EBDDA79BDDE62B6873484D33175309DCFB4FEC93A1780BCEFE264D7980FF1C5DE377D67BDE9C74867BF2737FA7CE82FF6CB74D2170F640AC37DD8CE7A4982C944470E90613F88C6DD5948C3D2248D1AED49DF310AC036C4135A176E4862929C339870793E51DBDC12396F8C4DC62CBBAE90F514DFA7E805E9F44EAA304704A98FAE8301DE1321D89F2883C417387AE22F4AB5A1C5BE0945FD236F2D86DBD34CD0F883C6658BD6586A5BF2617BCCC6A7C5C4991DC37E0342B4FEBA27F76449DEF4C4E5DAD5552ED9B5343F61FAF0FC18CF0B408DA3477157EE18439E177AF6106196CB24D61BBB2131ECEE66CE64A0792211ACC89133A029A28136B653144BBB5C18A02A6A60129E6E14130B8F545F2F67B9BF40B961464D850D0EA759DA1737F6509668C9481A5BDE510CD94F668DD3FE24D2FD4CF07A6B8F3C41B3F5214D66C369FB9CB10ED3DDDBE74120A7A5D5931533C3E18ED4CB781742A749C2444A87B7B8FD7633ECC4D8CE923149E794683C0D1267C1196B64256F9783998D49DA71A36630C91A70B7C507E9812F00C701DE9886272E0CD75EB21EB6DB67729C2E8E8C20EE550E527575E0448A454D07FC18F693B465050A3E6DF0EA2674D7DE095D4E337FD60AA9559FD0E3D2B7E9E33CDD235CB0CF22C86CAFC6EA693A3DC39BD03A1C4E9B109F4EA0639F9D8F33652FC2B2DB337BE17021F8314DD9EBECD0A1FBEA60ED18E1025DD27069A4FC39993A944C40ABC379D95D806D275D70D651864E3CADEE5ACC0C8C60369E1C44EC4CB54E697FE7876B081B653DC9EBB6045A39109E9324A41BD26801E851E6621DB9E60E3A2E978D4904350EC1B4259FB7EE50C64EA4D298EBAC7CE6D3BE961D5087F6E009B23ECBCE9E6620F570803DD8ECB7A50D77E86D66E51852FDF362858C7B2D41E92E53736099B1ABAFD273B497A08EA184C8389BCE4E1BB501B51DC7D9CF1436E671193B38D052E6137F130D9008C3285C6796A591F2CFF3866F75498A345B60560F68A743E902BEC0FB9D961A762C621B1F07418A35C622C66DCFB3F638C177A7918E8BDBA14CD01037E287E8769D64F1B95700E2938DDEB7CC3065928416ECD9747B98B8B6C789B631E9E22B59D61701EE4CE7EEF41C1DDA74D4EFD2C88159B89182991D6583929CCCF347580DA7EB52B1990CEEC5C46A98CE03C935D652678A664AD6E2FAFA408AE30E25614A6FD4A1CE564FD8DABC92CE9D8D3B99BBAC3E1FCF8EEEC09B137DC9EA396D66642D4AC51EA8AD58DDAD1D5AF06D56811ABDEDE03458EAC2B83DC58C5EB7DF6D75B323721455CD9F4CD4717B892F58AEBBE1D2318587CB33C7B774622592948D961BEC3C686D8FCC20DB2267BFCFF4F63B69C19EB16461EFCF12AFB6C2FD78771E4AA97F188907660D2BB3BE34C2F91D98FAA1CFB5A7D9EA2C75865333E5CC69A936830E328CB1CEB8D5D81E649CCF56341D2FD9DDECCCDBC7439689FDD639D08F5940E9E659002B18475D9411925660AAA131E1DA91B23265A307AF68A85C298DBDBD3E8FCF4642FB0606A6C3A1547888AB2C93C4844550DDCDB68BB6150359B5DC0081498EF3591EB55AC9A6A565F83E46458E1BA27DD13E1E69BC34F4DE6A0E0F2D91DF0919888836192689FD5D7711A5A8DD1BF5C509D4B13394C526E26A3F9C2B3BDD3DB75B332B8DA4CD903BABBD49C31D1D83C936E9E0A5629BF496E61CD1ED4E027E0C74808E66BB15DE39F1AD58DE7316C92CBCF159A5ACED72C7AC756893A2F8C63B1C06532965A1DD721804CEE6D0D0BA0C425905E0CA82CE7D398E89C89D29DE62680EBAA17DC8266D3C9E3B5D8BDF2D15470BB8D58C1AC9FDBE389F6CC29D0D31CA9971DD38207B3B756EB9E1803FF064B9524EF1C93B9D3AF1093F6D45CC5FE38BC39E6176C95A989930748A0239180E39CA24797DB13AB5844387589D4D7DEDA884060F0ED9201530DC1A753ADB015D006E2D436E6C77B144AF3D383D72DE863DEC8F9D502382E1A99775264BD50B5B86259E7B5D0D3F125B010DA7735A12089B9B9CCCB170584C9776802D77935601D8A578180414FD467B21EEE1C89BF35E7730604DD8989CB6D99456A5D36005CB53C98226B83A14E6B394C60FA3E96AB56137ADBE3845898CE92C64F6981D0B4077DE3AC871A0B4F4B68D38EC46DCB116C48958A28EB7D3F5BC47B67B186F754D565F13874875B8817D98489DFE7C38594CF791233307A1B56B7788F1645AFA36ED96C5464A7F7172FAFBB628A8A32EBA17BBEDC03102151D1B3D3941473B66ECF8A22E6BF184717ACBB94A0A9DF63438A846CA680E0DCCF9346B9B5101B81C62BBE149D9908AB26D0FE7FE16C6303A4303D1623B817B9C9263757618C74477A3B873144861B6C171434A2C610DD6EE30F67A0D5E545BFCE63028039FDE747F9ACD3A31475B0B7E3BEA84E7FDC90D757D7C7286292CCD8608D815570DD3EF4CCF6D0D77B22D1B6623C289F7C3607C4ABD5D9B4F43166A09B346D9657E29AE97BD4E0FF7964683E2F973B0351D61301A4D0F017C34D5833AE02389198C636ED1D5A073BA27F57E4611431F7899336E6DEFA293B49FF4B671BB74DADDDD48DC61A89E09D612A7A025A9ADE688B3DF61AD7530D9386B78E646CC7EB15368866CF9C31DDB9A1D07ED21296F423D320618391A244BDDD93434BE546CD3615067CC0E180A4416FDD178314ADA9B85391FF6E5604CA6CBD606ED1C635640A6DCF8CCB50DE0E68ACB6ED0DBF7025F2537F29AF0D61315F1F045AF5CCBD978B070E14664CE1A2B3F5A11ABC5A83595A6473ED0C5C8B426A3296EC161B4C99C48B0062CB03A23EB709CEA1E9EEDD5163BDE034B8B6DF57DE2F63AE5060BA718E86FEB4C6F1274016F7D6589BA232C0C5D0F95BCB371D0E1E4B8DDC89489CD4E0D113EC63AD24A5AA388503A9EA0CC29D3DAE31B634C2DB72545D0A5E135652D4F47E9D0C2DC99BD6D4C604B4AE6DD313965492FDC1F2DC2DB7B4360FE14CF36F56895F574589D8D7B1B7602B65B075A184C0F8F7D685F8EE1A263A814C6F5129A4FE49DD261C06E2113DB6CAD1FD731D2E3666636DDF1F16971ECF62339592F62A2E50DD5A5BC52E41EDC81875DDC400C714931ABAC049C020F4A9DCB0947E42C597F341CF560C514B873B2578CD18A6B6BA9190ACE38E5853988F1766E4B9376E63AC59410A68F0751C6B294D2708B8A4B9B7268C1C78DBF9FE883AE497B9E759A0ED7C4B16588236C962ED7331C0586AA01CDCC8D424DE3BD60709DC5EA887777983445BBDCB1DD99C982611DD7A2BB2C001D66BB9043569C221D6975CA28D63E67940D77937D20644897963ADDB0A3265A8F3D30FC5AEE8BA9D64B167BDD4677CC3E3ECD6782D51A05B3DD46BF6C0E8C16670366DE22FA5B751DF2C10A272977339779B0CBF8E3B594CCE24E3238CF15C2C154D8DBCE5A2D284290B4DB58B2BD81A99A320F074CACA978547AB0ED4C7086CE791ABA8CC9F5B7C3EC8C12ECA2659C71833F994B428291D1163EB413A05E94D765F62B63D51BAA30664D14EC98B665DE679D8C4D393B2DCD28E2F5E96C35EF47139B6B2446A27176CF628F50B73D0B809F406064160D464BCBEDB7DA3BA23750E80169A47384F2527238022B2748D1D1F8CCF39E62968ABD4DCFA604E1187AA450ADD58D4F283F3FAE9415954DD5B6E9CA23288351D2D4985916CBDDA1BCE676CE1CA7C604DE1AAE8DE5A03FC1B1695F9D8561C98AEC1403CF1AF4215E241B53D6A269FFC40C5AEB733B4CE460A59DC3B4BD839602E69928DD1B500995E1CB96E99170A3DD1311F40011E8B037E8FA24C38805E0BE315F6D196606C981B8EB27D6A005ED75F9CC9E2D041561C45DB6D791AC59C172D172595BDB79DE7C25E829321C304371901DE8502281C914D473D22FEDF2988F134A91FBD348391932B91E6E767A7FC70E1CBBBD3C7A1EBAFB7FEC9D6993A3389380FFCAC4EC475301485C9A8AD908C018DF17188337F603A72F6C30978D7FFD4A50AEAEEA63BAFB7D7B2776278AAAC0C836A90349F9904A9C73BDACCAA9EFF76EB93A82C7DD402DE075A086C8E667FDAC37467D3C33DCF786D36A3D052BC9CC3546C5E0C002DF44FBB89E9CCBEED13C0EECA3E6ECAF23E6B072AD55E778BF44C75579C7045A1EAEA7E0B0DED7A3D2BC1D4FA12B5E589BEFB525EC19CBD21AC8B303BE5911B22E27997C3DB3F094354E6F73CC82DAB57F08E3DABDF415C3BE756AB89486DE6E9D1AC7AB253BE2FDA23AC140064E777C6D676C2D0939E7205CCAAC33AE86F4461DF25CD5CBA028EBEE2CBECE0546818CCC54FC4E0C0A9DDBD9C1361EAFF895BD5E4FE1E2BC544E673DD79C9950A7EDF4A5744EEAE8344BCAD42ABA18CAEF8308CE721822AFBBA417C7C9280EF05DAFAE9E8E4CF7E682A9C81F7A5B96D5F31059A8E67679BA13ABEBB83E0D8BB663073B71ED4D2F1368F2BAE7BB172FC959A7DB49C5BD714026E7E5E7DD09C9D6662A6577BB0BFCBB092FBCB11D475181716AAD5F994ED74DFBDD3298B4020D6878777C5577B9C1158B3B86EB4E325421BF3D69677CEB733B30E1A62EC76A25757A074B5535F66627DC725B2CAE8B40032662D9EC4C0F403D39B6D6B9FBA93ACDFB465C6F0BFF50CD57DC36E486C3B26BA9C1359DEE50CDAADD93741D2445E046E26CEA38B3945787C55ABA7736E1A53842747537503D2C507B47BF3938D3FC30466BDD9F32B73B948E75A04CC27D15ACF58B6B1C32FA0A56E64EE426EBAD599AD2B198DE339A45C64E9AA098955CF7B2DD45E901E06BD5089CDD21774C11D4FDE1E99028F17E329F8130F2678BD95A52CE5C4FB4EEBB5802F9E4EA2DD9F8D6E5B4B33629A5A5E59ED64EA2A45B9AE9F7BD595885693B5246173D5EC58B64CDA3FC500EF6082500F585AB246E56B6E9CC8CD9C2B5D1FC289F879C15D1F61049694C2346CC6130AAB2BC3FD50B3D8BFAE9B1B5DBCC8334B683E3164E536B16D6FE3CAA6F75974EEFE939166D34ABBBD9D5B86DB8AC2F0D6CB53338295291E29A06227DC8E9CA14F674A77B95659A965AD3BDDC53C6F275B19265475689F155D56438D6F95EC090545F5EC8323941D697B55FA3A30783D23F59A059A9D0EAB9C954DD85D2ED89DCB89D0F9DE5593921E6A8A96C3A3DDADA79676A5666F65DDBC5B77C9BB303BDFB0DD0159B14E1EE104A9C07237E566D0A7D748487F5BAE71B63555EDE5CDB6E4B183B2308C3CD49F587FC66008A8D35BE9A98036EA1D53BA427A089B451CED7B807F6F349BC5C8408C5ABEC520F9369E998D59E53D8C2436ABF703BAD0D563C6B23CE752D636906463299EE38C79DC14B72C113B422CCB79DEE8EBDDE76B4170A2E128279BEEF9C0F9D00A5539365ED9A96CB5E8ACE74DF9F38F3462066512D4D26C1BA5B61C8DBCF3B53C4A3747034579ABF3D5E6C7751D778FAA1E972D07F631057E43D23F770CBCA32596D9077F2D87D594F198E3BE41D6EA1C9B23221875F6EBDA2EB019ED9AC79C66697BCAF5B77DB20C6F2DBC2B86AEA78213717B511F8B8B2B339B3A39143122B7265557265DF6F1579FFED7287D79F7E5BE0DC732EF67535C789BD8D4FEC363579B795A4765F9AF43F95B2ED87DFEB7FEF3625D2160FA1CB2A007CBDB19D32D4D91CB76B3B5294B624B80117B2D474E0A3D19EFCE79FCD177E276BAB79F3530F64C9F4D579BB59CDFB621955FC8B65D476AD541445C03D164AA10818F6B9DAE77B6F1FEF8BFA8FE6307E5971CCDCF4A991F647BB60FF5C3D9155F3A7767DF78F2249DF2D354A22A0381E7E6795B17B45DC45A471BBC8B3C10FAD32DE57993651BAFD765470E34A9B3917CF4DFADAFA242842D1EF594CE468FB93176C818AEF4B02448741572AB96D126E3A1E2D19B3D44245DAEB123B0E97962A976933A3B5C44D91C7AA07716D4AAB40D5C4A43B10C3A33308266EEDD65C21548B4A1B647930BAED0CB50A8C7CC7278B3D8F0643BF3A3B92991EEEBABDF5567AE7D6EA0F189B561698E1D01EA58696EBD3BE35EEDBC2CC306FA544A7B2768A8F9A2CF5B96014CBDAC4C97C776584767E1F74D65CB15B6CCA20BC729369345CB580BE988B6EDEBBCF7AB71B1AD3719A1C5647FBA09F36FCB5DE1D8CE570213923BD1A55EC647D1F1CC7105AEB158A757CB7250D85DD9DF33774B93ADC2371EE3502BD7E79E86C1625BAD3AB48C6E3764ED3F255C13D7DA2BD1BE8DD7E60837ED31F0F57DC45E5BCE9D47862CDFD5A22136C7B6FEC0BC6E2BACEBA13B9D6456E86B648477E907675773AF3382B34AEA1A8C6C5D0D4E7E3B5BA29A0289C26BD9DEEDDAB4B8F4E3A524883E2AEA6276FD81A7D0E5B6F6D2ECA5172B2CF1CE86E057873224735F0ADE9EE36C4771C5ABCC57D9716571CE3B8319E0292E3251EED7565373636C8DDDF9834E91AFE68BA99B64AFD1E6F2FEB49186843F1EAF4193C21C359854E8B71B0BD5C26F7E300957227954C644BBB1B90EEC6DD8FA54DCD4CEF1066C2DECD233B1C8DF8D5416E27534BAEB9F144BA32E8BEE2199546B84F0B9BD55283AC4D1FC792892FC74DB8DA53DB9993F6239AEC6B4A6C524BED44703E920696F997D9E0A1C9EEAEDEC3A3018F04954C47759DBBF4E06E69895133977B7E9FE7ECAA66BBD3C5EA78981A123FAFFD5B4B0905BB1A75EDBE59588A3152F9E15D2B86F7C9796E889675395E0B2B1B41AEB36A0AF2ADD2F5A36862F9AB7632C5339C47DEFFB69E35E68B75AE4E96862672766747CBA36A694ECB7C75B9B0BD3CB1BAD762EA8E0B293A3502CB4D01247170BCB85E278C2749A8DC4EFCAE38952B01F4EAA8BE9ABBF54439DA83C1D64BAF00AA15062E61C2EF1575398DDC99E16B9562ED2BB1ECB4378A6B3D867C9ACE4AB41F7567BD45E20CCADB4537268745B05EDC0ED39B72163B7BE9B6D9C79E608370C25F8154D6A39E705CFA533EF1670A3CA497EAECD3ED55CEFB0C724F1D518FBC05ADFB7575C9CC99B73F58FD8B64F48ADE5EDEA7F6764C8B3E5D0C86B57A4691B4ED2C2E351929EF556823F0DDF09A77E13EAB104970DB9F57A1ED58FE4C8FBEF6AB808DC8CD014ECCBFA142CBCF55E8CBE4F05E8FBEEDA85FF4D1F75BFAAA42E134716CA51548D45DD33D48FF5A0C0AF9BD1F4380A49B75C32591A7A4CDE466B4BCDB865B5C06E5E89F27AD117CA323E8E1E206FB87825EE9ED37B160B9CB92A3FDB66DCB5685FE46BCDFFEFCFD44F94441519F7600521CC3523CA0204E49220559A612A92744B11CF5C48A1460A92720F82C2B5040E42916F01410048A85F85C5EA20027E16F12210285B51F2FB1F8A50288A5A8D79D4FF422F5BA8BA95BF8FB6FD13E8EFD2426DE6BFF1145011284DFFE0B0286FF6FA2BFB3E41862B51E35AABF718075B32CB926C7C6D52DF9833C131CFA4551A7E461F9322F92D39BB7E3C4CFFFFC9DA19867866AF4BB203C8B22CFF1B836782F31E819094080380921008879665989E704842BCB4AA2C83CF3AC280900513C6281C43F37C4C0309F27897CE64DBEEE791B876DCEEFFF1AFFC11786F93ACCBCFE96D5D77DC3A4BF801AE206C641897DA11B56841278D00D2B21013E6749D13C9F8693CC7314EFD33F6EBF8A789ADC44DC1D7046406A1AE3837C3EC8E7837CFEFF93CF7A2604A9B4F819F2A9D48582C98719D3577A30AA36863071BBABA992A799DBBF64562A4427A3B53E1866579C967C398D78D1AA775C5FF74E7ABD89BA23C71CC251A7706FDBC99197B55EB02ED86BD6999EACB1206D23ADBB06BDE349594675AE6EC3E5216E510AA4227F62446F35C807CEA6B3DBEE5D6D9ECE0DEBCA6C903EF73426A83C1E2ADA689DA5F6863B9CBB666D2E879B62B8ADA1BEBB6EB88E7E4966E0DE69DDA1AE8A3836D98BC086E838DB2CA33B9CA1F949102ED6707E90E6A2CEEDE485B8EFD328CF324399729113D35B6563934BF83AAABE71E72CCDC35149933BE7EE9E4088F6259C34DBB7E6C6762C7F9D276ED0423B860CE381F4EA17F96E5339E5EB6399FDAAC0FBF8BA0E170B9CE81EC95BE4E83381C75740F1C16E87F9ECC166D7C7CDFE974694DEA13CBB51D3DF41537DE2EDF97E3B9132BC74B756E0DB3E87ABAF2C888D04E74D06CE7C458A3294DBB67C311E3CC887C5FA49C27482351509275549A28091E649E23006B03C0759887107B022C75122A6014C3D2CC227483EC792271D290E538E0029041147F622C4A2A0C040BCE7451053140531EBB042C6229C15E6222CCA677986449AC59942922FF59D74C50204096349185558C43184B14496C7A22194F01E9701CB142496C39F4B121231B3B13C4242AB8249B45DEAB38A7EC65AD7DDBE081BD2927E19697D96E3332B328C08012E091224049EDFB413212642654D533DB74D85C1B361B0F76D81D31031B8AD5949C00D213D7F96CB2FE6AEC668F30577A1EF7017BE382FD8053801B00FEC0282C483FF4DEC6A72630989E39E4A7ED7E403BB3EB0EB03BBFE11062733367C69F22F6017313875565678CAC13AD35CE82CF7A3305B16033FECA3F8DC08D4B24C9C9E4C7B3887D05EF5AFB3C97D32956A701A5D9732BDEE0418BBE2CB62BB57CBF35AE0ACA88F5075B9C99D819A33E6F6A4E0964EFC6DD417DDD687C735A37AEF3835AB0E55A08749229F76B56032D66AB28EC281C095FBC05E4BB7E5F46CAF2A9F5B665BD64F8593014E37DE3B2C1C2D1477972C924E83D663B054D6F39B18C6BAD91140580A7A799FC3CB756E1C18DA0C254F1BE8275FA623B00D0B672CC8021F7132305F17CB9A367D619846E0F7E6C12F37C55B005406BA55063DB40A6D25F659A6E19846E05761E6ABE3F6FD362616AE1EAA37EBDB7D5CF3CDEB5F089C54CA8627A594670B52A82FE4C9A3C52B1DBDF6D976B6693AEED7CD628FFEF5AE6BBDDB54E7D342D0B235387DBE70F376CD062DF0D160DB6D4F7EACD93CB00B40462474823515C7F11C261C282080E10AEB7E4C49AC883525B133B19288553D43208B7A0212234AC0E730950912C5718015444AE4781EB31907259E223F168B774020DC85C5025EC8784E2024C742E4E34CB072E424C26C380F8E13280E89222F60D660394061D29020C91D277161008FB028F2CDBF4C57AC0430AEB0128B8B0C44883FC14488C986E3055C328E8722F201002C821CAEAF88CFC2F5068240F2C7F59738623B7BDF1E9F5BC224DE0F7CB6E133E197F1D967793E038EC1F8451895810266B2D7D67CA1B3B6419F9B06E5044CBCFCF3DB767BFEAC5D705A62A4A68E10091CFEFC7D7E3F426A3FC36AE429E42F598D3C85FC4D566B1E9C24742934D8866B8F9BE1C55EC6605A7D801B8975FFCB4C634430441491497E2AED03D13E10ED03D1FE0988C628A93299BC3858FC08A29980209A8911CD228836B42FCBD21CF557829AC4ABD965E7CC992E5BE4ADDDA9235DF51CA04350D89CE8952A339B5C2722DAA5D57CC696433573257F74DB4EB55B57DB05132BBE5EC049EAD801A134BDCCFB9B99AAC39373E785D6D496A6BB34C0606807EEAEA7F4D5F971D21B268BD3110DECDDFE2E24EB7290C0E09AF9ABC5C62A46301CB0D7135330F5923FDE9CECB0CD755D4AA63D3F6ADDB98091389100B9A9B2ADEEA1782EE715BA6F43489BE7691C66B04CA4E15E53828E2CD1605B165C77DDEB104CEB98F9E798D6B6E10FCC855F6E5FC7B446E0376D4EFF02A6350249E257615A2BF0B5F37E1DD31E7DEC4730AD11F835FF9A2F312DFF06A63D9455F6A2AEE29757EAF1C1DFB264F7C88C797EAF3C31937CD2A25F43899F8087C658F2053CB0DF838726047D030F4D00FA073C20C4A2D7C53612CAF997D1431B7B9A7AC487FEC0870F7CF8C0877F043EC8E1E59EE43FE552F4B0F08C69C73EA93DA44FC7CEE5E81D07196B39D27EEC2D847A2E3602CDC17853E01E73CB0C1A4F40833E19AECE6693A6205D6AE5745433D949E3F6DAC4D8B0867D56338166CB494F9D85CBA9E5AE894BD16CB537A353A71D7AB9B7B1E7B122A2F171A0F59DDB68BF973230496DCB5D2CCCF036B5FB5733736EC2609AFBB85095EC72977069F626004F39E3EE22D1D86C918DEE79D8B6E12AEC76A0D601957F03E2CAEF84FB1CBAE2D9ADC460D45D448170CD0726CFD2BB195D9802DC868B0B1C77B47E3D5B441F2E453FE452A408D96CFF37B9143D3455460128491C8C1F6F48002B47964280E798574546BD1E3CBEF6B798401E9961B278396A0BFB9A6C0BFBFCBEB0983BDEE8DF6FD930BE0F1FBF495F850EF05D8B0509D0FC021DA2081ED041A232BF4207F96DD35F071D1C457E7DED03363E60E30336FE11B0B114CFCB6AF2135E3CF7B5D09D28781CF176DD2D366BE1C2DCD04071B5646E8C06D01DD0479E1F7B4A2350AFBB8ACB2D83444791255C561CD881AA88377C3A4D6F2B15B9F535DBCFFCA53A1B1B42E2648A13A11B3DC91AD8F01AD898CFFCFD1DF893F6B9D41560FBE3D3C1E9AC12AC2DF3550F0FC34038ADB2CB7D980C2BEF70D8713D947B48EB833858A0C3B657AEABA3B1748E0CE82BC965AC1F82158CBDE8E5774BAEBBAA5FB0DBE87E16B369DC39F3D9381E14BC0F794B08D3DB5ABDA9E1F02CD1F411D1EED61A76FBC893B7CA116DF30F2F9E1FF1E2D1429EF1EE4D7FFF3BBC7888FF07F0590431483C76158B5FC9BF4F14186488EBCCA7978A7C06280A366711F71AB27043FC6B180A228AF8A920F1FD4BF5C4E2339EF0D7A8278EE27CE2FBCC02921947B525F81C5AA007252835D022FE3268413C20B5E058C020F48CD53E43FC8218728478967B7304201005F829C90B0C473EC56C20F1B80D008FE033460806127F21207112F30C38C031B83E3C8FCFE19FDF65F68B9D6B1A795FE00FFCAECD85C4876CF0A7890EF9F0B411185E7CF5B421C1677E99574D1B9C887A44B4F9C0A00F0CFAC0A07F0406D5A542235FFB510C5ACE6B90A893A519E0AB3AE71659C03A376BA3ECA783CBAA375AF352CFBB88E648305BC8F0CFD3A3BE648422F47661B7F6A7E27DB3963CDFD02237F747CB7C3251FAFD3498006B9BCF3B9D3BD3D78C517DCB9DDB28DA9FE549D513A4DC573BA05DBFA846F6781C3BFB9D2D27AB813ECC0D70EC8E56BB3DE827EB72AC9D3735D49539831128CCEAB33FAD06875AF00C2707E975AD8CCF9C37920401F7C49A6FFBA1BBF322B8A2B53B3DB360A79F1F60C74B97824E1B99EEEC06915D8FFA1D81B50ECA4C40331BC9F323B7E5BE40A02F9E2BFE771188A8FFF6A2FC220422F4F32D81FF120211FA69047E138126D936A2ED66E5E747108874B576B6F96B04D2BF8E402F01C730F540C44B184ADEBEF80F1DD6C6F4A3FE3289C9089087A2A826861C45DE1519FF21BF8DB1471C9049603DAA0DAA471EA02291F4A8368A1ED546B8A35EA2DBFD751253152EA3F892DB131011F16C2625A19E785E822C854503216E23D13DB470F684414D6000153741E4C8D924805CF5C48B3C2E167E1130923D89647D887A62790C1602C58A1C8F732065E75F2B44FC55DE1F7CD3371AFD3ADF9B97AC306FBDB4FDA7A3F62ABC26DB7888CFEF5BF8F97D1B3EB7B1FDA897B87ECFEFDBEAB989CAF79A7AD760CF4D503CE28F4402E23DBF96EBC7BC73FE2D3B17F77D3B9724702DE891603EAF762EF409F43EEC5C1F80F701781F80F7ADD2D197D9AE23FD844F0E5C672F8B6AEBCE150E4655309DAEF9B551A63D63A458CAAD772844A3D72EAA49C97C93E31E332CF473C059EA986B17D5C67260EE39DEB5D8782D75EBE14251CE561CF8A3F9611371305A74F7F36CAC03534E4A5E5737F3C1B57D4E5FD72B4FE2048155FCFD627AE85D465DA64A4E71D08B874A01B5696E2A356033468E36BD7804811C7297D01A378B6A4ED65D24C769B47157E760F4E2431C7505C08351273B84DE3CEC9F57750551DE3987D6686E32B37E47DACE65D899D377DB3E1D7B12A6C68A5B4483E1A469AA0F9F9CEFFBE43CFAD8DFE593F37FD4D6C5792C6251C349DCAFB375092C46B64FB62E492074486C584D20BF3747AFB6AE97E4C3D6253002A9F3C3D6850424BCB17571227C63EB7A9BD9CFDBBAAE2CF307418E97983BB79790332FC9FA25D99ED2C4846922C9B451624818994FB163484A8E8B303BBB45A826E7223C372169FE6883CFB427EE82EC3FFF4700000000FFFF0300504B03041400060008000000210042BE4A81DC010000D106000012000000776F72642F666F6F746E6F7465732E786D6CC494516F9B3010C7DF27F53B20BF2736513A5528A40FCB5AF56D6AB70FE01A13AC629F659BD07CFB9D2110D65555D24CDA9331BEFFEFFE77075EDDBEEA3AD949E715989CA4734612690414CA6C73F2EBE7DDEC86243E7053F01A8CCCC95E7A72BBBEFAB26AB312201808D227C8303E6BADC8491582CD28F5A2929AFBB956C2818732CC05680A65A984A42DB8822E58CABA27EB4048EF31E1376E76DC93034EFF4D032B0D1E96E0340FB8755BAAB97B69EC0CE99607F5AC6A15F6C8665F070CE4A471263B2066A3A128C97A43876550B853F2F6920D88464B13BA8CD4C91A3D80F195B2C7323E4BC3C36A80EC3E2A62A7EB21AEB5E9F2B2196C1C6F7139024FB15FF4225DF7CE3F26A6EC848944C4A838C5C29F3907279A2B734CFCA9D64C9A9B5E9F0758BC05D8ED65C3B977D0D8234D5D467B302F232BFEDA67B00E439E96E62F33F354718B7FA016D9C3D680E3CF353AC29125D8F5247ED6643DB97292360B7B8B115E5AEE780047F0952A72324BBB408B5BBCD38AC79C3076BD597E4F6F6244F76A234BDED46172D2297EB8B878CB05DAC1585E068957018BBA5AC5062D96E3E6B189FE781380D0F58A8EF29E3198EA8F5C1F70BEAD5E3ED4FC6EFD024C50A6E9AE9DA7B7BD60FFBF15EFFAFBC76D996CFCFA37000000FFFF0300504B03041400060008000000210044611E3A1F90000000EC32001E000000776F72642F656D62656464696E67732F6F6C654F626A656374312E62696EECDD07BC96F3FF3FF0069A4A452A457636214A458BAC4A6621328B060D7B858C8C32CAA6A56C0A15512159515456D1B01AB63856F57F1EF7CFF9F7D0B9EFEE71DDF739F5FDDCDFD7F3FBD5B7735F9F6B7CC6FBBACE7D8E9933AA2C1836A6D6C212FF79352D51BAC4CA55E54A6CB4DAFFB73725FFFDC326254A94FABF3FAF5CB56AD5BFFFF7066C48FEFBCA50967294A70215D9984A548E6DA64415AA528D4DD98CEA6C4E0D6A528B2DA8CDCB363289C94CE1155EE535A6F23AD3788337798BB77987E9BCCB7BCC6026EFF301B398CD1C56FD8FBC56F052C5D835CC97FFE76CDBD235DC8ABA6CCD366CCB766CCF0EEC483D766267766157766377F6604FF6A27E8958DFDC877D69C07EEC4F431A71008D695222BF6F9728712007D18CE6B4A025AD38984368CDA11CC6E11CC191B4A12DED388AF61CCD311CCB711CCF0974A02327721227D389533895CE9CC6E99CC1999CC5D974A12BE7702EDDE84E0F7A721EE7D38BDEF4A12F1770211771319770299771395770255795C8DFF79EFED3C7B56865BB7D6C2BFF1DC9BFAA1BEDB19EB46A55FE7C50DEBC91FF9A12FBEBFC53B9C62BFF2B0EFABF89A4A433D9ED9FA34EEF55BE44A992FFB69FFF5AFB3B62AFFC7926FF55DA556CEF2AB7F9E7EAA5FEAAA4FDFC43C99FF7926DBF0EAD9BE4CF6AF9C7DFC2F9EFEE5AB6D50FF2AF746AAFAA691C7FFEFEE6F7E3FC57FE98CFBF6EFF8EFF7CE1F5BFF32A195BC6D37E95D4734A978FF5FDFF8EFDFCF5BF5DF35E7D7B77F9A71458F31F97371C9B3F7F65F62AFDFF6B92345EF9EFCD5F37FE575FFDB89A6BB896FE5CC7F5DCC08D0CE0266EE6166E652083B88DDBB9833B19CC10EEE26EEEE15EEEE37E1EE0411E6228C318CE0846F230A318CD233CCA633CCE133CC9533CCD338C612CCFF21CCF338EF14CE0055E64222FF13293985C22D64F5FE1555E632AAF338D377893B7789B7798CEBBBCC70C66F23E1F308BD9CCE1433EE2633EE153E6328FCFF89CF92C20BFF05EC4177CC9577CCD372C66094B59C6B77CC7F7FCC08FFCC4CFFCC2727EE537F2F89D3FF893BFF89B15ACE49F8542E7CF5FBC4A519A0DD8908D284359CA519E0A5464632A51994DA84255AAB1299B519DCDA9414D6AB105B5A9C3966C455DB6661BB6653BB6670776A41E3BB133BBB02BBBB13B7BB0277B519FBDD9877D69C07EEC4F431A71008D6942530E2C19AB419AD19C16B4A415077308AD3994C3389C23389236B4A51D47D19EA3398663398EE339810E74E4444EE2643A710AA7D299D3389D333893B3389B2E74E51CCEA51BDDE9414FCEE37C7AD19B3EF4E5022EE4222EE6122EE5322EE70AAEE42AFA7135D7702DFDB98EEBB9811B19C04DDCCC2DDCCA4006711BB7730777329821DCC5DDDCC3BDDCC7FD3CC0833CC45086319C118CE46146319A477894C7789C277892A7789A6718C3589EE5399E671CE399C00BBCC8445EE26526319929BCC2ABBCC6545E671A6FF0266FF136EF309D77798F19CCE47D3E6016B399C3877CC4C77CC2A7CC651E9FF139F359C04216F1055FF2155FF30D8B59C25296F12DDFF13D3FF0233FF133BFB09C5FF98D3C7EE70FFEE42FFE66052BC95FF8F357FE9294A2341BB0211B5186B294A33C15A8C8C654A2329B5085AA54635336A33A9B53839AD4620B6A53872DD98ABA6CCD366CCB766CCF0EEC483D766267766157766377F6604FF6A23E7BB30FFBD280FDD89F8634E2001AD384A61CC84134A3392D68492B0EE6105A73288771384770246D684B3B8EA23D47730CC7721CC773021DE8C8899CC4C974E2144EA533A7713A6770266771365DE8CA399C4B37BAD3839E9CC7F9F4A2377DE8CB055CC8455CCC255CCA655CCE155CC955F4E36AAEE15AFA731DD773033732809BB8995BB895810CE2366EE70EEE643043B88BBBB9877BB98FFB7980077988A10C63382318C9C38C62348FF0288FF1384FF0244FF134CF3086B13CCB733CCF38C6338117789189BCC4CB4C623253788557798DA9BCCE34DEE04DDEE26DDE613AEFF21E3398C9FB7CC02C6633870FF9888FF9844F99CB3C3EE373E6B380852CE20BBEE42BBEE61B16B384A52CE35BBEE37B7EE0477EE2677E6139BFF21B79FCCE1FFCC95FFCCD0A56F2CF4D9F72BD24A528CD066CC84694A12CE5284F052AB23195A8CC2654A12AD5D894CDA8CEE6D4A026B5D882DAD4614BB6A22E5BB30DDBB21DDBB3033B528F9DD8995DD895DDD89D3DD893BDA8CFDEECC3BE34603FF6A7218D3880C634A129077210CD684E0B5AD28A833984D61CCA611CCE111C491BDAD28EA368CFD11CC3B11CC7F19C40073A72222771329D388553E9CC699CCE199CC9599C4D17BA720EE7D28DEEF4A027E7713EBDE84D1FFA7201177211177309977219977305577215FDB89A6BB896FE5CC7F5DCC08D0CE0266EE6166E652083B88DDBB9833B19CC10EEE26EEEE15EEEE37E1EE0411E6228C318CE0846F230A318CD233CCA633CCE133CC9533CCD338C612CCFF21CCF338EF14CE0055E64222FF1329398CC145EE1555E632AAF338D377893B7789B7798CEBBBCC70C66F23E1F308BD9CCE1433EE2633EE153E6328FCFF89CF92C60218BF8822FF98AAFF986C52C6129CBF896EFF89E1FF8919FF8995F58CEAFFC461EBFF3077FF2177FB38295AC22FFA155494A519A0DD8908D284359CA519E0A5464632A51994DA84255AAB1299B519DCDA9414D6AB105B5A9C3966C455DB6661BB6653BB6670776A41E3BB133BBB02BBBB13B7BB0277B519FBDD9877D69C07EEC4F431A71008D6942530EE4209AD19C16B4A415077308AD3994C3389C23389236B4A51D47D19EA3398663398EE339810E74E4444EE2643A710AA7D299D3389D333893B3389B2E74E51CCEA51BDDE9414FCEE37C7AD19B3EF4E5022EE4222EE6122EE5322EE70AAEE42AFA7135D7702DFDB98EEBB9811B19C04DDCCC2DDCCA4006711BB7730777329821DCC5DDDCC3BDDCC7FD3CC0833CC45086319C118CE46146319A477894C7789C277892A7789A6718C3589EE5399E671CE399C00BBCC8445EE26526319929BCC2ABBCC6545E671A6FF0266FF136EF309D77798F19CCE47D3E6016B399C3877CC4C77CC2A7CC651E9FF139F359C04216F1055FF2155FF30D8B59C25296F12DDFF13D3FF0233FF133BFB09C5FF98D3C7EE70FFEE42FFE66052B5945FE37EA4A528AD26CC0866C4419CA528EF254A0221B5389CA6C4215AA528D4DD98CEA6C4E0D6A528B2DA84D1DB6642BEAB235DBB02DDBB13D3BB023F5D8899DD9855DD98DDDD9833DD98BFAECCD3EEC4B03F6637F1AD28803684C139A722007D18CE6B4A025AD38984368CDA11CC6E11CC191B4A12DED388AF61CCD311CCB711CCF0974A02327721227D389533895CE9CC6E99CC1999CC5D974A12BE7702EDDE84E0F7A721EE7D38BDEF4A12F17702117713197702997713957702557D18FABB9866BE9CF755CCF0DDCC8006EE2666EE156063288DBB89D3BB893C10CE12EEEE61EEEE53EEEE7011EE42186328CE18C60240F338AD13CC2A33CC6E33CC1933CC5D33CC318C6F22CCFF13CE318CF045EE04526F2122F3389C94CE1155EE535A6F23AD3788337798BB77987E9BCCB7BCC6026EFF301B398CD1C3EE4233EE6133E652EF3F88CCF99CF0216B2882FF892AFF89A6F58CC1296B28C6FF98EEFF9811FF9899FF985E5FCCA6FE4F13B7FF0277FF1372B58C92AF2BF495F9252946603366423CA50967294A70215D9984A546613AA50956A6CCA665467736A50935A6C416DEAB0255B5197ADD9866DD98EEDD9811DA9C74EECCC2EECCA6EECCE1EECC95ED4676FF6615F1AB01FFBD390461C40639AD0940339886634A7052D69C5C11C426B0EE5300EE7088EA40D6D69C751B4E7688EE1588EE3784EA0031D39919338994E9CC2A974E6344EE70CCEE42CCEA60B5D398773E946777AD093F3389F5EF4A60F7DB9800BB9888BB9844BB98CCBB9822BB98A7E5CCD355C4B7FAEE37A6EE04606701337730BB7329041DCC6EDDCC19D0C6608777137F7702FF7713F0FF0200F3194610C6704237998518CE6111EE5311EE7099EE4299EE619C6309667798EE719C77826F0022F3291977899494C660AAFF02AAF3195D799C61BBCC95BBCCD3B4CE75DDE630633799F0F98C56CE6F0211FF1319FF0297399C7677CCE7C16B090457CC1977CC5D77CC36296B094657CCB777CCF0FFCC84FFCCC2F2CE7577E238FDFF9833FF98BBF59C14A5691FFADB89294A2341BB0211B5186B294A33C15A8C8C654A2329B5085AA54635336A33A9B53839AD4620B6A53872DD98ABA6CCD366CCB766CCF0EEC483D766267766157766377F6604FF6A23E7BB30FFBD280FDD89F8634E2001AD384A61CC84134A3392D6849AB32B16F5C1E426B0EE5300EE7088EA40D6D69C751B4E7688EE1588EE3784EA0031D39919338994E9CC2A974E6344EE70CCEE42CCEA60B5D398773E946777AD093F3389F5EF4A60F7DB9800BB9888BB9844BB98CCBB9822BB98A7E5CCD355C4B7FAEE37A6EE04606701337730BB7329041DCC6EDDCC19D0C6608777137F7702FF7713F0FF0200F3194610C6704237998518CE6111EE5311EE7099EE4299EE619C6309667798EE719C77826F0022F3291977899494C660AAFF02AAF3195D799C61BBCC95BBCCD3B4CE75DDE630633799F0F98C56CE6F0211FF1319FF0297399C7677CCE7C16B090457CC1977CC5D77CC36296B094657CCB777CCF0FFCC84FFCCC2F2CE7577E238FDFF9833FF98BBF59C14A5691FFE1BC9294A2341BB0211B5186B294A33C15A8C8C654A2329B5085AA54635336A33A9B53839AD4620B6A53872DD98ABA6CCD366CCB766CCF0EEC483D766267766157766377F6604FF6A23E7BB30FFBD280FDD89F8634E2001AD384A61CC84134A3392D68492B0EE6105A73288771384770246D684B3B8EA23D47730CC7721CC773021DE8C8899CC4C974E2144EA533A7713A6770266771365DE8CA399C4B37BAD3839E9CC7F9F4A2377DE8CB055CC8455CCC255CCA655CCE155CC955F4E36AAEE15AFA731DD773033732809BB8995BB895810CE2366EE70EEE643043B88BBBB9877BB98FFB7980077988A10C63382318C9C38C62348FF0288FF1384FF0244FF134CF3086B13CCB733CCF38C6338117789189BCC4CB4C623253788557798DA9BCCE34DEE04DDEE26DDE613AEFF21E3398C9FB7CC02C6633870FF9888FF9844F99CB3C3EE373E6B380852CE20BBEE42BBEE61B16B384A52CE35BBEE37B7EE0477EE2677E6139BFF21B79FCCE1FFCC95FFCCD0A56B28AFC0FE696A414A5D9800DD9883294A51CE5A9404536A61295D9842A54A51A9BB219D5D99C1AD4A4165B509B3A6CC956D4656BB6615BB6637B766047EAB1133BB30BBBB21BBBB3077BB217F5D99B7DD89706ECC7FE34A41107D0982634E5400EA219CD69414B5A713087D09A43398CC339822369435BDA7114ED399A633896E3389E13E840474EE4244EA613A7702A9D398DD3398333398BB3E94257CEE15CBAD19D1EF4E43CCEA717BDE9435F2EE0422EE2622EE1522EE372AEE04AAEA21F57730DD7D29FEBB89E1BB89101DCC4CDDCC2AD0C6410B7713B7770278319C25DDCCD3DDCCB7DDCCF033CC8430C6518C319C1481E6614A3798447798CC7798227798AA77986318CE5599EE379C6319E09BCC08B4CE4255E66129399C22BBCCA6B4CE575A6F1066FF2166FF30ED37997F798C14CDEE70366319B397CC8477CCC277CCA5CE6F1199F339F052C64115FF0255FF135DFB098252C6519DFF21DDFF3033FF2133FF30BCBF995DFC8E377FEE04FFEE26F56B09255E47F28BF24A5C8FF0CDF066CC84694A12CE5284F052AB23195A8CC2654A12AD5D894CDA8CEE6D4A026B5D882DAD4614BB6A22E5BB30DDBB21DDBB3033B528F9DD8995DD895DDD89D3DD893BDA8CFDEECC3BE34603FF6A7218D3880C634A129077210CD684E0B5AD28A833984D61CCA611CCE111C491BDAD28EA368CFD11CC3B11CC7F19C40073A72222771329D388553E9CC699CCE199CC9599C4D17BA720EE7D28DEEF4A027E7713EBDE84D1FFA7201177211177309977219977305577215FDB89A6BB896FE5CC7F5DCC08D0CE0266EE6166E652083B88DDBB9833B19CC10EEE26EEEE15EEEE37E1EE0411E6228C318CE0846F230A318CD233CCA633CCE133CC9533CCD338C612CCFF21CCF338EF14CE0055E64222FF1329398CC145EE1555E632AAF338D377893B7789B7798CEBBBCC70C66F23E1F308BD9CCE1433EE2633EE153E6328FCFF89CF92C60218BF8822FF98AAFF986C52C6129CBF896EFF89E1FF8919FF8995F58CEAFFC461EBFF3077FF2177FB38295AC22FF07724A528AD26CC0866C4419CA528EF254A0221B5389CA6C4215AA528D4DD98CEA6C4E0D6A528B2DA84D1DB6642BEAB235DBB02DDBB13D3BB023F5D8899DD9855DD98DDDD9833DD98BFAECCD3EEC4B03F6637F1AD28803684C139A722007D18CE6B4A025AD38984368CDA11CC6E11CC191B4A12DED388AF61CCD311CCB711CCF0974A02327721227D389533895CE9CC6E99CC1999CC5D974A12BE7702EDDE84E0F7A721EE7D38BDEF4A12F17702117713197702997713957702557D18FABB9866BE9CF755CCF0DDCC8006EE2666EE156063288DBB89D3BB893C10CE12EEEE61EEEE53EEEE7011EE42186328CE18C60240F338AD13CC2A33CC6E33CC1933CC5D33CC318C6F22CCFF13CE318CF045EE04526F2122F3389C94CE1155EE535A6F23AD3788337798BB77987E9BCCB7BCC6026EFF301B398CD1C3EE4233EE6133E652EF3F88CCF99CF0216B2882FF892AFF89A6F58CC1296B28C6FF98EEFF9811FF9899FF985E5FCCA6FE4F13B7FF0277FF1372B58C92AF27F18AF24A528CD066CC84694A12CE5284F052AB23195A8CC2654A12AD5D894CDA8CEE6D4A026B5D882DAD4614BB6A22E5BB30DDBB21DDBB3033B528F9DD8995DD895DDD89D3DD893BDA8CFDEECC3BE34603FF6A7218D3880C634A129077210CD684E0B5AD28A833984D61CCA611CCE111C491BDAD28EA368CFD11CC3B11CC7F19C40073A72222771329D388553E9CC699CCE199CC9599C4D17BA720EE7D28DEEF4A027E7713EBDE84D1FFA7201177211177309977219977305577215FDB89A6BB896FE5CC7F5DCC08D0CE0266EE6166E652083B88DDBB9833B19CC10EEE26EEEE15EEEE37E1EE0411E6228C318CE0846F230A318CD233CCA633CCE133CC9533CCD338C612CCFF21CCF338EF14CE0055E6462C5DCFE8CE347DAFB984FF894B9CCE3333E673E0B58C822BEE04BBEE26BBE61314B58CA32BEE53BBEE7077EE4277EE61796F32BBF91C7EFFCC19FFCC5DFAC6025ABC8FF41DCB225A675AAD334FF4701DC10941E9A7F694AF4FBE7BFF33F2050BA64D97F7E9AB762A9D12B06E77F44E09FCF01C77EC2B74CFE4787FEF9DA6615EA96985EA243A9FCCF7EB9722B62FF5BAF44ECD360F99F802DF9CFCFF19A711BD7FCE77F577F2D1E1E12121212121212121252BCA2A02FF49F25FAC642424242424242424242324CA85F434242424242424242D6A584FA352424242424242424645D4AA85F434242424242424242D6A584FA352424242424242424645D4AA85F434242424242424242D6A584FA352424242424242424645D4AA85F434242424242424242D6A584FA352424242424242424645D4AA85F434242424242424242D6A584FA352424242424242424645D4AA85FA3C9C48943E6CC9E24CB962D94BCBCE5B1C4FE18FB2B5F93EDDD080909090909090959EF13EAD74C13AB590B0AD6C489D5B2D9DEA59090909090909090F538A17E4D3F2AD124CBD63513AAD89090909090909090F412EAD7749249E55A9065CB16864F148484848484848484A49A50BFA69CE43F2D904C42091B12121212121212925242FD9A5AA22D5EF3C253D890909090909090901413EAD7D412C92707D62C61B3BDDB2121212121212121EB4D42FD9A72E23D828DFD6E81891387FCE7796AEC576B257E701B1EC18684848484848484249950BFA69C351FC126F9BB5D7D4D78041B12121212121212926142FD9A4E0A1EA6A6FAE9D504256C78041B12121212121212924C42FD9A4E6265687ABFC3355E091B7E236C48484848484848483209F56B9AC9E47169A85F4342424242424242D24EA85F8B2085FE2C57F8086C484848484848484832C945FD5AF003F8AB7F6C34F6D3FA49FEE4D37A96427F09D7BA52BFC6AE5AA157B3A82E65820E16C92E25D87EE61B2FE659F37217938B1E9279621DFB3FBF1D65BD9F9C8B643D0AE3683DCEEAE328C7D737C7EDC67EBD52A18DC6FE98E3A923D3FA75F553567018057FEB18FE735A0BCDB2CC7E877F821F8A4A3E999FEEE4ABA839A9D7AFF18E31A5DD4EA3DDD577A0D0B7AF99488E37C924B34B99F4AE643AF09A556CAAC7BBD643586BD6DC870C93E4C82D48864338674963AE88645E8E64FC4698FFD4AC890F7F1D2AAD0ADDFF82BFCDCD7AB47AB23A8E92DF6CBC443E6F1424C15147D5687158F7931F47B144D5B5723C3F17D436C9B7184BB60BD9E8EBD782DE9964B95390B40B9A22EFC7C974A6D53B50B1AA5F25ED3726C8EA87938DFA358D019C4613C96F7FF50BB14ED7AFA99ED8D553FC6B9D48E68ABCD4E7E5E253BFA6777DD7952AB6D02B15FBAB9CAD47B1E4601CA5B7F1D593BDFA35F1D145D2441AABD29A49BB5767D27A26A32997F373DA656B86ED269F6C3D7F4DEF98D33BCEA2AD5F533AD2D87C51ACEAD7B5CE26990CD4D8EE455EBFA6B74B29F5AE343A55DAF727A936B466A25A87225912B2B728669EA8EAD782234DB2471593FA35C3EB5BFC4BD835F739F7EBD1E25C8DA31C34915ED67AF89174A4A25AF733A920574F1A273F67F373AC72CDBCADD5938DD9232BCF5F733C4B16D57D587AE327C1F949A3AD6CD7AF99CF11F14642DAF56B26BB94FC8294DEF613D4EB79F1AF6F7A6DAD9ECC1F6944352947B53F594AB4F56B2C49AE0785BE379715E17A7F73B2B818AC47B91C47D9DE7EDA59EB1988A4171549FD1AED0492FCF9CF65BF8ABC722D48E4B347F4F56BE6497550AD07FD38AFB83E7F8DEA4633D576E325F3D39E4CBB690FE0D8C6533DDEF4DA5A3D19CE0BD14E8EB1A4FDEC2AABC946FD9A97C4F92FF2FA35C235A9185ED68244758CABA7A88A8C82D6E39DF0CC379E8DBB91648658247573EED7FD6C1476C9CC93B9EC57599A210B12EDEC511CEBD7BC14C755EEFB7136AE7151D5AF79F19F0B66B52BA73785E5E6597B861B5FB7EAD76C4C8E79C5F5116CF6BA74E24E55B4F56BE4475D6C4BD8680FB320493E62CFF138CA7CE3D9A85F939CA233EF4239FEBE6B96A68EB5CE93B9EF57D97BFE9AB8DD34928BFA75D91A3F833FF19FDFC290F8AAE4B863A5349C72BFDE67AF7E4DD06E82C38CDDBDFDA7F558E996E4C949A31F27B8D0FFE96389F72471D30946EF9AADACD98D635F9352A3F19A4B3E99AC438967AB82435EF35AC74E72BC3716CF12274B8B502C69B49B83B3B4D6432E74725E6BAFC8D2DE6698C4475AB0F3D9588F723F8E12349764B251BF2639FF67DE74246339F901B8D6E38AB72666384FE6BE5F253EB1B11613379A789F239CF4B25BBFC6AE6882B727983532EFDF59DAEC5AEF4EFE7369D7DA930A92A0D1785D2AA5AE10555DB5D646135CD664DA8D9778E7308D123CC121A4D1CA7F8E375EA3F1DE1E6F9B996F24ED56624972B0CC59E356211BEB6224496F1C253984131C7524E337BD24D8EDC49729F1282E9E9738C1D5C9CBE67A547CC6516EE68D78497C1E72B34B995C8278493CF6B3777D8BAA5FAD79BC6BDEF5AD35D92BED0A92C5FA35C9BD8C778532BFC52FF4F465A92C4E72E3098641E2E32D3EF56BF22730F1D84BE3FAA65717A6DA0DD26B65AD257BAAC79B9B8A27DE3E67727791F9C8CD5E323FABE90DE1A2AA5F138CC1240772843D24078977B0C91F6F7AEB51F119474578A7B438FE1293CB5DCAC6BA5FE8FEC70E2DD5A348E9FA1655BF5ABD17A5718C05C9520D56906CD5AF299DDF784B4286FDBBD06D66EF3E2CF9F9B1D08B5A54F56B5E9CCA2C9216132C9F698CC042B793DE2D6C36AAF668EBF5942E567A89FCD631D6B7D37B6F6E92D57194603B455555C4DBD5942E53AA075B8489B7AB595D8F8AD538CAC1BC912085363D27CE47B9B23457C4DB87B43798C6784F9C24AF6FD1F6ABD855CB708C67FBBA67AB7E4DB2F958B234B967A3F68F773F94D266537D0EBAB8383D7F4DFB7633A5E35D33999C81CC8F3AC9EB9BDEC3B94293838A275E672E8675495489EAAC4655E264FB5417DA685E44F37331BC57C9EAF1C6BB58C56A1C15554F4BDC74BCBFCAC66E44BEEE17D5F55D0FE6E742F7BFB8D7AF69F4956C5CA7A8F6AD2051CDE369DC221749FD1AD54450E89EE7B29E8B1DF8B2381F758FAA95580A7D7B2C496E21961C3C472974FB19DEE015F344B5BAC7DB4EBCB357245545AA3B9920EBCA521AD5F1A674B051351A498AF0F96BE2876D393B4BD1365484376F393B63D948BC87EED11E4256EAD73426B56C1C67E4F761A93E7449693BC5F0F96BBCE34DF51C46F24D844CCE40F26729F3F39CEDE7CD296D248DEDAF4337F76924C2A32E743BC5AA7E8DB77EA4B1A9084BE1AC26AA939CFCC116B77194ED7923D5760B4E5A1AAB5E7A8976DD2FAA9EBF2ECECF1393FB0544111E42B6FEFDB129254B5D24F26D46B51E14ABFA35C1FEC76B34B6B71996743978689D46323FCFF1B610D5F14635F88BF0394D1126C25521A565B24856A3425B4CBB6228746BC5BF7ECDF67A54DCC651B6E78D54DB2DF8829C0D81425B49BBA316D5F52DFEF373AC5A8D15AC6BAD59B37408C5BA7ECDB06747FEFC35AA0D16ABFA3571BBF14651C17BE7FCFB1DF9047B1249FD9A9BE92F9256E29DAB48F624A58D2448E22B1B6DA2DAE7CCF3BF53BF46DEE23A71C3B3E6EE657B3D2A6EE328DBF346BC24F34DB642772CF25BA068D7FD4816AFA8DACD5252DAAB58C19A765BD1CE7899D6AFB1E3593D69EC5F966E190BDD6626A325AA0DA6B1121455FD1AEF5D99677D7DFEBA38A2E7F4591A146BDD7E3612C90E479208ABBA42B7537CEAD7C8FB4FEE0F218DE47E3D2A6EE328DBF346A149B26FE4A6162C744F42FD9A20C9EC4C26356B4132A9BE0A4DA6F56BE689D7F59339AD8913F9F3D7A82E491A43A208EBD7786FCC30EBF1F3D7641E45E4664F122492F928C944B2C39124AAB39AEA768A49FD9AC9BABB4ED4AF9927D5F5A8B88DA322B94C493E5CC8CDBE45BBEE47329947D56E969260372646F76FAF8DBC785D5CE4F56B82C922F3A38D7CB3516D30C2FA35A5D6939C65E2ED40B4236A3D7EFE1A49E990EDE72839BBBFCFC15C9F7CA25A4153ED8DB9AF2AB2B1EE167A08D958968A2A69AC47C56D1C15C9F3D7E477B8D0AF8CB60B45DB44B4F781B10799ABA738F7ABA8F6217B534451D6AF89CF4EE6E3ED7FE1F96BE6F56B4A433136FC0ADD9354B31E3F7F8D64CA8BE48A2748A85F574FE6D7372FE1A52926F56B869D271BDB2C3E496F3D2A6EE328DBF346F22D167AC652BDF14B23D1F6D268EBD735F72DDEA68ABC5F25B8974B72B373D2FAF44E4A299AFA75AD655024832DF22D473530D218C3F13A53AAD567865B28D899CC4757AAEDE660E25B9CE5FA26A53D89B791A8CAC19CCD8FC5AABEC9FCFA26386F093692DE6250F084268D95A0D00D86FAB5D064B21E15B77194ED7923F9160BFDE21CDCC86572F6D64CB4EBCE9ADB29F2FA35DE9949753B69CF549924A7F56B92754F54232DF2D9B6D00DA6B1B769D49109D6BF0C97DE4CCE76EC82C666FF58E2ED64E6ED86E7AF0549693B696C3FDAE4723A5B6BD2BBBE05FD3CEDC38CEA6C27BF3CC47B7B32EF8D97C82790A24D24EB51711B47D99E37D64CA16D25E869512DA3296D3FED9E1FEF7CA6B1C1423795A5C79FC9A7D07EB5D6715124D5EA9AC951FDBAD61BDCB59ED03452E8C63399C1E35DD4547738DAFA35F9232AAAE5279276A3BD0F8E97E253BF26984132AC420A92F991AE9EDC5CA00C93A55561AD272DDA769725F1DB97D3DBCFC4596FEAD768D7A3684F7586E3E8FFB17707BBB2235B5A804F770323460C19F204F0003C00520B9E01249040082608E9BE483DC3BD43C647AAA7A8C3BC675B3A53A43D84ACF6256F766EDB190EC75A19E1F8AE3E5A4555EEB41D0EDBBF57AE74269C374A16B7B3F9D1278AE6DBBEFA86ADEA563B1BBEFAE29C79B575742CB1B59F92446C7E2DBCC17D1C9D8643D3BCFEBA75116A124DCEDCE5172E37FAC6774B93CBDED60854AC4FC552F2F3EBFE1E6F7298B49D0FCD0FB708CDF36BE1292B2237EF8C6D9369FCD5E8F935E87AD4D5719470DE78B4157476FE646B0D5B9D2B9A9F88B6B6F1E8601E9D276F9C57ABDBDBE1911E955F0FDDE0DE47A7EDD1B5BA949307C9D6CA1F7ADB8A1BD0FDB352E1C43AF3B76734390E2B6EF42BC4E5D7CF46FDAF75A377681115C748CEDE39AF618E3C74BE8AC8AF9FDB7B4A7E7D127A3DEAEA384A386FDC5527D1B6C9EC49DD2AEDD819D2F3FB6567ABDF38AF5A2D375AFBFCFABDEA414B11431351103A3F95B7C667FFE87D79FD7BB95D27EF7A970DAF18BD5677DB5BEF73747DEA96723EBF1E3D3BBFDCE34DEEF79A94162A4ECDEFD22A471E1DF9A0FCBAB526F2EB5DCEF5A89FE328E7BCB1A84EDBA1B7BB11D7FDADFD5B38983BB1617FE7BE6B5EADBEBE6E0C9703B0D5947BD238BFEEDFFC351C9412418B3BB32DD5F378EBACF438BF7796BE73522B9C584F9B7932ACEFAFEDAAD053DE5D3FF975E7A473741877567E7F42BEDCEAFD701074CE3AA3618E3C3481E3F2EBD6BC5A7D71C4DD7BCFF935ED7AD4CF719473DE58541462EEEFBCBA924DC240C43BEF4FA4FD377F3909EBFE36745E35B96A7F7F68D7093A4BB4CCAF876E737F6E3FB9B79588FBB08F82E9F814EF6EFFFCB82377066467A13B07FCCBA5EF2FBAE4E4B875DD5A76E2B2814F6BFBE3D5077647C3CDD6081C7A93EAA5E4E7D79D35F9FA2F7FAC7D15F4712F549CAAEEABBDFFCE3B7F78687B73B4CD91E57585BA795578EA583DA7552CEEA526133B4DF2F5A893E328EDBCB173492A59CFADAD2EF9DB8A773E7FDD3FBA7F4B76EEF2872797FBB7FFEB5FACEEC18FDD5ADBFE72F7CF39AB17FD65B9CBA25737FCE4C96755B3FCFAF224FBB4F187DEBCD5A297A59F5FE2A13363B99D25EE9C95CEAC4CE1C9B1FAFDB7ECEF85E68B5B94CCBABA9CF1646B426EBDFED056FCE98F7F3834E1173B03DE36D22DBACD34111B9B33AF7676FAEA68AFBE3222A2F5B9AFF3AF47F9C7D1A1B76A7EDED87AB7C2C13CF9E73BEF7074430A45ECDFCF82C3E72DE7E7512E0A6DF26BC94C3A7F83BBE5D058375987FCBDBB73FD3BB33225278B8AB3DE4BFB4B6CBEB8C57BF3EBCEFEADD88A8A9B968AADAE1671ABDD44C5FE5D0EB1FD524AC472CBDF64F57D22AA504195ADE6DE753D4A3E8E2ADEAAE17963F5C5E519656BACCA774AFE75FFE4A5F0E7DA23D24B46EC2DE7E788EB7EF3EB4283FCFA72707F8675EF16AEC0A356E7ACE653AA3ABF7ED44EB5C2734DF362F3CBC9D07671E5CBFD1821BFEEAFE78EFD4D68389FBB0DAF1FA7F7EFD681F6F2ACD2645EEDAC40617E3D5902A9DBF664EFBD1E651E4787DEAD7AF55657E37CFAFC38DD42F096EBFE9954B7750F5CB2DCB79C9F9B47D8E625D806F9756723A393EBE22DF3F8E8721FC7E468BED959D67D788FA6CC43BBA6E13C2E5968AB65552CBAFFFC7A5F93A3D3AFE433A393F72A39C7FB19E7F7EFD6B110BDDCFDF7F97A5AAB38C9D42DBAB73DDEC3F528E7383AF49E6DCF1B5B1B78FE3C59FE26EFBAEE9FA916D5D55F176F393F37BCF4FF08F8E18306F9756B4CD3EECB0F0D71DBB53A3AA596A5575C024B2E1EE5E350771EDFBA7D6CBED0EA45EC7B6F7EFD6CD4FFFAB4B687F648C956549FB07AABC3AD6AB27F57C77C7FF31B86BFC2C1DF5AE2D1C5DD9D4C1B69DE7E3D5A241C4787DEF6F10FCF9F37565F76F4EE686B8A16BECF40D7FDFB169DC9AF8BFCF3F35B7273A1B3F9F5E414BCBFC9CFBF6F0D7954BEC1EFBA0F7B5C81973BF8718B2A4A2385D7BF9235393902DF0FFE86CDB26987A6EFA1372FF7DEFCBAB37F4F6E45F9F9A570D72FBBB8F03D7FC63F48A4A1B8FD9B965F0BD3F3D612AB7756C55D77BE1EAE478FEF137A1C95BCED5DC3F3C6D64CA8985A5B2B50F2B7A35CF71F17FDF5F58766E67DB9F9E7E7F2D9F2B4E88A03A75C547E3D7F3D287F87B7CFE3FB6A2CB3EABE9B977FFEBA0BE3F2EBD135396359CAD382EECB3AB3B892FD58A16465E2E6F3CEFE3DB4153B6BFE7577DC7744DDB4FF3A919EDE33F4DC14E12DFBB7D57217AB5791D5FDBBBAC4EA13E0EABB555C7D43F5703DFA2AE8385ADDD22DFBEB76E8BCB13A03EB866875A83FCB6669B7D7FD65005777EBD7A13B7304BDE5FC5C78DDCFB9349CCDAF5BF3AF70F13B6F32DCA591500D1300D38ACB37FB27BD86B377F57D562FCF5BEB59B1D0ADF58F8B05755C8F601E51F5D7C2C52FCA2B0A4CABC99589C98D9E5F0FE5C833C5AD270D4B6EA15C8F601E51F5D7F2F39ABA1A25CC13CE6B328B56F34D4EFFC0D1F3EDEA8B3F0FE6B9AD95EFAD79E0C3F5086612557F2DBF5B6DF821D757CB9B7CFDBF0C47FD95F3CEA793AD7998905FB7DE64E728A85BDB275B0BEDF05CDAF9F5881CAEFB9368F0FCAC3367B7AD93C5F9F3C5D6075ECE44835217E1BC93B368E77CB59F90E272F3E76E18DD89BC85916EE7445AF2E7F9B6D6F6BDD72372B8EE4F25F0F9AF2F67CCCEC9E2F374BF51F595863EA9BF725E458EFC5EF0FBB1FBEF50B7DCC745EF2CF7E59BD405DF65E923A6813EAF47E470DD9F4AECEF6F7DAE3D48A2E462F0A9FECA3FA4FECA793BF5C8335E7E1C1FB4DC92457FBC7AD0D2D7F3F3CBD0DC61E7EB5D9FD72372B8EE4FA5417EFD38FEE3A5254ECE36F76117A3FECA794139F2E5C92A2EBF969C279B2FBDF328D0E1F5881CAEFB5369935F23CECEEAAF3C527FE5BC883355C975F15DB9F9EE651342C442DFA5C3EB11395CF7A7D226BF7E9C3B3FAEFEADFE571EA9BF725EF364537832E921513589B0A38480DEAE47E470DD9F4AB3FCFA517BCA58BA91BEFE7BF5571E6D2580E8E572256D7364F999A4ED72ABAFC42723EC5867CEAEAE47E470DD9F4ACBFCFAF1EA2BABAB278BE5AF9ACF36F76117B3B5439D9528D72447DE4E7147675DABFCFAF4DDA30A474FD18B8A4DEE413FD72372B8EE4FA5717E5DFC28F83AE7E30951FD9597D45F39AF2247DECE24CB97D6CF64C7EAE59E5FF4AA9253F47D35463F61F6703D2287EBFE5442F2EBE2FBFF7F2EC9E27E9A687E2E06E0A8E5147D3F4BDF4FD1F7D01CBD02995C8FE06202F32B00003427BF02003012F915008091C8AF00008C447E05006024F22B000023915F01001889FC0A00C048E45700004622BF02003012F915008091C8AF00008C447E05006024F22B000023915F01001889FC0A00C048E45700004622BF02003012F915008091C8AF00008C447E05006024F22B000023915F01001889FC0A00C048E45700004622BF02003012F915008091C8AF00008C447E05006024F22B000023915F01001889FC0A00C048E45700004622BF02003012F915008091C8AF00008C447E05006024F22B000023915F01001889FC0A00C048E45700004622BF02003012F915008091C8AF00008C447E05006024F22B000023915F01001889FC0A00C048E45700004622BF02003012F915008091C8AF00008C447E05006024F22B000023915F01001889FC0A00C048E45700004622BF02003012F915008091C8AF00008C447E05006024F22B000023915F01001889FC0A00C048E45700004622BF02003012F915008091C8AF00008C447E05006024F22B000023915F01001889FC0A00C048E45700004622BF02003012F915008091C8AF00008C447E05006024F22B000023915F01001889FC0A00C048E45700004622BF02003012F915008091C8AF00008C447E05006024F22B000023915F01001889FC0A00C048E45700004622BF02003012F915008091C8AF00008C447E05006024F22B000023915F01001889FC0A00C048E45700004622BF02003012F915008091C8AF00008C447E05006024F22B000023915F01001889FC0A00C048E45700004622BF02003012F915008091C8AF00008C447E05006024F22B000023915F01001889FC0A00C048E45700004622BF02003012F915008091C8AF00008C447E05006024F22B4094EFDF7FB9895E0AC06CE45780103F7EFBF5F3F3FFDCDCFE217A590053915F011ABB27D747522C402BF22B4033DFBFFFF2F3E7DF7D0DAF8BDB7FD24E00709EFC0AD0C07E729562011A925F01CE5A6D18D8A79D00A09AFC0A50AF22B94AB10027C9AF0035CA1B06F6692700384A7E0538A655727DF4E3B75FA5588042F22BC001271B065EA6D8E8F507B800F915A0C82D5C362FBB7EA59D00E025F915E0858886817D522CC00EF91560D32D4486360CECD34E00B04A7E0558F7C6E4FA488A057822BF023CCB6F18D8A79D00E091FC0AF017BD25D747522CC0427E05F8B34E1A06F6692700905F01C648AE773F7FFE9D140BCC4C7E05A616D730708F9841E1583B01302DF91598545C72FD9A2C3397057079F22B30A3B7D444136ABD0033905F81B9C4B5BA1686C8B8E82CC50293905F815984963F8F7E88AF2916A09AFC0A5C5F9FEDA75DE5698081C8AFC0C575FE79FDED4D34C5021C22BF0297F5F656D71E56552116B81EF915B8A0119F57E5195B0085E457E06A864E819EB105F092FC0A5CC7400D03FB2EB3210011E457E00A2EF92D28CFD8025825BF0263BB76DBA8A65880AFE4576054B7F835498552532CC023F91518D2841DA29A620116F22B3098998B91F3949C0176C8AFC03034832EFCF02C3039F9151843E73F039BCF0FCF02D3925F81DEE9FBDCA19D009890FC0AF44BC340094DB1C06CE457A04792EB519EB105CC437E05BAA361A09AA1036620BF021D11BF9AD04E005C9BFC0A7441C3405BC613B830F9157833492B8EA658E092E457E09D340C24F0E85CE062E457E03D24D7649A6281CB905F816C1A06DEC5C803D720BF0279429FB4AFEC5A48532C303AF91548A261A02B6E248071C9AF40381F5BF7C90FCF0283925F8140926BFF42DB09EC232082FC0A44D13030103B0B1888FC0AB4270C0D2A6EC729C4020DC9AF404B1A0646670F02FD935F816654EF2EC333B6809EC9AF40031A062EC96E05FA24BF02A728D45D9B676C011D925F814A1A25E7615F035D915F811A5A5D27A4D60E74427E058ED11339391300783BF91528E54364169A6281F7925F81D72457BEF2C3B3C0BBC8AFC00B3E2F6687E901E4935F814DB700E1FB3A94D04E0064925F81151A0638CA9C01D2C8AFC033B534AA79C61690407E05FE422F234D98484028F915F89DB219CD29E40341E457989DB645E2985D4004F915A6A6424602D57DA02DF91526A543916471374BA61CCC467E85E9F8D924DEC50FCF024DC8AF3011CD88F4C03C044E925F6116EA5E74C5AFBB01D5E457B83EADAE744B532C50417E852BD3EA4AFFB4130047C9AF705932010371AF0594935FE182340C302853172821BFC2A5F84E0C171097621562E11AE457B8084D845C89F90CEC905F61789E09CF55F9E1596095FC0A63D32FC8E599E4C013F91546A534C53C7CC8003C925F613C5A039993990F2CE457188CAF6633390FD900E45718862E40B87338C0CCE45718809F268255DA09604EF22B744DC31FEC73770713925FA15F715FB8F6092917A39D00A622BF428F5C8CA182676CC124E457E88B860138C3110433905FA117AEBBD08A5FF7806B935FA10B1A06A03987155C95FC0A6FE661EC104A532C5C8FFC0A6FA361007238D6E062E457780F35214816FA5987E30E32C9AF904D4F1EBC9103102E407E853C7E28087A703B587C000243935F2183F63BE88DA312C625BF42064F18803EC51562A3D71C6626BF4286E6F9557285869AA758F91542C9AF90A1617EF5D1244468DB4E20BF4228F9153234B92E4AAE10AD558A955F2194FC0A19CE5F11350C409AF3ED04F22B84925F21C399FC2AB942BE93CFD8925F2194FC0A19EAF2AB860178AFEA7602F91542C9AF90A1E21228B942272A7E78567E8550F22B643874F1D330001D3AD44E20BF4228F915321CCAAFD12B0354F8FEFD17F9153A21BF428643F955E700F4497E854EC8AF9041FD1546A7FE0AFD905F2183FA2B5C80FC0A9D905F2183FA2B8C4EFD15FA21BF4206F5D7CBBBEDB56AD1EB462BF22B74427E850CEAAF9754FD70FBAF6EEFE3B9699D537F857EC8AF9041FDF5621A26D727526CCFCAF7A3FC0AA1E457C8A0FE7A2587EA7015FC6E709FD45FA11FF22B64507FBD8CE8F0BA907EFA640F4227E457C8A0FE7A19E5FBF1248D04BD517F857EC8AF9041FDF51A827A5EB79809BD29DF77F22B84925F2183FAEB05E4740E3C5282ED8AFA2BF4437E850CEAAF17704B935B49E5B6CBFEF4C73FD4B9FDEDD63B97BBADC3F204AE3BB328C2A13D12BD323033F91532A8BF5EC0EA4EBCFDCBEAE4FA9462CB6748B925D4CAB24DA8BF423FE457C8A0FE7A01AB3BF1960E9BE4D79BD0E65ABF8FD0C4A1018F5E199899FC0A19D45F2F6075679DE91C7872BE8BA084145B4DFD15FA21BF4206F5D70B58DD890DF36BE6C30DA4D83AE5232CBF4228F91532A8BF5EC088FDAF3B96AF9D450FDA95A8BF423FE457C8A0FE7A013D3F7FA09A42EC21E5032BBF4228F91532A8BF5E40CFCF7FBDADDB627978D6A1F9266915527F857EC8AF9041FDF51A325B543F4FCF8425CE96ACB35E8242E5FB4E7E8550F22B64507FBD86CC126CC34FF66FABFD72068AB02FA9BF423FE457C8A0FE7A1939113622FDBCECB215B95E7AEF1E04EEE457C8A0FE7A25D1113634FAEC4F45A96B87FA2BF4437E850CEAAF1753F2897C9D840702EC17624DBF1DE5FB517E8550F22B64507FBDA48629F667EEEFBBEE971245D855EAAFD00FF91532A8BF5EDEFD095615A2D76DD54E1AF350D82DE547B1FC0AA1E457C8A0FE4A87761A09DC447DA5FE0AFD905F2183FA2B7DDA9A994AB0ABCA8F62F91542C9AF9041FD953EEDD414A3173D1CF557E887FC0A19D45FE9D656178112EC57E547B1FC0AA1E457C8A0FE4ACF24B012EAAFD00FF91532A8BFD2B3AD12ACA9F8A4FC28965F2194FC0A19D45FE9D95665510BC123F557E887FC0A19D45FE9DCEA54945F9F941FC5F22B84925F2183FA2B9D5B6D2110C21EA9BF423FE457C8A0FE4AE7B6C259F472C7527E14CBAF104A7E850CEAAFF46F7536BA9BBA537F857EC8AF9041FD95FEADCE462DB08FCA8F62F91542C9AF9041FD95FEADCE52F9F54EFD15FA21BF4206F5D7336E03B2885ED0E456BFC225BF3E2A3F8AE5570825BF4206F5D70AB7C0FA75DC6EFFE696A864D9085BB3D4682FD45FA11FF22B64507F3D6435B93E51176C68EBF7B7EE6EBBC3B4FC507F856EC8AF9041FDB55C79954B4438AFE456E16EF208ABFE0AFD905F2183FA6BA14311414A38EFD0CC9C7C727EA8BF4237E457C8A0FE5AA87C940485F38E86D7C5B41156FD15FA21BF4206F5D7122FBB308D5843474BDD7733771E978F92FC0AA1E457C8A0FE5AA27C889EC80A15EA8AAF8BE875EB93FA2BF4437E850CEAAF3B6EDBFBE3B75FB78668F9E6FB9FFEF887E5655B8316BD9217B313C596C7932D03BEB353E67C8AD9D6A0AD0E51F4CAC0CCE457C8A0FEBAEAE597DF6FFFF516A41E6D052F2D0487EC0CE3D380BFDC41F38CBCFA2BF4437E850CEAAF4F0A1FDBF4E3B75F9FE2D456A2F238D843562BD95FEF16766E189EFE709214FB72281EC7247A656066F22B64507F7D54FE3DADAFE5C01B3F737ADED618D6E5D7497681FA2BF4437E850CEAAF774787427E8D10915F3F27086D86023A21BF4206F5D7C5D1EFBCCBAF4182F2EBE7A5739B280FFD905F2183FAEB47D5039BE4D72071F9F5F3D2D1CD204027E457C8A0FE5AF7DB04F26B90D0FC7AD5DDA1FE0AFD905F21C3E4F5D7FDF0BA7C7B7D6B28E4D708E7F3EBCB27485C728FEC6CEF13F91542C9AF9061E6FAEB7ED5EA9E9956FFABFC1AE47C7EDDD9178FBB2F7A4332A9BF423FE457C83073FD7567DB1FE3E9CB17C8AF0DB5CAAF3B2FF8BC6286DBDAD219B61DBA22BF428669EBAF3BE1E6292DADBE467E0DD230BFEE47D82BDD8CA9BF423FE457C8306DFD756BC3BF46A5ADA1905F23B4CDAF5B3BE5F372316E751B67D870E88DFC0A19E6ACBF6E459F9F6BBF53BAFA4AF93548F3FCFAA78DDFF55D7662F4E6E4507F857EC8AF9061CEFAEB4EA0915FDF2B22BFEEDCAE446F4E9AD50DBCFC564387E457C83061FD752BCDAC8624F93559447EDDDA35CB7E8CDEA204EAAFD00FF915324C587FDD8A32ABB9477E4D16945FB7F6E365F6CEEAD6AD925F2194FC0A1926ACBF6E5DD4E5D71EC4E5D7ADA91EBD4509D45FA11FF22B6498ADFEBA75A55FCDA3F26BBEB8FCBAB3EBA3372AC1EAA6AD925F2194FC0A1966ABBF1E6D1E905F93C5E5D7AD5D79811DA4FE0AFD905F21C36CF5D7D5EDDDFAE696FC9A2F34BFAEBEF935F2DCEA50AC925F2194FC0A1966ABBFAE6ED74EF380FC9A2C34BF6EFD49F44645537F857EC8AF9061AAFA6B45E2915F9385E6D79DBD19BD5DD156B76B95FC0AA1E457C83055FD75EBE363F9B51FD1F975AB81247ABB42A9BF423FE457C83055FD557EED9FFC5A67752856C9AF104A7E850CEAAFFB5FDE925F9345E7D74BEE23F557E887FC0A19A6AABF563C7C407E4DF696FC7A8148B73A14ABE4570825BF4286A9EAAFAB1BBBFFF001F93559747E5DFDABD1239DFA2BF4437E850CEAAFF26B57E4D73AAB43B14A7E8550F22B6498AAFEBABA51F26B57DE925F3F079FDBEAAFD00FF915324C557FDDDA28F9B51FF26B9DD58D5A25BF4228F91532A8BFCAAF5D915F2BA8BF423FE457C8A0FE2ABF76457EADB3BA51ABE4570825BF4206CF1F905FBBE2FB5B15D45FA11FF22B64F0FC81D56C24BFBE4B747E5D7D7FCF1F005A915F2183FAABFCDA15F9B582FA2BF4437E850C53D55FB7B28BFCDA8FE8FCBA750F13BD5DD156876295FC0AA1E457C83055FD75351B7DBE4A3CAB7F22BF0689CEAFAB7F32FA3E527F857EC8AF9061AAFAEBD6657EFF2B5CE57F22BF9E179A5F772640F476455BDDAE55F22B84925F21C354F5D78FAA476895FF89FC7ADE5BF26BF44645537F857EC8AF9061AAFAEB47D557B8B686427E8D109A5FAFFAF0810FF557E886FC0A1966ABBF56B4C0AEBE5E7E0D129A5F575F7F811DA4FE0AFD905F21C36CF5D78A16D8F2D7CBAFE7C5E5D70B37BF7EA8BF4237E457C8305BFDF563E34ABFD342B0FA7AF935485C7EDD9AEAD15B9440FD15FA21BF4286D9EAAF1FC75B08B686427E8D10945FB75E7C99BDB3BA75ABE4570825BF428609EBAF3B51467E7DBBA0FCBA35CFAF714BA6FE0AFD905F21C384F5D78FEDAD5E4DA5E5AF945FCF8BC8AF5BAFBC52925BDDC0CB6F3574487E850C13D65F3FB65B08567F4B76F595F26B9088FC7AEDE2EB87FA2BF4447E850C73D65F3FB637FC6B54DA1A0AF93542F3FCBA73AF12BD2D9956B771860D87DEC8AF9061CEFAEBC76EC9EA299B96BC467E6DA56D7EDD0AAFCB1E8CDE9634EAAFD00FF915324C5B7FFDD8DDF6C778FAF205F26B430DF3EB4EAABB5E86DBDAD219B61DBA22BF428669EBAF1FAFAA56F7CCB4FA5FE5D720ADF2EB4EE575D97DD11B9249FD15FA21BF428699EBAF1FDB5FE4BA5FE9B79281FC1AE47C7EBDFDFBFD597DC93DB2B3BD4FE4570825BF428699EBAF8BFD08BB457E0D723EBFEEBBE4EE507F857EC8AF9061F2FAEBE2D020DC87427E8D109A5F2F1CDD0C0274427E850CEAAF8BA311567E0D12975F2F9CDBD45FA11FF22B64507FBD3B3A14F26B84A0FC7AF9D06628A013F22B64507F7D54DE0B2BBF0689C8AF97DF05A23CF4437E850CEAAF4F5E7E7BFD3E145F13D5EA1FCAAF87ACE6D79F6BBFEB5B72B3B13C41227A9D7BF072281EC7247A656066F22B64507F5DF532C57E4D543B8F738A5EDB2B297F60D9CB1D34CFC8ABBF423FE457C8A0FEBAE3B6BD3F7EFB756B889684B424D79D5AA0FC7AC84E14BB0DF27DC07776CAF2B2E8F5ECCDD6A0AD0E51F4CAC0CCE457C8A0FE5AA27C889EC80A158E3E0BE251F4BAF549FD15FA21BF4206F5D71275BF7130F3889D71F4C1587733B71A978F92FC0AA1E457C8A0FE5AA8A228E89B5BD52A6E18668E65EAAFD00FF91532A8BF163A5A1494124E3A7AC33079A9DBCC844EC8AF9041FDB55C79841511CE2B7C90D962F2F0AAFE0AFD905F2183FAEB2125A14ADB40432F1B09A67A4ED68E92E3F73E62D12B0333935F2183FA6B85AD142B4B45D82A2E1AED3BF557E887FC0A19D45FEB6C2586E8E5CEC96C7CA9FC28965F2194FC0A19D45FEB6CE557A1AA3943FD92FA2BF4437E850CEAAFD50C510EA5EE12E547B1FC0AA1E457C8A0FE5A6D75E87C79ABB9D5AF7009618FD45FA11FF22B64507FAD26BFE6905F4B941FC5860E42C9AF9041FDB59A5C95C37DC24BEAAFD00FF91532A8BF56F3BDA2045B832CBF3E293F8AE5570825BF4206F5D76AF26B025FDE2AA1FE0AFD905F2183FAEB19ABA3A434D890268D42E547B1D18350F22B64507F3D43BA8AA6F9B584FA2BF4437E850CEAAF676821086578CB951FC5F22B84925F2183FAEB19BE5D146AB5BC6D1E7EA5FE0AFD905F2183FAEB49AB03282234616CCB951FC5061042C9AF9041FDF5A4AD1AA1AC7F92DA7639F557E887FC0A19D45F4F12B382681E38A4FC28965F2194FC0A19D45FCFDB1AC3E8E55E9BEC554EFD15FA21BF4206F5D7F3B62A854AB0D50CE951E547B1FC0AA1E457C8A0FEDA84A0D09692F621EAAFD00FF91532A8BF36E15B5C0D6929AE507E14CBAF104A7E850CEAAF4D6C452E59A182E2EB51EAAFD00FF91532A8BFB6B2359206ED109DAF75CA8F62F91542C9AF9041FDB51525D826DC0654507F857EC8AF9041FDB5A1ADC1543B2CA4F85AADFC28965F2194FC0A19D45F1BDA2983452FFA1AB646CF8DD33EF557E887FC0A19D45FDBDA1A4FA1E125D5EB33CA8F62531142C9AF9041FDB5B9ADD193C3766C750E987525D45FA11FF22B64507F6D4E143B6A277E09FD85CA8F62F91542C9AF9041FD35822E82430CD749EAAFD00FF91532A8BF4650502CB753AE36DFCA951FC5F22B84925F2183FA6B10B1ACC4CE2809FAE5D45FA11FF22B64507F8DB333B646F2633775C95847951FC5C61642C9AF9041FD35CE7E556CF2086B701A527F857EC8AF9041FD35D4CEE7E3B7919F763C6F1BBE33F1740E54283F8AE5570825BF4206F5D76822EC13E1B539F557E887FC0A19D45F13EC0CF28461C26844283F8A0D3284925F2183FA6B0EA1EDE355E555AEAAA6FE0AFD905F2183FA6B8EFD84314323C17E7835BB4E2A3F8AE5570825BF4206F5D7342F8B64170E70336F7B02F557E887FC0A19D45F33BDCC1997FCF6D2CE37D83EE77E0E43438587F032E0D12B0333935F2183FA6BB29711F662F1627F8209AF4DA8BF423FE457C8A0FE9AAF24C25E60A85F36BC9A510D951CBFF7D915BD323033F91532A8BFBE4549C16CE85E82FD9E814F29AA29F557E887FC0A19D45FDFA5A43C396221B670BBA257633625C7AFC18704F22B64507F7DAF92F11F25C59624D74FBFB01540FD15FA21BF4206F5D7B77BF951FBE2F6B26EC7FFB662855B610A052919FC85FC0AA1E457C8A0FEDA83F2FA596FB5D8C29A6B876B7E25EAAFD00FF91532A8BFF6A37C5FDC5EF9F64FE16F2B50BEC27A06A215EE8865F244AF0CCC4C7E850CEAAF5D3954485BB248F24D4579C1F55D6B3821F557E887FC0A19D45F7B53DE4BFA68E98E0DDA41CB3BD7AD55C4FAF055F94E915F2194FC0A19D45FFB74B4CCF9984E6EA9F1FC97BD96C07AA849E091E49A49FD15FA21BF4206F5D79E55A7D8BBDB9FDF13ED126AEF95DABBFB7F5DD2EAF9259A27F90EEDA0E8958199C9AF9041FDB57FE7536C0EC9F55DD45FA11FF22B64507F1D455D076A8E9E9F4D3B89F29D25BF4228F91532A8BF8EA5AB14BB742648AE6FA7FE0AFD905F2183FAEBA0DE1864C5D60E1DDA7DD12B0333935F2183FAEBE896209BD020DBE4B10644507F857EC8AF9041FDF54A4E3EF4EA49AB477191E0D06E8D5E199899FC0A19D45F2FECF1F158CB83B19E1E8F75FF378F0FD8925687A3FE0AFD905F2183FA2B5C80FC0A9D905F2183FA2B8C4EFD15FA21BF428643F9D58F8242870E3D89427E8550F22B64A8F8A28F2E02E844C56FB3C9AF104A7E850C755F54FFE99742E1ADAA7F55587E8550F22B6438F3A025ED04F016677EBA427E8550F22B6438FFA0502916D29CFFD135F91542C9AF90A1D583EEB51340A8EA8681AF476BF4AAC2CCE457C8D0E48A78BF2E4AB1D05CABE47A3F4EA357186626BF428686D7C585760268E87CC3C013F91542C9AF90A1797E5D2E90522C9CD43CB9DE0FCFE8358799C9AF90A1ED47934F9749ED0450C15109E3925F214FDCF5F2C76FBFBA5E42A1DBC112577675244202F915B2055D383F35C5420107205C80FC0A6FA0FC03F97C00029721BFC2DB68BF831C8E35B818F915DEECC76FBFC6D584A2571EFAE7B30EB81EF915BA107789956299965657B82AF9157AE1234E6825B4D5357AE58197E457E88B140B6738826006F22BF4C8E79E5041AB2B4C427E857E698A85426EF9602AF22B74CD87A1B0CF535D6142F22B0CC0151A56B9BB8339C9AF300C9F90C29DC3016626BFC248E27E78F646C18921F8C90F407E85F1688A654E663EB0905F61549ED0CE3CE23E79905C6144F22B8C4D1720976792034FE457189ED21457E543066095FC0A17A135902B319F811DF22B5C8AAF6673011EB201EC935FE182FCF02C83D2EA0A94905FE1B27CFCCA40FCC81C504E7E852B9309E89F5657E028F915AECF67B2744BAF0B50417E855978C6165DF15D43A09AFC0A13F1412D3D300F8193E457988EA658DEC8E700C079F22B4C4A532CC94C39A015F915A6A61846023F030BB425BFC2EC342312C7EC0222C8AFC0EF54C8684E751F0822BF027FA14391264C242094FC0AFC03DFBFFFA26C4635857C2081FC0AACD0B6C851E60C90467E0536F985240AA9D90399E457E005BF50CF8E5BBE8C981E9F6E72806DF22BF09A8F86F9CA0FB901EF22BF02A5A45816BEE407BC97FC0A1CE3D14893330180B7935F811A712146F9AD5B9E8D0574427E052A692798877D0D74457E054E5193BB3CADAE406FE457A0013D919764B7027D925F8136E2BE93FEA929369DB23AD033F9156849A3E4E8EC41A07FF22BD09ECF9D07A5820E0C417E054284B61348B1CDD959C040E45720900FA3FBE7676081E1C8AF40B85B8E91623BE467608141C9AF40129F5077252EB9DA1D4034F915C8135AF0139B0A793616303AF915C8A629F65D8C3C700DF22BF01EDA09926975052E437E05DE498A4D6090818B915F8137F3A1761CADAEC025C9AF4017A4D8B68C277061F22BD0119F7437A1D515B836F915E88E676C55730300CC407E057AE4E3EFA3B4BA02F3905F817E49B125FC0C2C301BF915E89DCFC47748AEC084E45760007E78F6ABDB6A6B1800E624BF02C3D04EB0086D75557605FA27BF028399F98B4A5A5D013EE45760501336C5EA030658C8AFC0A8E629467A3616C023F91518DBB59B62B5FC027C25BF025770C92FE36B75055825BF02D771990E51ADAE003BE457E06A86FEC05DAB2BC04BF22B704123B68D6A75052824BF029735D0A7F071AB2AB902D723BF0217D7F90FCFFA195880A3E457E0FAFAFC68DECFC002D4915F81597495173D1B0BA09AFC0ACCE5ED4DB19DF73300F44F7E0566F496F2A76763013421BF0293CA6C8AF56C2C8086E457606A093551ADAE006DC9AF00814DB141340C0033935F01FE6C88142BB902C8AF007F11D74E709E86018085FC0AF0ACB7142BB9023C925F01D675D24EA06100E089FC0AB0E9FBF75FDE986225578055F22BC00BF9ED041A060076C8AF00457EFCF66B428A955C015E925F010E086D27D0300050427E053826A29DE0965C955D010AC9AF00355AA5580D030047C9AF00F54EB613681800A820BF029C5591622557806AF22B4003E5ED041A06004E925F019AD94FB1922B4013F22B4063ABED041A06005A915F01DA7BFCE159C915A02DF91520CA2DC56A1800684E7E05006024F22B000023915F01001889FC0A00C048E45700004622BF02003012F915008091C8AF00008C447E05006024F22B000023915F01001889FC0A00C0489E32EBA3968B01008026E45700004622BF02003012F915008091C8AF00008C447E05006024F22B000023D9CBAF7FF36DE4FFFDCDB77FF7ED3F7CFB2FDFFECDB7FFF6ED3F7DFBEFAFFFE0E97FFFECDB5FFFFD08FCE3DBFFBB8DD2FF7DF5FADFFFF7FBEBFFC99FFFF9AF6ECBFFAFDFFEE3B77FF5ED5F7EFBB7DFFEFDB7FFF1ED3F7FFB9FB7FF7FE9FFFEF9B7BFFEABDF97FBFBFB952EFF7FFFD36FDFFED1BFFE7FECDD059415E5FF3F70FE844D372A2A2A20228A01A858082A4A1AA008582016697777177617D8D88A6277077661A2D8A26BFB7FF9BBE7B7670FDC3B7BEFDC99BB177E0FE7FD3A47BFEC9DE79999273E33EEEEB7F5FFFC73D5F6FB6A7D74ADB1FFD38FB179F6A1ADF3FFAFDDFFFD53FD27B45D2B73BD92FA5368FB55FFFCBFFAB56AD5A60E75A9C7222CCA622CCE122CC952D4A7010D6944639AD0946634A7052D69456BDAB034CBB02C6D598EE5598176ACC84AAC4C7B3AD09155E8C4AA746635BAB03A6BD09535598BB559876E74A707EBB21EEBD3930DD8908DD8984DE8C5A6F4A60F9BB1395BD0972DD98A7EF467000319C460B6661BB6653B863094EDD98161ECC8704630929DD8995DD895DD18C56876670C7BB0277BB137FB3096718C67021399C4BEECC7FE1CC0811CC4C11CC2A11CC6E11CC1911CC5D11CC3B11CC7F19CC0899CC4C99CC2A99CC6E99CC1999CC5D99CC3B99CC7F94CE6022EE4222EE6122EE5322EE70AAEE42AAEE61AAEE53AAEE706A630951BB9899BB9855BB98DDB99C61DDCC95DDCCD3DDCCB7DDCCF034CE7411E62060FF3088FF2188FF3044FF2144FF30CCFF21CCFF3022FF2122FF30AAFF21AAFF306337993B7789B777897F7789F0FF8908FF898597CC2A77CC6E77CC197CCE62BBE660EDFF02DDFF13D3FF0233FF13373F9855FA9E0377EE70FFEE42FFEE61FFEA55603F39FDAD4A12EF5588445598CC5598225598AFA34A0218D684C139AD28CE6B4A025AD684D1B96661996A52DCBB13C2BD08E15598995694F073AB20A9D5895CEAC461756670DBAB2266BB136EBD08DEEF4605DD6637D7AB2011BB2111BB309BDD894DEF4613336670BFAB2255BD18FFE0C60208318CCD66CC3B66CC71086B23D3B308C1D19CE0846B2133BB30BBBB21BA318CDEE8C610FF6642FF6661FC6328EF14C602293D897FDD89F033890833898433894C3389C233892A3389A633896E3389E133891933899533895D3389D333893B3389B733897F3389FC95CC0855CC4C55CC2A55CC6E55CC1955CC5D55CC3B55CC7F5DCC014A67223377133B7702BB7713BD3B8833BB98BBBB9877BB98FFB7980E93CC843CCE0611EE1511EE3719EE0499EE2699EE1599EE3795EE0455EE2655EE1555EE375DE60266FF2166FF30EEFF21EEFF3011FF2111F338B4FF894CFF89C2FF892D97CC5D7CCE11BBEE53BBEE7077EE4277E662EBFF02B15FCC6EFFCC19FFCC5DFFCC3BFD46A68FE539B3AD4A51E8BB0288BB1384BB0244B519F0634A4118D6942539AD19C16B4A415AD69C3D22CC3B2B46539966705DAB1222BB132EDE9404756A113ABD299D5E8C2EAAC4157D6642DD6661DBAD19D1EACCB7AAC4F4F36604336626336A1179BD29B3E6CC6E66C415FB6642BFAD19F010C641083D99A6DD896ED18C250B6670786B123C319C148766267766157766314A3D99D31ECC19EECC5DEECC358C6319E094C6412FBB21FFB730007721007730887721887730447721447730CC7721CC7730227721227730AA7721AA7730667721667730EE7721EE733990BB8908BB8984BB894CBB89C2BB892ABB89A6BB896EBB89E1B98C2546EE4266EE6166EE5366E671A777027777137F7702FF7713F0F309D077988193CCC233CCA633CCE133CC9533CCD333CCB733CCF0BBCC84BBCCC2BBCCA6BBCCE1BCCE44DDEE26DDEE15DDEE37D3EE0433EE26366F1099FF2199FF3055F329BAFF89A397CC3B77CC7F7FCC08FFCC4CFCCE5177EA582DFF89D3FF893BFF89B7FF8975A8DCC7F6A5387BAD46311166531166709966429EAD3808634A2314D684A339AD38296B4A2356D589A655896B62CC7F2AC403B56642556A63D1DE8C82A7462553AB31A5D589D35E8CA9AACC5DAAC4337BAD38375598FF5E9C9066CC8466CCC26F462537AD387CDD89C2DE8CB966C453FFA3380810C62305BB30DDBB21D4318CAF6ECC0307664382318C94EECCC2EECCA6E8C6234BB33863DD893BDD89B7D18CB38C63381894C625FF6637F0EE0400EE2600EE1500EE3708EE0488EE2688EE1588EE3784EE0444EE2644EE1544EE374CEE04CCEE26CCEE15CCEE37C26730117721117730997721997730557721557730DD7721DD773035398CA8DDCC4CDDCC2ADDCC6ED4CE30EEEE42EEEE61EEEE53EEEE701A6F3200F318387798447798CC7798227798AA7798667798EE7798117798997798557798DD7798399BCC95BBCCD3BBCCB7BBCCF077CC8477CCC2C3EE1533EE373BEE04B66F3155F33876FF896EFF89E1FF8919FF899B9FCC2AF54F01BBFF3077FF2177FF30FFF52ABB1F94F6DEA50977A2CC2A22CC6E22CC1922C457D1AD0904634A6094D6946735AD09256B4A60D4BB30CCBD296E5589E1568C78AACC4CAB4A7031D59854EAC4A6756A30BABB3065D5993B5589B75E846777AB02EEBB13E3DD9800DD9888DD9845E6C4A6FFAB0199BB3057DD992ADE8477F063090410C666BB6615BB6630843D99E1D18C68E0C670423D9899DD9855DD98D518C6677C6B0077BB2177BB30F6319C77826309149ECCB7EECCF011CC8411CCC211CCA611CCE111CC9511CCD311CCB711CCF099CC8499CCC299CCA699CCE199CC9599CCD399CCB799CCF642EE0422EE2622EE1522EE372AEE04AAEE26AAEE15AAEE37A6E600A53B9919BB8995BB895DBB89D69DCC19DDCC5DDDCC3BDDCC7FD3CC0741EE42166F0308FF0288FF1384FF0244FF134CFF02CCFF13C2FF0222FF132AFF02AAFF13A6F309337798BB7798777798FF7F9800FF9888F99C5277CCA677CCE177CC96CBEE26BE6F00DDFF21DDFF3033FF2133F33975FF8950A7EE377FEE04FFEE26FFEE15F6A3531FFA94D1DEA528F455894C5589C255892A5A84F031AD288C634A129CD684E0B5AD28AD6B46169966159DAB21CCBB302ED5891955899F674A023ABD08955E9CC6A746175D6A02B6BB2166BB30EDDE84E0FD6653DD6A7271BB0211BB1319BD08B4DE94D1F366373B6A02F5BB215FDE8CF00063288C16CCD366CCB760C6128DBB303C3D891E18C60243BB133BBB02BBB318AD1ECCE18F6604FF6626FF6612CE318CF042632897DD98FFD398003398883398443398CC3398223398AA3398663398EE3398113398993398553398DD3398333398BB3398773398FF399CC055CC8455CCC255CCA655CCE155CC9555CCD355CCB755CCF0D4C612A37721337730BB7721BB7338D3BB893BBB89B7BB897FBB89F0798CE833CC40C1EE6111EE5311EE7099EE4299EE6199EE5399EE7055EE4255EE6155EE5355EE70D66F2266FF136EFF02EEFF13E1FF0211FF131B3F8844FF98CCFF9822F99CD577CCD1CBEE15BBEE37B7EE0477EE267E6F20BBF52C16FFCCE1FFCC95FFCCD3FFC4BADA6E63FB5A9435DEAB1088BB2188BB3044BB214F56940431AD1982634A519CD69414B5AD19A362CCD322C4B5B96637956A01D2BB2122BD39E0E7464153AB12A9D598D2EACCE1A74654DD6626DD6A11BDDE9C1BAACC7FAF464033664233666137AB129BDE9C3666CCE16F4654BB6A21FFD19C040063198ADD9866DD98E210C657B7660183B329C118C642776661776653746319ADD19C31EECC95EECCD3E8C651CE399C04426B12FFBB13F077020077130877028877138477024477134C7702CC7713C277022277132A7702AA7713A677026677136E7702EE7713E93B9800BB9888BB9844BB98CCBB9822BB98AABB9866BB98EEBB981294CE5466EE2666EE1566EE376A6710777721777730FF7721FF7F300D379908798C1C33CC2A33CC6E33CC1933CC5D33CC3B33CC7F3BCC08BBCC4CBBCC2ABBCC6EBBCC14CDEE42DDEE61DDEE53DDEE7033EE4233E66169FF0299FF1395FF025B3F98AAF99C3377CCB777CCF0FFCC84FFCCC5C7EE1572AF88DDFF9833FF98BBFF9877FA9D5CCFCA73675A84B3D16615116637196604996A23E0D6848231AD384A634A3392D68492B5AD386A559866569CB722CCF0AB46345566265DAD3818EAC422756A533ABD185D55983AEACC95AACCD3A74A33B3D5897F5589F9E6CC0866CC4C66C422F36A5377DD88CCDD982BE6CC956F4A33F0318C82006B335DBB02DDB3184A16CCF0E0C634786338291ECC4CEECC2AEECC62846B33B63D8833DD98BBDD987B18C633C1398C824F6653FF6E7000EE4200EE6100EE5300EE7088EE4288EE6188EE5388EE7044EE4244EE6144EE5344EE70CCEE42CCEE61CCEE53CCE6732177021177131977029977139577025577135D7702DD7713D373085A9DCC84DDCCC2DDCCA6DDCCE34EEE04EEEE26EEEE15EEEE37E1E603A0FF210337898477894C7789C277892A7789A677896E7789E177891977899577895D7789D3798C99BBCC5DBBCC3BBBCC7FB7CC0877CC4C7CCE2133EE5333EE70BBE64365FF13573F8866FF98EEFF9811FF9899F99CB2FFC4A05BFF13B7FF0277FF137FFF02FB59A9BFFD4A60E75A9C7222CCA622CCE122CC952D4A7010D6944639AD0946634A7052D69456BDAB034CBB02C6D598EE5598176ACC84AAC4C7B3AD09155E8C4AA746635BAB03A6BD09535598BB559876E74A707EBB21EEBD3930DD8908DD8984DE8C5A6F4A60F9BB1395BD0972DD98A7EF467000319C460B6661BB6653B863094EDD98161ECC8704630929DD8995DD895DD18C56876670C7BB0277BB137FB3096718C67021399C4BEECC7FE1CC0811CC4C11CC2A11CC6E11CC1911CC5D11CC3B11CC7F19CC0899CC4C99CC2A99CC6E99CC1999CC5D99CC3B99CC7F94CE6022EE4222EE6122EE5322EE70AAEE42AAEE61AAEE53AAEE706A630951BB9899BB9855BB98DDB99C61DDCC95DDCCD3DDCCB7DDCCF034CE7411E62060FF3088FF2188FF3044FF2144FF30CCFF21CCFF3022FF2122FF30AAFF21AAFF306337993B7789B777897F7789F0FF8908FF898597CC2A77CC6E77CC197CCE62BBE660EDFF02DDFF13D3FF0233FF13373F9855FA9E0377EE70FFEE42FFEE61FFEA5560BF39FDAD4A12EF5588445598CC5598225598AFA34A0218D684C139AD28CE6B4A025AD684D1B96661996A52DCBB13C2BD08E15598995694F073AB20A9D5895CEAC461756670DBAB2266BB136EBD08DEEF4605DD6637D7AB2011BB2111BB309BDD894DEF4613336670BFAB2255BD18FFE0C60208318CCD66CC3B66CC71086B23D3B308C1D19CE0846B2133BB30BBBB21BA318CDEE8C610FF6642FF6661FC6328EF14C602293D897FDD89F033890833898433894C3389C233892A3389A633896E3389E133891933899533895D3389D333893B3389B733897F3389FC95CC0855CC4C55CC2A55CC6E55CC1955CC5D55CC3B55CC7F5DCC014A67223377133B7702BB7713BD3B8833BB98BBBB9877BB98FFB7980E93CC843CCE0611EE1511EE3719EE0499EE2699EE1599EE3795EE0455EE2655EE1555EE375DE60266FF2166FF30EEFF21EEFF3011FF2111F338B4FF894CFF89C2FF892D97CC5D7CCE11BBEE53BBEE7077EE4277E662EBFF02B15FCC6EFFCC19FFCC5DFFCC3BFD46A69FE539B3AD4A51E8BB0288BB1384BB0244B519F0634A4118D6942539AD19C16B4A415AD69C3D22CC3B2B46539966705DAB1222BB132EDE9404756A113ABD299D5E8C2EAAC4157D6642DD6661DBAD19D1EACCB7AAC4F4F36604336626336A1179BD29B3E6CC6E66C415FB6642BFAD19F010C641083D99A6DD896ED18C250B6670786B123C319C148766267766157766314A3D99D31ECC19EECC5DEECC358C6319E094C6412FBB21FFB730007721007730887721887730447721447730CC7721CC7730227721227730AA7721AA7730667721667730EE7721EE733990BB8908BB8984BB894CBB89C2BB892ABB89A6BB896EBB89E1B98C2546EE4266EE6166EE5366E671A777027777137F7702FF7713F0F309D077988193CCC233CCA633CCE133CC9533CCD333CCB733CCF0BBCC84BBCCC2BBCCA6BBCCE1BCCE44DDEE26DDEE15DDEE37D3EE0433EE26366F1099FF2199FF3055F329BAFF89A397CC3B77CC7F7FCC08FFCC4CFCCE5177EA582DFF89D3FF893BFF89B7FF8975AADCC7F6A5387BAD46311166531166709966429EAD3808634A2314D684A339AD38296B4A2356D589A655896B62CC7F2AC403B56642556A63D1DE8C82A7462553AB31A5D589D35E8CA9AACC5DAAC4337BAD38375598FF5E9C9066CC8466CCC26F462537AD387CDD89C2DE8CB966C453FFA3380810C62305BB30DDBB21D4318CAF6ECC0307664382318C94EECCC2EECCA6E8C6234BB33863DD893BDD89B7D18CB38C63381894C625FF6637F0EE0400EE2600EE1500EE3708EE0488EE2688EE1588EE3784EE0444EE2644EE1544EE374CEE04CCEE26CCEE15CCEE37C26730117721117730997721997730557721557730DD7721DD773035398CA8DDCC4CDDCC2ADDCC6ED4CE30EEEE42EEEE61EEEE53EEEE701A6F3200F318387798447798CC7798227798AA7798667798EE7798117798997798557798DD7798399BCC95BBCCD3BBCCB7BBCCF077CC8477CCC2C3EE1533EE373BEE04B66F3155F33876FF896EFF89E1FF8919FF899B9FCC2AF54F01BBFF3077FF2177FF30FFF52ABB5F94F6DEA50977A2CC2A22CC6E22CC1922C457D1AD0904634A6094D6946735AD09256B4A60D4BB30CCBD296E5589E1568C78AACC4CAB4A7031D59854EAC4A6756A30BABB3065D5993B5589B75E846777AB02EEBB13E3DF9EFC73E3664233666137AB129BDE9C3666CCE16F4654BB6A21FFD19C040063198ADD9866DD98E210C657B7660183B329C118C642776661776653746319ADD19C31EECC95EECCD3E8C651CE399C04426B12FFBF14FD51F06C9E3CF7F17A457FF5FFFBB34FE74A323E7D7D1F3DAFFFD74CC7FC3C44CF1F7FF7D77EC7FFEF74F523F5B151212121212121212129254FEADF273FB55FF59926F2C242424242424242424A4C884FA35242424242424242464414AA85F43424242424242424216A484FA35242424242424242464414AA85F43424242424242424216A484FA35242424242424242464414AA85F43424242424242424216A484FA35242424242424242464414AA85F43424242424242424216A484FA35242424242424242464414AA85F43424242424242424216A484FA35994C9F3E79E61B3364CE9C595251313793CCBF66FECAD7A4DD8D9090909090909090853EA17E2D36999AB5B2608D4EA6964DBB4B21212121212121210B7142FD1A3F2AD13CCBD6F913AAD890909090909090907809F56B9C1453B95666CE9C59E13B0A42424242424242420A4DA85F0B4EFEDF2D904F42091B12121212121212525042FD5A58922D5E2BC25BD890909090909090900213EAD7C292C8770ECC5FC2A6DDED90909090909090908526A17E2D38B95EC1667EB7C0F4E993E7799F9AF9D55AD12F6EC32BD890909090909090903C13EAD78233FF2BD83C7FB7ABAF09AF6043424242424242428A4CA85FE3A4F2656AA1DFBD1A51C28657B02121212121212121F924D4AF71922943E3FD0ED75C256CF88DB02121212121212121F924D4AF3153CCEBD250BF8684848484848484C44EA85F6B20597F962B7C0B6C48484848484848483E2945FD5AF903F855BF6D34F3D3FA79FEE4D34296ACBF846B41A95F33772DEBDDACA95B1931C012E952C4F18B3F789967FEDB5D26373DA4F86406F63CBF1D65A15F9C6B643F0AF368214ED57954E2FB5BE27633BF5E296BA3997F2DF1D2516CFD5AF592559E46E5DF3A87792E6BD6CC29EE77F847FC5054FE29FE72E75F45CD2CBC7ECD758E05753B46BB553B90F5E3F32791F3CD33F974A998D195CF009EBF8A2DF47CAB3D856A337F1F8A4C9E33B732454EE19225C65A91C8BA9CC8FC4D30F3D4ACD1A7BF00955659FB5FF9B7A5D98FAA26D57994FF617325F175A33211679D54A3E5B0EFE73F8F32496A6895787DAEAC6DF26F3193B40BD9E4EBD7CAD19967B95399D8054D8D8FE37C0653D5015456F5ABC4FE6044AA9E4E1AF56B8C091CA389FC8F5FF5462CD0F56BA117B66ACABFD64964ADA8287C5D2E9FFA35DEFD5D50AAD8AC772AF35725DB8F3229C13C8A77F0AA49AF7E8D3EBB449A88B12BCD9FD8A3BA98D68B994DA55C9F6397AD45B69B7FD27AFF1AEF9CE39D67CDD6AF059D6966BD28ABFAB5DAD5A498899AE95EE2F56BBC2E1534BA620CAAD8CF278536347F92DA8712D912D2DB148B4F52F56BE599E639A2CAA47E2DF2FE967F093B7F9F4BBF1FCD2ED53C2A4113F152EDE92732906A6ADF2FA682AC9A1817BF64EB73A6722DBEADAA4963F548E5FD6B8957C99A7A0E8B377F22AE4F8CB6D2AE5F8B5F2372CD84D8F56B315DCA7F438A77FC887ABD22F7FD8DD756D514FF4A23A94539A9FEA49464EBD74CF2DC0FB27EB69415E142FF7032BB0CF6A352CEA3B48F1F3BD55E814446518DD4AFC92E20F95FFF528EABC42BD7CA24BE7A245FBF169F4227D542308E2BCAF5FD6B520F9A85B69B2BC55FF67CDA8D3D8133072FF47CE3B5553545AE0BC92E8E99C47E77956AD2A85F2BF2B8FE355EBF26B82795E16DAD4C52E7583535556454B69EEB82177FF0349E46F2996289D4CDA5DFF7D328ECF259274B39AE525A212B93ECEA518EF56B4581F3AAF4E3388D7B5C53F56B45EEF782A90EE5784B5869DEB51779F005AB7E4D6371AC28D757B0E90DE9E84155B3F56BE2675DB6256CB2A759993C5FB197781E157FF034EAD73C97E8E2875089FFBB6B4A4B47B5EB64E9C7557AEF5FA3DB8D9152D4AF73E6FB19FCE9FFF35B18A2EF4A89075641D3A9F4FB7D7AF56B44BB11A799797A9BA7F54CE996E7C589318E236EF43C632CBA27D14D47CCDEF95B997F1867BEA6A0467335977F8AD987A257ABCA539EFF5E672E72AE0F96678993D22694498C764B7095AA3DE5AC8B73B5A322A5DE1699E833ADEC7C1AFB51E9E751447379268DFA35CFF5BFF8A61399CBF94FC06ACF2BD79E58E43A59FA71157D61332D46371ADDE70417BD74EBD7CC1D8DF878C4AA51FCF84EE9B0D53E9DCC736BAB1D4995896834D7902A682824555755DB68C46DCDA7DD5CC9750D6394E011A710A39579CE3757A3B93E9EEB98C51F24762B99E4395966CEF7A890C6BE9848E2CDA33CA770C45927327FE325A2DBD1B7297A1697E72D8EB83B1569EE47E5338F4AB36EE44AF475284D978AB905B9123DF7D3BBBF3535AEE63FDFF99FFAAA4D7AA55D6552AC5FF3EC65AE3B54FC237ED6CB9752599CE7C123A641F4F9964FFD9AFF058C9E7B31EE6FBCBAB0D06110AF956A4BF642CFB734154FAE3E17F37451FCCC4D2FC55FD57853B8A6EAD7883998E7444E70849420B94E36FFF38DB71F95CF3CAAC127A5D9B9B7985276298D7D3F6BFF33A756E85914747F6B6A5C551D4531CEB13229D5609549AB7E2DE8FAE6DA128A1CDF598F99DE7358FEEB63D69B5A53F56B458ECA2C911623B6CF183330EB71E23DC2A651B5275BAF1774B3E225F147C7CCD88EF7D9D224D57914719C9AAA2A7275B5A0DB54E8C9D660727535D5FDA8ACE65109D68D88646D7A668E6FE54A69ADC8D587D8078C31DFA393E7FDADD97195B96B45CEF1B4EF7B5AF56B9ECD6792D2E29E46ED9FEB79A8A0C316FA1E747639BD7F8DFDB859D0F9CE9F62AE40F1679DE7FD8DF7722E6B4A50F1E41ACC6558972495A4AE6A52254EDA973A6BA31509ADCF65F8AC92EAF9E6BA5965358F6A6AA445379DEBAFD2E846E2FB7E4DDDDF85607DCEDAFF72AF5F638C9534EE53527DAB4C52EB788C47E41AA95F935A08B2F6BC94F55CE6C4E7E4F856F7A45AC924EBC733C9F3089994E03D4AD6E317F98057E6496A77CF759C5C57AF46AA8A423B199105652B4DEA7C0B3AD9A41A4D2435F8FE35FA655BC9AE52B20DD5E0C35BC9AE581AC9F5D23DD95348A57E8DB1A8A5719E893F8715FAD2A5A0E394E1FBD75CE75BE8354CE43F22147305F2BF4AC55FE7B4DF3717749018C75F801EEE6324C1B3CE7A9CB2AA5F73ED1F310E9560299C6A92BAC8F99F6CB9CDA3B4D78D42DBADBC683176BD784976DFAFA991BF20AECFD3F3FB0544099E425AFFFFB10525A52192F83193DA0FCAAA7E8DE87FAE4633BD2DB2A42BC14BEB1829FE3AE73A4252E79BD4E4AFC1F734359804778582B6C91AD98DB2B618BB62C87AB4F2AF5FD3DE8FCA6D1EA5BD6E14DA6EE517946C0A646D25F640ADA9FB5BFEEB73A65ACD14ACD5D6AC299D4259D7AF458EECC4DFBF2675C0B2AA5FA3DBCD358B2A3F3BF37FFF8B7C444F12A95F4BB3FC25D24AAE6B95484F0A3A4844A2EF6CB249AACFC5E7FF4EFD9A788B0BC403CFFCDD4B7B3F2AB77994F6BA912BF9FC47B6AC1D4BFC1128D97D3F91CD2BA976534A41BDCA14ACB1DB4A76C52BB67ECD9C4FD5C4E85F4A8F8C598F59CC6C49EA803176829AAA5F737DAAF82CACEF5F6727F49E3EA54951EDF1D348221D4E24095675598F533EF56BE2E3A7F4A71023A5DF8FCA6D1EA5BD6E644D9E63A334B560D69E84FA3522F974A6989AB532C5545F59536CFD5A7C720DFD7C2E6B74127FFF9AD42D8931256AB07ECDF5C122B310BF7FCDE75544697A129144D6A33C93488713495257B5D0E39449FD5ACCBEBB40D4AFC5A7D0FDA8DCE6518DDCA63C5F2E94A66FC9EEFB892CE649B59B5222BA313DB9FFF7DAC48BD7D9355EBF462C16C59F6DE2874DEA8009D6AF05B59EE72A93AB03C9CEA885F8FD6B22A543DAEF514AF67C5F82B53EFF24B583163A1A4B5F55A4B1EF663D8534B6A59A4A8CFDA8DCE6518DBC7FCDBFC359BF32D921946C13C93E07665E64564D398FABA4FA90DE125193F56BF4D5297EBEFD5F78FF5A7CFD5AD054CC4CBFAC3D29340BF1FBD74496BC44EE784442FD5A35C5DFDF8AC85B5326F56B9183278D63964FE2ED47E5368FD25E37F26F31EB152BF4C12F46921DA5C9D6AFF3F72DD7A16A7C5C453CCBE579D899B1BE7BA7A0D44CFD5A6D1994C8644BFCC8494D8C187338D7602AB4FA2CF208959D297E7615DA6E0916BED929D73705F524D741922A074BB63E96557D53FCFD8DB86E110789B71954BEA189B113643D60A85FB3A698FDA8DCE651DAEB46FE2D66FDE2123CC81573F5E64FB2FBCEFCC7A9F1FA35D79529F438B157AA6252D2FA35CFBA27A99996F86A9BF580317A1BA38E8CD8FF8ADC7A8BB9DA991B9A59FD33C9D5C9E2DB0DEF5F2B53D071621C3FD9947239AB36F1EE6FE5388F7D9A495DEDFCB7875C1FCFE7B3B992F80252B349643F2AB77994F6BA317FB2B61531D292DA460B3A7EEC919FEB7AC63860D643A5F4FA33FF641D57D5CE8B1AA956E74F89EAD76A1F70ABBDA03192F5E0C5ACE0B96E6AA11D4EB67ECDFF8C6A6AFB49A4DD649F8373A57CEAD78815A4C82AA432C59F69D594E60615999476856A2F5AB2EDCEC9E3B72FC7EB6774169AFA35D9FD28D94B5DE43C2AC1BA914F7311A79FF64291F8B9673D6052EFAD224E3CEB1797665CE59A1D99B2B57C5E49A45BBFE6F9805BF5EA247869127FFF9A6B134AA43429E6293FCF76D37EF0CD9544B6BD5C5720467F62B452FAFA35FA8E27324D921D0F894FB7349278FD9AE7929546DD1C716D1319C6F36741AF5F53DA8FCA6A1E9560DDA89A5C854EC44772F530A9B522F18528D739167A310B1D273538AEB29E6F19CEF4B4EAD7821E702BAF4EB2B32B6B2B454E925C9D2FE8B0311E40A357A53C0756319F2D2689CCC3180FFA31925EFD5A91D0F7BFC6BB7A053511638E94E6EE149F04EBC882D6AB34EAD78ADC772AD4AFF324D5FDA8ACE65109D68DCAC4AE4493ADCCE649BC2E4524E292167F5F22CEBA06C75552EDA69DE4EBD7E9B17ED1521A97268D1742C50FE55CD7277AF656BBFF557B5E453EF5664E3CC6D54BEA693BD7710AED4FBC568AAF5F0B5D9DABBDE3893CEF25F26A21C6D25C5349AA8E2CF4CAA754BFE6EA49A85F2B539AFDA87CE65169D68D4C6257DBA93EEEA6B1EFE7BABF795ECC88B221FAE6D6D4B8CAFAF5F1AE6166022635E4E649C2F56BF4C35F8217259FA4D45C31E7127B1CE75A95AA8EEF88D62316B53C07D63CA75964B11EDDDBAC4975C9AB4CF9D4AF118B4EA19731A2F3D103B2DAB38E2E0E525AB38A49827564410338BDFA35D7B8CAFAC5693CBD9773FD5AB2FDA87CE65169D68D4C62BC88A93C72D64E26520CA471E4E881147DF06A0761BCCFA63AAE12D9B5A757F9769D94568924EBD7821E73E7E4FECDBD49258DE7B0D9790CC779CA3BFF5CF546465C90884623267CB5AD47379DCFE2986BDFCADCC4CC09CED3DB99D5FD07BB428B9B5C57A0A083C46EA5F4F56B444FE6FF1F6766FB51D0AA7721C65255D9EDE823477CB0A0F32D4D92AD23F37FAF106F5CE5B974645DD36234576D1219D8254B89F7A3329947255B3722B6A47CFA99EBACF3F96C8C2317BFEF177A7FF3B9B9990F16D96EBF69EDB2DEC1D991EFDAA2DB8D5E73B26EFA9976334D673DF122179FAC49AC7EAD76919DE7E40B3A78524D675A2FBEC58256C6FC13D162C4AA544C67F25C1C631F3F57A2EF42E2CD6592CFA88B5767CC935C0332D7D717741653A71C5CD080CF24E282275BD26552B6354D1A275B9A711571D3B35EEDAC5F994689569EF7BAF4FB51E9E75141874A7CDDC875B43C2F66911F8F3842A1279267D2B8BF15794C9F1A599F17944D2199FA359F9154FC036EAE1474AD13E943E9EF6EC4FE574C67F2592C62AC7AD526BAC5C49BCBA466EBD788FB1BE32C623CB4C438EBD849E3513B91C4B8BF992916FD2A258D76F33F48D6E3A4F1162AA5375B89A7A6F6A312CFA318874A70DDC8FAC5F9D728B9AE55FE37A5F4FB7E915BE19C6CBF223D9F2B5623EB731AFB7EE2FB4202F56BB517774E6ADFBD9B6707AA26A9352BF12115BB7E9D1D77A8E5B9D624FEB2B9DAC1906C73F9B73B7B41A85FA3FB1991E85348703C976DF13AFBFFB37777398E2B470246D7ED8DDC35D86B68A057D1BD00BF15D0AF03D4EBC8438F2C4B2495243342F973060703C3AE2E4924257E154A5197F7EFD613EDEDAB4A95E36AE70E14F6EBC511C8B9C79EECB3E7A3CCE7D1A1DF76FAEEADDE8DEBF5F9757909C147CEFB57AA6EEB6FE092DBFDC8EB73F584AD3E82ADD0AF3B0F32BA5C171F398E8FDEEEE33639DA373BB775DFBC472BF3D0AEA9781C97DC68ADDB3A71D3EDF7EBFD9E1C3DFC4ADE33BAF8B74ACEF3FD8AEBFB77EBB9107DBBFBBFE7F565EDC48BCCB99B6E6D8FB7703ECA791E1DFA9D755F37B61EE0F5D7C9F25FF2A9F3FE9569D1B9F9EBE223AFCF154FFDBF03BEF8A042BF6E6DD3B4BFCB0F6DE2BAF7EAE821B5DCFA895360C9C9A37C3B9C7B1DDFFAF3B1FA8D9EBE897D9FEDD7EF4AEB5F9FEEEDA13D52F2284EBF60B536875B5565FFAE6EF3FD875F31FE0A37FED62D1EBDB9BB8BB591E6E3E7A345C2F3E8D0AF7DFC87D75F37567FECE85F475B8768E1EFE9E8BC7F7F4457FA7591FFFAFC916E2E74B55F2F1E82F75FF2E7FF96863C2A7FC09FFA3BECF10EBCDDC18F8FE8C468A4F0FC57724F2E6E811F07BFC3667968870EDF43BFBCDC67FB7567FF5E7C14E5AF2F85BB7ED9C585BFF34FFC85442A8ADBBF69FD5A58CF5BB7787A679DF8AB3B5F0BE7A3C7DF13FA3C2AF9B577155F37B68E841387D6D61D28F9B7BD9CF71F6FFAF5E70F1D99F7DBCD7F7D2E3F5A9E6EFAC413A75C54BF5E3F1F94FF868F1FC7F7BBB11C55F7DDBCFCE7D75D18D7AF47EFC915CBAD3CDDD0FDB6AEDC5CC97E3CA1E4CEC41DCF3BFBF7D0A3D8B9E7AFBBE3BE23CE1DF6AF07D2D3EF0C7D6D8AF091FD5BEB7617AB6791D5FDBB7A8BA75F00577FDB89B36FA816CE47AF829E47AB8F74CBFE7D3BF4BAB17A049EDB44AB9BFABBEC286DF6BCBF6CC0D5DDFABAE9AE3C833EF2FA5C78DECF39355CEDD7ADE3AFF0E6777E4977A74642552C00A615D737FB2F7A158FDED5DFB37A7ADEBA9F276E74EBFEC765C139CE47308FA8F96BE1CD2FCA270A4CABCA9989C9F5DEAF873AF2CA70EB49C5915B28E7239847D4FCB5FC75CD5C8D128E13AEAB7214ADF64DCEFA81A3AFB7AB3FFC7DB0E7B6EE7C6B8B07BE9C8F602651F3D7F2BF562BBEC9F56AF925AFFF9FEE98BF72DDF53AD93A0E13FA75EB97EC3C0BCEDDDB275B37DAE06B69E3E7237238EF4FA2C2F5B3AEBCBA6DBD585C7FBDD87AC3CB2B51A7CC45B8EEE251B4F37AB55F4871DDFCBD1BA33BC95B98743B2FA425FF3CDFD6BDFDECF9881CCEFB5309BCFEEBDB2366E7C5E2FBF27AA3D3671ADA64FECA75273AF247C1F7C7EEFF8673B7FB78D33BB7FBF6979C0BDFE5D67BAC8136CF47E470DE9F4AECF76F7DAF5D48A2E464F06DFECA7F337FE5BA9D79E4156FDF8E0FBADD929BFE7A77A1A5D7D7E7B7D1DCE0CAD7BB36CF47E470DE9F4A857EFD3AFEE5A5252E1E6DFE0E1B8CF92BD70575E4DB17ABB87E2D799DAC7EEB8DA74083E7237238EF4FA54EBF46BC3A9BBFF2C8FC95EB225EA94ACE8B9FEAE6BBB78B10226EF4531A3C1F91C3797F2A75FAF5EBDAEBE3EABFB5FE9547E6AF5C57BD6C0A5F4C5A28AA2A09DB4B04B4763E2287F3FE54AAF5EBD7D9978C6535D2EB7F6FFECAA3AD0288BE5D4652B723CB5F49EADEEEE933F1C584EDEB95B3A9F311399CF7A752B35FBFDE7D6475F5C562F957D58F367F870D666B877A55A25C958EBCBDC41D3DEA6AF5EBD3678F4E38FA12BD38F1905BD0CEF9881CCEFB53A9DCAF8BDF051FE77C7C41347FE52DF357AE3BD191B75792E543EB57DAF1F4ED5EBFE955252FD1F7BBD1FB0B660BE7237238EF4F25A45F173FFEFFBA248BFBCB44F5D762008E5A5EA2EFAFD2F797E87B3447DF814CCE473098C07E050080EAF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B40941F3FFEBA89BE1580D9E8578010BF7FFDFCFEFE9F9BDB7F88BE2D80A9E85780CAEEE5FA48C502D4A25F01AAF9F1E3AF3F7FFEF91AAF8BDBFF643901C075FA15A082FD7255B10015E95780AB56170CECB39C00E034FD0A70DE897255B10017E9578033CA170CECB39C00E028FD0A704CAD727DF4FBD74F150B5048BF021C7071C1C0DB8A8DBEFF0003D0AF00456E71597DECFACA720280B7F42BC01B110B06F6A958801DFA1560D32D2243170CECB39C0060957E0558F7C1727DA462019EE8578067F90B06F6594E00F048BF02FC476BE5FA48C5022CF42BC0BF35B260609FE50400FA15A08F72BDFBF3E79F2A1698997E05A616B760E09E9841716C3901302DFD0A4C2AAE5C5FCB32F3B60086A75F81197D64269A30EB0598817E05E612B7D4B53022E3D259C50293D0AFC02C42C79F47DFC4B72816E034FD0A8CAFCDE5A74DF5344047F42B30B8C6DFAFBFFD128B62010ED1AFC0B03EBED4B585BB6A100B8C47BF0203EAF17A55AEB1055048BF02A3E9BA025D630BE02DFD0A8CA3A30503FB8679200011F42B3082213F05E51A5B00ABF42BD0B7B1978D5A140BF04ABF02BDBAE5D724134A8B62011EE957A04B13AE10B5281660A15F81CECC3C8C9C67E40CB043BF02DDB01874E18B6781C9E957A00F8D7F0D6C3E5F3C0B4C4BBF02ADB3EE7387E504C084F42BD02E0B064A58140BCC46BF022D52AE47B9C616300FFD0A34C78281D36C3A6006FA156888FCAAC27202606CFA156882050375D99EC0C0F42BF0614A2B8E45B1C090F42BF049160C2470E95C6030FA15F80CE59ACCA2586018FA15C866C1C0A7D8F2C018F42B9027F44AFBC6AE852C8A057AA75F8124160C34C51F1240BFF42B10CEDBD66DF2C5B340A7F42B1048B9B62F7439817D0444D0AF40140B063A6267011DD1AF407D62A853713BCE2016A848BF02355930D03B7B10689F7E05AA31BD1B866B6C012DD3AF4005160C0CC96E05DAA45F814B0CEAC6E61A5B4083F42B70928592F3B0AF81A6E857E00C4B5D2764D60E3442BF02C7581339390700F071FA1528E54D641616C5029FA55F81F7942BAF7CF12CF029FA1578C3FBC5EC707800F9F42BB0E916103EAF4309CB09804CFA155861C1004739668034FA15786696C669AEB10524D0AFC07F58CB48150E2420947E05FEC5D88CEA0CF28120FA156667D922711C5D4004FD0A5333212381E93E50977E854959A148B2B83F961C72301BFD0AD3F1B5497C8A2F9E05AAD0AF30118B116981E310B848BFC22CCCBD688A6F77034ED3AF303E4B5D699645B1C009FA154666A92BEDB39C00384ABFC2B034011DF1B716504EBFC2802C18A0530E5DA0847E85A1F84C0C0388AB58835818837E85415844C8481CCFC00EFD0ADD734D7846E58B678155FA15FA66BD20C37390034FF42BF4CA688A7978930178A45FA13F96063227473EB0D0AFD0191FCD66722EB201E857E886558070E7E90033D3AFD0015F4D04AB2C278039E957689A057FB0CF5F773021FD0AED8AFBC0B57748198CE5043015FD0A2D723286135C630B26A15FA12D160CC0159E413003FD0AAD70DE855A7CBB078C4DBF42132C1880EA3CAD6054FA153ECCC5D8219445B1301EFD0A1F63C100E4F05C83C1E857F80C33214816FA5E87E71D64D2AF90CD9A3CF8204F4018807E853CBE28085A707BB2780304BAA65F2183E577D01ACF4AE8977E850CAE30006D8A1BC446DF7398997E850CD5FB55B94245D52B56BF4228FD0A192AF6ABB7262142DDE504FA1542E957C850E5BCA85C215AAD8AD5AF104ABF4286EB67440B0620CDF5E504FA1542E957C870A55F952BE4BB788D2DFD0AA1F42B6438D7AF160CC0679D5E4EA05F21947E850C274E81CA151A71E28B67F52B84D2AF90E1D0C9CF820168D0A1E504FA1542E957C870A85FA3EF0C70C28F1F7FE95768847E850C87FAD5CA0168937E8546E857C860FE0ABD337F8576E857C860FE0A03D0AFD008FD0A19CC5FA177E6AFD00EFD0A19CC5F8777DB6BA745DF376AD1AFD008FD0A19CC5F8774FAE2F6AF6EBFC775D31A67FE0AEDD0AF90C1FC753015CBF5898A6D59F97ED4AF104ABF4206F3D7911C9AC39DE07B83DB64FE0AEDD0AF90C1FC7518D1F1BA503F6DB207A111FA153298BF0EA37C3F5E6421416BCC5FA11DFA153298BF8E2168CDEB1647426BCAF79D7E8550FA153298BF0E2067E5C02323D8A698BF423BF42B64307F1DC0AD26B74AE5B6CBFEF1F7BF9D73FBB75BBFB9DCED3E2C57E0BA73144538B447A2EF0CCC4CBF4206F3D701ACEEC4DB7F79BA5C9F2AB6FC0829B744AD96ADC2FC15DAA15F2183F9EB005677E2AD0EABF4EB4DE8E25ADF8F50C5A10D1E7D676066FA153298BF0E6075675D5939F0E4FA2A82122AF634F35768877E850CE6AF0358DD8915FB35F3E2062AF69CF22DAC5F21947E850CE6AF03E871FDEB8EE56367D11B6D24E6AFD00EFD0A19CC5F07D0F2F5074E33883DA47CC3EA5708A55F2183F9EB005ABEFEEBEDBE2D968B671D3ADE945621F35768877E850CE6AF63C85CA2FA7DF9485872B6E43E5B4B50A87CDFE95708A55F2183F9EB183247B015DFD9BFDDEDB747A0847DCBFC15DAA15F2183F9EB30721236A27EDEAEB2955C6F7D760F0277FA153298BF8E243A6143D367FF50545D3BCC5FA11DFA153298BF0EA6E41DF973122E08B03F8875F8ED28DF8FFA1542E957C860FE3AA48A15FB27F7FB5DF74789127695F92BB443BF4206F3D7E1DDAF607542F47D5BB553632E0ABBA5FC59AC5F21947E850CE6AF34686721813FA25E99BF423BF42B64307FA54D5B47A611ECAAF267B17E8550FA153298BFD2A69D9962F44D77C7FC15DAA15F2183F92BCDDA5A456004FBAAFC59AC5F21947E850CE6AFB44C8195307F8576E857C860FE4ACBB646B00EC527E5CF62FD0AA1F42B64307FA5655B93454B081E99BF423BF42B64307FA571AB87A27E7D52FE2CD6AF104ABF4206F3571AB7BA8440843D327F8576E857C860FE4AE3B6E22CFA76FB52FE2CD6AF104ABF4206F357DAB77A34FA6BEACEFC15DAA15F2183F92BED5B3D1A2D817D54FE2CD6AF104ABF4206F357DAB77A94EAD73BF35768877E850CE6AF57DC36C822FA8626B7FA112EFDFAA8FC59AC5F21947E850CE6AF27DC82F575BBDDFE9B5B5169D9085B47A9ADBD307F8576E857C860FE7AC86AB93E3117AC68EBFBB7EE6EBBC361F965FE0ACDD0AF90C1FCB55CF9944B225C57F2A7C2DDE4096BFE0AEDD0AF90C1FCB5D0A1445009D71D3A32273F38BFCC5FA119FA153298BF162ADF4A42E1BAA3F1BA983661CD5FA11DFA153298BF9678BB0AD316ABE8E8A8FB6EE695C7E55B49BF4228FD0A19CC5F4B946FA2275AE18473C3D745F47D6B93F92BB443BF4206F3D71DB7C7FBFBD7CFAD4DB47CF2FD1F7FFFDBF2635B1B2DFA4E0E6627C596CB932D1B7C67A7CC7915B3AD8DB6BA89A2EF0CCC4CBF4206F3D7556F3FFC7EFB5F6F21F5682BBC2C21386467333E6DF0B73B689E2D6FFE0AEDD0AF90C1FCF549E1659B7EFFFAF994535B45E572B087AC4EB25FFF5AD8F983E1E91F4E52B16F37C5E33689BE333033FD0A19CC5F1F957F4EEB751C78E36B4EAFDBDA86E7FA75925D60FE0AEDD0AF90C1FCF5EEE8A6D0AF1122FAF57B8268B329A011FA153298BF2E8E7EE65DBF0609EAD7EFA1BB4DCA433BF42B64307FFD3A75C126FD1A24AE5FBF874E371B011AA15F2183F9EBB9EF26D0AF4142FB75D4DD61FE0AEDD0AF9061F2F9EB7EBC2E9F5EDFDA14FA35C2F57E7D7B058921F7C8CEE37DA25F21947E850C33CF5FF7A756F7665AFD5FF56B90EBFDBAB32F1E775FF403C964FE0AEDD0AF9061E6F9EBCE637FCCD3B73FA05F2BAAD5AF3B3FF03D62C36D3DD2191E3B3445BF428669E7AF3B71F3544BAB3FA35F8354ECD7FD841DE98F31F35768877E850CD3CE5FB71EF86B2A6D6D0AFD1AA16EBF6EED94EFE1326EF531CEF0C0A135FA1532CC397FDD4A9F3F6BDF53BAFA93FA3548F57EFDC7C6F7FA2E3B31FAE1E4307F8576E857C830E7FC752768F4EB6745F4EBCE9F2BD10F27CDEA031CFE514383F42B649870FEBA5533AB91A45F9345F4EBD6AE59F663F4234A60FE0AEDD0AF9061C2F9EB56CAAC768F7E4D16D4AF5BFB7198BDB3FAE856E95708A55F21C384F3D7AD93BA7E6D415CBF6E1DEAD18F2881F92BB443BF4286D9E6AF5B67FAD51ED5AFF9E2FA7567D7473FA804AB0F6D957E8550FA1532CC367F3DBA7840BF268BEBD7AD5D39C00E327F8576E857C830DBFC75F5F16E7D724BBFE60BEDD7D55F3E46CFAD6E8A55FA1542E957C830DBFC75F571ED2C1ED0AFC942FB75EB9F443FA868E6AFD00EFD0A19A69ABF9E281EFD9A2CB45F77F666F4E38AB6FAB856E95708A55F21C354F3D7ADB78FF56B3BA2FB756B0149F4E30A65FE0AEDD0AF9061AAF9AB7E6D9F7E3D677553ACD2AF104ABF4206F3D7FD0F6FE9D764D1FD3AE43E327F8576E857C830D5FCF5C4C507F46BB28FF4EB0049B7BA2956E95708A55F21C354F3D7D507BB7FF101FD9A2CBA5F57FF55EF4967FE0AEDD0AF90C1FC55BF3645BF9EB3BA2956E95708A55F21C354F3D7D507A55F9BF2917EFDEEFCD8367F8576E857C830D5FC75EB41E9D776E8D773561FD42AFD0AA1F42B64307FD5AF4DD1AF2798BF423BF42B64307FD5AF4DD1AFE7AC3EA855FA1542E957C8E0FA03FAB5293EBF7582F92BB443BF4206D71F586D23FDFA29D1FDBAFAFB5D7F00A845BF4206F357FDDA14FD7A82F92BB443BF4286A9E6AF5BEDA25FDB11DDAF5B7FC3443FAE68AB9B62957E8550FA15324C357F5D6DA3EF77C5B3FA4FF46B90E87E5DFD27BDEF23F35768877E850C53CD5FB74EF3FB1FE12AFF27FAF5BAD07EDD3900A21F57B4D5C7B54ABF4228FD0A19A69ABF7E9DBA8456F93FD1AFD77DA45FA31F5434F35768877E850C53CD5FBF4E7D846B6B53E8D708A1FD3AEAC507BECC5FA119FA1532CC367F3DB10476F5E7F56B90D07E5DFDF9017690F92BB443BF4286D9E6AF2796C096FFBC7EBD2EAE5F075EFCFA65FE0ACDD0AF9061B6F9EBD7C6997E6709C1EACFEBD72071FDBA75A8473FA204E6AFD00EFD0A19669BBF7E1D5F42B0B529F46B84A07EDDFAE161F6CEEAA35BA55F21947E850C13CE5F775246BF7E5C50BF6E1DE763FC4966FE0AEDD0AF9061C2F9EBD7F6A35EADD2F29FD4AFD745F4EBD64F8E5472AB0F70F8470D0DD2AF9061C2F9EBD7F61282D5EF925DFD49FD1A24A25FC71EBE7E99BF424BF42B649873FEFAB5FDC05F53696B53E8D708D5FB75E76F95E8C79269F531CEF0C0A135FA1532CC397FFDDA1D593DB569C9CFE8D75AEAF6EB56BC2E7B30FAB1A4317F8576E857C830EDFCF56BF7B13FE6E9DB1FD0AF1555ECD79DAA1BAFE1B61EE90C8F1D9AA25F21C3B4F3D7AF7753AB7B33ADFEAFFA3548AD7EDD99BC2EBB2FFA8164327F8576E857C830F3FCF56BFB835CF733FD5619E8D720D7FBF5F6DFEF1FD543EE919DC7FB44BF4228FD0A19669EBF2EF613768B7E0D72BD5FF70DB93BCC5FA11DFA15324C3E7F5D1CDA08F74DA15F2384F6EBC0E966234023F42B64307F5D1C4D58FD1A24AE5F07EE36F35768877E850CE6AF774737857E8D10D4AFC3479B4D018DD0AF90C1FCF551F95A58FD1A24A25F87DF05521EDAA15F2183F9EB93B79F5EBF6F8AD7A25AFD87FAF590D57EFDB3F6BDBE257F6C2C579088BECF2D78BB291EB749F49D8199E957C860FEBAEA6DC5BE16D5CEE59CA2EFED48CA2F58F67607CDB3E5CD5FA11DFA153298BFEEB83DDEDFBF7E6E6DA2A5909672DD9905EAD7437652ECB691EF1B7C67A72C3F167D3F5BB3B5D1563751F49D8199E957C860FE5AA27C133DD10A271CBD16C4A3E8FBD626F35768877E850CE6AF25CE7DC7C1CC5BEC8AA317C6BA9B79A971F956D2AF104ABF4206F3D7422786823EB975DA893F1866CE32F35768877E850CE6AF858E0E0555C24547FF60987CD4EDC88446E857C860FE5AAE3C6125C2758517325B4C1EAFE6AFD00EFD0A19CC5F0F29892ACB062A7ABB9060AAEB64ED2879FEDEB758F49D8199E957C860FE7AC256C56AA9085BC3455BFBCEFC15DAA15F2183F9EB395BC5107DBB737234BE55FE2CD6AF104ABF4206F3D773B6FA5554556753BF65FE0AEDD0AF90C1FCF5349B2887517789F267B17E8550FA153298BF9EB6BAE97C78ABBAD58F7089B047E6AFD00EFD0A19CC5F4FD3AF39F46B89F267B14D07A1F42B64307F3D4D57E5F077C25BE6AFD00EFD0A19CC5F4FF3B9A2045B1B59BF3E297F16EB5708A55F2183F9EB69FA35810F6F95307F8576E857C860FE7AC5EA56321AACC8228D42E5CF625B0F42E957C860FE7A85BA8A66F16B09F35768877E850CE6AF57584210CAE62D57FE2CD6AF104ABF4206F3D72B7CBA28D4EA78DB71F8CAFC15DAA15F2183F9EB45AB1B50225461DB962B7F16DB80104ABF4206F3D78BB666845AFF22B3ED72E6AFD00EFD0A19CC5F2F9259412C1E38A4FC59AC5F21947E850CE6AFD76D6DC3E8DB1D9BF62A67FE0AEDD0AF90C1FCF5BAAD49A111EC6936E951E5CF62FD0AA1F42B64307FAD4228D465A47D88F92BB443BF4206F3D72A7C8AAB224B8A4F287F16EB5708A55F2183F96B155BC9A5154E307C3DCAFC15DAA15F2183F96B2D5B5BD2463BC4CAD773CA9FC5FA1542E957C860FE5A8B116C15FE0C38C1FC15DAA15F2183F96B455B1BD3ECB090E1EB69E5CF62FD0AA1F42B64307FAD68670C167DD363D8DA7AFE70DA67FE0AEDD0AF90C1FCB5AEADED291ADE32BDBEA2FC59EC508450FA153298BF56B7B5F574D88EAD95038EBA12E6AFD00EFD0A19CC5FAB936247EDE497E82F54FE2CD6AF104ABF4206F3D70856111C62735D64FE0AEDD0AF90C1FC35828162B99D71B5E3AD5CF9B358BF4228FD0A19CC5F83C8B2123B5B49E897337F8576E857C860FE1A6767DBDA925FBBD5A5B18E2A7F16DBB6104ABF4206F3D738FB53B1C913D6C6A9C8FC15DAA15F2183F96BA89DF7C76F5B7EDAED797BE03B079E950327943F8BF52B84D2AF90C1FC359A847D225EAB337F8576E857C860FE9A6067234F1813B64684F267B18D0CA1F42B64307FCD21DABEDE4D5E75D569E6AFD00EFD0A19CC5F73EC17C60C0B09F6E3D5D17551F9B358BF4228FD0A19CC5FD3BC1D920D1C70333FF604E6AFD00EFD0A19CC5F33BDED8C213FBDB4F309B6EFB9AFC35051E15378D9E0D1770666A65F2183F96BB2B7093B585EEC1F60E2B50AF35768877E850CE6AFF94A1276804DFD76C1AB23AAA292E7EFFDE88ABE333033FD0A19CC5F3FA26460D6F55A82FD3503DF2AAA2AF35768877E850CE6AF9F52329EEC71105BF8B8A2EFC66C4A9EBF363E24D0AF90C1FCF5B34AB67F2F155B52AEDFBE612B80F92BB443BF4206F3D78F7BFB56FBE2F663CD6EFFDB1D2B7C140EA120251B7FA15F21947E850CE6AF2D289F9FB5368B2D9CB93678CF4762FE0AEDD0AF90C1FCB51DE5FBE2F6931F7F17FE7607CAEFB03503D10A77C472F044DF1998997E850CE6AF4D3934485B5A24F98F8AF281EBA7EEE184CC5FA11DFA153298BFB6A67C2DE9A365756CD00E5A7EF3B97B15717F7855BE53F42B84D2AF90C1FCB54D47C79C8F7572ABC6EB1FF65A82F5D0228147CA3593F92BB443BF4206F3D7969DAED8BBDB3FBF17ED12B5F749EDDDFD7F5D6AF5FA2D3A4EF21DDA41D1770666A65F2183F96BFBAE576C0EE5FA29E6AFD00EFD0A19CC5F7B716E056A8E96AF4D3B89F29DA55F21947E850CE6AF7D69AA62979509CAF5E3CC5FA11DFA153298BF76EA83212B5B1B7468F745DF1998997E850CE6AFBD5B423661816C95CB1A10C1FC15DAA15F2183F9EB482E5EF4EA49AD4B7191E0D06E8DBE333033FD0A19CC5F07F67879ACE5C2584F97C7BAFF378F17D852ABDD317F8576E857C860FE0A03D0AFD008FD0A19CC5FA177E6AFD00EFD0A190EF5AB2F0585061DBA12857E8550FA15329CF8A08F5504D08813DFCDA65F21947E850CE73EA8FEC73785C2479DFE5661FD0AA1F42B64B872A125CB09E023AE7C75857E8550FA15325CBF50A88A8534D7BF744DBF4228FD0A196A5DE8DE720208757AC1C0EBB335FAAEC2CCF42B64A87246BC9F17552C5457AB5CEFCFD3E83B0C33D3AF90A1E2797161390154747DC1C013FD0AA1F42B64A8DEAFCB0952C5C245D5CBF5FEF48CBEE73033FD0A19EABE35F9749AB49C004EF0AC847EE957C81377BEFCFDEBA7F32514BA3D59E2C6AE9E899040BF42B6A013E7B745B150C0131006A05FE1038C7F209F37406018FA153EC6F23BC8E1B90683D1AFF061BF7FFD8C9B0945DF79689FF73A603CFA159A10778A55B14CCB525718957E8556788B136A095DEA1A7DE781B7F42BB445C5C2159E413003FD0A2DF2BE279C60A92B4C42BF42BB2C8A8542FEE483A9E857689A3743619FABBAC284F42B74C0191A56F9EB0EE6A45FA11BDE21853B4F0798997E859EC47DF1EC8D81135DF0951F807E85FE5814CB9C1CF9C042BF42AF5CA19D79C4BDF3A05CA147FA15FA661520C37390034FF42B74CF688A5179930158A55F611096063212C733B043BFC2507C349B01B8C806B04FBFC2807CF12C9DB2D41528A15F6158DE7EA523BE640E28A75F61649A80F659EA0A1CA55F617CDE93A559D6BA0027E85798856B6CD1149F35044ED3AF30116FD4D202C72170917E85E95814CB07791F00B84EBFC2A42C8A2599430EA845BFC2D40CC348E06B6081BAF42BCCCE6244E238BA8008FA15F8171332AA33DD0782E857E03FAC50A40A0712104ABF02FFE5C78FBF8CCD38CD201F48A05F8115962D7294630648A35F814DBE21894266F64026FD0ABCE11BEAD971EBCB88C3E3DB1F39C036FD0ABCE7AD615EF92237E053F42B504AC5B2F0213FE0B3F42B708C4B234DCE01007C9C7E05CE888B18E3B766B93616D008FD0A9C6439C13CEC6BA029FA15B8C44C6E7896BA02ADD1AF4005D6440EC96E05DAA45F813AE23E93FE6D516C3A6375A065FA15A8C942C9DED98340FBF42B509FF79D3B65820E7441BF0221429713A8D8EAEC2CA023FA1508E4CDE8F6F91A58A03BFA150877EB1815DB205F030B744ABF0249BC43DD94B872B53B8068FA15C8133AF0934D855C1B0BE89D7E05B25914FB29B63C3006FD0A7C86E504C92C750586A15F814F52B1096C646030FA15F8306F6AC7B1D41518927E059AA062EBB23D8181E957A021DEE9AEC25257606CFA15688E6B6C9DE60F006006FA156891B7BF8FB2D41598877E05DAA5624BF81A586036FA15689DF7C47728576042FA15E8802F9E7D75BBDB160C0073D2AF40372C2758842E75357605DAA75F81CECCFC41254B5D01BEF42BD0A90917C55A070CB0D0AF40AFE61946BA3616C023FD0AF46DEC45B196FC02BCD2AFC00886FC30BEA5AE00ABF42B308E6156885AEA0AB043BF02A3E9FA0D774B5D01DED2AFC0807A5C366AA92B4021FD0A0CABA377E1E3EEAA7205C6A35F81C135FEC5B3BE0616E028FD0A8CAFCDB7E67D0D2CC039FA15984553BDE8DA5800A7E957602E1F5F14DBF87A0680F6E95760461F197FBA36164015FA159854E6A258D7C602A848BF02534B98895AEA0A50977E05085C141BC482016066FA15E0DFBAA858E50AA05F01FE236E39C175160C002CF42BC0B3D62A56B9023CD2AF00EB1A594E60C100C013FD0AB0E9C78FBF3E58B1CA1560957E0578237F39810503003BF42B4091DFBF7E2654AC7205784BBF021C10BA9CC082018012FA15E09888E504B77235760528A45F01CEA855B1160C001CA55F01CEBBB89CC082018013F42BC055272A56B9029CA65F012A285F4E60C100C045FA15A09AFD8A55AE0055E85780CA569713583000508B7E05A8EFF18B67952B405DFA1520CAAD622D1800A84EBF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F4E4A9591FD5BC190000A842BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF6FAD5FFFDEBFFFE5700000000FFFF0300504B03040A000000000000002100460095E0686000006860000015000000776F72642F6D656469612F696D616765312E706E6789504E470D0A1A0A0000000D4948445200000395000002590802000000B69786FF000000017352474200AECE1CE9000000097048597300000EC400000EC401952B0E1B0000600D49444154785EEDDDB1EB2FC7B9E77969952D02C3082424180C56A2E00E1C6EE0E824EB6102A1D8A105930D936CB2FFC2FE0BC3C472A868178483611C890D1C5C0ECC0D94C8602E48964017044A8DF7D16DDFEFFDE9FBEBEE6F5577555775F5CB1CCC91545DF5D4FB79BAEA53F57DBAEAF5D73EF9F36BFE8700020820800002082080404F04FEFA9B775EFFED37B316FD6F3DD9C91604104000010410400001041E10A05F8508020820800002082080C09908D0AF67F2165B11400001041040000104E8573180000208208000020820702602F4EB99BCC55604104000010410400001FA550C208000020820800002089C8900FD7A266FB115010410400001041040807E1503082080000208208000025D1388B3609FDA47BF76ED2DC621800002082080000208DC11A05F8504020820800002082080C09908D0AF67F2165B11400001041040000104E8573180000208208000020820702602F4EB99BCC55604104000010410400001FA550C208000020820800002089C8900FD7A266FB115010410400001041040807E150308208000020820800002672240BF9EC95B6C45000104104000010410A05FC500020820800002082080C09908D0AF67F2165B1140A04302FFEDDDFF157F3A348C49082080C0A804E8D7513DAB5F0820509D40C8D6DFFFFD771FBF7C197FE22FD5DBD30002082080C0BF10A05F0502020820B085C0A45C7FF9FE2FA687E32F3FFCFA6754EC16949E410001043209D0AF99C014470081CB13886DD73F7DF8C64DB93EE511FF32FE937482CBC708000820509700FD5A97AFDA114060240293728D6DD7B7DE7C73A95FF19FA200153B92DFF50501047A2340BFF6E611F6208040A704A6848115E5FAD4EE49C54A27E8D497CC4200819313A05F4FEE40E62380407D02214323B775366160BD7149B1F59DA3050410B82201FAF58A5ED76704104824B092EA9A58431493149BCE4A49041040208500FD9A4249190410B81C819454D77428B774029F76A5435312010410582240BF8A0D041040E09E4056AA6B3ABED88895149B8E4B49041040807E1503082080C06302A15C97CEC67AFC705A09E904699C94420001041609D87F151C082080C08F046EA9AE89270CECA1E68CAD3DF43C8B000208D0AF62000104AE4EE0760DEC01CAF5296B676C5D3DF2F41F0104B612A05FB792F31C02080C41E0EE1AD8E3FBE48CADE3996B110104CE4E807E3DBB07D98F00021B0914391B6B63DBCF1E93145B8AA47A1040E00A04E8D72B78591F1140E02704CA9E8D550AAEA4D85224D5830002C313A05F8777B10E2280C04F08543A1BAB146549B1A548AA070104062640BF0EEC5C5D4300817BE5BAED1AD8E3394A8A3D9EB9161140E04404E8D713398BA90820B09140BD54D73F7CF9C7373FFD3EFEC45F361AB7FC98A4D8E248558800026310A05FC7F0A35E2080C03C817AA9AEDFFDF0C3279F7FFEAB7F786B6A38FE12FF18FFB2AC2724C596E5A9360410188300FD3A861FF50201046608544A759D94EBCF7FF797FFFAF57F78DA6AFC63FCCB7A2A36BAC3CD082080000241807E15060820302081907A95525D234FE0B9727DAE62EBA51350B103C6AB2E2180402601FA351398E20820D03781AAA9AE4F1306D631443A418DA4D848279014DB7700B20E01048E2040BF1E41591B082070008103525DEF12061E76AA6A526C6CC446971FDAA000020820301E81D75FFBE4CFE3F54A8F1040E06A0442CCC5C664F15E47AAEB97DF7C7BFB486B73FD61DEFBEFBC1DBBA79B6B587A301215F69B57DC2A1522800002FB09FCF537EFBCFEDB6FA67A9EFE3DFED1FEEB7EBC6A40008196046AA7BA165187514964CD564A8A8D4C5F1BB12D4350DB0820703801FAF570E41A4400814204EAA5BADE9D8D55C8DE5A676C85791FBF7CF9A70FDFA0624B794A3D0820D03901F9039D3B88790820304F20E45A8D9FE343B97EF6EA556E9E6BAE9342687EF4E2450DFBA513E4FA42790410E89680FC816E5DC3300410C82630250C54127FEB676365DBBAF0C074526CBD7402676C95F2947A1040A04F02F207FAF40BAB1040608640C8B2D876ADF19DD6740D6C9154D774CF553A632B0C70C656BA17944400813312A05FCFE8353623703902B754D7E2DBAE95525DD33D54F58C2D49B1E98E501201044E4440FEEB899CC55404AE482094EB07EFBE5763CFF59854D7749F498A4D67A52402085C81C04AFE2BFD7A8500D04704CE4AA0D2A9AE81A3DBEF9C2ED8E5B34627BB1140A03201DF6F5506AC7A0410284DA0DED9584D525DD3F14CE904953EED924E90EE08251140A06702F25F7BF60EDB10B8228103AE81ED1C6B9C4E503529D6C5B39D0700F31040E02101F9030F11298000020711A89AEA5AE41AD883403C69C6C5B3C733D7220208744240FE40278E600602082C1208A1169748D5F84E2B7E8B8FC3560F3E1BAB94A7AB5E3C2B9DA0949BD48300020713903F703070CD2180C03D817AA9AECDCFC62AE5EC4A49B17118998B674BF9483D0820702401F90347D2D6160208FC8440BD13A37A3B1BAB94E3EB11EBF6408652E8D4830002A723207FE0742E633002E3139812066ADC4730250CC45750E34174F1EC783ED5230410D84040FEC006681E4100815D0442B9FEF0EB9F4975DD0CD1C5B39BD179100104C62040BF8EE147BD40E01C04A4BA16F453D533B67CDA55D053AA420081E204E8D7E2485588000233046A9FEA3A6AC2C07A304DE90471DF41E4FB960DBBE9D3AED8292F5BADDA104000812204E8D72218558200026B042AA5BA469303A7BAA68794A4D874564A2280C01804E8D731FCA81708744AA06AAAEB9B9F7E7FD2535D6B784B526C0DAAEA4400813E09D0AF7DFA8555089C9E8054D7262E9414DB04BB461140E06002CE7F3D18B8E610189F806B607BF0B193627BF0021B1040600F01E7BFEEA1E7590410C820E01AD80C58358B564D8A8DD3097CDA55D37BEA4600810704E40F08110410284320044DC89A1AA7BA0E730D6C19D039B5D4BB78361CED8CAD1C57288B00022509D0AF2569AA0B816B12B8A5BAD6B84C2B0E87BAE6D958A562293662AB26C5C6BA2502A094B5EA410001045208C87F4DA1A40C0208CC13A897EA1AEDC5D9588E17281B79A1356B6C9073565937A90D01042602F25F4502020894275035D5D5D958E51DF6DA6B55CFD88A3B816DC4D6F09A3A1140E03901F903A2020104B209381B2B1B594F0F544A27882EC6955D92627B72355B10189600FD3AAC6B750C811A0442B9D6BB4C4BAA6B0D97CDD6E9E2D9C3506B0801046A1090FF5A83AA3A11189380ECC921FDCAAD43BA55A710188080FCD7019CA80B08B424502F61203ED292EADAD2B5959362A513B475AED611189580FC81513DAB5F0894213029D7C86BAC7436961306CAF869772D959262236C24C5EE768E0A1040E09E00FD2A26104060918054D74B0587A4D84BB95B6711383501FAF5D4EE633C02B50884728DE3906A9C153A250C8454AA65BA7AF711A87AF16C04958B67F7F9C7D30820F02301FA551C2080C04F08D44B75750DEC8942ADD2C5B341C0C5B3270A03A622D02D01E70F74EB1A862170348150AE1FBD78513CCF35BA11CAF5B357AFECB91EEDD112EDD58B8AD889FFE2EBAF4445092FA903813109AC9C3F40BF8EE972BD42209740A5439442B97EF9CDB73ED2CA75476FE543C5C6675835AC724B700DAAEA44600C02CECF1AC38F7A81401502A15CE384814AA9AE3FFFDD5F88D72A6E3BB6D2D8258DACE5D09AC59B954E501CA90A11B80201F9AF57F0B23E22304FE096EA5A3C6740AAEB9031E78CAD21DDAA53089C9180FC81337A8DCD08EC2510CAF58377DFABB1E72AD575AF6FCEF07CD5A4581BF66708013622700401F9AF4750D6060267215029D535BA2F97F12C3150C44E815404A34A1040608980FC57B18100023F12A87736966B602F1861B1512A29F6827ED765047A2020FFB5072FB00181EA045C035B1DF1551B90147B55CFEB37022D09D0AF2DE96B1B81630854BA0676FA482B4E187084E7317EECB61517CF76EB1A8621302A01FA7554CFEA17023F12A87A0D2CE52AC89E1270F1AC78400081C308D0AF87A1D610028712A89AEA1ADBAE3E123FD49DE7694C52EC797CC552044E4C807E3DB1F3988EC02C8103525D250C88BD75029262450802085425E0FCD7AA78558EC0D1042A1D69E454D7A31D394A7B1190EFBFF376F10B32028FC3DA468911FD40609180F3B3040702E31390EA3ABE8F4FD8C3D8888D3CE97A17CF46D89F900A931140602F01F9037B097A1E81E604A4BA367701035AA513C41D727FFAF08D7805B80001042E4540FEC0A5DCADB3031288C9BBC68FB31206068C950EBA54F5E2D92FBEFE4A6676074E660202C508C81F2886524508F443604A18282E5E43B9C6AFBDCEC6EAC7D1235952F58CAD8F5FBE944E3052B4E80B022B04E40F080F04CE472026E9D8768D5F4E8B9B3E295767631507ABC2A704AA9EB1158B3AE904E20D81E109D0AFC3BB58078722704B75ADB1EDEA54D7A162A5FBCE543A632BFA1D1BB19262BBF73F0311D84540FEEB2E7C1E46E03002A15C3F78F7BD1A7BAE525D0F73A2866609544D8AF56382A843E0BC0456F25FE9D7F3BA95E5172250E954D720E810CD0B8551DF5D15E47DFB8775083420E0FBAD06D0358940110255CFC67AF3D3EFED4E1571934AF61398D209EA9D142B2976BF8FD480403F04E4BFF6E30B9620F01302075C038B38025D1188D3092A25C546BEB8A4D8AE7CCD18047612903FB013A0C711284FA05EAA6BD81A5B5CCEC82CEF33359626E0E2D9D244D587C0F908C87F3D9FCF587C5902B2002FEB7A1D7F4EC0EB202A10B83201F9AF57F6BEBE9F8640D5545767639D260E18FA84C074526C1C91519C8A8B678B23552102471290FF7A246D6D21304FE0805457390382EFBC04E24E8D58801557B153526C6CF1FAB4EBBCB1C1F2CB1290FF7A59D7EB782F042AFD421A93FD97DF7CEB78815EDCCC8E12042ABD2C619A83E44AF8471D081426207FA03050D5215084404CC671D7658D2B095C035BC4412AE98D40D58B675DD9D59BBBD983C00A01F903C203810604EAA5BAC6B6AB54D7061ED5E481049CB175206C4D21D02901FAB553C7306B5402B5535D235350AAEBA8C1A35F370211E4B59362D14600819E09D0AF3D7B876DA311888481F85E24BE1A29DBB1D8739D120628D7B260D5D6398149C556BAB22B727BE285ED9C00F310B82C01FAF5B2AED7F14309C44418D975525D0F85AEB16B1090147B0D3FEB25023F2140BF0A0804EA12B8A5BAD6D87695EA5AD7796A3F0F0149B1E7F1154B112840C0F9590520AA02815902F5AE818D8481CF5EBD922D20F010784E20DEBB8F5EBC28BE5C8C862251E18BAFBFF2DE893A040E23E0FED8C3506B0881BF117050A55040A021012F6043F89A46A01401E7BF9622A91E041E13A87736566CFF481878EC00251078EDB5299DA0D2A75D4E8A1562083427207FA0B90B18300E817A3F5C4A1818274AF4E45802DECA63796B0D819204ECBF96A4A92E049608D4C8BA7336967843600F817A676C458A6DBCF27B6CF32C02086C26E0FC81CDE83C88407502AE81AD8E5803D72050EF8CAD6BF0D34B04BA2340BF76E712062110045C032B0C10284EA0D2195BC5ED542102083C2440BF3E44A4000287129894ABCBB40E85AEB1CB10A877F1EC6510EA28025D10A05FBB700323109808B8065624207000817A49B10718AF0904100802F4AB3040A00B02A15CDFFCF4FBF87DB30B6B1881C00508488ABD809375715802F4EBB0AED5B1B31090EA7A164FB173480292628774AB4E0D4F807E1DDEC53AD83501A9AE5DBB8771D7202029F61A7ED6CBA108D0AF43B953674E44604A187097FA895CC6D4B109488A1DDBBF7A371801FA753087EACE690848753D8DAB187A25025F7CFDD595BAABAF089C9500FD7A56CFB1FBEC04E25ACBB37781FD088C47C04F22E3F9548F8624F0FA6B9FFC79C88EE91402C713F8D3876FC4959289ED46F2406249C57A2030AD373E78F7BDF8FFF7DF79FB66D2CDE3F11DDEF42FBFFCE6DBE92FD34E1E3DD483FBD26D08477FFCF26562F9707A1CD59C5858310410C825F0D7DFBCF3FA6FBF999E7AFAF7F847FA3517A6F2082C12C8D2AFF1E51665D37330858EB9A9D5F465C9528F42E84CBA36442DBFF7ECF7B0ED875FFF2CD142FA35119462086C2340BF6EE3E62904F20864E957FBAF79700F293D69D6D85EDD2F58D7ED8DAFF768D9435C9ADD88FDD76C641E40A01A8115FD2AFFB51A751523B04A40FE6B3F0112BEF8FDDF7F17BB6EF1C3F12FDFFF456DF11A1D8F56E24F34176B9E685A30F4130C76C7FBF1054B10582140BF0A0F04DA10304DB6E1FEA4D53BD9DAC49ED0CA846C13F24B8D5A4B74E50EC620B044807E151B08B421609A6CC3FD5F5A9D94EBB4DBDAD08CA74DDF84ACEDD8B61EB1B06CCB5FEB082412A05F13412986406102A6C9C240D3AA0BE51A3FD977A55CEF0CBF6DC75AE1A4B9B47029D80B03551D027508387FA00E57B55E9240D6F75BCE1F38384642977CF4E2C59EDCD6E984ACA7C763C5C75E77C7DD4F47164CFF9B8ED9DAD9E267AF5E59EA1C1C2ACE1F3818B8E6105822E0FC01B181C01104B2F4ABF3078E70C9BFB4B159B9963AF46AE7515C715881DBDA8E8C16E7BF1E465B4308AC13A05F4508024710C8D2AFF65F0F70C9241C73935C432FD6BB7AE0760FC206ABA8D80362269AB0FF7A0C67AD20F09000FDFA10910208142090A55FEDBF1620BE5A45D6419E5153ECB61EFC637DEEC6F0F116D6F65187F567858DFB0B3AF420934622E0FCD791BCA92F8310F0994855474E1F69A534111224365C63391117811E9C691ACD45A3D1741870BB7E76C5E648A58D4EC5010529FD52661B818363609B919E420001E70F880104DA10304D56E21E0B83F8FD37E5ABA9908C91C5110AB2F9EFF261409811C6A4A8D8483C08756EFD532F7E2AD5AC5A04102848807E2D085355086410A03F326025179D4E757D583CF63B27E5DAD52A62DA8E0DC3A6DB651F6EC40AA1878EDE50A0AB90D860BF4710B80801FAF5228ED6CDEE0898268BBB2476251F7E1435EDB9C67E67B7FCC3B0302F652F562E41F1108A0AAD0A6A50552702C509D0AFC591AA10812402A6C9244C6985A65B09D673066ED902DD2AD7A77DBDEDC5AE67144CB9046990944A22708AF048EA8942080C4D807E1DDABD3AD73101D36429E74C1F8CAF8BD7F845BEB76C8194EE4F2A763D9D203A4EC2A6C04C2C636199084A3104DA12A05FDBF2D7FA750998268BF8FEE16947B7848122CD35A9E4613A4148D8F8644D4415F18E8565118C2A41A03601FAB53661F523304FC034B93F3252C4EB19B75D9F93993662D77309E2765C12B64850EDAF440D0820509B00FD5A9BB0FA119827406AEC8C8C87E275CA19D8D94A578FAFE712C42E2C09BBDF5F1696FB19AA01810308D0AF0740D6040233044C937BC2E2A1789D0E19D8D3449FCF4EB9044BB64D171C581AEDF11D7A7BE8791681C308D0AF87A1D610023F21609ADC1C10EBE2754A781D7879105D5B3F5D8B84DD1C5AF1E0C091B3078B6711E88D00FDDA9B47D8731502A6C9CD9E8E5FC9979E9DEEA31F9E6D74F0B357AF56D26157106DC67E91072D2C2FE268DD3C3B01FAF5EC1E64FF59099826B7796EE59CD749BC6EABF6744FAD7FD1E550ADCD0E1D7EF1B3998C0711E88A00FDDA953B18732102A6C90DCE8EEB6197CE790DF11A5B921BEA3CF5232BBBB0012A709DBA774D8CB7B06C825DA308E412A05F7389298F401902A6C95C8EA1C696AE879DC4EB059704EB8904818B84CD0DB30B46512E22E511E88100FDDA8317D8704502A6C92CAF87DC5F12AF51CF35C5EB047092B04B30039A95526EA46595571801049A10A05F9B60D72802AF51155941B0F241D2D8A70DA4509A4E24582AE95BAE1486B732169659B81446A01501FAB51579ED5E9D8069323D0256D25E89D7DB2E6CDCD7308B54226C7AA445490BCB2C5C0A23D08A00FDDA8ABC76AF4EC0349918012B9903A1D82C036E18E36A8325092B8B2031D8A298884A67A524020D09D0AF0DE16BFAD2044C9389EE5FFAF93BBED91AF286AD442CB3C502C8D2A1B0B20812C15A582682520C81B604E8D7B6FCB57E5D02A6C914DFAF640E5CE7A8D71450B7324BDF72C92248C4686199084A3104DA12A05FDBF2D7FA75099826537CBF74E6C0D20FE529758E5D26E26A258B60ECBE17E99D8565118C2A41A03601FAB53661F523304FC034F93032E2AAADD9323207D6D1AD6411380EF661D459583E44A400023D10A05F7BF0021BAE48C034B9EEF5D0F74B576DC91C78F8C22C21F221D7437416960F112980400F04E8D71EBCC0862B12304DAE7B7DE97B239903896FCB12A80FDE7D2FB1866B16B3B0BCA6DFF5FA7404E8D7D3B98CC18310304DAE387269F355E6407AF42F6511D8827DB8F19F0E594904106845807E6D455EBB572760FF75250296365F572E4ABD7A3CCDF5FFCB6FBE9DC5620B76255A2C2CBD4A089C8200FD7A0A3731724002A6C925A7AE6CBE8296F526AC6CC166D573A9C216969772B7CE9E9700FD7A5EDFB1FCDC044C934BFE5BDA1DB4F9BA21E297A039886009A635D28630F30802C713A05F8F67AE45047E24609A5C8A83D9335F23F315B10D6F4E409BBD916BE960DD0D4D0CF68885E5600ED59D5109D0AFA37A56BF7A27609A9CF5D0D2BEE0522A67EF6EEEC0BE2574B660679D6399D441CC320181C704E8D7C78C9440A00601D3E42CD5F7DF797BF6DF472A670D2F5CA1CE25744BA8AFC064A58F1696170F00DD3F0B01FAF52C9E62E768044C93CF3DBAF4E596335F7746FF2CC0A5EB2176B675F6C72D2CCFEE41F65F8400FD7A1147EB6677044C93CF5DB2F4E5D6175F7FD59DFF4E65D012402904B38BA853F996B1085C9400FD7A51C7EB767302F65F9FBB60F6176D5F6EED8FD5A5AFB8A4103C676B61B93FDED480C00104E8D703206B02811902A6C93B284BC903BEDC2AF2FECC62944260FFB54874A90481E309D0AFC733D722023F12B0FF9A180792071241AD175BC2280EEFB859581689379520509B00FD5A9BB0FA119827609ABCE3329BFC2A79A0D4FBB39442E02ED9E7BF039462AE1E0410A847807EADC756CD08AC11B0EF754767F6447DC90305DFA259985260EDBF168C315521701801FAF530D41A42E02704ECBF3EC5B1A4E6250F147C6D66614A81B5FF5A30C65485C06104E8D7C3506B08819F10B0FF2A203A21E014ADA78EB0B0EC242C9981C03A01FA558420D0868069F22977C9AF0744E1520AEC014D9FA8090BCB13398BA9572640BF5ED9FBFADE928069F229FDD92C4CC9AFC503540AEC43A416960F112980400F04E8D71EBCC0862B12304D5ED1EBFADC3D010BCBEE5DC440047E2440BF8A0304DA10304D3EE53EFB15918FB78A87A64FB81E22B5B07C884801047A2040BFF6E005365C918069F2E67552BEF90BC005A2B179103200812C02F46B162E851128468062788892C47F8828B700A40F8941F410910208F440807EEDC10B6CB82201D3E4E4F5D0F11FBD78F13C02E2E62D12BFF88BB184345C80F62D208B6357210208142740BF1647AA42049208900B41E04F1FBEF1F1CB97B3C9AFF12FE33F399A342998D20A05CC403A5B76A21DEE1096169669D1A414028D09D0AF8D1DA0F9CB12B8F834193A6949B93E0D89B8543644D56583A454C7A7A5C2EC0DBD4F9B9854ECC525ECC5BB5F2AE4D483406D02F46B6DC2EA47609EC095A7C949BC264646882A123691D552B1480F48BF27F6E212F6E20BCB9D91E671040E2340BF1E865A4308FC84C095A7C9D984D795F808ED259160F3FB13E8D2C5EBD44AAE8336DBD6E183575E5876E80E2621B044807E151B08B42170D96972839C0A0FC56FDF9725B6274003DAC3B481E7F55F79C170E585E59E48F32C020713A05F0F06AE3904FE46E0B2D3E40639655370F36BB3792775B39B369BDAC98396499D38821908AC13A05F4508026D085C6D9A8CFEC6CEEB52266B9C96F5C9E79FFFDFFFCFFF1BFFFF872FFF38EB92D814BC1AB49DA119B896320702F20D78C09F6D289C152EBB1AF3CB2E2C77069BC711389800FD7A3070CD2170B9FDD7DB3959B1A5372BA7423FFDF7FFF9FB7FFAEE9F034DFCFFFFF8C77F0C692550EA1108BC01F9063CE0CF4AD87056B8EC6AE76A5D4DAFD70B333523509500FD5A15AFCA11582470856972FD84D71B9ACF5EBDBAC314D26A56517DF0EE7B422A9DC02CAE003B29D7A7FFFBF29B6F57AABDD4E9B0F65FD3034C49041A12A05F1BC2D7F4A5090C3F4D4EA7E5E77EF97E8B89754575E9D0D9D7F959B05F7CFDD5C35A2F72A3C41516960F7DAD0002FD13A05FFBF7110BC72430F63499725AFE987E1DBD57C3DF2831FCC272F408D5BFAB10A05FAFE269FDEC8DC0C0D36488D7CDDBAEBDB9893DCF098C7DA3C4D80B4BF18CC03004E8D7615CA923272330EA3449BC9E2C1037993BB0841D7861B9C9D51E42A05302F46BA78E61D6F004869C26B7DD4D30BCAF87ECE0A8771C8CBAB01C320875EACA04E8D72B7B5FDF5B12186F9A0CF1BA72E8FD74C26B4BE2DACE27102E5B3A1D362A0B778F77AFEF900BCB7CCF7B0281DE09D0AFBD7B887DA312186C9A5CBFA7344ECBBF9DF03AAA4387EC579CB4158E5BBA516292B083ADC406EBCE9061A953080401FA551820D086C060D3E4CA3DA5D369F96D286BB50481F51B25365F515BC2B4F2750CB6B02C0F488D08F441807EEDC30FACB81E8191A6C9957B4A43BC3E3F2DFF7ADE3E7D8FC38917B9D777B085E5E9234F0710582040BF0A0D04DA1018699A5CDA810BC543BCB609AF0AADC62EEC92841D690B76A485658528502502BD10A05F7BF1043BAE4660986972E9CC81F8EE47DAC060511D0E9DFD9C2BCE2218663D364C47068B3DDD41E08E00FD2A24106843609869F2FD77DE9E25F8D9AB576DC86AB5268125B70EB3053BCCC2B26614A81B81F604E8D7F63E60C135098C314D2E65BECA1C1835AA232164EC2DD8611696A346A07E213011A05F4502026D088C314D7EF0EE7BB3F8640EB489AA435A5DDA825D0A86438C2AD6C8180BCB6238548440AF04E8D75E3DC3AED1098C314DCE5E58B0725CE8E85EBD44FF96B660576EAF3811973116962702CE5404B611A05FB771F314027B090C304D2E75E18BAFBFDA4BC7F37D1358DA821D20AAC75858F61D3EAC43A00001FAB500445520B081C000D3E4D2EFC5CECCDA100FE77A64C9C503A4100C20C1CF154BAC45601B01FA751B374F21B097C000D3E4ECC9039207F646C6499E9F75F4D2611427E9D38F660EB0B03C116DA622B09900FDBA199D0711D845608069324EFD7C8E40F2C0AEB038CFC3B38E9E0D89F3F4E9474B0758589E0B386B11D846807EDDC6CD5308EC2570F669F2ECF6EFF59FE717089C3D300658588A4D04AE40807EBD8297F5B14702679F2625BFF6185507DA346A0AECD9F5F78121A029045A12A05F5BD2D7F695090C394DCE9E6C7F652F8FDDF721DD7DF685E5D821A77708DC08D0AF8201813604CE3E4DCE7EA9F3E537DFB6A1A9D5160466DD7DF64FB8865C58B6880E6D22509700FD5A97AFDA115822609A141B087448E0EC0BCB0E913209811A04E8D71A54D589C06302434E930E1F78ECF8814A0CE96E0BCB81225457462640BF8EEC5D7DEB99C0D9A7C9014E4AEA393CCE6BDBD90363C885E579C389E5082C11A05FC506026D089826DB70D72A02AB04CEBEB0E45E042E42807EBD88A375B33B02A6C9EE5CC22004DCBF250610380901FAF5248E62E67004ECBF0EE7521D1A818085E5085ED4870B10A05F2FE0645DEC92C0D9A7C921CFFEEC32524E66D4D903C3C2F26401C7DCAB12A05FAFEA79FD6E4DC034D9DA03DA476086C0D917969C8AC04508D0AF1771B46E764760C86972E952D9EEE833A8048121DD6D61592234D481407502F46B75C41A406096C0D9A749576D09EC5902670F8C211796621581F108D0AFE3F9548FCE4160C869F2EC77879E2374BAB17248779F7D61D94D74300481BA04E8D7BA7CD58EC01201D3A4D840A04302432E2C3BE4CC24047612A05F7702F438021B099C7D9A9CBD3BF4EC772F6DF4E5551F9B75F7D92F95B5B0BC6A38EBF7C908D0AF27731873872170F66972C9FE7FFFD6BF1BC6473AB24260C9D1670FECB32F2C052D02172140BF5EC4D1BAD91D8101A6C9D9933E87FC26BDBBE8E9C0A059479FFDF0D7E07A76FDDD41683001812308D0AF4750D60602CF090C304DCE7E69FECBF77FC1DD572030EBE8B31F3E108E1B60617985F0D34704E8573180401B02034C934B998E5208DA84D481AD2EB9F8ECC9AFF65F0F0C224D21B08B00FDBA0B9F8711D84C6080FDD7A52E7CF4E2C5662C1E3C058125170F10D5032C2C4F11428C44602701FA7527408F23B091C018D3E41FBEFCE3F3FE3B8560634C9CE7B15917CF06C379FAF4374B0790E0A763CE60043610A05F3740F3080205088C314D2EFD5EFC9FFEEEEF0A3052459704969C3B40F240F01E6361D965E0300A819204E8D79234D585403A8131A6C950E1B39F9CC7C73DB260D383E14425C3ADB35F6E45188CB1241BA317278A28A622B08D00FDBA8D9BA710D84B609869F2B357AF6659C882DD1B225D3EBFE4D6A530E8B2136B468DB1B03C1D760623904B807ECD25A63C0265080C334D2E6DC1468AA42C8232B1D24D2DE1D0D9CCD761365F83F4300BCB6EA2862108542140BF56C1AA52041E1218699A5CDA7B8B1F9A49D887917096024B990361FF309BAFD19761169667892B7622B08D00FDBA8D9BA710D84B60A46972690B36184984DD1B287D3C1FE2F5E3972F676D1969F3D5FE6B1FE1C60A041E13A05F1F335202811A0446DA7F5DDF810BDD6317B646081D5667B86F49BC0EB6F96AFFF5B0A0D210023B09D0AF3B017A1C818D0446DA7F9D76AD568EFF8C5DD8FFF21F7FE544828DB1D2EEB17059386EE54EE070FA602BB1C1BAD32E76B48C405D02F46B5DBE6A476089C078D3E4AFFEE1AD15091BDFFDACECE189933E0984CB566EA3087787D3FBB47CB355832D2C3773F020029D13A05F3B7710F3862530E434196A66F638D861BD78E18E85A3C713AFD32F0917F6AAAE23701A02F4EB695CC5D0C1088C3A4DFEFC777F2161078BD5E7DD091787A387ECE6900BCB213DA553172740BF5E3C0074BF198181A74912B659541DD2F0C0E2D5FEEB2111A411040A10A05F0B405405021B088CBAFF3AA10809BB920BBB0197473A21106E1D75E775223CF0C2B293106206024508D0AF4530AA04816C02C34F93911CF9C9E79FA7E4127CF0EE7BCFF1BDFFCEDBD94C3D90406033D870653874C89CD7A7D8C65E5826048822089C8300FD7A0E3FB1723C02579826A38FB157F750C53E5754716CD3EC67EF5F7CFDD5789150AF47B3B802ECF383CC3E7AF162C58C49B9862BAF10B4C32F2CEBC59B9A11389200FD7A246D6D21F06F04AE334DDE546CFCF43CBB1D1B8AEA763A6C48AB95D3F2AFA09F0E7849A61B2526153B9DF03ABB5A086785CBAEA35C27F262EC8008D40402FB09BCFEDA277FDE5F8B1A10402008FCE9C337560ECBBC43F4E6A7DF5F13DA0FBFFED9B68E8FFDD9D036260F9FCA8A49211A046261997E50B1987C18810A20B087C05F7FF3CEEBBFFD66AAE1E9DFE31FEDBFEE01EB5904B613B8CEFEEB1DA3CDDF757DF6EAD576DC577D7233B4CD6E3A3B69FBAF67F720FB2F42807EBD88A375B33B02979D26B77D00141B5D9725B62776035ACA2774CF9BB86CAAF16517967BC2CCB3081C4F807E3D9EB91611F891C095A7C948A9CC0A02BFD266E1BA2BBCE138DE70D065570B97EDF89E18F32C02C713A05F8F67AE45047E2470E56932FA9E2E6189D7FD2F4C6411A4EFC25E59BC5E7C61B93FD2D480C06104E8D7C3506B08819F10B8F2FEEB24DF1F9EAB15C5863F2DFF98B7623A02E2614AEB744ED6955756175F581E138D5A41A00801FAB508469520904DE0E22A61120A4BA7C3DE4E6EDA962C9BED8C6B3C1030E3D48BA58DD8AB9D93B5E4F38B2F2CAFF12AE8E508049C9F358217F5A11302596715D9E8BAF3DA4D3750F655E3F9F77FFFDD2FDFFFC55D13B1356BA97063927EC49BE496AAB1AA72049C9F250610E88E009576E7920032FDE9CE556319B4F9FED8B1302CF6C6FEEB451CAD9B6727207FE0EC1E64FF59099826CFEAB993DB9D7EC5C6C93BBAD17C2BA88DE03C86C0B104E8D763796B0D817F25609A140BFD10B8EC69AFCF5D6061D94F58B204811502F4ABF040A00D01D3641BEED76E7529EAACA66E7101C5B55F11BD3F0D01FAF534AE62E860044C938339F414DDF9E0DDF79EDB997E34EC29FAB8D3480BCB9D003D8EC03104E8D763386B05817B02A64931713C81E7270F840D5F7EF3EDF19674DBA28565B7AE6118024F09D0AFE2018136044C936DB85FB8554BA614E7A394424919049A13A05F9BBB80011725609ABCA8E3DB757B367920CCF1F1D6539F5858B68B502D239041807ECD80A52802050998260BC254550A81D9E481487E158A4FE95958A6C4923208342740BF367701032E4AC0347951C737EA765CBB35DBB2E4D73B2CD47CA308D52C027904E8D73C5E4A23508A8069B21449F53C24108BA5D9CDD778D0B5B177F42C2C1F86930208F440807EEDC10B6CB82201D3E415BDDEA8CF1FBD7831DBF21FBEFC63238BFA6DD6C2B25FDFB00C812704E857E180401B02A6C936DCAFD76A640E2CDD19EBCBADE7E1606179BD57448F4F49E0F5D73EF9F3290D673402FD11F8D3876FA45F2EFFC9E79F93B0FDF9F081457BC44D137787C11FBF7CB9B4F92A796096CC0FBFFE596264C6D76F3FFFDD5F120B2B860002B904FEFA9B775EFFED37D3534FFF1EFF48BFE6C2541E81450259FAF5CD4FBF87F214044202C6EFEFE92B93954E85DC89EFA50E538D2BE2358CB4829AF5D43AB4BB47E8D753BCC28C3C2F8115FD2A7FE0BC6E65F9B909ECD9C93B77CFCF637DF828D624B17F5944BC46BFA39EF88E2AB6F7964E0328C8269A58DA79255E573837D9262FE8775521701102F4EB451CAD9BDD11304D76E7929F1A34EDC39552AE779D0D151BCAB81E81A87CE9C08168D499AF2BE42D2CEB85A59A112848807E2D085355086410304D66C03ABC68D68FC8DBAC0B655C43C2C6B66BECEFAEC86E3F79AFFBCBC2725B3C7B0A818309D0AF0703D71C027F23609AEC36140E10AF53DF4365164C2498B21D56B65DA79DD7CF5EBDEA967C0F865958F6E0053620F09000FDFA109102085421609AAC82B544A54BA7A596A8FBBE8E909B3B23211E0F119C92A73B89570B27FBAF3522599D081C4C807E3D18B8E610B0FFDA750C841CAC94F3BAD4ED0FDE7D2F9148D836FD09C13A69D648158824DD10C10F6D9ED20688D787A8772E271ED6AF0002081421E0FCAC22185582C08F04B2CECF727A519F4113BA70F627F869F3F29FBEFBE76D66FFFBB7FE5DE8D4F51FF7B7D59CF254DCB375D8A15D29F6745EC6F9AF9D3B8879D721E0FCACEBF85A4F4F43C04E589FAE7AFF9DB79F1B16E2F5BFFFCFDF6F16AF51613CFB3FFEF11F63D17270AFC3F26894784DC76EFF359D9592083424207FA0217C4D5F9A8069F244EE2FF5CD53A8D8109487753CB65DE50CE4D2B6B0CC25A63C024D08D0AF4DB06B1481D74C937D06C1C344D29D66C7FD5B3B6B48793C946B5CF066DB3585D55D190BCB0DD03C82C0F104E8D7E3996B11811F099826FB8C83D9FDD1F44FAC1E766A363FE1E1538905C278CA3591D552310BCB9D003D8EC03104E8D763386B05817B02A6C913C54429D1195F71D5D8DF9D646BE4B946B6803DD79D716561B913A0C711388600FD7A0C67AD20704FC034D9674CCCFEBE1FA2F3BFFCC75F85FADC6C733CFB9FFEEEEFE2ACABCD35C483A15327A97AFB139A35F20426D96A45B487EDED59188B60540902B509383FAB3661F55F8840D6F959213B2E84E63C5D3DECF2AD1B12875B75151D5901E032DEAE7CC798F108383F6B3C9FEAD1E909D87FEDD385B1FD76E4110101E18BAFBFEA13C535ADB2FF7A4DBFEBF5E908C81F389DCB183C0801D364B78E8C9FE30FB32D365F45C261B4531AB2B04CA1A40C02CD09D0AFCD5DC0808B12304DF6ECF8632E1A888D5E9F5BF516069613BD79843D08CC12A05F0506026D089826DB704F6B35BC535BC24E17D2A699A3D471042C2C8F63AD25047610A05F77C0F328023B08982677C03BE2D149C256CA857533D6112EDCD48685E5266C1E42E06802F4EBD1C4B587C044C034D97F24848F2217B6A08A75BF40FF4EB7B0ECDF472C442008383F4B1820508C40D6F959A18A48D862E88FAA688FB8E1EEA3BCB4B79D1F7EFDB3C42A9C9F95084A3104B61158393F8B7EDD86D45308CC10C8D2AFCE7F1543087448C0F9AF1D3A85499725E0FCD7CBBA5EC7FB25B06727AFDF5EB10C819313B04D7E720732FF2A04E4BF5EC5D3FAD91B01D3646F1E610F0241C0C2521820700A02F4EB29DCC4C8010998260774AA2E9D9F8085E5F97DA807972040BF5EC2CD3AD92101D364874E61120216966200815310A05F4FE126460E48E0F77FFFDD80BDD225044E4EE08377DF3B790F988FC02508D0AF9770B34E7648E097EFFF228EE9B1D9D3A16B98744D02B1A48C2344E2C5BC66F7F51A817311A05FCFE52FD68E46E0E3972F63CAA46247F3ABFE9C8A40BC8093727DEBCD374F65386311B82E01FAF5BABED7F34E08C494192A563A4127EE60C6A50884728D572F5E40CAF5527ED7D90108D0AF03385117462030A51350B123F8521F4E426052AE12064EE22E6622F01302F4AB8040A0230231954A27E8C81F4C1994C02D6160D0FEE91602E313A05FC7F7B11E9E8BC0944E40C59ECB6BAC3D0B8149B94A18388BBFD889C01201FA556C20D0230149B13D7A854D272720D5F5E40E643E02FF46807E150D08F44B40526CBFBE61D9A90884728DFC72A9AEA7721A6311582340BF8A0F048A11F8ECD5ABEF7EF8A15875FF5A91A4D8E24855781D02F5525DE3658F57FE3A24F51481AE08BCFEDA277FEECA20C620707602315F7EF4E2458DE378FEF0E51FBFF8FA2B17CF9E3D42D87F0C817813E332AD1A7BAE9372F5261EE347AD5C99C05F7FF3CEEBBFFD6622F0F4EFF18FF4EB950343DF2B1288DF2B6B4C9C6171A8D85FFDC35B154D573502E727E0053CBF0FF500819F68D63BFD2A7F407C2050854048CC373FFD3EB466F1DAA5131447AAC29108D4BB06365EE74F3EFFDCEA71A468D197F312A05FCFEB3B969F80404C7531E1154F8A75C6D6097CCFC4C309D4BB06365EE149B9CA1938DCAB1A44609E80FC019181C01104624FE8FD77DEAE94146B43E808176AA36F02951206A4BAF6ED76D60D4E6025FFD5FEEBE0BED7BD4E0884C4FCF9EFFE52299DC0C5B39D7899194D08D43B1B2B5ED8786DEDB93671AB4611582740BF8A10048E2350299D203A2029F6382F6AA91B02F5CEC60AE51AF9EB7ED9E8C6D50C41E09E00FD2A2610389440ECE5C48E8EA4D843A16B6C3802F5AE81BDA5BA0EC74C8710188A00FD3A943B75E62C0426155B239DC0C5B3678901766E2650E91AD849B94A18D8EC170F22702401FAF548DADA42E027046A9FB115D33CE2088C4440AAEB48DED41704F610A05FF7D0F32C020508544A8A8D8D5849B105DCA38A3E08544D7575AA6B1F4E66050219049C9F95014B5104AA1270F16C55BC2A3F2F813F7DF8468DB3E79C8D75DE9060F94508383FEB228ED6CD7313A897141B1BB11FBF7C299DE0DCF17149EBA784811AE2D5D958970C289D1E8780FC81717CA9276310A89A141B52207679C700A5176313A87A0DACB3B1C60E1EBDBB0201FAF50A5ED6C7F311A894141B206223367E8DA562CF171397B1F8806B602FC3524711189680FCD7615DAB636310A89A14EB78F6318264985E44B47FF0EE7B91EE52BC47525D8B23552102071058C97FA55F0FE0AF0904F612A874B77B9815598054EC5EF778BE0401415E82A23A10188A80EFB78672A7CE5C90C0944E50E3BE03676C5D309C7AEB72D5B3B1A4BAF6E66EF620508480FCD722185582407502713A41A5A4D8E9CA2E49B1D55DA88167045C032B281040601B01FA751B374F21D086C0ED8CADC8E72B6B818B67CBF254DB430295AE818D765D03FB10BE02089C9D00FD7A760FB2FF8A046223366E69AF944E10676C3929F68A5175609FAB5E031B0903B1CC3BB0379A4200810604E8D706D03589401102D349B1C53762C33649B1451CA492E704AAA6BABA0656C821701D02F4EB757CADA76312888DD898B68BABD85B3A819362C78C9BC37B7540AAAB6DD7C3BDAA41049A11707E5633F41A46A02C01C70F95E5A9B682042A05672CDBBEFCE65B07C015F494AA10E88A80F3B3BA72076310A842A0EAC5B34E27A8E2B30B545AF51AD8F8F18178BD4010E922023304E40F080B048622E08CADA1DC79E6CEB806F6CCDE633B02BD13903FD0BB87D887C03602552F9EFDE2EBAFE41A6EF3CB159E720DEC15BCAC8F081C40C0FDB10740D604023D12A89477185D75F16C8FFEEEC0A64A2127D5B503DF320181A309C87F3D9AB8F610E88480A4D84E1C710533AA9E8D25D5F50A21A48F08A41390FF9ACE4A4904CE4A4052EC593D7712BB0F381BEB2424988900020711A05F0F02AD1904DA12982E9EAD7A526CDB0E6ABD15814AD7C046C2806B605BF954BB08F44F807EEDDF472C44A0188149C5BA78B618D06B5754F51AD80854DF085E3BBEF41E813502F4ABF840E0720424C55ECEE5A53B5C35D5356E4576AA6B698FA90F81D108D0AFA379547F1048242029361194624F094875150F0820D00301E7BFF6E0053620D09240FC0AFCFE3B6FBFF5E69BC58D70C65671A46D2BAC7736D667AF5EC91668EB5CAD23D02101E76775E8142621D00B81D8889514DB8B337AB543AA6BAF9E6117021725207FE0A28ED76D04EE08544A2788567EF9FE2FFEF4E11BF1BB33E667245035D5354E1890EA7AC6A8603302CD09C81F68EE020620D017817A17CFC689487E26EECBD9ABD6B806F644CE622A024312707FEC906ED529042A12A894E918164B8AADE8B672550B80722CD58400021B09C87FDD08CE63085C9640D533B67EF8F5CFA413741B5A5513069C8DD5ADDF1986C0B908C87F3D97BF588BC0A104EA25C57EFCF2A5A4D8437D99D098B3B11220298200025D1090FFDA851B188140E704EA25C54A27E8C1F5525D7BF0021B1040E08E80FC57218100020508C8892C00B1BF2AB8B53F9FB00801047E2420FF551C208040010292620B40ECA90AA9AE3D79832D0820904140FE6B062C4511402008488A1D200CA4BA0EE0445D40E0CA04E8D72B7B5FDF11D84820AEFAAC7465575C631B9F76C52FDA1B2DF3580281C01B906BDC181CF7114460B80936C1098A2080C02E02F4EB2E7C1E46E0CA046AA71350B1C5A3ABEA35B0713616E55ADC652A4400815902F4ABC04000815D04EAA513B8787697637EFA70D55457D7C016F494AA1040208580F3B35228298300028F09D43B63CBC5B38FE92F977036D61E7A9E45008186049C9FD510BEA611B81601873175E5EF4AEE8815C597DF7C1B5BEF5D7596310820301801E7670DE650DD41A05F02533A41DC4A50DCC4299D40526C22D8AA0903F19116F19AE808C51040A00601F9AF35A8AA13814B13888F782A25C5C627F392621FC696B3B11E2252000104CE4E807E3DBB07D98F40A7049CB1D5C43195CEC68A840167633571A8461140609600FD2A301040A02201676C5584FBD3AA2B9D8D15CA35B2419CEA7A981F358400022904E8D7144ACA2080C02E0295D209C226E9040141AAEBAEE8F43002089C9000FD7A42A7311981131298D209E237E8D8CF2B6BFE7465577CDA1532AE6CCDFDD726D5B57F1FB11001046A10A05F6B5055270208CC1390145B3032A4BA1684A92A0410381701FAF55CFE622D0223109014BBD38B95525DC32AA9AE3B5DE3710410388600FD7A0C67AD2080C03D0149B11B62A26AAAEB9B9F7EEF54D70D4EF10802081C4F807E3D9EB9161140E06F0424C5A6874228D7AA0903946BBA2F94440081E6045E7FED933F3737820108208040A59B4E036CFC267E767156094E7C4BF7D9AB57B18A107E082080408704DC1FDBA153988400023F21503529F6BC17CF86720DE3E398B0E2E122D5B53852152280C06104E40F1C865A430820F09840A5A4D8335E3C7B4B750DE31F83CB2911CA350E323BFB9E744E8F95450081D108C81F18CDA3FA83C0180442BD7DF4E24571E91670FA4F2788BE7FF0EE7B35F65C250C8CF176E805021721B0923F40BF5E24067413815312A894F7D9B38ABD60974F199A8C460081FA04E4BFD667AC050410A840604A27881DD3E2757778F1ACB3B18A7B59850820302A01F9AFA37A56BF101884407C1D5F2F29B6938B675D033B48B0EA0602081C4540FEC051A4B5830002BB09C46FEBEFBFF3F66049B1951206A4BAEE0E37152080406302F2071A3B40F308205084406CC4FEFC777FA9944EF0C3AF7F1652B2889D8995B80636119462082080C01D01F903420201044E46603A2936F6178BDB7D5852AC54D7E2BE532102085C8A00FD7A2977EB2C02E310888DD8F8B4ABB88A8DE484AA49B1525DC709413D4100817604E8D776ECB58C0002FB08C4A75D95D20926155B3C9D202A8C6A6BE4EF86940F146E82DD17509E460081D310A05F4FE32A862280C02C81535C3C5BF51AD8C8A6A05CBD1D0820702902F4EBA5DCADB3080C4BA0DE195B3B93625D033B6CCCE9180208B423E0FCAC76ECB58C0002150854BD78F68BAFBFCADAE9743656050FAB120104AE42C0FDB157F1B47E2280C044A092708C9AE3F4AED8EB7DC8B99201F1BDDA97DF7C9B62C0430B15400001043A27E0FCD7CE1DC43C0410284CA076526CECF22E595CF56CACF8488B782D1C2BAA430081131290FF7A42A731190104D208D44B8A9D3D63CBD958696E510A010410D84B807EDD4BD0F30820D03381E98CAD7A27C5DECED8AA743656240C381BABE700631B02083421E0FBAD26D8358A00020D0854CA49ADD413A9AE95C0AA160104CE4240FEEB593CC54E0410A848A05E526C71A3E32B31A9AEC5A9AA1001048621207F601857EA0802082411A894149BD47642A12961C0475A09A814410081EB12A05FAFEB7B3D47E0B204EA25C5EE412AD5750F3DCF2280C0A508D0AF9772B7CE2280C0BF1198546CFC52DF0394296120EB72841ECC6603020820D08400FDDA04BB461140A01702533A4143151B4DBFF9E9F712067A0908762080C01908D0AF67F0121B1140A02681D8F56C92142BD5B5A657D58D00022313A05F47F6AEBE2180403A815B3A41C8CAF4A7B69594EABA8D9BA7104000818900FD2A12104000817F23101BB1B59362A5BA0A38041040602701FA7527408F2380C080042AA51384727536D680E1A24B0820703801FAF570E41A4400813310287BC6D62DD5D5090367703E1B1140A07702F46BEF1E621F0208342450E48C2D09030D3DA8690410189200FD3AA45B750A01044A12D87CF1ACB3B14ABA415D082080C0BF12A05FC5020208209044202B29D6D958494C15420001043611A05F3761F31002085C92404A52ACB3B12E191A3A8D00028712A05F0FC5AD3104101880C04A52AC54D701FCAB0B0820D03F01FAB57F1FB11001047A247097142BD5B54727B1090104062540BF0EEA58DD42008143084C49B14E753D04B64610400081BF11A05F8502020820B08B40A41338D57517410F238000029904E8D74C608A23800002082080000208342540BF36C5AF71041040000104104000814C02F46B2630C5114000010410400001049A12A05F9BE2D738020820800002082080402601FA351398E2082080000208208000024D09D0AF4DF16B1C010410400001041040209300FD9A094C7104104000010410400081A604E8D7A6F8358E0002082080000208209049807ECD04A638020820800002082080405302F46B53FC1A47000104104000010410C82440BF6602531C010410400001041040A02901FAB5297E8D238000020820800002086412A05F3381298E000208208000020820D09400FDDA14BFC6114000010410400001043209D0AF99C01447000104104000010410684A807E6D8A5FE3082080000208208000029904E8D74C608A23800002082080000208342540BF36C5AF71041040000104104000814C02F46B2630C5114000010410400001049A12A05F9BE2D738020820800002082080402601FA351398E2082080000208208000024D09D0AF4DF16B1C010410400001041040209300FD9A094C7104104000010410400081A604E8D7A6F8358E0002082080000208209049807ECD04A638020820800002082080405302F46B53FC1A47000104104000010410C82440BF6602531C010410400001041040A02901FAB5297E8D238000020820800002086412A05F3381298E000208208000020820D09400FDDA14BFC6114000010410400001043209D0AF99C01447000104104000010410684A807E6D8A5FE3082080000208208000029904E8D74C608A23800002082080000208342540BF36C5AF71041040000104104000814C02F46B2630C5114000010410400001049A12A05F9BE2D738020820800002082080402601FA351398E2082080000208208000024D09D0AF4DF16B1C010410400001041040209300FD9A094C7104104000010410400081A604E8D7A6F8358E0002082080000208209049807ECD04A638020820800002082080405302F46B53FC1A47000104104000010410C82440BF6602531C010410400001041040A02901FAB5297E8D238000020820800002086412A05F3381298E000208208000020820D09400FDDA14BFC6114000010410400001043209D0AF99C01447000104104000010410684A807E6D8A5FE3082080000208208000029904E8D74C608A23800002082080000208342540BF36C5AF71041040000104104000814C02F46B2630C5114000010410400001049A12A05F9BE2D738020820800002082080402601FA351398E2082080000208208000024D09D0AF4DF16B1C010410400001041040209300FD9A094C7104104000010410400081A604E8D7A6F8358E0002082080000208209049807ECD04A638020820800002082080405302F46B53FC1A47000104104000010410C82440BF6602531C010410400001041040A02901FAB5297E8D238000020820800002086412A05F3381298E000208208000020820D09400FDDA14BFC6114000010410400001043209D0AF99C01447000104104000010410684A807E6D8A5FE3082080000208208000029904E8D74C608A23800002082080000208342540BF36C5AF71041040000104104000814C02F46B2630C5114000010410400001049A12A05F9BE2D738020820800002082080402601FA351398E2082080000208208000024D09D0AF4DF16B1C010410400001041040209300FD9A094C7104104000010410400081A604E8D7A6F8358E0002082080000208209049807ECD04A638020820800002082080405302F46B53FC1A47000104104000010410C82440BF6602531C010410400001041040A02901FAB5297E8D238000020820800002086412A05F3381298E000208208000020820D09400FDDA14BFC6114000010410400001043209D0AF99C01447000104104000010410684A807E6D8A5FE3082080000208208000029904E8D74C608A23800002082080000208342540BF36C5AF71041040000104104000814C02F46B2630C5114000010410400001049A12A05F9BE2D738020820800002082080402601FA351398E2082080000208208000024D09D0AF4DF16B1C010410400001041040209300FD9A094C7104104000010410400081A604E8D7A6F8358E0002082080000208209049807ECD04A638020820800002082080405302F46B53FC1A47000104104000010410C82440BF6602531C010410400001041040A02901FAB5297E8D238000020820800002086412A05F3381298E000208208000020820D09400FDDA14BFC6114000010410400001043209D0AF99C01447000104104000010410684A807E6D8A5FE3082080000208208000029904E8D74C608A23800002082080000208342540BF36C5AF71041040000104104000814C02F46B2630C5114000010410400001049A12A05F9BE2D738020820800002082080402601FA351398E2082080000208208000024D09D0AF4DF16B1C010410400001041040209300FD9A094C7104104000010410400081A604E8D7A6F8358E0002082080000208209049807ECD04A638020820800002082080405302F46B53FC1A47000104104000010410C82440BF6602531C010410400001041040A02901FAB5297E8D238000020820800002086412A05F3381298E000208208000020820D09400FDDA14BFC6114000010410400001043209D0AF99C01447000104104000010410684A807E6D8A5FE3082080000208208000029904E8D74C608A23800002082080000208342540BF36C5AF71041040000104104000814C02F46B2630C5114000010410400001049A12A05F9BE2D738020820800002082080402681D75FFBE4CF998FFCA4F87F7BF77F7DF0EE7BEFBFF3F6F46FDF7AF3CDF8FFEF7EF8E1CB6FBEFDE2EBAFFEEBD7FF614FE59E4500010410D843601AA2A3866994BE0DD1F1F718A5E3FF7FF50F6FEDA9BFAB67CD475DB9833108EC27F0D7DFBCF3FA6FBF99EA79FAF7F8C7EDFAF5F77FFF5D0C88D368B8F4BF10B29FBD7A35A9D818593E7EF9F2AEE4279F7FBE47E3FEE9C337960CD859F37EE86AD840603648A29E373FFD7E436D1EB92681A5285A1FA96E7A6EF3C27B73BBFB9B9EED5ACA103D3DF874A03E69CCA474B6F67C745274A733DBBC7F3A97ED317845BF6EC91F88613A02E897EFFF625DBC86C55120346B8C2C7BAC5F7976DA3F98FDDFB4E5E07FE722B0E4B508B9737584B5E722102355FC89312DFEC490F5C3AF7F1643DC015137B57BD7740C983B9B4E1FA227374D03F5315D2E1E18E99DAD3D1F15EF9A0A670998F705C644205BBFC6D81A23DD43E5FA946F4C099524EC2D6FE1B93B6313858F4F4760C96B7B36E94F0781C13D1098B44E08D99D5272435F260DBD79CCDC30443F55B1C7F77703A2DB231B3A5B6F3EDAD311CFA61330EFA7B31ABB649E7E8DC1225EFE0D44E2A9D9ADB59DBBA4D6611B7CD1F3233BE3A1E7AEB1EDA404F648C93D5D8E3173837ADE3C44DF4C8DFE9E45C26EEE6CA5F9688FBB3D9B4EC0BC9FCE6AEC9219FA3506B56DE2752238FBECCE5D52EBB0C1A273291ECE32A10EE60EDDB98D5D9B77437732CC52939BF5DC9D91598DEEECE0E6C73B9C8F36F7C5835904CCFB59B8062E9CA15F3F7AF1A23710D661BD7964A73D4BFBAFF2077682F5F84E02B1FC6EB5884A54933BF5DCE9246C87F3D1CE18F3782201F37E22A8E18BA5EAD758D9AFE4BCC6779D7FF8F28FF1C97F7C273EFD89BFC7BF897F5F95A0755855BCC7576EFFF578E65A4C24D05030A534FDFC7497A7FD7A3E3E4F43F44ADF531A4D4457BC589FF351F16EAA709680795F604C0452CFCFDA7C62C5FA4F5A3180EE397D70A5F29D358B8F2604961CEAFCAC26EE3869A34BE758AD9CA937EDAD4E4759AF2CD4D74FE5DBD06E347A6B7A3D3B6BBDE995913036117EFEBBBF2CB9325A0F9D7ABA5308FB9C8F4EFABE9CCE6CF3FEE95CB6C7E002E7676D1EE0429EAEACF2E5BFEEF1EB78CFDA7F1DCFA7A7E85124A8C49F18AC42EAAD8C5735BE2FBC351D8BB495A6577643573207A2C215F11AAE89D6A3C0D20F65EB7BBA0D3DDBE77CD410C8A59AB6FF7A2977AF7436297F6029F12B06C794C4C47509BBC71331F24EB90ACFFF3FC5B03D4D7BB60601F9AF35A8AA338BC0CA78B532716635B154389A8ED16CF6BFAEEC0A2FBD35A14A137FDD5ADFA02DD2B58295743B1F15ECA3AA560898F785C7442049BF2E8D8FE9BBA7E92537386692AACFFF7F43551E694BC0FE6B5BFE5A9F0884ECAB9DBBBF843AC6B1A55DD825DDB69478B0BEF37A67C0926EEE300BB6F3F9C84B740C01F3FE319C7B6E2549BFEE3F553E426D763EA8F17B5CCFB8D9B64EC0FEAB08E984C0EC37CE59F7B66CEEC8D2783BFB762C1DECB5FE6DD673DB9686E8E872AB831796009A8F3687960711188940927E2DA23267E783AAFBB223F9E9227DB1FF7A1147EBE60A8122B94F1B86D6CF5EBD9AB5AAC8F85FD0E345EC311F15F488AA10684220E9FC816DDFD5DEF567F69BC1F58F6A9FD6B064C32CB57A870F8419D347CAD1EEB41933ED2BC7681813C6D38967B6BF0FBF059EFD60629652BA257B026B6A256A78DAE55BAF673B9ED85CDC2D945832AB584A44D58BE715FF66F577E9BC855977DC22304025E63BDEBD597721FD34AAE3EF77819DE58E26859BF8377A5AA4DD89D8ECF7F5B3C3DA6C5C6D1E00676B5B1FB58E777111CE3BE7A3E7BD7E3E2017798F5A8D1B4B273CA40CB029537F944989D26EE7FDC9B9CFE7FDD99777CF1B5429AED65FDBC4793F2A29B2D85E37A6C0F903B30D64A546C52C185EBCFB73FCD8B7B9C5F068BCD2A12F23DB2C94EBED97C4E9EFD395E551E080DFDA522CD9795D50341135C4D039F5F7AECBC170EAF5ADE351F298BE6F76DFB91E7C1E454F9DBE1481D38DA389AE9F5C3C1BD237FF4EAE9F023BB1DA7371CEB576E5E0F4DCAA8A942F3EDACC661D1C9335B11F4893F9A8ABF7A8E0B8B114EA1B36BF97BE7ADCB0D8DE1F24B9352CCDB6D320596F786C12575367D3E7FDDBD4507C204A745352FEC04A6A54FAAC361DD472F7275DBC6F786D12113C2C768BE087E3781458BF2DFD610D0F8D09E0D1C4C37AE2BDDA26289F6A9A87C63C2D30F57D5BA3590DF55CF8A15F128D7FFA5EA487DF5479CA0FC753144D3A38C5A469A44E17C72975765EA6F65103EBDD4FF4CB5225C59541ABF969B6833DCC479361BDBD4705C78DA510CA7D2F2272668339F1FBC8B3CCFBD3845B6A4C3B3EAE7267995B4F0FDEBCBB239CA45FE399A5D5D8669D94EBE9945939B7CE94F2D3EF1759D3C94A2827BEB44B86C51BB27EC8F99DA08C0D89F48967DA704DD734B3464E2A36BDD114179CA8CC4EFFDE7A7A03981B7E61C0FA9A701AA7D2A3E80EFE61EF7B5BA72F5DEF545C17CE7633FDF5999DDDF70461AB6136D7DDCDE7A33EDFA3B2E3C66C20E57ECFB724409792ADEF22A1554026EE13DD4DB8FB256C93B8DAD0D9E72FEC6DF32E7DF8CA7DEB9F974FD5AF2B6134F0C6DBA41E36509E16251B1E5C7964FDCAC4253599F89BDA1E4DF3BCE92B4BD8224E9F34E886F05B9F1572D5F03597284BB7FBE47ED1BF3912D2CF87CADD0C7B68D2D2E2A7E136D8ACCD6DE7A36EDFA3B2E34691EFF9964234FDA7D787415BBCC0FAA5A12BCDC5BC3FFB8B74E2FE5793B8DADCD9590E217B12254711AFA5EAD7955309273B6E2A363DA3A04807EA55B2413D5435669B204E5C2E174FECDBA6FBEB013C57CDD31276C340B0322B948DE7C1962801E79670B6F4A21DB6F9BAED4DBF45F8CE7779CFF6ED616F59C3F9A8E7F7A8ECB8B13498A4AF9A9692070E5B0A6E08C89D7A6E164ECA3BD524AE767676166FE2CEFA06D76CDF7F8D2753AED17A9A2757761BF9F80D800DEAE1A14B12D761CFEBD9634CCAB335E6E66156320FDD7A2BB0D9BF774DFCD377FFBC61BB7D6556283B384ED6A6C4553ABA034A86E68E0C99D93FF19FD61382978EF72F6BF6F443DE6C9DB39921A5E2ED612FD225CBC3AA4A1568321F75FE1E151F3796BEE74B9CDCD37F49588A8A83E7FDE8D7CED5E3F459736E903789ABFD9D7DDECD87096CB964D6CB279D9FF5B48AA5633596C6DCD80CA8A18D6ECDA51F349305EEE1BA245EECA7E70A4DEF73BC6CEBD1BFEDFCAC68EBAEDAE7ADAF379D72E8C9D2815FD1AFE99490F8CBDDF701D3B94B2BAF6B4ABB4FFDB2F41A2F9D2795E5D35BE1A556B2ACDD703EDA736B572C79AE63A6B9E4EE34ABA8E1E68515FBD75FDBD983609ED6BCC479CFB930DB7C97F254D9C920FA183B0A293F776E8BABC4A123FDF0ACAC307ECEB34860A7B8A9489983E7A34EDEA3C3C68DA586528EBE0AFF2EE1DA3F9E579AF773FD9B3248068787E3E4C376FF8FFFEF3FFF5FFFFBFFF97CFE0D71B572C2DA7ABBEB2267D21877937EFCE36DBC8ABF3F9FFD770E3EB363C2CAF959D9FA351A78A8ED9E1B9118EE1B46B4B2C71FDE0C588989877D59E1B34DBFC653378DB8D2FACAB49D18554F7B7D2791575C13EDC656DCAC8A7DC8EAAEDA257489F627C6CF369D9162EAC3712AA59269BC7BCA330563746A4963AD07E44371B6E2DF30B5AC6B123DB85EACA07E4D21FF705DB4BF534B715563F43B977E3D723EEAE73D5AB2A4ECB831C5EDACB44A19E8766ADFF5B7E6B0C8BF99B13E143C14452B92BD555C2D89E6DC41EFB6779612151B06C3C2E7BF86E48F492B25A5E3666BBDC377B2CC4864B7F2C37774FCE176F2063EEB86A588D7699DB4F42B67E2AF30D30E5FFC7FBC6CD18B943DA7A9DD52292FFB6F864C747127C596FA7BF37884774AC84D5E58EAD4D28FBF51739C67F7D0CBD3C9774BC909A7CB2248777D22F9F40A37979C7DBF967EC36DF5C9F6E6DEED7C70C378BB6D3EEAE73D3A66DC98FCB27491F2C31482FDC9032B815163DE5FF26FCA20BC9ECDB26E6DABB82AB2E514B3C3ED052C2503D20784D4EFB7EE6ABC4D69596154E3F09D0DB9260FE92CE500C414FE70B29F2A8F62C5EF4F0FD40FA5F3CE8CFBA87F52AE0F113D8F87D948C84D9B5B1AF21E8E95B906572A9F1B8DEBEB8A69399B18724B3D5ACAA34D0FE6A9E6A5013AF103C14AC0AB56DBC979C6B99EAACAA4CFCA0F988FBA7A8F0E18376E8E5ED2CA0FF74496BE64DA39A04D86E58EB40FE376E57B8387BF50AD8F90EB4D7715570F292D15985EC0229ECDB261A37EBD392C8C8E5D8AF4CF0923ECB20E257DD8992C01FDB0B628B0249552E4E3C3FAF7581BA81FD61F05F6349152FF52999D5F3D4FD59E7DFF3517FEFA565991E5ECD22CB26195128FCC76F0E14CB627AEDA3EDBFC70C0ACDFF2DAB26ADE7AC467BDF9A8ABF7E88071E3E6CDA5DB22D6BFF488697456621699266A4C732B9BA0E9B26C69845C7935BA8AABB03377CBA9ED5BBF4BBF4EA64F1BC8B16F17436DCAFC5DF688FBE2EBB09DE72D577267FA0AA1D40051A923EBD50EAC84663BBED2DF52BB6EB32FC866653C1B5D3BBFD86D1269598D961DB2129B7EF8AB65FAB49AD8E218C52ACD475DBD47078C1B4F8361694E59F9596CC9C20DCBE6D9B02C3EEFCF5618EF60EE5B96FBBB6BC3B89A556B61CF745BF8297EF3DCF2FDD6FA30377D91F7704A2B95EA5BFC3BC4CDE9EA7758367C06B1FF03ACB06143BB290E7DBA324B1F3B72BD5CE4CBAA87D37091568A705EF1F8FE4F748343C12F99D6A976F515D736FF4E0357747365EC5AEF6629DAE99F4E1EF6154BEE8BFCF01D3CAC4091F9A894671FF63AF13DAA3D6E3CB73337D24A4DA34BC4CACEFB053F359BAD6AE9F5691B570FBF390BB327397E77E8CDC3302E5BA0F0F75BEBC6252E7F430315391F345D4BED615A6A53739BB51B56817B3A3B3D1BAF56382886ADE95CCCE95ED96D87DBA51BB3B46ACF5D04A7B758B664AE7F97FA9BF23B468AE587ED671FD6504AAFB7959906AEDB4F49B395D4B8B5217C1D7F42B3C69F902F599F4E6EEBE9FA53B33F20961A006B187CC07C7458782736547BDC788E74F607C0A595DE52F2C0E69F7D9EDB933BD2AE0749C1DDE2ACA92AD1DDFBDF9AD9861EEE8507E469EABF9D9C3D6DCDF6B33B5B207F6009EE948DB4F2C37770D9BF475D6AA6BFF5A2EC8B7107679BB5074F1E119D11A6936CDDFFE664D5B094D7B53F4EB2CCD85C38D7BF4BFD3DD8E39BFB7B7BF05C59530FFBBBF235F186296752A54B7F62908C3F9374CE9AFCA217B9F1F6B0E3031738663EDA0930F13D3A7EDCC81A990FD8863820F23737B1F9C19DC1B3F2F84A766F56A3778AB679A64145FD3A7199CE565862B46132B8ABAAAADCCC726DCF851329854C8C889CB65A9B74E78081AF49BF72E3FF6A472075E594DBC095B5E7D44F171235D092C1ADDEFD6300D69E8F8EE945D5A3A966BBB0B4B29A3D3E6F76E323FD138E14863D4769EC3E4C3FAADCFE74BB1F116EDDE39749CE4EBBB3457E4E4F71FDD332D5F56B34B6722EE9FE1DBE0ED73AB93E78587EBF9A49A134DD5DD9765CC85AE53FE456B5C04E9530D9B6DFB3EB7D2C62640AC6B6619362E18632FD4763F179F10A67CA6E988F7A7B8F6A8F1BB32FCBACD079FEE21F134229335AFA2B5FD6BFD34EFFD33F4BBFD4976D77A5BF2BE3F386E393671BDA76A672BA8F664B26E9D729E3E1E99FDCDF7357647E6E5577DD38D7C4D9ADB50F53B977C659E2E367DF7FCDF5EFFEDF1FD6C116D737897E1CA3D8D29E536DAFEDA41741B87350DD6940EDC78F9F8F7A7B8F9A4460E2726ED6B6E29F70E48EB47D8E939DC4D5B6E3939754EC911BB149FA75CAE17DFA67C3A53B95968C65D761E192E2153E7573D5CA374F1BEBE275FAB8249240A63F4B697C7B7E86B8599E38446EEE69C10797CE5BC96AE2ECE7DD6675F68C85FB7C611FBE2F9B519F6201D9F37CB4997CD6834DC68DA58360EFC4C0EC6FAAC5855AE72F6696373B293C6D1B4F07A1269E85BA24610F5B3F27E9D7AA7C772E25CBAEC3967ABA3FCFA12AC38795AF508A505BEADD7402E5F471490C5ED39F876DED29708AE9333A58EAFD5CEA6FA9FA977CB1F239D1E6FFB4C7EF9EDD46202B2B31A58903321753CC6858266B3EDAFCB2AC3C98D2F756E3C6C3C34D8F491E084407CCFB0734D1E7F83C7D4B3A69D9E976AA49CEA6AF19221131258CF797D9A85F37FC445549FAA4334D84B5E1ACE6C49A1B165BA1B4341446C866DD0857249567CFFE6B6DCDF7D47D5993DC8ADF6BEFA3ECE1D9305CFB69BAE11C960861F6D5DE66F6916F5062EF128BD59E8F7A7B8F6A8F1B4BD897DABDFD647C4CF240985776DE7FD8AFC438CC2DD65B5C3DB7FF76AAE094CE7B53B40FF91F33986CD4AFD1CFDA537862286C1BA937488A0D2913CF5B296E6D22A59562B3BA73C3AD95CDBB1601195F41DE4EF4A8FAFE2CED58E74228F5122DF9F7A4199CFBA3BA480D5543A8888551C9D2999A1BB2D09686B84AA95FA5084CF5947A95663BDBDB7B54AAB3B92E584A21B84D22C7240F84D9B9236D6E4FA7F2453665569AEE2DAE52284D8AF69669B024648F09D1EDFA35F727F54A93C1C375408A4B9E96597A45E385D93025DCB55EDCDADCDE254AEADC196B3F99FD1D9902F276A247FC84115A76B6DA9DA3C64A6773FD7BC0FA7BD6A422472FEF7759E7351C7F4AD106204BC1BC617C5E4AE9AEF4D3D986CEAE3CB2A1BF590674F51E1D306E2CC1995D2F4DFBDF4B53FCC373F2B31C3115CE1D69D79B5899F42BE9969B3D5DC555AE2326213BFB546DE93F35BA5DBFC6C34BFA60B63F95F4788D75D8520A410C9189422D82FE18FF2506DC12A5222FE74A066DA279B7629B9565918EA4585BB0B3D1DC01F9BE4BFB739B7F4F980E094E6175EA329D9CC891C270E9D3C92C372DA5AC15BC3329A52F7BCA64F537773EEAEA3D3A60DC5872C4CA103D3BA494159A37AB8ACFFB4B93FEE62BF712C7C9B67135DD55B473F6ACE4E294A160977E4DDF925C9AF5F71FAB5183DDCA7A3145C2F67090EA9DEF97286DD68BB7FAC3B36593B597D6A3EBD13C3B74AE7CF4BAAD95E8EC66D9376BFF01FB282B5B0B59F3FD64FF2DB6373C9B321E75526645BCEE1FB28AF771298AD2C7E7256F76D8D9157AE9FDDD301F75F51E1D306EAC709E5D2FC57ECDACA6ACB4FE293EEFAF4CFA31E6E72ABCF471B2615C4D6F41786DFAAD32B78FEBE358F11327669BDBA55FA3C6E8FFC39EAFCCFAFB3B597C1D36615ABFF676BA6DE2E92F26D3DFE35FC67F5AF925AB92B5C567C494DF97A7F56559F11A1D590A8915C114FF6916EC4A16C48656A630BE3554F0BB99E7EE2BFB8BEDD214127D49BF37655AA9DF623B5D2B140FCE4A1526BEC2FB87ACE2F6AF9CAEFD70BD3DBDC54BE352879D5DA757753EEAFF3D2A3B6E2CA19E1D579742A892493566D2A5497F5278893FBD6E18275BC5D5D35DFC9B8A9D844DFA18B5327AA457B2B9E4EBAF7DF2E7870FC724F7B04C4CE731D84564DFE275A2F074CA7F5E499CCE9018DF45F6F9D29B0B536B3826282DE58B448B4B7DCC327B76EB68A5DD956EC653D3ABF5D4476164C4FDD26AFBCEC5EBFD9D0DAA1547DFC5D8BA25EB4DAF6FB03D8DE4D9309E2C79BE50596934E5255A7FCB367C5477ABF0E111BF53979FFB3AFE4DB87B69499615990FC79052058A8C154BC6C417B84BFFA9C8FBBB0DC2C32E47F03C1F9C573C1B666C7879B7199FFB54CAAB54693E3AFE3D4AE96CBD7163A9E6C4C971CF903535FD30B05382277D987AD8AFA53971E738797C5CAD839D5E9FE8D4CAA410FF7565AB2E9DF9430FFEF537EFBCFEDB6FA6624FFF1EFF584CBF3E34E27981ACE03E388E4BBD3977BD6EA55FC38CA579B708D825EF6F9B028BA41E3E7C7FF64C0C51F9ECDCDFAD7EBDDB3CDEF0B6CE3EB2CDBFA55ACFD591FBDB5D0FAA86FAB5C678F5F00DDACF735B0D7BDEDC951653E6A3E3DFA3FD9D4DE957AE231287E8FD2194D8D0BAFDE966549A0D1F8E93C7C75511B065E7FDA5DA56F4EBDEFC81DCB8BF950F8FD6F82C71B33DCF1F8C4DC788FB821536AC6A255B6829FF26D7DA22F76F4D8DE69E7EF0DCD494BCBDCD06A7549E4BAF76F9F0726CA5174F1A9B64536DE33BA93F0226F1C7A22606AF64116CB0277DCADF5079878F24CE47DEA3F421BAC838B97F2EC80AB6B22FD1D3A6D7C7C983E36ACA7CCD229355B852D2F3731B36EAD7E94A86AC2EDD15CEED61EEE7A27B6CBB3DBB59C22EF1A991B5B3BFA7B9BE78DE6259A1BF19FB64D8ED279E75329B974F2BB8AAFA77E78916C587C86953A16749B7FFD5B8D5506313ABA079535511D23B87E5A99ECE95FA736E47CE47A77B8F768E1BB3519AB2EB71BAE4E9DB4B54763A4B1C278F8CAB7A32FDE0D163A37E8D5722C6CA6DDB39F1D486C5FDC1EBB0A712367E79CFEAE9CA5497554FF1E96DA9C29DD1BCC19B0FBBB6D9A449BC268AAA0DE3D47A67ABFA77FF7C105842719692382B99DC0FFD7BA202812B9CBE79B573704FF74BD81375F6C6F6E0F9E85CEFD1FE716336861F56DB6ACADEFFC64D1B284506F3E91ACB44938E8CAB1828A6BB61136D4B2C76F0E8B151BF4EB1BB612E4C5C8B24C23AAC58F43425A02769DEE154F7705F70DBB417FD0D719F2816739D35BD605983486E74E56EF4D650EAB958F697DF00F669A3DD06F97E327735DC946BA5082F6EF0D30DA4AC17677A70DBCE42A55E6455DB643EBAF87BB43ECD15491E881868F2BB6BB4BB5F4A6E1E270F8BABE8E34DC56E182EEEDED026A3C746FD7AFB49229DF5D4BDF4B548D6F87540E129A0A7254BF4E5E6EFE9EFD354D7EDCFA929D199B520BBF5B72AF9F441647374252EB5A3BFF5947A5586B395DF823925306E35DC209F4BCFA5E09DDEE2E9459E623BDC1D6FC4497B7A7B7112FD7B76CFB69A8F2EFE1EAD44D7C3DDD994B732CAB4DDC48D1120C68169C64F34F8B60EDC23068E8CAB49C53ED536E93D9D4A36143F49E70FA4F4E7769851149E76FB2697DF4E6138E94C90D2F7D932B9E7586D6EA8C683D35977D3AC70E7CDA7A7F0D4687AA9CE95002B62D24AFD1D6EA89725FFDCDD53FDB757B808E1B236AB2D91C014D8D3EB7C777AF1C0837393F9C87B941893672CF6F43DBA4D8BC78C9307C7D5F4A9D96DD078DAD99B8E3F72E8D87B7ED619A3ADB9CDB327C94D3F7037B78D01082080000208208040E7047A3C3FAB736493797BCE069A4D392DF5ABCA29E831120104104000010410A8416063FE6B0D537AAB733ACA38F1D6B83BE3F708DFDE38B0070104104000010410E88A00FDBAE88EB8F936FE5BCA85DACFC56B08DFD97ADB66A37715798C410001041040000104B611A05FE7B9C5B6EB2D0120FE326DC4A6ECAAAE5C4057EA48916D9EF6140208208000020820300601FA75DE8FCFEF2C898DD850B1F155D62464EFB46CFC63FCFBF8AF4B3BAFD1CCFE6BAEC68839BD400001041040000104F61028767ED61E237A7B76F6E8AB9D463A796027408F23800002082080C0A508387F20CFDDC52F8C0EF16AF335CF074A2380000208208000020B04E40FCC8089235AB3EEDB78185D215EAF767DC343260A208000020820800002DB08D0AFF3DC42C2C6AD68DB983E7DAAC9A5C0FBCD56030208208000020820D02D01FA75D135B7BB8F373B2F14F09E4B9037B7EB410410400001041040606002F4EB03E7DE546C7A4641940CE5FAE6A7DFC7B303878EAE2180000208208000024D08387F20037B1C92F5C1BBEFC503D3075EB7036227693BDD0D1B37144875CD60AA280208208000020820304760E5FC01FA55C8208000020820800002087447C0F959DDB9844108208000020820800002DB08C87FDDC6CD53082080000208208000026D08D0AF6DB86B15010410400001041040601B01FA751B374F21800002082080000208B42140BFB6E1AE55041040000104104000816D04E8D76DDC3C85000208208000020820D08600FDDA86BB5611400001041040000104B611A05FB771F314020820800002082080401B02F46B1BEE5A45000104104000010410D846807EDDC6CD53082080000208208000026D08D0AF6DB86B15010410400001041040601B81FF1FFB4A06ACBE6942F80000000049454E44AE426082504B0304140006000800000021002538FA35BB050000BB1B000015000000776F72642F7468656D652F7468656D65312E786D6CEC594D6F1B4518BE23F11F467B6FFD159B24AA53354EDC4093364AD2A21E5FEF8EBD53CFEEAC66C6497D6D7F01823B07242EA88044118706FE4C005138F42FF0CEECDADEB1278DDB0481441C293B33FBBCDF1FFBAE7DEBF6D38493632A1513693BA8DDAC0684A6A188583A68070F8FBA375603A234A4117091D27630A62AB8BDF1E107B7605DC734A104E953B50EED20D63A5BAF545488C7A06E8A8CA678AF2F64021AB7725089249C20DF8457EAD56AAB92004B039242826CF75103910227BB546B2A630A51B03191B1CDF15FAA953908B93C3412684138C393DD9D6AD31245C39AB92839E875B824C7C0DB41D57E82CAC6ADCA14C0758E1BAB290CF58BC4494038288D87EDA06B3F055D41100DEB17F1B700AE177173FC2C00C210CD5BD47965B3B6565B2BB02550BEF4F1DE5A6BB51C7C897F6301BFDAEC6C756A0EDE82F2E5CA02BEB1D9586DAC3A780BCA97CDB7DB5A02E5CBD632780B8A394B876FD77E0AE90BBEE38577BBA500CD5095524AE5F4A97612EC8E64C06D5A25F044C82EDEB7B105CD52A2C719ED433885910C52A1705BAD5737ABADEA0A5E277F2B4636AC532851E547A15A38326A10154A96E976F009720D4A9037A72FDE9CFE40DE9C7E7FF6ECE5D9B39FCE9E3F3F7BF69D877007D24199F0CF1F5FFEF5F5A91FA8CAC0D7AF3EFBF5E7CFFD405D06FEF6CBB77FBCFAF2F7175F21C5EB6FBEF050DC91D02B53E48EF270A63DB90CEE280656C675848C1890FBF4C403DED6B103BE3F060E1EDC26751DF548621FF001EF8E9E385A1EC672A49907782F4E1CE0168CD27D9AC63EA81155821E8DD2815FB61C95710700C73ED19DB9606E8F32CC67E663D989A9A3E53EC7F8C280A65413734F0C29F5903D66CC71EB1E0BA550A2AFC963463681793D72C47A4EEACC887658826119FB14C4683BBED97B443605F7B1DFA2C72E1273DF9F40943B6EBC0B230D895763487819B90B3AF629793896A1E370A5254AA75C90ED882AE5A37920C78EBAF700FB9137EC7B7C9CB848A9D9D087DC05219C9C13C34E0C49E6D599612E96B01FABA1101CC8BED05E25845B20668F7180F4DC703F62D409F779F5FC900D1C45666961EE8CA4AF10A8708B70CCFB405383ACCCB5E984A5D73DFBBA675FF7ECEB9E7DDDB3FFC33D7BD6A6ED743E99C12D9BC41DC81FF4FB2CA47622EF33CE0FF598D35D651BBC42F3A22E1EDA8D259ACEFF598CCB429C831B48B06B2285FE94E9F830860CC5D4AC84812A580F14C984C287843DF6F23637F001A3F3B3E6E47503D1A0F74454BC4395DF13A76CEC6E605F7027821A86C1B2C21A1F5D4E582D072E29AD66555B943635D92BCD5E0A6F62DD1030DF30D45AF55C34260A701A19BFE70C2661B9F210A918225AC4C8D8BD6848CDFA6D09B7AD5EECB592B435C3F612D296095259DCCA39E226D1BB4C94260C665132753B578E3C7577E404B56AD69B0109216B077D9CC7709964C84F9956057C90B6835017A65C58CCF306FBD3B2563DD76047442695DE0215E754F65641C4D399FEF5E68AF1C3D518E0E946CB69D158ADFD8B5AD84B39B4B4DFA7A13EE764B62DEE8991A6F2308E4E488F8FE401A0DE2655D19E88297C54D85C331B89156AEFE0CEADFCA20A3C5FC09973E0590C454F32253AB13087DBF55407BB2BA937DDCDE9FE9EA6D892BF2253CA69FC3F33C5642E0EB88DC82C431C03241093A3ED40481D0BEC4259CCC2AEC4C1C1CA42BD089685518970F3C5B6D1951ECFFA56CEC316144E2CFA800D8864D8E9742C29DDD7859D1730AB155DB1A88C8251D167A6EAAA2CBFF6E831E547A67A5BC6FE80C4936E5238C2E2E683E6EE0B67F406A650FFAB934F9E36EF3A1ECC04E5F4CB0A2B35FDD2A360ED722ABCE3A336EF580BE2EACDA51FB519BEA610F30F1B3793219FCDB747E200A34FF864A224988837F2C1839852CC573DD4393FCCA51956B9847F6A8C9A85602A77CED9E5E2B842674FC7A53967BF5DDCFB3BBB5839BE2EE791C7D595C512AD945E64EC6EE1972DD17B82B2B7F0FD68C4B5B2F6D1A7F852DA99FC3C817C72899674E36F000000FFFF0300504B0304140006000800000021002C822F6A3D0600005F14000011000000776F72642F73657474696E67732E786D6CB4585B6FDB36147E1FB0FF60E879A94589BAD8A83BE8BA6568DAA24E7F002DD131118914283A69F6EB77A84B6DA72745D6614FA1CE77EE179A276F7FFFDA368B07AE7BA1E4C6216F5C67C165A56A21EF36CE97DBF22A7616BD61B2668D927CE33CF1DEF9FDDDAFBFBC7D5CF7DC1860EB17A042F6EBB6DA380763BAF572D95707DEB2FE8DEAB80470AF74CB0C7CEABB65CBF4FDB1BBAA54DB312376A211E669E9B96EE84C6AD4C6396AB99E545CB5A2D2AA577B6345D66ABF17159FFECC12FA357647915C55C7964B33585C6ADE800F4AF607D1F5B3B6F667B5017898953CFC288887B699F91E89FB8A701F95AEBF49BCC63D2BD06955F1BE8702B5CDECA09027C3F43B45DF6CBF01DB5388832A1027EE703AF73CF8770ABC670AFAE635918CD07BB1D34C8F7D3285D156EBEB3BA934DB35D09510CE023C72DE415BFEAD54BB785C775C57501BE869D7759616D0BC550FFC13F4BA92ACB996A31DA8FF199A33C31359DF8A960F54660C0317EA5BDE76D02C7CA1D7A2DE38FABA26A3D2DE3C35FC1393BC1CB495A2315C83F90706F105AE4B1DF8604DB3B57CFDC671ED7775EC8D6A2F4856B934338958D2A0BABF965F7A3E311D38B3837921288FED8EEBE75463F37241A985E69519BDB463FB517E3ECA97C14F4CB33BCDBAC3CB2C1F66CB2F72DC5A2FBE05DD70A64FE814A4519DFF2712D683E8C55908032FB3B99590A881FA81B523F7651DB64A9B1B6E0EAA9EABE0BA7307D47CCF8E8D01B7B66077C6236F82AB03045D818D6DC72A702853D268D5CC7CB5FAA04C06179786B91A250EB5DE1E58C7F35171FFEEAD5AF7963059EA170F6BFE159A90D7C2C045DA89BA655F378EE7D295D5B0C4543CAEF74A19A90CFFA4CFBFC00FDB7B5753E73D230F312C9FCB72597FF7F14CCF257556732138DED6A7D376BCF96DF7411136CEC56D7EA36A6EAB75D4E2F537C450729B6418E2B116A8219850AD45CD87C61ABAA0841A6DC5DF7668FF82A912A07198E9FFE0C18F1CE0D25AFE0817D5ED53C74BCECC11BAE17F3236345CD988EE4668ADF4B5ACE18AF8DF8C89FD9E6B302060C06EA01385568F439EED78C2A5F91FED2ECFDB089E1BF5D0E9F6F0193AF634AB7EE9165936DDD8809E4F3109CA18450809B20245622F2E298A94240D703B65408A179088781E861042132F4291941645892361BC42EDD8DF397F1A846708F18A1C8DD40B68E1E62892856988DBC96992872852044132F5CB25E2C79007D48E1F07498646FA724DA9E745019A37EA8785EBA34814E42BD46B1A453442AB4D63378D50DF6842E2156E27A30945B505C40BD21445BC902638E247255EED2008BD55822291E7E1FD16E47E9EA03908725A10744A421206212A1352AF58A1D50E334A225CA624AB1CCD5B4469910C3F6FDF218157666846A1090A3C3B514A33DCB7288F60203124F6DD2C40AB1DFB34F151AFE3555814A89D38233446AB10675EE4E31EE46E92BC8078658ACEF6CAA52E41276B4548ECBF8078898BF6CECA77530FCDC18A86315EB9844484A05E274110C5687D9228F413F4464A329284289252B87D51AFD310728D469A863EC12B97666E89E720236415CFAFFF4BC48F5621DA895918503C9E2C756317EDEBACA461867A90BB9478A8D7B91B061EDA0739A1AB12EDC4DC0F898B4E23206182C693875E80DF217916C514CD4E5EFA297E2B17C42D287ABF157E44F05FA62208698866A7887D0F9FAC220B320FCD01FC04E7119AD1123A31C565120ABF682892D2553678B01C217895B46BBBCADB97EF78B24FCC453B4A64ACDD69C1163776D95F5A8E9DBE4F859CF11D87AD929F23DBE36E06AFAE46A06F61212C61D59881A1082D2C507D076BC0706E6E98BE3BE99D38344A8565E3AF6FBAECD2CBF51F5A1DBB117D842D6E7C3ACE2C848E656FD7429AF7A29DE9FD71B79DA524ECDB67D051D61F1FF490A7537A607B8327E0F0047FCF86A7E4C0CBE5D597ED98ECAAD15BFB4CE437ACEBC6D7E6EE8E6C9C46DC1DCCB8FFC157CDF4FDF0B1BBF326CC1B306FC4860F56D9C8807B3A9C68DE4C3BE3F3679A7FA2D19936EEE4C3319869C18916CEB470D8B9E19DAF1B21EFE1E13B1F2D7DAF9A463DF2FACF13FE1D694CC2B010FEEC86387137EC491DCD05AFC52C7377A9A16686CD4FEE0BE1A1C59FF96257E24A403B6E9FDADD69D37D333ADE881ED6840E9662A3F48CFD36602418B665730B5D7C0F85FDCCF729EB793D0ED2FC9FC177FF000000FFFF0300504B03041400060008000000210043329552000100008B0100001C000000776F72642F5F72656C732F73657474696E67732E786D6C2E72656C738C903B6B03311084FB40FE8310A4CCE9EC2204733A6362075CB831E74ECD22ED3DF0E981B409E77F9F6D0C31A448B5EC0EF30D3BCD76F1B3F8C65CA618B45C55B514186C745318B4BC749FAFEF521482E0608E01B5BC6191DBF6F9A939E30CC4A6324EA908A684A2E54894364A153BA28752C58481953E660FC46B1E54027B8501D5BAAEDF54FECD90ED03531C9D96F9E8565274B784FF61C7BE9F2CEEA3FDF218E88F080544C07ED7A14F7C4766431E90B4ECA71999AE3E36E652B80EB3B398CD2EA53D10987304CF8D98D364732CB12773271473804CE3CBBA26EEA7F09C9108F388E02A1769B9479CA2E3270E0B6B0166A9DA463D54D8FE000000FFFF0300504B03041400060008000000210062EA2B34F30000004F01000018002800637573746F6D586D6C2F6974656D50726F7073322E786D6C20A2240028A0200000000000000000000000000000000000000000000000000000000000000000006490416B84301085EF85FE0799BB265677D1455DB6ABC25E4B0BBD8638AE019391242E2DA5FFBD919EB63D0D6F1EF3BEC754C70F3D4737B44E91A9214D384468240DCA5C6B787BEDE30222E78519C44C066B3004C7E6F1A11ADC61105E384F162F1E7514162ACC4B5BC3D78EEFDAB4EBD3B8E06511E77D99C745DEE571D9ED4F1D3F3D67E773F60D51409B10E36A98BC5F0E8C3939A1162EA1054D3047B25AF820ED95D1382A892DC955A3F1EC89F33D936BC0EB773D43B3F5F9BD7EC1D1DDCBADDA6AD53F8A56D292A3D12792347393B0B8900AE1B78C49323E70FCE7826CABE1803515FB03D9F4DD139A1F000000FFFF0300504B03041400060008000000210005C95CF40E0100009201000013000801646F6350726F70732F637573746F6D2E786D6C20A2040128A00001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009CD04B6F83300C00E0FBA4FD8728771AF32C4140457948BBEDD0ED8E426891488248CA8AA6FDF705EDD17B6FB16C7FB6931E6E62440B9FF5A06486DD1D60C42553DD20CF197E3B354E8C9136ADECDA51499EE1956B7CC89F9FD2D7594D7C3603D7C8125267F862CC9410A2D9858B56EF6C5ADA4CAF66D11A1BCE67A2FA7E60BC52EC2AB834C4038808BB6AA38433FD73F8C74B16F328D929B66DA7DF4FEB64BD3CFDC557D40B337419FEACC2B2AA42081DAFA6A5E3827B74A84FF70EC400DED12B1B5AD45F184D5BB187916C853DBD54D2D8191BFAD2597531C9387D6833E770036B00EC69E3BA6E5DF961139765B0A7414023A0755C00F5FC224AC9BD27257F5BD9E7FD33F36F000000FFFF0300504B0304140006000800000021001FCAF261E1010000E603000010000801646F6350726F70732F6170702E786D6C20A2040128A00001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009C53C16EDB300CBD0FD83F18BA374AD2B4D80245C5906EE861430BC46DCF9C4CC7C26C4990D8A0D9D78FB61B4FD9769A4FEF91F4D32329A99BD7AE2D0E1893F56E2316B3B928D0195F59B7DF88C7F2CBC5075124025741EB1D6EC41193B8D1EFDFA987E80346B2980A967069231AA2B0963299063B48334E3BCED43E76404CE35EFABAB6066FBD79E9D0915CCEE7D7125F095D85D5459804C5A8B83ED0FF8A56DEF4FED253790CACA755895D6881507F86484D41DC4B2A5A24C2D820544A4E05AAF4046D693BD4730E4F443DC01E935E2A3902F5EC6395F4C74B2547A4B60D4430AC98F4D525D7655C7D0AA1B50688A7ACBF59137DF23515F783F5A2FF5FC9BC44713B3B342FD1D2B1B79153F5D5B279BD5272046C2CC23E4268925EF4EE26A676065ADCF220740D6D42257F07D41DB7CD4B7E00DBFB3BD0FA80867C2C92FDC96B5E8AE23B24ECC7B7110788161C89B16C24036E43A2A84B4B2D6B4F7C8079598EEDAA373982F3C2810C1E189FBB1B4E48F735F746FF30BBC8CD0E1E46AB999DDCD9E98C3F54B7BE0BE078BE72423CE01FE93194FEB6BF196F333C0F665B7FB6D4EC0218DEC9F57295EF3FCBA81D47B1E2854E3B9902EA8E3B886DAFCFFFBA3D56A79ABF13FD8D7A1A9FAD5E5CCDE6FC0D57E814E38B30BD27FD0B0000FFFF0300504B0304140006000800000021009A2F69A222010000E601000018002800637573746F6D586D6C2F6974656D50726F7073312E786D6C20A2240028A020000000000000000000000000000000000000000000000000000000000000000000A491CB6AC3301045F785FE83D15E91FCA86D429C90870DD995D242B7428F4460698C342985D27FAF4CBA494B575D0D778639F70EB3DABCBB317BD3215AF01DC9179C64DA4B50D69F3AF2F23CD096641185576204AF3BE2816CD6F7772B15974AA08808411F51BB2C356CAAC743473E0E7CA89B5DDDD37DDED7B42AB73D6D07DED37C376CABA26987A26C3E4996AC7DC2C48E9C11A72563519EB513710193F669682038814986130363ACD4079017A73DB282F39AC94BB277AF6E24EB39CF75FB499B782BE76897607FB9382B034430B890E0BE0DAE60A751CCD7B129A42801AD8E84FD036ABD8149E079A637EC5104F43AECC16380F16F72930B531655494BA52A5A8956D1567245956A6A2572C30BF1302FB31FB7CFFAE637EB2F000000FFFF0300504B0304140006000800000021000CC41A92C3000000280100001E000801637573746F6D586D6C2F5F72656C732F6974656D342E786D6C2E72656C7320A2040128A00001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008CCFC18AC2301006E0FB82EF10E66E534516599A7A59046F225DF01AD2691BB6C984CC28FAF6863DADE0C1E3CCF07F3FD3EC6E615657CCEC291A585535288C8E7A1F47033FDD7EB905C562636F678A68E08E0CBB76F1D19C70B652423CF9C4AA28910D4C22E94B6B761306CB15258CE532500E56CA98479DACFBB523EA755D7FEAFCDF80F6C95487DE403EF42B50DD3DE13B360D8377F84DEE1230CA8B0AED2E2C14CE613E662A8DAAB3794431E005C3DF6A53151374DBE8A7FFDA07000000FFFF0300504B0304140006000800000021007BF302A3C3000000280100001E000801637573746F6D586D6C2F5F72656C732F6974656D332E786D6C2E72656C7320A2040128A00001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008CCFC18AC2301006E0FB82EF10E66E531516599A7A59046F225DF01AD2691BB6C984CC28FAF6863DADE0C1E3CCF07F3FD3EC6E615657CCEC291A585535288C8E7A1F47033FDD7EB905C562636F678A68E08E0CBB76F1D19C70B652423CF9C4AA28910D4C22E94B6B761306CB15258CE532500E56CA98479DACFBB523EA755D7FEAFCDF80F6C95487DE403EF42B50DD3DE13B360D8377F84DEE1230CA8B0AED2E2C14CE613E662A8DAAB3794431E005C3DF6A53151374DBE8A7FFDA07000000FFFF0300504B0304140006000800000021005C962722C2000000280100001E000801637573746F6D586D6C2F5F72656C732F6974656D322E786D6C2E72656C7320A2040128A00001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008CCFC18AC2301006E0FB82EF10E66E533D882C4DBD2C8237912E780DE9B40DDB644266147D7B83A7153C789C19FEEF679ADD2DCCEA8A993D4503ABAA0685D151EFE368E0B7DB2FB7A0586CECED4C110DDC9161D72EBE9A13CE564A88279F581525B28149247D6BCD6EC260B9A284B15C06CAC14A19F3A893757F7644BDAEEB8DCEFF0D685F4C75E80DE443BF02D5DD137E62D33078873FE42E01A3BCA9D0EEC242E11CE663A6D2A83A9B4714035E303C57EBAA98A0DB46BFFCD73E000000FFFF0300504B030414000600080000002100743F397AC2000000280100001E000801637573746F6D586D6C2F5F72656C732F6974656D312E786D6C2E72656C7320A2040128A00001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008CCFB18AC3300C06E0FDE0DEC1686F9CDC50CA11A74B29743B4A0EBA1A47494C63CB586A69DFBEE6A62B74E82889FFFB51BBBD85455D31B3A768A0A96A50181D0D3E4E067EFBFD6A038AC5C6C12E14D1C01D19B6DDE7477BC4C54A09F1EC13ABA24436308BA46FADD9CD182C57943096CB48395829639E74B2EE6C27D45F75BDD6F9BF01DD93A90E83817C181A50FD3DE13B368DA377B823770918E545857617160AA7B0FC642A8DAAB7794231E005C3DFAAA98A09BA6BF5D37FDD030000FFFF0300504B030414000600080000002100BD84622390000000DB00000013002800637573746F6D586D6C2F6974656D322E786D6C20A2240028A0200000000000000000000000000000000000000000000000000000000000000000006CCE3D0EC2300C86E1ABA0EED4031B32E9529810532F1042AA46AAE328363FB93D298201A9F363BD9FB123E1ADE3A83EEA5092EF0C9E38D3E029CD56BD6C5E34473934936ADA03889B3C596929B8CCC2A3B68E0964B2D9270E51E1B1836F4D6B0DC6DA92C6601FA4F68AE9D9DDA9E2395CB3CD659942F8211E6F41D74F3E8217FF5CE70510FE1E376F000000FFFF0300504B0304140006000800000021006F0EBFE4FE0000008A01000013002800637573746F6D586D6C2F6974656D312E786D6C20A2240028A0200000000000000000000000000000000000000000000000000000000000000000008CD0BB6EC3300C05D05F09B4DBB2E334090CDB193AB6010264E94A48942D202605898ED3BFAF53A48FA143372EF75C92CDE1365E56578CC933B5AACC0BB542326C3DF5AD9AC4657B75E89A5087C801A3784CAB2541A90EAD1A4442AD7532038E90F2D19BC8899DE48647CDCE79837A5D145B3DA2800501FDA3A807734BFE1B9AE7399FAB9C637F8F95FAEDF87AFEB4334F49800C7EA582F95FBB27C70164B87B3B7D822884F19949225F92EA1ACB661A91E408043DDEA7AE39A2F570C6785D80177C3FB127791CDDAA5D09AE5A6FAAACB276936D606FB3BD296C66ED6E6BA174C51A9E962593AFC95F5A257142A5BB46FF55A47F7FB5FB000000FFFF0300504B030414000600080000002100BB29ECCE0E0200000807000012000000776F72642F666F6E745461626C652E786D6CD494CB8EDA301486F795FA0E91F7439C704703A30E1DA4D974D1611EC01807ACFA12F91832BC7D4FE270132985E9AA5808E73FF69FE34FBF797CFAD02ADA0A07D29A31495A9444C270BB94663526EFF3D9C38044E0995932658D18939D00F234F9FAE5B11865D6788870BF8191E663B2F63E1FC531F0B5D00C5A3617068B99759A797C74AB5833F76B933F70AB73E6E5422AE977714A698FD436EE16179B65928BEF966FB430BEDA1F3BA1D0D11A58CB1CF66EC52D6E8575CBDC592E00F0CC5A053FCDA439D8249D0B232DB9B36033DFC2C3D41D5556B83DA1D54CABA341F73E83F460A0F9E87565AC630B85F0B19308CDC8A4A61F1523C33416DE767A6155A5E7CC58100996B64C8D09EDE24868D9559FF6F0B74BFB242E17F23573204A8FB0300D72C6B454BBBDEAAC66261472E9F97AAF6F9993654FA1047285850D2C28FAD41F1294044375AEA4176BDAE70AAF7C06E74A72B206DF1907001720E6520B887E8822FA5975DE4424C5D1A36D24D1C16F8AB34E3391EA4DFF4EE4057B4E5F66B32391292AFD41F7F982C8F01A91EA31093EB713F9866D352723A5CFC8A153F108E31E0E504880FF88C39B585911BDBFFE11451985124600D2FE1C0A63FDDC6DC47C978B4F5C9AF611CDE9B16FBF34B590DC87668AFF9B5631B8929261C807DE95FB52A2ED52B8A6EB92C90FB16CCE08ED9D66A41466D3837204511DF27A46867FCB483D81C96F000000FFFF0300504B03041400060008000000210014E0FE477B070000092F000013002800637573746F6D586D6C2F6974656D332E786D6C20A2240028A020000000000000000000000000000000000000000000000000000000000000000000EC5A5B73DB361A7DEFCCFE070EF759222952D789D271AD649B69DC646A6DBB6F198804256C488221405BFEF7FB81F7ABC48BD2F1761A3FC424710E3E1C7C37907EF3E3D975A4271C3042BDADAC4D5559C29E492DE21DB772C8EDC94AFEF1ED1B936F4CEA71ECF1FD8B8F1FCD1376910437BF6C65597251F67F61D0AFC8C55B7947CDD0853BD5A71F765B593DAB1AFCA8CBF57B4DD3DEEDF4F9FBD5FDBDB15C1BC67AA1AEDFADEED4F54CBF5B54B1BF67D66AD5473BCCCC80F83C7A7C1F60C4B184240F3F4B5662C8B40A7934A98F13F3131D84719A39C38725D26778B1B00F0B6CCC16AAAD2F97DADC58A0399EC91208E7B18DC9B7F289737FA3282C92854D5D620694519B4F4DEA2AD4B689899599AA2E14177364218E94C2FC29918B8610F901581F70825974EF8EF3801C428E99FCF61F3FBC39336B1393491C0547CCC5A6301F9978DC5C915801A5B0761E8438BAB409762C16EDAB81357B01FB681AAB83BA5A2F8D035AEA87B989D64BDD58AD65C963B3D8653CA6C7BFC41A80BD9961CFCFCFD3677D4A83A3304353FEF3F031F6BB7C70F7B1FED8F5C63460F7565E6AC8D667863ED12DCB981868654D56A66A4D2C6BB9B09066AB3334CF013AB8D2C254E7CBD97282D0723E31B08126EBC31C220BAD54A4698BF96AAD65DB455C9F065CF2F28DEA349FD28EEF347D86C70E166112116CE58204E90090CB77F059B86EE662F85B084923BB2E73A491F7803C748C1E5CE2428E53A509B0BD9585CB3C608BA0471C3CC15E3D24BB04BE47BC4FA61906E00E6A7D1D8DE0F788F151049FEE7F1B84BB0B39DDA3A308A0FEE0774FF0E867C44EF7D41231D79FE15FD8C30112D9714FDCAE14FAE6F184026CFD41F8E9DF0C32E400DC0EC426CEB0650BCD7EC12F9F29F1F8308671E81D14913DFA8ABD26B452F0D9E8F78A4B47F712FAECBA182FDD4151E2BA96D5BB25A784FB3D0DDC1DB651E84022FF1622874012B7BE7B32B6DC7CF0F5745C4F1F0A079DB29CEC9BDDC88867531FF193605D2A9F51C02116EEA10E07D4C9B35B3D7D8E37F4426E1E6F784BE26E499568433C0B9FB7F20A6A2F711C747070A1865B84F90E7A895BB7568A13B12CEC1560105A38F090730507ED98F5C9735E1264E6CA44387FB1060498411B638A3C251D101335C4659B5F29C785A02BC3AA217359914AFECF5411AD490F556A343D94A9615F8F3A7171CB44D1D47EAAE4F0B6B5A7236EB1E474888BCE1FB177E427E90939218C98CD93AE285A7C81E1261A150A792E94D64FA80A479B5AA5612325DBE333BF919754BB915C86593F19EA443DC2A80E7E3D0AD5BAAD5C22BD9F440D4C3D346A40BF1E91AADD5DAED1A27F3495897A485407BF9E74DCACCEF2BA3A5560DBE2DB166E2387FD7F65E562AB9E4BD5B3D72993F470A232F0CF0CB11E07844E6F03FE3E20FCE50F08F5337D1E30C6F58089E192C037444513794B3C34BC024A6E891514A3FE0C57E2ED6C214804FB033827C9C3EBE2AB2831FE03A825974FF260DE39BD0ABD030D41076BF80BAF5D2E942C891DDECA1108A2DC3B56A66ED99D3BD3042BF8072B2548572BEE946DAFECD465C2F88573179B46BCA8A882B29DABD21476B80BFB2527CE5F30E56E3CEFE5C65299A2D99D8B635EF5E9A54745A8A418EA630F12A70DA91F7116656918F7153256ED1B468027C577E4578A064ABF4D9406845E61C8C1A1E6D7ECD13F91E32449FC86560EAA5DE4FAE009F11847E0F75915CBEB8E1F064E04B14C25518929DA5453F2B1E06F85AA5704444FB29114AAC895B2903AAF420F79166B2D2D176C8BE93F52333A3C64082B3C38C413C246B8C40805EC63CA3760015D7445351475069C5398BC43816B5AF02DA68FB8CA36945388E0F95C708F3837DEEFBF541E64F042924A28EA83D3B16D1F332C73638A8F9334B850891A3ECA24E068513183889A010C1B024D2D1751D7D38254B4C2E7CB0BF0A64A93E5E76870391D2705418A885B6DE7843B57E6CD6731EAB3EC237C2B3D0B0FFFC5A6F8623D40572BFF003D44D8AFF8E5990656F543C535555BCD7190770C21290EDA64F0AE230D5EC6DA12B3259FD66F4316E02732802D0B4BCFA33C4A2AE99DB4354F6F4A2DFFF627C2E2122D817F11211193F8093241E81E7020515B62E809EED1404A8D6453806109F9BE2300A20B001228E93E3C23D09C4850C5A4D087720546025B3605B221D2258CCC5346366DB62DAEF7D555C477CBABBDDE5439E2CD34B5A292FCD3E8DD2FA52C37A11D91731E6129E1A0F888C5B8F2A9AED8328DFAD389CB87B21BF44AB73CDCF639A327DA9437E73344378463F2AC7662AA1C98CACEE19B9BD289A9B4B36FC5B694FDB5862E1C9686621B2A590D2D2E2B679B06176A99EFC2C930CB4E57E1B553E10070F904D81DFED3EEFE8E316A12D173BC83DE81BF0CDE6EE04A183A9DC3AF6D045C66F192CD114F90056DC2928DEB80EB0C797C611CBB1F92F6BF1734951492731BAE939BE5CCF16E5557DFB2E1ED065669863234683390A92A55479A9A178FF4DD183E2E61C51CA928BF611B0762C6E14C96687987626723B0FA08ACE8CC8762E77F42B26ED8E9FE69B375AB075389BD1E0E9E8D01EB63C0C618F07C08782F7ACEC1812ED0DDDF157F07FFCB0C18B38281192A9AFB6A3F75A3450E8DADD4C8ABC8C8CEACB1579AFE98FDEDFF000000FFFF0300504B0304140006000800000021002D25BB11B50100007D04000018002800637573746F6D586D6C2F6974656D50726F7073332E786D6C20A2240028A020000000000000000000000000000000000000000000000000000000000000000000B4944D6FDC201086EF95FA1F2CEE18E34F12C51BED3659295223456D2AE53A0B7817D58005B8DBAAEA7F2F76F692E66313B53DA1C19EE79D195E383BFFAEFBE49B745E59D3229A662891865BA1CCB6455F6ED798A1C40730027A6B648B8C45E78BF7EFCE843F1510C007EBE455903A891B2AAE57172DFAD9AC56CB26A7355EAF2ED7B85CD611735930CC5605A3655966ACC87EA1244A9B88F12DDA85309C12E2F94E6AF0A91DA4891F3BEB348418BA2DB15DA7B8BCB07CD4D2049267594DF818E5F59DEED162AAE73EFB93ECFCC3702A6D74EA918A56DC596FBB9072AB0F02F7602D034CDD116E4D8872B73F0689C83FA30E2E36E882927EDE5B86E0D4660CD21FD3D8EFF7E9BE98E7118994DC5D7FFC3CFFFB5F8A7B16DA50E88ABC2C702144894B6002339E092C44530BA05D9643F56C32AD7956357983019A0A97B2047CB2A93ACC806540695DB113FAF7ED888351AEC1C056CE9609F1108F4EF845B2329D1D20EC268986DC800B46BA0FD122CEF6AF263FE1ED01F8D758E523EF39895F711A07FE30BA7EA6094E643FB7EC094D29794B62904EFBA3194F0F49C5ABE20CF4C46EC444207F5CC9297EF0642C7E030000FFFF0300504B030414000600080000002100503A6749CB0000003601000013002800637573746F6D586D6C2F6974656D342E786D6C20A2240028A020000000000000000000000000000000000000000000000000000000000000000000AC8F416AC3301045F785DC41CC3E969B4528C64E08A4592605B75D7523CB635B20CD1869129CDB5784B627E8F2338F37FFD7FB257875C3981C5303CF45090AC972EF686CE0E3FDB47E0195C4506F3C1336400CFBDDEAA9EEAA96AFD162522D7AB4827D2B779F81AFC3DBA1758B4CAFBD932CBD0C83B37821EF088B2579500FF06C4286330BEAF3F7FB16546E43A9EA1A9844E64AEB64270C26153C23E5DBC03118C9318E9A1FE223DB6B4012BD29CBADEE5CE71D8FD1CCD3FD47F62FAA5DADFF06E7F5DF000000FFFF0300504B0304140006000800000021004139F2A1E20000005501000018002800637573746F6D586D6C2F6974656D50726F7073342E786D6C20A2240028A0200000000000000000000000000000000000000000000000000000000000000000009C90C16E83300C86EF93F60EC8F73440A1B08A5095D249BD4EABB46B1A0C4422094AC2B469DABB2F68A7EEB893F5D9B2BF5FAE0E1F6A8ADED13A693483641343845A984EEA81C1F5F599941039CF75C727A391813670A81F1FAACEED3BEEB9F3C6E2C5A38A4243867A69197C9DB665D314BB8414659B92ECDC34E458E409498F4F59768E4FDB3C2FBF210A6A1DCE3806A3F7F39E52274654DC6DCC8C3A0C7B6315F701ED404DDF4B81AD118B42ED691AC73B2A96A0576F6A827ACDF3BBFD82BDBBC735DA62E57F2D37799BA4192C9FC74FA07545FFA856BE7B45FD030000FFFF0300504B0304140006000800000021009955F41BB9030000CB17000012000000776F72642F6E756D626572696E672E786D6CCC98DB6EDA3018C7EF27ED1D50A45DB639400EA0D18A51983A4DD3A4760F6082016B3E44B68171BB97DA63ED15E64302ED48184DC8D4DEB8E4F3FFEF2FFED9FE0CEF6F7F10DCD9402E10A343C7BFF69C0EA4299B23BA1C3ADF1EA75789D31112D039C08CC2A1B383C2B9BD79FBE6FD7640D76406B9EAD8511E540CB6593A7456526603D715E90A1220AE094A39136C21AF53465CB658A014BA5BC6E76EE0F99EF92FE32C8542289F31A01B209CDC8E1CBBB10C52155C304E80541FF9D225807F5F6757CA3D0312CD104672A7BCBDA8B0614367CDE920B7B8DA27A425039B50DE140A7ECEB85672C7D23581549A115D0EB1CA8151B142D9E135EABAA9E0AA30D99C7A890DC145BF6DE6F79A31B8E360AB9A83E139E9CFAD88609BF96947DF3B8388B6D82BCE49E1F998452604207A18B8D6D43C995C3F7C9941F0B741B66C06E72367EBECE0869AB9DDD3EF7B2FBDB55FE095437EFA6AA259320F2B90A91D48D2C1FD92320E665865A49075D4AC77F4B2766ED4910366427290CA2F6BD279F6E97E3E743CD3850A3457B10DC043676AFEE2B1E3EA085963893EC30DC48FBB0C167DF4E0189AC7B69B24192E82BDE9244AE224B211BCD101A49A62307532725974F66D2F752C4EC9FEE11CA68880DC3A7B903BBC1FF933123A757586867BFF47F8632F7DE75FEF9F7F4A8BA7182E64EEF6959B7CD534E46DD147A5E0A8FF33A6A0F889E7E9FEEEA127A27A86B4511E569F56802ECD99DF8D8AEEC6DF35C39BF6C974FF93855FC5E2AE368B281C25DD7EBF6D16BD3659F47A2759E8F0E55904552C26B55984711C7861306A9945B74D165E7292850E5F9E45B78AC5B4FE191584A349121FD66D3B2C821659A8C57402858E5E9E842D28C724ECAAA845C28BFBE3E8C3A80189D91A63584CDD11880F265A5E2C7EFFFC75894DD1AC586C073C6FA68C4AA1275DA4485D531E7664C6B0918ED4943F7B80A8D44B7001D484E766C6A526D7B08A6B3EE135B88E935ED0F5FD96B996179E0B716D56785E03D7A88A6B7E30D5E03A1D8749187B0D6E14E7702D2F6217E2DAAC88BD06AE7115D77CDE6A70ED4FBAA37E3C69703B39876B7941BC0CD74605F135504DAAA826B5A986519444D35E6ED0DA3DA794EA65AE39074E655475F404D59A20FA5520FAB54124FE281879410310E76CAF167757230EFF69775103933EFD36FD8C6CF15E06A36B7A1EC9EC17BF52597C4266BFA394CA4CA9AC901DFD427390992B6B85CCDED74A65E6465421B3D7815299599815325B6D4A65A6DE54C8EC71562A3365A04266375FA9CCEC8B0A996FF751A9AE588B46675BFB23FCCD1F000000FFFF0300504B030414000600080000002100F5A800746F71000022830B000F000000776F72642F7374796C65732E786D6CEC7D5B73E336B6EEFBA93AFF41D54FE73C646C49962CA776EF5DD66DA76B27999EB833F34C4BB4ADB42C7A7489BBF3EB37098224480024B0009014B5DC5571CCCB02B0AEDF028185FFF8AF6FAFDBDE9FFEFEB009761F3FF4FF76FDA1E7EF56C17AB37BFEF8E1F72FCB1F261F7A87A3B75B7BDB60E77FFCF0DD3F7CF8AFFFFCBFFFE73FDE7F3C1CBF6FFD432F24B03BFCF8BAFAF8E1E5787CFBF1EAEAB07AF15FBDC3DF82377F17DE7C0AF6AFDE31FC73FF7CF5EAEDBF9EDE7E5805AF6FDE71F3B8D96E8EDFAF06D7D7E30F94CC5E854AF0F4B459F9F360757AF57747F2FED5DEDF861483DDE165F37648A8BDAB507B0FF6EBB77DB0F20F8770D0AFDB98DEABB7D9A564FA371CA1D7CD6A1F1C82A7E3DFC2C1D01E1152E1EBFD6BF27FAFDB8CC0488FC02025F0BAFAF1D3F32ED87B8FDB90FB614F7A21B10FFF19B27F1DACE6FE9377DA1E0FD19FFBCF7BFA27FD8BFC5A06BBE3A1F7FEA377586D365FC2964322AF9B90DE4FF7BBC3E64378C7F70EC7FBC3C613DE7C89FE47786775383297A79BF5E6C355D4E22AD806FBF0FE9FDEF6E3876BF2133D4E1E9E45F73E7E38FADF8E83F4E2C38BB70EC94C97F1FB87BF92970783E4CA2C1A41EEDAD6DB3D27D7FCDD0FBF3FB023612E3D86FDFAF8C1DBFFF0701FBD78451913FF66D8F556FC8B34FCE6AD36A41DEFE9E8871D1FC663D96E224318DC8E933F7E3B45B2F14EC780364208C4BF53B2579CC442850DD5F721B6A2F0AEFFF473B0FAEAAF1F8EE18D907911F9F0E2EF9F3EEF37C13EB4948F1FEEEEE8C507FF75F3D366BDF677CC83BB97CDDAFFD78BBFFBFDE0AFB3EBFF58126DA71756C16917FEFFF0B64FB4687B582FBEADFCB7C876C2BB3B2F92E9AFD10BDBE8E9D3266B9CBCFEEF84589F4A42F4FE8BEF450EA4D78FDE38305D2517589A770A5488AE5450892E1486AFD2C12194B42E276EEA6A6854574344FBEB68E8B6AE8626753544C8B86C68B35BFBDF64D6A76126311D89FD69D391189B361D892D69D391988A361D892568D39128BA361D891E6BD391A8A9069D63B0528801436DF71DD1AD8E0A30BAD5210146B73A02C0E8563B7C18DD6AFF0EA35BEDCE6174ABBD378C6EB5B3D6A71BE3ABDEA7D0CC7647632B7B0A82E32E38FABD08581B53F376212D924AD9A117053D7F6F659016C8C49E8D0662636A2B8FFC5DAD21C448E1F1FC18657FBDE0A9F7B4793EEDC30CDCB4E3FEEE4F7F1BE6C23D6FBD0EE95924B8F78FA7BD8423109DDEFB4FFEDEDFAD7C9B8A6D8F6894FEF576A7D7470BBAF9E63D5BA3E5EFD696D99750B4E21452850E93E697C848361694FAD55BED03F3AE059E35FFF0F3E660CEAB88486F7ADA6E7D4BB47EB5A3628496796E40C898A706848C796640C89827068CCC6CB18852B3C4294ACD12C328354B7C8BF5D316DF28354B7CA3D42CF18D5233E7DB97CD712B71F10C0CE9ABCFE0CDB641341BAED83155AA0F9BE79D17E203D568A44A97CEAAF63E7B7BEF79EFBDBDF4A279EF6A7EE8B2791AACBFF7BED8088029255B4900D1A75938EACDEE641EEC73D46C59624ACF922DA6F42C59634ACFDC1E7F09317584E67EB293FC3C9C1E8F6A166E6AA0DEF6146364DB16EA1D6D1B7D6642CBCDFE60CD90C4642DD8C0AF117A8E14C206B2CC7A69DEB18C96B96116FD9AD5EE5192167AB90D565FED38F29FBEBFF9FB300BFC6A4C69196CB7C1BBBFB647F1E1B80F64BAC63A0D327FA564738BD7B717EFB091E46A0CCD813AD448BEE3F77EF1DE8C87FC79EB6D767624BBF8E1D5DB6C7BBA98A54455BEFCF273EF4BF016E5BD1163EC109C06C763F06A8D269D9AFC7FFFF21FFFBF9D0EDE8759F9EEBBA5D1DE5B9AAF22C4661BE5A0544529585BA21442D9CD6EA311812BE8FD8FFFFD31F0F66B3BD43EEFFD78E9CCD1B744F1C17B7D93011B6DDB0A3DE77BE87F2C202E42EF9FDE7E134D54D932AA2F568831F39887D3E31FFECADCD5FD1AF4AC4C55FDFD742413A2044E93B7ED913307123972E6208248330C0F91FE5A186C8E9CF96073E46C0D76B6F50E878DF49B2E989EADE126F46C8FD73CC1A4F4A205704FA7AD3D062604AD713021688D85C1F6F4BA3BD81C31A16771C0849EEDF15A541942CFC21C21A1F7DFFBCDDA9A3008315B9220C46C898110B3250342CCAA00CC970C31C4CCD70D31C4CC170FC5C42C410086982D3DB31AFE2D7D766288D9D23342CC969E1162B6F48C10B3A567C379CF7F7A0A41B0BD10C390B4A5730C497B816677F45FDF82BDB7FF6E89E462EB3F7B16A650636A9FF7C153B4A722D8C54BC92D908CE6C1B716C1764CCE9690FFE53F5AEB5A44CB66BF2CCC997ADB6D10589A5BCB020E799399381C95ED08885F23FB518CBBF079EBADFC9760BBF6F79231C9DF0DF3E587787388B81BD5DF187B8A93A33F6F9E5F8EBD688F0C6D8CA53DBEAE7C3349EB73AF55372892CC38D97B237AED177FBD39BD261D8DCD20F7F250FD65A2F7B9976FAA5FCEF046EECD91E29B7C9BE3EA37332C9D7BF356F14DBECD89E29BC49A736F9659CDDCDB7F152AC26D99FEA499A044F96ECBB4287D59D86C9922A56F8A54F0B64C8B72A6D2BB5FADA26F0ABC74D46C46FEBE9AF1C8DFD7B12239151D73925351B62B39893203FBCDFF7313C57F1DD74ADA4BD77154BAD721C1DE4AAEF41FA74036DDCF7EB852FF18F6290460BB83DF53233C54FF2296734C72D62B7B28390965572527A1ECB3E424949C97F4752D2F26A7A2ECCEE42494FD9A9C84B683E383889E83E3DFD77370FCFB1007C75381383803E02027A18C20E424B40D9527A16DA806E0424E42CB50B9D74186CA53D136549E84B6A1F224B40D95C76C7A86CABFAF67A8FCFB1043E5A9400C95A7A26DA83C096D43E549681B2A4F42DB507912DA860A4C07A4AF830C95A7A26DA83C096D43E549681B2A41940686CABFAF67A8FCFB1043E5A9400C95A7A26DA83C096D43E549681B2A4F42DB507912DA86CA93D03254EE7590A1F254B40D9527A16DA83C096D438D3755C20D957F5FCF50F9F72186CA5381182A4F45DB507912DA86CA93D036549E84B6A1F224B40D9527A165A8DCEB2043E5A9681B2A4F42DB507912DA864ABE421A182AFFBE9EA1F2EF430C95A70231549E8AB6A1F224B40D9527A16DA83C096D43E549681B2A4F42CB50B9D74186CA53D136549E84B6A1F224CAF4937EFB545ED0AFB14920991755DF2CA0FE3D8C76FBB7F26DED0CEDA13AEDA4DF1AC4C9BC80E26EA5E06B4F6D9BE69024316A54378FDB4D40A6CA258B0058BA640187D667DABFCFCA772CB1D40D6B56D19D1BE40B2F47FCA6CC2CD937B9899A1BD536B9CCF1A6CC02D93739287B536678EC9B5C6CBD290B06C4D8932534618CE35E2E0B03CCCB7DC9EB652180799D677199E3675EE4395CE6EE99177906973979E6C5512FF2F8C5B74765CAC4BC3D4E57C37214CA948AA1702BA750A65CBCAC121FCF1B86AAD0E41454A527A7A02A4639052D794AC9E80B564E4A5BC272523051F366A62B6AB8A1CA29E88A9AA700123547062E6A9E1458D43C2998A879C7A82B6A9E82AEA8E1CE594E01246A8E0C5CD43C29B0A879523051F3A14C57D43C055D51F31474456D1890A564E0A2E6498145CD9382899A0777BAA2E629E88A9AA7A02B6A9E0248D41C19B8A879526051F3A460A2E6526F6D51F3147445CD53D015354F01246A8E0C5CD43C29B0A8795265A226533339516B4998795D0F84312FEA0564E6453DE7CCBC08C89698B781D9124301982DF1B24A64AE972DB142935350959E9C82AA18E514B4E42925A32F5839296D09CB49C144AD972D89440D375439055D51EB654B5251EB654BA5A2D6CB964A45AD972DC945AD972D8944AD972D89440D77CE720A2051EB654BA5A2D6CB964A45AD972DC945AD972D8944AD972D8944AD972D89446D1890A564E0A2D6CB964A45AD972DC945AD972D8944AD972D8944AD972D8944AD972D4945AD972D958A5A2F5B2A15B55EB62417B55EB62412B55EB62412B55EB62412B55EB62415B55EB6542A6ABD6CA954D4926CE9EA3D776855449B1C02173E7CFCFEE64725CC998D3BEBB82A2BFD08481EFCB44E0F978A5E8E7AD2A3C778D1CBA4C3F48321F9FFFD21CCEAD2F3C4A637D7CBFE7DFC143DE36C15F53D798239842B39E98B345CD1D5B473F46B677C3616DBBDEC482BD2F6A377F0D77F8FB8C9757E17952A145C8F4AFA25D79366662FDE3EBE9B313B7986AA53F6D155C08EEBE5A8BF98C50FD253CBBEFAFEDBAF6117C8B5E88F9F373BFF10934A0F347B8CCA78F991D6935D49F47C33AA79415C27E9E73FB7694394A5B489D2C3E5BC3F4A0E978B6E2EE8B5E87EEE7CB9DC9BD9F972D1E5697ABEDC63FCDF593CA29CECA7C3C9983F6DCE231A4DC0277BDEDC840E96396F8E7A80DC7973E49AA1320DA4CA44FDA71D651AE82B13446506318BAB5486D849EB5566308EFE1555263AE280F82C72F1CB263A2F6F9E7030D3171AB572FA42AE19EACB50AA2F745D811D7D19EAEB4B7E7507B92477D5A3DBC12039AF11E49B94F42C894B2DD0B3BC668DAE67D733B133CA748B3AA35BFEF04BBA1024A75CE49AA172DD48958BB66847B96E3AA15CC4DEDAA15C9BF8BF2227369CF407FD2CC095AB5A7CCEAAA112C507D08A94882E41B2A344A34E285162B56DF350F5ABCD58AA363494DA519B7127D486585237029BA1DADC4AD58666FD76D4E6B6136A9300D07687ACFA95682255229AF6D951A249279488D8551B7DCF6DF4AFA836C2744D94CC2739A9891EDD49F5884AD78E1EDD75428F92D993963BA35AB46A150AD45BD1DAF492A9517A8E555AFE889C6255D437C96157125DA1F39555BA22EFF7319A222EE93399422E9DD38D6799A5CAACACCDC7C76DAC40E1FF7CDA45CAFC1EE95EDAD3F5372F2615DE9FF9DBED2F5EFC74F0267F74EB3F452619DEED5F9392A485FB8FF1E91AD2F7F7E4C38694C055BE33F19FE57A121F00BA8977DC48A7D0A3D97B01BBC99E32534E433C63A8D6C5DE447ED1A73EACC429169D9FBF2F757D2AB3E2D3F1B03FA47365D4F5641E2CF5593DD2B61FCDABA47FFC76DAFAB98F08E47545A35E9D0EA1AE3C440F1405C60CACC8A6F8562F1B748157429F20E19C11D706A39BC5F59CAA75CC35AB9F5696F109CEC5F1D3839D75D424A664AE26B3EBE535FD9664A226615821DE28F2251F3FFC701B9F7D443C03FD933CF4C72A693A42B9F19021B15112FB481BA6DF4334C35889C633322A4A3CBE65AAF1549D2C6BFC79F13FE53653CC96D4B22DB29C2B76ABC777207FEFFA83FBC4C0441E65BA8CFE891944161BB00C8A67A0DED939F264EE5FC71D95A86C54513B64EDA7DD53C03190DEEB919B55BE8A67170D46723C3E990D6E87743A43EE8B0A7E84B818A11B6198947EE7CC206BDFE8AB2639CAB1C81F72B18A2F6CFEC39C34C9997644ACCCBBD32F155A09CFB83F1E25450E38062759CDDD984D6BA2BF18E69AFBC4745C22EE99FAC34C025286C939E222DE27470873A644AF6B694B7A081F376E4AAE4C5FE820B5F4858D0D3283A4EA521B8A64872AE1AAA916E58423E5A42BE0A803A737C9F2992227E8CD5EDF06A68E5A9131C31DC4A8750D4483CB6634E51DAF7091C97B6049DE7456ACB3F26E6ACD4B3A91948A95CC0B45BBB63899C6EB12C92D913CD9392789B09273240AD39EFDC1683A2DF7EA3A3E3D9DCF21FF533529350DF6210027CB26E34929D2ABC8DF52C6FC1585EAE87FC23EF9940C911D9B6CD2292BD0BBE97416E8ED64B20BF4F226D4D8B5FF93D9EBFF84BD1ECFBBB1EC3FE7194231DCA2E7B308D3BFDCD92D228392CDB4304401D32D02C055F915C2D01C853E37C48FFE73E0F77EFF14BD4E9C69FED2EAC0FCCD3938D57449359A15995A262DD398C66A859EF0E492B2C5E3AFFE3E1D4D3F0D2CC995A4355E12EFFD9B708CCF241F086F857FC52EE1E8EDD6DE7E4D0EC6FA763C517D0E6FEF4EAF11CECF1E0DB66B2219E6017A9E4FF6CCDB3E780BF651829A115AED8EDF8EF7DB631455A16951AE6417277AF66695A1CA3E270AA61FE8CC02DC3EB547B90D565FC5BE28BAA3E689EC391AC13AF9B7E99A71FE82A042B02F0D2A7D36AADC4CFB7771393C1E30134B7FDA931D16C9EE0B69BCB6D5425954B7D54649ECB7D344E4C3A948D8E9F47E7F44E8D3E974F2277D5AECF18B587AB363B034194A3B96524E83F577B181843700919A926B2A4CF7E389467B931DB9014979641C1F1329E8B1AC32382AC5B6F38E639473FCEE964C3894279A2A5CBE91C5B10E478E87804DBA35CAE57C5E7EC0256CB4A5E5F2A90D54F30A35E737E564F2A9DE96231246F9FE9BFA5C752ACC1CD2569CD4D155F578D025ACB4A5EA542635ABBA8087DD50FFE5667F387EDA85DC2A012C3DF2548F3E2692613EDC8AE4C634D4947D0CAFE924778C439FA21EFD4C62C2D0F61741D9A8D5582CB7151E0D56F0BA116BE98465541A45893954858866ED80C6897C3EE6CC0494B4BF4AEFF56204AABEB5A0509605E45C9638251049A4C263359625341B1EAA72853CB3AB2344D1C554711DADC52C5094194AA989A8C58A96E7CEB5C6922A53A936124838410B31B490B24C9B8A0C967053F26D8653B5E6E22C3FAA596ED74A303DD7B49C9C701951065FE343857801A6E70DE9C94CF0F5900AAB2012B5CD85543C8F7127E83797FC1798CC52C8FBB48484E13AEF9445338FD43DE318B4A2D745DC017E654D7A6E775F26E74806F16A3DDD3511259FBDAEC94F44A7B8244C64378ACB21F8F55E84EED3692B5CF295DC345AF5951C79D69A85288A6CCEED217DCF2D2A23BEE5B7E07D1A3AA487CD5F29BFE877D9E4899098FC894FEA0BD340CBB496E4A738B0476FF5F5791F9C76EB647867B7082BFC9F15558797545D565BDF8B632CB3CAAC176582DB488FC94FCA8B25B918CB98BD16AFB08C5D6BD41E6D2611E7E74869E23E9204335400623102775A509B58A6BABDBE233F8ABD8E770DA4BD8ED945BB2D19C4D62B1D8391A1B473C4446C61CFD921E706A96A34E6432DB05336D487C2B2063DE95EC8501F4327DBFFA7BF8F677C0D7A3AB98EFE29EA5F5A0245B3A33F05FBBF5AD4512858F8212E4BCB5765CD8186A4786DB22A0AD103A207D2C733420F8BFB597F96372C7EFD590BF1C37C3CB99910012BF5BB1308C2FD985B84210A2B23E583ED028AA861B0D670C46C361E8DB3DDF2555AD82492B0DA55432CC17F87116209F1B718C4128825DA8F254246DC2E8AC0BDB8AFB7855862B95C2C251848D4EF4E6009F7636E1196582E6703A6FAA77CB05DC012350CD61A9608B5703A15E31E9116368925AC76D5104BF05FAC855842FCD51AB1046289339897182F474BB1B991C3FEDA8A25668BC5749115BBA8EA7727B084FB31B7084BDCDC4D87F762E0941F6C17B0440D83B5372F31588C25D987480B1B9D97B0D955432CC19FCF23C412B4A21B6209C412678725E693F9782E8E4FF9D9F4966189E9E07E7E3F57EE7727B084FB31B7084B0C6683FBC1BDC260BB80256A18AC352C71B714ACD5916B619358C26A570DB1047F4C9B104B88CF6C432C8158E22CBE71B0BC60CD2DFFA1B175DF38B4FADD916F1CAEC7DC222C51A86D2F1F6C17B0440D83B5F88D434B0B9BFDC661B1AB8658823FBB53882588CD2296C8588F58A20B58223F5B713E5842D4EFAE63094B633E0F2C911F6CC7B184ADC1D68125445AD8522CA1DF550896109E58986288ECDC4200744836A92274D0810E9D5CA510FD2B28B96CAB529F541A308BDFB6BDE471C5A0ACB2B2CEF1EA741340C7B6A4B3986DDC5F08BD487E710875CE335273DB21D62874880EB7D8A3626FD4F82FAD0C2E657EB5AD43D92E70DE2299AA3259046E582E273C02420728A9AAC02C13CF6E93947D616AADA717F376945ECE55344FAF16B2A8C2F5F4FC117A1D2CD1D975F44FD1530D9B5C1B61B09DDD126AA8DEFD193D65BEFB136104C288D8DD8E16D792F54008241048209028E8350289E680C462341D4EF3AB14CB7C559350C26C6FBB5D3051B2FD930513F0ED9F0826104C242E77BA1483897CA44330516809C10482090413E46A4D602214E7682E5EBC28F2554D8289A5D1E676BB60A264FF270B26E0FB3F114C209888B57EB0BC5FC64D14B55EB45309C184BE0F1C2C07B38178BFBE705DBC733051E8500E4C643D4230816082BBDCECCCC4F572B010AF38106E196F7266C26877BB5D3051B201940513F00DA00826104CC45A3F5B4C1753A1D68BB62A2198D0F781A3D1F4EE5E05AFD505260A1DCA8189AC470826104C70979B5D2FB1142C4390FBAA26C184D9F676BB60A26407280B26E03B40114C209890BBDC58EB457B95104C007CA0682956CC62E1CA78E760A2D0A11C98C87A846002C10477B9E9CF1C3ABEAAE1CF1C5A5D7509264AB680B26002BE0514C10482892AAD176D56423061154CE41D4B1BC044D62304130826B8CB6D0513225FD5523021ECAA753011596F687F641C421C913C104B5B1F41D0A88908420B41A878CA81BC82C4FC6E9CA94FCE6F5396B2B6AC5696A28255E511154C34E7472CD174579583F36458F143FFBB6FCDFB852188452724DAB3D9F6C5541394A4BB7CD726F897BA542280DA817FC163C9749E02EDBBBCD24311693DEC75071ECD83417231C757EB86E35CB8CEEBC4742731D09345A3E5751D1F856D2D81717D66F2CE8F708554B91501BC524BEF0E5A3248C9AAF7D8D307CDB7D9638ED68D1CED66DABFEB675E2347D4204B53200BC8D314A862A6D6E62F02F59764C05C4D4D3298AB39CBD506F3EBE5B578C216B335D36CADC0DC4248482EBBCDD76A1030666C6D9286B59C6D3E9EDC4CF2EB49CB026293599BFB13EA2F3E6F2B296752C8DBE0154D306FEB46DEA6401492B7E9E2546B54316F6B73DE567FF51BCCDB542583795B65F330DECEC7F7FCD4BF48EB316FD377DD05E6160C2BB9EC366FAB41C098B7B5491AD6F2B6E572B19414411405C426F3B6B0ABD369BE53655DC5BC4D3F6F2BA91C55C8DBE0C5A3306FAB3D6F1B4E8793A164973D2DDCA19FB74D46B339E339724413ED00E46D0A6401799B0255CCDBDA9CB7D55F68AC25799B82ED62DE566D246799B70DA793E5440CCE84E55A306FD370AF05E616424272D96DDE568380316F6B9334ACE56DB3C562CA6D159007C446BFB70D1663C95A195157ED1FF597CF714A0ADA15721C784D3BCC716ACF711410BE7E8EA300BE20398E2EA6B34615739C16E7380DD43F6C498EA39BF3638ED39D1C67301CF40762D095D77ACC71006B0AF3CC2D8484E4B2E33585EE058C394E9BA4612DC7990EEEE7F77385BE369FE3DC2D055BD6E45DC56F53FA795B49EDD042DE062F1F8A795B036B0A45BE39361D5ABA0DB2A6504E34D10ED09AC24AB2A035859554316F6BF3B7A93C2F58DF3FCA5DEDE09AC24ADBC5BCADDA48CE326F136ED217693DE66DFAAEBBC0DC4248482EBBCDDB6A1030E66D6D9286C535855A01B1D935855A5DC5BC4D3F6F2B29D35CC8DBE0959A316F6B55DE46B316BB795BA21D96F336114EB54615F3B6F3CCDBF20B2B2E2A6F13CD6360DE7611795B5EEB316FB39BB765DC6D2C6FB32560CCDBDA248D3AF23651406C69DE26EA2AE66D59DEB67AF1F6DE2ACC6D880FCB72B7D7D79079BFF94FFEDEDFAD7CD21D3669F376BBE0E81D37C1AEB74F1F8ACD2E9FAFCDFD27EFB43D7E0E5B79DE7B6F2FCB60778C1FE413B7C4059A246E946787BF92DBC98DC35FB34372AD9FE86AC22B0973DE925E8B98F325E479195F22990859C266AF61F6F835B9CED09D855271C9252EBD554C6915F568753A84AE97685F94814A984706596420BDDF8B1EE8656C50D62A0943359959A95F5FFD7DDA99589B043AD7BF09BBF3EC1D4F7B3F54BDF02F72F3700CDD9EB75FCFC23E873D3B5155086FEF4EAFCB5037B24783ED9A309179E0211159F2CCDB3E780BF691C6658456BBE3B7E3FDF658381705A2E50FA7C73FFC55A9A21FE82322417122D8457295DD14088FB6EFDA204AB2336B3ACF0E45A6F6F419B9E60B9D849C6FB6F59E6550B7AC809FC09C7BFBAFD1D1719CB0A21BE45039A184546628AFCD35D6DD0C2504AFD3FF2172C213E574F16B01D4C5F895C5746733C9D4278C824F63B6B5263E2B06D59C38110A7446C8949767931597F09DBD46736240F6969B82AA737EC1AE405B290EC0D110EC8491A134EC32F8FC8DC3C1411DDD997DAB879525135AC84A112B21985C7A22488ACDCD8F0241908E209D51F9C2211DEC2433C2F496F89E122F23940AC2740DBE0F46D7B36BF1A1DC08D49B00EAC3497F109F11AE261084EA672F8FCB01EB7531F322E0BA5D661A0076FE28080EB0C3CF8040C08E803DB72A2457E39E557A226D04EC08D83B0DD8A7FDC948A7F2380276C702592E6703490625140802F6B397C7E500F6BA98791180DD2E330D003B7F060007D8E1C5FF11B0236067947E922FFCC72A3DD13104EC08D83B0DD887FDDBDBF1546200EC5504ECF508E4E66E3ABCD7A8018E80FDECE5713980BD2E665E0460B7CB4C03C0CE17B4E7003BBC923D027604EC2C5EC9D79867959EE818027604EC9D06ECFD797FDA17037661FD6404EC8E0532980DEE07F7EA0241C07EF6F2B81CC05E17332F02B0DB65A60160E72B9973801D5EC21C013B02F6DC67A51CC759A5273A86801D017BA701FBED32FA273100F62A02F67A04325D46FFD4058280FDECE5713980BD2E665E0460B7CB4C03C0CE97B0E6003BAD8583801D01BB33C04E740C013B02F64B05ECF9AD1D08D81B0FC3428120603F7B792060B7CDCC4B07EC0066CA01BBB87EE93C589DA24298BF786F84D339BC4EEFF5A29B31FFD44AF43244677597E83541F1FBA8406E54FED83BAC369B8F1F1EFCE7C0EFFDFE297AFDE53E147BFED2EAC0FC1D8F04503D79A5581EB5C8D4326999960466B5424F787249D9E2B15235558124CEBBCEF0E287576FB37DD83CEFC80038E9C7F77BD9033AF65A207E0E366B6E4FA2415771D5D4AE8A52B46C5B5D2A349C136326B4D7B717EFB039F0924A6EE80987E7FD403CB5F4EF8807DE514D0E1BF2C786967F2E4A003CF6DD7A171C7DF969037EFCC0B91C35F0670895EF43554C7B7638BD85E069B5DFBC910E815D65CC06E1C103098BB44F1D60885E887B2C0C983338CA491B2710B012D363EC45B94499BAFFE96F8337FF7EBD0EBBCF7B469FDEEF79F4812AB577AAD54FFBB06B24CF7BFFF8E1F66E40F4F82594CDDD24FEDF589FFD6FA18E92BF233E46CA19DF7E0F879F2550215E5CBD4419D59BF74C662FBE117F122A79885D630DFF4EAFC4991F1D06C4B2A2BC2F1A5A9457868F4D26244E54A4105FA2DCEDE38757EF8F60FF53046E23DABE7738DE1F361E7B7341AFA52858F8E6EA4092417A79BA596F3885A69B1658F81B5F3355AFDFFCD03C7672EDDAC7F71B552E1759602D2284428265B0DD06EFFEFAA7F0997DE45139F9F04FE8B9697BF2BA5E8EFA8B59CE39E7BE9A4D8793317F64533C1132482FD34990D8FA44A8E2945CA0739A46DC0D8EE588EB893E71E9902BE1941073A54CD2065D2CD9CB405DDC88797BA6CCB481BB7262D3E3ED45012F7EADC37FEF376BB24EA1FF733477CC8929BADF230FF4FABDF811919814963ADC50DEB90E7E75AF4250F97CAB776268BEAE3A7BDC62D9C72E7B6D947DD4B7D74AC9A7517B8D143E7DB86D26FD92E2A6992B4EDDCE62098CC3652AA5AB4F08D412B07D4C7E54D8CE9CC69A364AFEA24E566BE587A5E538EBE094B8F070902D18A3E8B867D12055F9A54FCA20DC498F95E0C39EF1F91218FF783D9D8F2737936CFB552E55B2170121AD406220A41D40148434038A83F0863423A17E43180BC96FD35838EBDF8C6FB8382166FCF946C35A47D98578C8576D97C7431ABB301EDA8887CBE562C95444CC696A3675681A0F21AD40E221A41D403C8434038A87F08634E3A17E43180FC96FD3781832FEF63EABDF55CAF8F38D87B58EB20BF1902F8A2C8F87E0EAC8180F05C86DB1982E24C82D5360D378086905120F21ED00E221A419503C8437A4190FF51BC278487E9BC6C3E968D19F7353D462C69F6F3CAC75945D88877CCD51793C04171FC57828D0D4C1FDFC7E2ED6D46CFECC341E425A81C443483B8078086906140FE10D69C643FD86301E92DFA6F170329D8C262335C69F6F3CAC75945D88877C493F793C04D7F6C378289AC910EDE38E35355360F3F952FD5660F3A5FAED80E64BF59B01CE97421BD29E2FD56D08E321F96D3E5FAACEF8739E2FAD71945D88877CC52C793C4CFC25C6437ADF553CCCE6CF5CC643592BB6E3A1AC1DCBF150D68CF57858DE90C578286E08E321F9ED321E1619DFCD78687D94671A0F4B97D0C0D7CCDC5E6ECCB3B5D6B9DCB4EDB5521A226C3723091036D7876378A8AAD455CB7684DACA7915BC7C5CCEEB91ABFDDAC1DD104549D65D48CD3AE79B8FA14252557506951936233F0586E5E51B5D8B653CCC9F2DADDCD1921A7E4D7414864A5436BC0CCCB7BA204CE19C90FE2274185081B403822AF08634C10A6CF93EC2152770C5827A216071615A0859CE0AB22CEE677D66893F5B2CB76DA0C56A578D604BF9A48AF98E24842D82B93EDDBD0230D8026907045BE00D69C216D82E0B842D4E608B05F542D8E2C2B410B69C156C09B975BB88FD47110B64126E076CB1DA5523D852BA7D2C852DF08D63085B3857A4BFA503065B20ED80600BBC214DD802DB0C83B0C5096CB1A05E085B5C9816C296B3822D8BF172B4CC477D5EC22D996DB1D95523D852BACB2F852DF0FD7D085B3857A4BFF306065B20ED80600BBC214DD802DBB384B0C5096CB1A05E085B5C9816C296B3822DF3C97C3CCFBE03B2582093703B608BD5AE1AC196D2CD98296C816FC344D8A2B5203CF350363E12E9B703FC48046D48FB23916E43085BC86F371F898CD50B618B0BD342D87256B045C8B0A2845BF391C85E578D604BE99ED914B6C077CB226CD172451994750B5B64ED58872DE50D59842DE28610B690DF75C31645F542D8E2C2B410B67405B6E427365A0D5BF4BB0A822DA56B5AE04B5926D4635F204A911573D0DFBDA85FD1C3EE1E6A7BAD00AA7958DEA86DBB19CD4A1EB8519B50B60CB35803492FE674EDEC83B52DA024649504D8748B8339B843E3C61FABA43364ACF9A04219BA8947E7484B3B86290538D01AFF2E424B710FBDED8EEEFC2846497A99937A1D1828AF697A0379EFC8400ECA12710EAE4D46A12C8E968CE20A9417AA5498189A5798C04491D302C8AE71C0613996EB58D86C0772588EED7219F61BD23D2C07CB6510DF8349634A5C078D63D2884923268DDDD652AC62E2A2AB6E134758586F65EA58EB501C268FF58EC35DFAE86A1C5726096469AD9F348184D7FAC10452B0C641BF7E07E8F471AB15856CB6033B7DDC6EE122FB0D699F1E80858B08E5F8B1C7B81B9840B21C93F00F13484C20CF444D31816C4302B9BCD07A52C2AEBA4D206161BD950964AD43719840D63B0E7709A4AB715C992490E52B54CDABAE6102C9E901A49212E07872CBB5DD6CB603399EDC760939FB0D69269058420E13484C201BE220269098405ED217C80BADEC27ECAADB041216D65B9940D63A14870964BDE3709740BA1AC7954902595AFF324D20E1F52F3181E4F40052D34E3F81B45D65D3663B8004D27A314FFB0D69269058CC1313484C201BE220269098405E500279A93556855D759B40C2C27A2B13C85A87E23081AC771CEE124857E3B83249204B2B11A70924BC12312690822FD1B93893D3834C3D4C1348482BB0750EFAED8096B0EA37035CC20A6D487B09AB6E43B1DD63028909242690861CC4041213C80B4A20853D2B869A762490EEBBEA7A092B24ACB73281AC75284E97B0D6390E974B58DD8CE3CA24812CAD099F2690F09AF098406AE94136F5E6328194B562DBCBC8DAB19C40CA9AB19E409637643181143714DB3D26909840620269C8414C203181C404321F6A5A9F405AEA6A7309A43CAC9F5D02697D280D2590F6C7D14C0269328E2B480259BA7415BE6235C910305F4CC5AE7F0E847EB6A8DF06C4A1E8B702C814F51B01E589D06634B34448DDE58BC8112987126E8A7D230FBEB411A79A98AEC98F584C4093AC2409B1C04AA20083ABA45913FC2EF423468E6937B43317A767C0017969804BBA7EB4DA251E2E01036E2AE5F36FCCCBE72392E3AC1BCBE703C20B96CF475497E7546DA8EE66DABFEB4BF68C82719D025188352A9005189F02D59AD05DA127ECBCE019E1BB4A7E22C2936AC0A55682374279A535AE539407AF718D284F304D8B35AE01EB3BB0C635A2BC4650DE7239BFE3A758134181CDB39228CC1A2BC9828CAF926A6D9FD0733D610327E9C879A0BC4A7E22CA2BD180CB2CD76C84F24A0BD1A6280F5E8816511E67E35888161068B0102DA2BC3CA76A437993D16CCEA4E4054101CD538128A8F44335594811AF6AAA35A1BC424FD8C0A91FCE1B437995FC449427D5804BADA96A84F2CA97DC99578B4494C7DB38568BC46A91582DF26C50DE703A9C0CE3210B0405344F05A2106B54200B303E05AA35A1BC424FD8C0493A721E28AF929F88F2A41A70A9850F8D505E6949B714E5C14BBA21CA13CCD7CB37D66451DFFC8BAD7E2B58D2CDA4212CE9D6D52FB6658272629E8EACD18DF1896CADD64DCF4C47CE03E555F213511E4C03D8ABADF8626BAFAB4628AFB4EE528AF2E0759710E569D97886FC5DA23C592B5877C9A421ACBB7479288F3A46DBE6E9C81ADD189FC8D61A4079A423E78FF2B26120CAD3D600F66AAB519E7E5741286F34F7F65FC93024086FD4234FC442D54677A36BEA5210DD55D8762158D98B181C617B5183236D2D7270942D2235096D2BE08C871CE788C774DD9849A100D687A57DEC02FCABCFA06BB3BAF3AF87E25471D0639FB7EE540163F43A352965BBDD4BD734E48CBD4B1B55C45A1E7B477E847D62AFC5A86AAC3FB9612D8BB5D851780EAB522B2ACE658D0B4661528B49AD0B8884496D9B925AB3CA28AC5B4B7B89696D2BEDAE0B85A030B145EDC1D4B6FD6AD97617D3351DC1E4D6B292D8DB72319EDC4C08A394F0559309AED5AE1AA7B8A585F2F2292EB85A1EA6B898E2BA004B98E2B629C55D1A958562DD5ADA4B4C715B69775DA88287292E6A0FA6B8ED57CBB6BB98AEE908A6B89695C4E24AE4C552F2094184AF9A4C71AD76D538C52DAD129A4F71C1A54231C5C514D70558C214B7555F718D6AE2B16E2DED25A6B8ADB4BB2E9400C51417B50753DCF6AB65DB5D4CD77404535CCB4A622DC59D2D16D38538F116E1AB26535CAB5D354E714B4B24E7535C709D644C7131C575019630C56D538A6B561094756B692F31C56DA5DD75A1FE31A6B8A83D98E2B65F2DDBEE62BAA62398E25A56126B29EE74703FBF9F4B7AC55E6D3EC5B5DA55E314B7B43E7C3EC5051789C71417535C17600953DC962D546679C1FAB551EE2AA6B898E2EA6B906EBCC61417B507AE3D98E2B6442DDBEE62BAA62398E25A5692A60EC66876A1B2C5AE1AA7B8A58763E4535CF0091998E2628AEB022C618A7B2629EE387715535C4C71F53548375E638A8BDA03D71E4C715BA2966D77315DD3114C712D2B4953A702B534C5D5EF2A28C51D1355793AC5C629496FC7BDF4A958F7F533DB44B51D67B6D427E4FC49A1E237B50DB6E437EB495891B7382D1E931FF1A0928BA6C746EAB701718AFAAD00FCA37E23A0141ADA8C6636ADDBCC9926D6FA79AE322A2853D43ED9446C89ED59A336933208FA513B8EB0C63176FD744293B3B26A4521163B6A8641544E76C8B088F9E90E0D8292E1A43F881D0D6B6731F4CBD8FEF0E2AD4392D3E5F9029559FF667CC33994E2404DA10AA415085881B403802B9066408005DE902664D16F08410BF96D0A5A608C3F37D852EB28BB0E5CCCCE43A915BA58EDAA15F0525AB39B072FF0BADD0D8297E57236B8CE0063CEDA324CD301F0B25C2E6EEFB3920192819A8217482BB0E967FD764073D1FACD00172C401BD25EBDA0DB108217F2DB14BCC0187F6EE0A5D651761DBC2C8D2ADDD70A5EAC76D50A7829ADC6CA83177845D606C1CBCDDD74789F81C39CB56546D801F0321D2DFAF3EC3020C9404DC10BA415087881B403002F906640E005DE902678D16F08C10BF96D0A5E608C3F37F052EB283B3FF36254C3B856F062B5AB56C04B699D3D1EBCC06BED35085E06B3C1FDE05E6C6DC442BB025E26D3C96832AA1AA8297881B402012F907600E005D20C08BCC01BD2042FFA0D217821BF4DC10B8CF1E7065E6A1D65D7C18B5975CA5AC18BD5AE5A012FA5159478F002AFA2D42078992EA37F626BCB8CB0139F8D44ABF18B0335FF6CA4DF8ABD5D0BE5ED58DBC250DE8CC57DAE2A0D59D9F45AD6108217F2DBFCB31184F1E7F7D9A8C6515EC0672396992C22C878D99ACF46F6BA6A05BC94D6C6E0C10BBC3E464BC14B86243B0E5EB281BA042FB2566C8317593B96C18BAC19EBE0A5BC218BE045DC108217F2DB25789133BE4BE0C5FA282F18BCE427395A0D5EF4BB0A022FB7091C21439180965BF31DCF149134815570C7331B549CB6813B9E71C7F3596011C6DED2C242AC81A41773BA56A841D44C6DA247BE4C5CED0047C8AABCF177948339F04483CE1FABA43364ACC288B48947E7484B25AC3F67352DA04A6BFCBB082DC55DFBB63BBAF3A31825E9A5729A6B33A003B3BFDD7B47067250968873706D320A6571B46414574659A64A4D8B2CDB34AF69D160DA89352D7203354D46B1A605D6B4C0B414D3524C4BA51A98A44C9896625ADA4A06624D16175D759B9AD65A4BC86D725AEB501CA6A7F58EC35D82EA6A1C573652D4D2CA457C8A0AAF5CD4608A8A958B7203354D51B17211562EC2141553544C51A51A98A44F98A2628ADA4A0662E52D175D759BA2D65A31CE6D8A5AEB501CA6A8F58EC35D8AEA6A1C573652D4D2FA747C8A0AAF4FD7608A8AF5E97203354D51B13E1D2C45C5FA7498A2628A8A292AA6A898A2762645BDD4FA8AC2AEBA4D516BAD0BEA3645AD75280E53D47AC7E12E4575358E2B1B296A6915523E458557216D3045C52AA4B9819AA6A858851496A26215524C513145C5141553544C513B93A25E6A155D6157DDA6A8B5567F769BA2D63A1487296ABDE37097A2BA1AC7958D14B5B4D6349FA2C26B4D3798A262ADE9DC404D5354482BB0D520FAED582ED7286B06B8D017DA10D69AC614B53EEC8F292AA6A898A2765B4BB156BA8BAEBA5EE80B09EBAD4C516B1D8AD385BE758EC3E5425F37E3B8B291A2969E28C0A7A8F013055A9AA266B36A78A280C3566CFB31593B9653545933D653D4F286F044014C51EBC3FE98A2628A8A296AB7B5144FC470D1D5E6525479583FBB14D5FA501A4A51ED8FA39914D5641C57D21475F5E2EDBD5598E0915E9C0EA10A91B7A25429EA6392B8FEE47BEB7008C359F83C193A9BAAD29BBD618FDC8EDD773E359DFB4FDE697BFC1CB6F6BCF7DE5E96C18EC45F92457E2D10A2DB58F9EC95A2F183FFBAF969B35EFBBB38244873591A7DF6516B87F011EFB0DA6CBE443CFCF8E1D5FB23D8FF741F068868A07E18C9EE0F1B8FBDB9A0D7A2FB2FD183C237570722147A79BA596FE2B673A9EF60743D939561E22A05DF92D4F7FDC7AFFE3EE55F9F66FC87BF52927425F5E1AF593434F65AFF26E4EAB3773CEDFDF056F857AC82C7D0837BFBF52C6486FFED78A29304E1EDDDE97519EC5FB34783ED9A6801F3C043321F903CF3B60FDE82FD7113EC3242ABDDF1DBF17E7B2C1C0C6547F76E4A75EFC692EE51AE9EB7EEB120ACA089809AD5959A188FB89B5A372AD5BA9125ADA34B4E3AE4F150CFF4F46C5CAA67634B7A46798A91F562F5ECB654CF6E2DE9D96D17F4AC248AA2D6E969DDA454EB2696B46ED23DEF761BFD2BEA99E88097391DBC9292E59386F8A3583715EFAE54F1EE2C291ED5AFEEBA3B54C33235CC94EECB2F3FDFAFF6C1EEFB2BAF73E1BD5E72534FE3047A2556ACD3EE65B3F6FFF5E2EF7E0F49ABE95A512AD5637F4B7AC88F7DBD0EC576908C9DDE148D9D5DB490B3AF8C6866A96ED86175DD83E82B88059F56E046199B8D3D1B234E3DAE576A5CDED1741615E5C436DB1C7DB1BCC89D16F983BC74F4BD43090F82B58C07D19D16F1201F7F3F7E0815EC106CBD431A58994B6285CD87B66B53D6857CD8EC36916A8A19C8DCBF0855FA1FFFFB63105ABE981BE95D542979ACFEBCF79FA2A87B3CFA1236E69E10B1B22C6AB32F9F55E8D61494DDE8CE71AD523036E23C2F687BC15E5BEF2F030F3C78AF6F5B4934A4F73AE2BCA49F294DD8F725BCFF1E0ED697580873BF236C74022BFEE9ED37648DBA9089E9DD16B1D011A408EFED23AFC83322BDD31413AE97A3FE629663426E6EA63FEFCFFA92A9E86CE73D9D8A9E10951129D629B94057AA2871538C2E3EEDD6FE37FEFCE74D745972D0338B2476A1EB165D8F22F66FFE3A42BABE4345330113D182C3886CB4F633B24FF2D88BB77B0E29C57FC76C256D80D8CA9F5916B39576FE12D87AE380AD7C9DFD98ADE282FA9D64EBD8015BF9DA90315BC545203BC9D68903B6F2F54C62B68A0B977492ADFD6B077CE537E1C57C15EFB6EB265F5D04AD5B095FE92A818BE0AB8BA83591F0957E83BB08BEBA085B7712BED2915F045F5DC42DFAB55CC2DD177A5787C734D570C8D226BFC83FC6FF857C4564187FF477077FF1FAF6E21D36FCA7597ABF973E2062BF4E9E4BBFE31799FEEF68FECD3B0AB82D48706DAF5FB6F58D9B32EB1FA740F0352FE1647C17EA29D8B959B6B9B239F46192D543584E7DC6DB744D7E2BED59E9B39B566EA6FDBBBEA43A7D92ED2BEE4DD2A31BF922DAEBCCE33D4653D921A9E198D0A20E30FA8BF3719331699BEC288CFF228F64BB44A396E219C4C4ED39D2504DE32EF988C0A94CA9969A7E3CC8D9839E72D6EC030CDDE76FFE93BFF7772BB9D5674FE8B153C0B064AAD7C081B29123649EF7964E1A27D2081DCE76165EB7C25DD600090D9A89EAFB5DBE64CACF917946C55038D6933B3D724BC473856A286331AB1BF8F8C8155368417913520442B04BF19AFC1415245E0D18BB08692D1330C9B20802265A52A5044CB3B42489215549FD1120D52B4E11BA506C8433C70410B07040CF36DB9602506EC4A6ACB5EFF85C2CBADF6693961597B06694C07DE96CCD18B4829C15AC8353022B42D1909DF418D73A6904B9B23F2D9CBB51B2E2B6F6BFFB81A745266760045555855066B5C8EC5DBD26D22CDA4E9AD18D6B22C564D96BB4225232A361AF78136A84E3C0E93240B64CCF06A867DDD43399268066F368DD637E996036AB97143B4E2481D37BE9132EA7F714BEE7E8DB99E1472203B2005B53A00A9AE653A6AB69C52A5FCA70AA0FA7FADA6ADDD2E9BEB698B7D96C879279E2A45F33937E18EDBA640E38FD87C1A85BC6D7DA6940949DA6ECDED5A76916A3E9703A4C29B325D2CF62421075A3D154AFC53AE76E721075AE253AE7629A90DFF6CA4F138AB7C0E234A1A369C2E5727E37CE0E25C86905658ABEBD291085D89B025980BD2950054D132AD3D5B4E34ABA384D88D3842DB66EE934615BCCDB6C5E44C93C719AB09969428C765D32079C26C460D42DE36BED3421CA4E5376EF5A27298EE65962CE4ED964FBF75A3C4D88BAD168AAD7629D73374D883AD7129D73314DC89771E3A709C525DD709AD0D134E164349BCFB20F0839ADA0A2D0B73705A2107B53200BB03705AAA0694265BA9A765C4917A709719AB0C5D62D9D266C8B799BCD8B2899274E1336334D88D1AE4BE680D384188CBA657CAD9D2644D969CAEE5D6365D7F572B058A694D9299BFC7AAF964E13A26E280755B7C1B3753AE76E9A1075AE253AE7629A903F96809F26141F5180D3848EA60987D3E16418CFE7705A4145A16F6F0A4421F6A64016606F0A5441D384CA7435EDB8922E4E13E234618BAD5B3A4DD816F3369B1751324F9C266C669A10A35D97CC01A709311875CBF85A3B4D88B2D394DDBB466DB8E52CFC4929B35336D939A22D9E2644DD6834D56BB1CEB99B26449D6B89CEB99826E48FD9E4A709C5476EE234A1B34DC7D18F582BA82820AB772B89C256EF569205ADDEADA40ADC74AC48577B5570055D9C26C469C2165B77C9A6E37698B7E92E4B05F3C469C266A609DB680F680E384D78E6C68750B3796370BDE91865A725BB77AD0DA02C6576CA6694BBDADA4DC7A81B9554EB089EADD339979B8E51E75AA1732EA609C74465CAA709C7541E384D983ED1D4342115855D7B4BE46BD9DE2859CBF646A95A9F26CCD1B568C7842E4E13E234618BAD1B344D58A779BB9B1749CD13A709DB374D88D1EEDCCC01A709311875CBF8CE729A10652790DDBB95291B12C7D2AB67384D88BAE13CD56BB1CE35334D883A57A3CE599B26FC79738843173F3D486EC5ECD79F15A4D368382BA8A304787CB89426CEAEE9CD263CC62323B905E571220FB1AB79F4565F9FF7C129842C94A0341F510E770599C6E12E7F76BB4ECE562FD7DC4D87A0994B695A9E9610C91338430025E53641445572A14A6E13379499A1CC4020977E0BEF13918AC16EF22D3CE119A2DEF40997A817CFC5543ABF12D1EF99A1DF8254D9C99ECBC6BF68F02E0F55BF481C8C2AE552A5DCE261945D53E75733B858767E358B8B9383821017A74FE0F9D5CA64411F5BF03CE8EEE1E28254F307B425CEEE1271311A7CDD47EA8AE4DA295C8C2AE5FC605A3C08B2EDB233C1C5B2031B595C9C54C6475C9C3E8107362A9305D8452555C4C567888B0B52CD9F489238BB4BC4C568F04A068FB81863483B540A4FDB3A0BD999E062D909452C2E4E4AC1222E4E9FC0138A94C902EC024FFCE9222E2E48355F823B717697888BD1E0EB3E344524D74EE1625429E7478F60A9FFB6CBCE0417CB4AF2B3B838A97D86B8387D024BF22B93B5BC6935AD4187B8F8ECD651E45ACAD79C4C9CDD25E26234782583475C8C31A41D2A85F594CF427626B858568396C5C549B10FC4C5E91358835699AC8B622E888BBB858BB34A3A888BD1E025068FB81863483B540A0B089E85ECB471F1C38BB70E3B48A4CA43E2E46ECC2C7D307C1DDF691E0C53CF958301650540928B11034282D3A4FA211B0E594B39E74A6E0E0AB22058AD177459D204D6C7A645BF1DA847C14316EA8B57D61DA7D70DA2D979406994EAE5C15EA1B0ECF3F55D3D879D5D47FF52A9B39513D96BF594A6EE347BA0E0ADA29E187DCABCA458ABD1DC70D21FF40745E71403E84EE1B9A6CA8920A66B63F4D7AC586314FF752BCE20AE43C922B66B3378598CA6C3E930957BBE2E207BF552D19D550619E23B595DAC02BE8397C66A35BE5B2E6783EB99D84565B0AF03F8AEA9B21888EFDA8802342BAF18A100DDCA2988EF50B288EFDA0C5F96CBE5682EAEFB9CC5CC4BC67756196488EF64F59D0AF80E5EE2A9D5F8EEE66E3ABC971612482E7700DF4D1A2AEF80F8AE8D2840411BACA10085B610DFA1649D4816F19D325F35E0CBE27A395888D717E727AD2E76FECE26830CF19DAC4E5101DFC14B15B51ADF0D6683FBC1BDD845DDA4973B80EF9A2A5380F8AE8D2840B31286110AD0AD6481F80E258BF8AECDF065B69C853FA9DCF3F5C6D8AB17BBFACE26830CF19DACDE4E01DFC14BEEB41ADF4D97D13FB18B1AA5973BF17D56BE53C7E5767BC477EDFC8A57A90D16BFE255B685F80E25EB44B288EF94F9AA015F0A7267E14B16332FFCFBAC3D0619E23B59DD9802BE4BB6165F10BECB5696741CDFB9DC368EF8EEDC5080A03281331420AA2C80F80E258BF8EE4CE14B163311DF5962901CDFAD5EBCBDB70A3D12B1CF0CE3EDFC5F4FAF8FE1E5E81516D9455EAAB78BEFC5AA9B877373FFC93B6D8F9F43B2CF7BEFED6519EC8EF1833CAEBBBB8BEF98E03A6A4687BF92DBF10DC69424237F4B7A5818F921B6A83C9A3DD03114065B0E5B6D0C8FFAFF0D8175919686A21E1307FAE2ED9E43171BFF4D9E5D85ACF6BF1D4FDEF6210E3D311F0809081F44DB6A0EB26D348DB0E27650132B442B500FB215A78DB02244A735F142B45AE3205B9DD10C2F6E6244E59E17A22F1B07D9978C667831890B93B8E7C5F4B4DDFA62E7D9A3F71AE54A18B4D2FFF9943E4A52E72BE6AE1BB6487C697CB369972AE64C12471D7346E25A29671AF6B062CE24ABC61D7346E26829671AF6B762CE24EBAD1C7346E27629671AF6BE62CE245F2A9D716616D2DBEC4EBE9835E9DD4659C3CDBEF607341815012EB9E88A4512679CDC6EDA1DAB7129C2BE4EB92471CC29971A76CD6A5C22B0D8299B245E3A6553C37E5A914D116276CA2689CB4ED9D4B0D356645304A69DB04932DB427844EF35CA1F71504B3ECF380B6AF1D025FE3ABED94EF07C5B0F67243E9A72A695E079520F67246E9972A695E099D077CF198927A69C692578EE13AFEB9235E97CB59839D96D7DEE0CA9B215B8F3EF65F4D6518D2D16819F6845C7E1485661F4C9B20D3107C803BD7E2F7E44C40585851C37C9273DC7CB34EA5E5571FEAB114C3E30977DF7256BCD05DF7DC7E4878C80F9EE9BAF0E1B7FD98A9D4B34160B9FE69D7C476FC118CFF423B5FA6E06F293722DFE1A2AAD259C5675B0F6B1B8898E1AB8F092BAC745576E5CFC187D3AFAF4D81266FD9BF18DA4965677BC7AADA3ECBA5F5FDCCFFA4C790E76954BDB3CBBD5AE9AFB76C99C88D0B78B6748D0B767F68FBE3DD2B812AFB75C2E6EEFB3C22039AF97D5833B77DF5EEB28BBEEDB97CBE5ED22B68AA2C31456106CD0B75BEDAAB96F97CCEA0A7D3BB8E821FA76F4EDB12D4C478B3E53EA33E7F5326778EEBEBDD651761EB78F97A365DE35F2BC6C096EB7D95573DF2EF92E25F4EDE08267E8DBD1B7C7B630994E46936C4370CEEB657560CEDDB7D73ACAAEFBF6F9643E9EE7F718F1BC6C876FB7DA5573DF2EF9B22EF4EDE06247E8DBD1B727B315F2BDB399333CFF39991A4779017332B25DA5C2AA21CDCEC9D8EBAAB96F17D53891F97670A113F4EDE8DBABBD5E0678BAECDBAD8FF2827DBBB062403B7DBB7E5741BEBDF4F329FC7B2959F6DD3DFF5DE72A3898BFD46FA550C7C3DD92BEEE95AEB2E03C2D91C2758FB8EE31F6E72A4B1E07E68B1DD1C15B58100773F19076404E1EB6C20FDD3CBA795C0659A3AB2F87F0E66B1FD1D55B581F079DFDD06F07E4EA610BFED0D5A3ABC7559135BAFAD20591A9AB872F8544576F61B91CCCD543DA01B97AD8FA3F74F5E8EA7191648DAEBE747D64EAEAE12B23D1D55B583D0773F5907640AE1EB61C105D3DBA7A5C3359A3AB2F5D2E99BA7AF8424974F51616D3C15C3DA41DE0048E6E43E8EAD1D59BF8CF92B52B99C2B56602C75E578D5C7DE9EAC9D4D5C3D74DA2ABB7B0B6CEBEAB97B563DDD5CB170BA2AB47578F2B2A6B70F5A573F4F0A9F9097AF6A223BC263F4547182FB6627D974D9290C850493477C09A159A17E3F1294312E68963E3A3B7FAFABC0F4EA18FA13DA0940C1C4D4100B1A3C9F15FD9F939D876B00E4E89833253227B67F6F14250E7906A80AD6491E828C3F60C5331F6578E52708A637B0659854AA42369B5B305EEC5A9C23D66DB8A9A8966E283410D98B4F3A368A1AB2E92E3782D74E75DB53BC296559C90567F0ECAECB11D20143C8DDE489439FBBFEC5D6D73E33692FE2BAEF974F7E16A6DD992E5AA99ABB2656BE7AAB2D95C26B7FB59963563656CC92BC937B9FCFA234190044900041A00F1C2CE54251952048846BF3C4F1368D81F097C52FE0262092AEBF42FCDD7E9236DE8A8C2D5DDC5CD8560010C983828340A71B60ACD02E2596FAB8586237D70471F5A53C0E6292222104A8A84140229445414C2A3D30D9246F88B6D482592A1129AA82B6832A1EB2086A313D2BD60159D80EF05433AC1F91C7B7FD32D85502803158A7E08526814F68DBAB7594064EB6DB5D070A413EEE8446B0A583A51CD40F874424991904E209D888A4E7874BA41D2097FB10DE9443274421375054D27741DC4707442BE96C97CBF31D2898E32CCA78B7BA6AE484319A8A0F5439042A3A08D6CFDCD02225B6FAB8586239D7047275A53C0D209FDB59DDEE8849222219D403A11159DF0E87483A413FE621BD28964E884C26C474327741DC47074425AD3A2A213F09A1648273ACA70797739BF2C706A4719A8A0F5439042A31097ABD02C20B2F5B65A6838D2097774A235052C9DA866207C3AA1A4484827904E4445273C3ADD20E984BFD8867422193AA189BA82A613BA0E62383A21AD9B54D10978DD24A4139C4F553CCC5828031534E403796FA3F66B2F41235B6FAB8586239D704727B810AB3503E1D3092545423A8174C2EE209D2F76F2E67483A4130AF27014DB904E24432714663BA2C54E7A0E62383A21ADCD57D109786D3EA4135ACA40056D370495B367BDBE9F8BC8465A2D341CE984173A51CD40DC74A21E06D289E1868974423692E09D6E7474C26D6C433A310A3AC1415DD1D2099E83704F27A48B9CE06B9B68C568640FF5DCEB9F75AF1F80F4FB80F85FFD5E00514FBF13507972DD6E0A9B4382A34D70CC908456693F4B4D424CC3433D4F35B0F3635CB58221660D840BA997D35F907FB8EAC05EF35F4CDFE28BC2A0944A91CC2BF3229988AD3AE6BEB8B89A5D75CCBDC0D5F6D015A417481081F403882B906E40184BBF2344595E5016D69AB554E54F236AA5515A1566E288B8B82AF170BBB810EC670F0D73597D5523D425AD2558A12E782D41445D9C6CE6C3F56D7DD078C3E8275CA3877D54D1EF05F65541BF1FD0D71CFD6E8007EFE97684A8CB0BEAC2929C968AA169C4AD542A50424C1C5197402596D70FEDB4675B9661A02EABAF6A84BAA425D72AD4052FB986A8AB63F477D3878B7B0145AD7D8129EA82F4020928907E001106D20D0875E97784A8CB0BEA9A63E5423B35A334E256AB47366E4554A80F66E288BAB82AF1305B4E974DD0D2956520B92E9BAF6A84BAE48BB6CC2B5321EAEA3ACBBBF9743EE51B3D79C60AEA82F4020A28807E201106D00D0875E97784A8CB0BEAC2026F964AEB68C4AD34EA99C14C1C51175725EEE7F7B37B7EFAB3966518A8CBEAAB1AA12E69019F0A75C10BF820EAE224B8C5FB256A5F60FE8551BF17FB6510F8FD582F3FC1EF06F88551B723445D5E50977CA29C588D23237163133C1370B27795E9300ED4053371445DFA2AC15E0DE20BA3BD5735425DD23A2715EA82D73941D4A565F435127789BA44BDD8DF2DCEEFC7FA2E7D7E37D65117BF23445DC1A12E2C17A451A8C14EDC4AA63A4E79195197B94AB05783465DFAAF0A425DD3FBD5E13B198600714DCFC82F8A49D5465BD373EA4B1CA32DAA7BC6D1809DF00000DB44E4300CB6C7C3DB94C51978AB9230036D3452FCA3EB3D14F7EDB35EA27A9D3E64A51CEB644A7141C6AF1CEFBAA6090D710E02B90900B2373037B5E9C2189B8B8274618CCC4B15BAD6EB0739E5B9602628187D84398097B2C92BED09C6A82C9F49BFCA35E24228B45755FD0BA0509E850A847FA1CC256F458FD9A8546829188E719916A43A6EA88E518D0A93564174C7AC4A05BCD9C26292A73CCAC533580752BD10921E95C121E91978D26C0C0D490F921E243D487A90F420E9512990D4243DE02A49487ADC901EA3123126AD82488F59911878B385C5244F7A946BD7B00EA47A21243D2A8343D233F0A4D9181A921E243D487A90F420E941D2A3529FAC497AC045CA90F4B8213D73930A4D26AD82488F42BB10D2D3DB6C6131C9939E961C58D2D35C05CB3A90EA8590F4A80C0E49CFC093666368487A90F420E941D283A407498F4A79C026E901D70844D2E386F4181548336915447ACC4AA4C19B2D2C2679D2A35CB98D7520D50B21E951191C929E8127CDC6D090F420E941D283A407490F921E95EA9C4DD2032ED189A4C70DE9E18FAD00BABDF5094D5A052E6FEB6D17B6BCADA7D9C26292273D2D39880B27B20EA47A21243D2A8343D233F0A4D9181A921E243D487A90F420E941D2A3521CB7497AC0157291F40C4F7A7ACB839AB46A9DF4F4170885375B58CC98494FB36E29EB40AA1742D2A33238243D034F9A8DA121E941D283A407490F929E51939E19D1BDAFEFC5FB0A08CFECACFA55A1F2FA5CA774221EB84E7F11E380598EC88318159106365AE85B7494C113AC37107238785EED580577434AFD0C8505F9A7921C5B5A9CBDE6FF04058B2F6A16A7542A8DD6F1CABCDAA8C7C07539BF985C4CDA6655242F6AB17F795E3D654DDE2DE30D66864542C1CD624023FF350C684A628E2DA4B91C54EA41EDE1767121D8521C5A58B3FAAA56029BB49A5C37B0C12BCA790C6CCBE562725E83898671D5F12E81C06658080EDC2C0636F25FC3C0A624E6D8029BCB418DE0C4BBEB879AE7360B04B2578338F1CEDEAB5A096CD28A41DDC006AF1AE431B05DDDDC5DDE0A8BCA949713086C73B3623FE06631B091FF1A06362531C716D85C0E2A79C6365B4E97CDB8D0755B8130369BAF6A25B049AB4274031BBC3284C7C036594C6E27B77CE32206994A60332CE8006E16031BF9AF61605312736C81CDE5A0520F6CF7F3FBD97DCD769B853ED8ABFE039BD557B512D8A43B7FBB810DBEFBD76360BB5BE67FF8C635AD2E27918AE42D392B070A0E6CBDCD626023FF354E452A8839BE54A4BB418D2015C9CA8E8D16B5DB0A261569EF55AD0436E9EEAE6E6083EFF00A34B0D52823F1C0A6B0310BDC2C0636F25F8781ADDEA0955060331DD488035B931C051DD8F45F1514D8AECB504586220868D7E6ABF7CBC3E570F57E1DB392F1F587E57E773AE673765C6FB7BFE552FEF4E175F5FBFEF0F97677DCE63D6E3247717BDCAED89B0FF45A7EFF39FF21F7C9F5914C1BBD7CB77DDA16A3DA16FF267E2677A6A5FC27A57F741772B456AB9BBA8347CE9E2E83F815F35CD9DEE312CE44356232F565BFAFCB972106CC757431CF26603B685486D7C245314F95FE96E068660A37E2D87E51DC3A3CD080D5B7090FBC25B822152A5BAD6A7261BED5CA23CB886AAB15328F489987E6A622E41EFEB847445385EC2345E31B35FF8868AE70D7A48B57451632D080A36121D27DB15D1602DF17EB918544B52F165948A42C44730728B2107F2C24A2A9421692A2F18D9A85443457B8C5DDC5AB220B1968C0D1B0106911832E0B811731F0C842A22A62802C24521632D7DBAE8F2CC41F0B8968AA9085A4687CA3662111CD15D62371F1AAC842061A70342C445A71A6CB42E015673CB290A82ACE200B89948568D6564116E28F85443455C8425234BE51B39088E60A8B47B978556421030D381A16222D0FD66521F0F2601E594854E5C1908544BB22AB11025B5A165470C51559D14C15B290148D6FD42C24A2B9C24A7F2E5E1559C840038E8685486B39765908F15029B1909AF4230B4116E28A8594BD230B099E85043655C84252343E642171CC15966575F1AAC842061AB05F16F2B63AACBE1D566FCFC40F944CE46FABF561FFDBE68FC2A458E2F19ADF297C5386F0BF9797AB0716CF99D692DB5D7A717353DC396E5EB79FB74F4F9B5DF1C3DDF3F669F3CFE7CDEE7F32C2422EF512908C3C15A862F558FE2E9F957C106FFB63E6D6E6E7C5EF453FB899F5FCE0E2EAAAEF1737939E5F6454A8EF17F3BE17BDBCEC7BD3CB79DF9B5E5D166F9A6B05151C87C1153F9021944F1F16FBDD719F05C7BC6912CD984BE415BE6F0E15E3BC2888E8C555A62ADF56A7F7C3266B29FB5B11864E992F5C1D9EB2C7F3CA7EEF949566B777EFAFCB8CA6D63FDDBF3C114D667EF0A57CFDF2376F87FDDBFE70DAEE777543EBDDE98FD3EDCBA955E75B6009EB4C7357EB4C16C4E9BE1F336E417ACD7921D73688AAB7ED83DC3DCB6F9FD5A6D062E2F79BAFABF797D32FA5E9E532969894A639896DC7E29CB250A4683D9259EE665DFEB679DABEBFFEF5B07DEA16012CEE9DE537E135FF66D7D6DC9E61DEA5931D08E0C80B92D5E095473ACFFF90761900DA2C025A809B22192403B9F6FA90E51CECF522E156F63AD96696FEB4F93C4C37FF70DB4D017758758B2247A78BFA17E7F99F4A0205EA17D6C5AD24536249B594E063316AD0411B964F22692ACB854D6D0182F5D44F26999FE77F1435ECBAA961CA2F6A83005B7C51205810560E6E8006E38AC1881E643E41E4126EE69793CB7AC75A237D650F3F407A812008483F000C01E9068422E01D69E208FD8E4682241EA6779777CDBD9B5DB98C114BC03406D1041FAF2E66D35973558C4CCB7CE209ABAF6A8628BA5540B988025CFD131185CC33881CC372F93099F7D62D354514905E208802D20F005140BA01210A78479A8842BFA391208AE57239BDBFA924C03AD05A2E634414308D414421D0B287BBBBA63EC9B4CC27A2B0FAAA6688A25BD18F8B28C095FC1051C83C83C831DC5EDEDFDC77D2968586D4D4CC1451407A81200A483F004401E9068428E01D69220AFD8E4682281ECE979307FE1A276ED5A9D1200A98C620A2E06AD962F230135458E66999D71C85CD57354314DDEA5C5C4401AECA858842E619448E61763F9BCF0AA7DC710C75890C534401E905822820FD001005A41B10A28077A48928F43B1A09A2582C39E70AB7E532464401D31844145C2DBB59DE64FF286B994F4461F555CD1045B7D20E1751802BEC20A290790671F252BC0DA8FE5A66FED543BF17D8570FFD7E405F3DF4BB017EF58076A4FDD543B7A391200AC93EAC5A2EE3FCEA01D118441436B4CCEF570F8BAF6A8628BA5533B888628688221444516F5D75892844BDD84614A27E2C230A5137D61185BC238B8882DF11220AEECE6E4414528D41446143CB024514FAAF0A4314F21599F08598F3500004554B2F254EC8A4D783CBFF691B79B1AFA7EB5E58D50B18F2F40C0A826F7A9B848099DE4601C8A5B74D104C516C551393F42BDF1800C8E09B4C8D5C002CA63CCCF23F8A63BC207516B4825F0F4AB23762454C45161C9A7A265A71A6ED5BAACBBCF2341DFB6E5DAF2C945BCEC614253CDAAAE9E6650E2B518D771278D0B9923895C322072CEC159C978E4B27FFA8BA746059B314B69F37C42B45262478584726C056C18AE15ADED2626E83B81520E153DADC3F31DFDC8F0CF0E31818E0D5DDC5CD45BDCE820EAA48628039A042A3A07245FDCD42EA13F5B70A2B48A4DAAE6E05A2BE7647C2063D140AF0C00797D38773C1CA6A6484C8089111063309C808ADCCCBC3EDE262D1746D52B7EE9113FA2F2262CE0A4D510AB85DB082B8977AECDCB0E7A3A0799916E4861FC7C00D97CBFB9B59FD2DA261C3741A21EB9F7A1B852D77EA6D16B4BAA9B755E06226C576B5D72EF5B43B126EB81CBEE48B0F6EB85CDE2DF9DC90374AE48611C05FE486294E0272435BF3722D488671DDBA476EE8BF1C943937344529E0760D14C4B5D463E786F2825B15378417DC426EF8710CDC703E5DDC3369BA860D53E5D1E7860A8D42B8A142B3006EA8D02A881B2AB7ABC90D7BDB1D0937F450BCCB07379C2C6F978520554689DC300EF88BDC30B949406E68655E1E66CBE9920FFDB96EDDE77743EF85FDCCB9A1294A01B70B5610F7528F9D1BCA4B2756DC105E3A11B9E1C73170C3CBBBCBF9658D3D1B364C95479F1B2A340AE1860ACD02B8A142AB206EA8DCAE2637EC6D7724DCD04319460FDCF061F170F770A73C4AE48611C05FE486294E0272432BF3723FBF9FDDB737554BDCBA476EE8BF44AB3937344529E076C10AE25EEAB173437911DC8A1BC28BE02237FC38066ED8D2E0860D53E5B15DA5971396AC356BBD062F2F2C5A6ED76A855DEA70B0A06E22DC507394C80D2380BFDC39456E88DC10E745DFAD7B5D53AAF5AA81AE29354329E0768752901172437939F38A1BC2CB992337FC38766E4895C776BD754E58B2D6ACF56AEABCB068B95DABB5D2A9C3C1D2E8E97343DE28911BC60A7F911B2237C479D177EB617243DEAB46C70D55500AB8DDA1146444DC50BECF10BEBD90608A10A860FCC4AA35FFF6C855A7617B04ABD3B43592D569D9A20B13B46DC58D71AC188F827041B7B6E59B51B8B4950328D5D932A428319AFC84ACA989C0E645B8D2629F60E8D102E8AC05B0CA6E857587A9FAA66A84E10E55BF3F5BE155F79DA9A8448F4CCD6A206E6ED9FF85AB037D1914BBB317621AC6E254F7E55BD2055DB1071E53250AEA001FD42CEF0CDE4ADB41C1228B1A0ECCF9299D4D74697E36112601D18504E042660E5D8851DB2349027A390108D380B68C1ED38016827EEB9C8DA60DB0EA8E89400C79A8FC980AD4D1A4485281D67D60B85A80C940AB938DE9C0B1A603033BBB0D75CB3B9B4F2F216855C7CD5282F223E9AA9420FC483A4C09A21309C089CC1C3A11A3B64792125CFA38F80D5382B68C1E538216C27EEB78A5A60DB0EA8E29410C79A8FC9812D4D1A4485282D67D60B85A802941AB938D29C1B1A604033BB21375CB3B9B4F2F256855C7CD52823D3B84CD4F22C594203A91009C0801269812F4B74AD0C7799F9812B465F49812B410F6E7CD53F59A36C0AA3BA60431E4A1F2634A5047932249095AF781E16A01A604AD4E36A604C79A120CECA466D42DEF6C3EBD94A0551D374B09CA0FA0AE5282F003A83125884E2400273273E8448CDA1E494AD0CB31CF9812B465F49812B410F65B87A9366D8055774C0962C843E5C794A08E26459212B4EE03C3D5024C095A9D6C4C098E3525E8FEA8784C09624AD04ADB61E8B8594A704A8CA03725589EF28E29C1EA1798128CC989CC1C3A11A3B64792126CC9827579D3C6554C098668F49812B410F6A536C0AA3BA60431E4A1F2634A504793A2D9386C510D302528F25F61A404AD4E36A604C79A1294AA117B155382C9EA56EA2941AB3A6E96129C1123E84D09D213A3312558FF02538231399199432762D436A60489F85A2E0F538261193DA604DD867D125F312588210F951F5382204D8A3F2508F381E16A01A604AD4E36A6043125A8C41D3025983C9B1F554A505FC7F553823F6D8F27E149C3F94D830386E97242FF19401AB61B21FF9CFCD39ED5E2A0E76EB067DD47C0E9C39E41C13C42BFA462CC63A9A5950ECBFDEE9443C7D571BDDDFE968FFFD387D7D5EFFBC3E7DBCC97E43D6E322C7A7BDCAED89B0FF45A7EFF39FF21F7C9F59108945EBEDB3E6D399AA7148EAA00EC687EEB6EEDA62A142DB2AC3FED28FFE6CB6A8052EDE3C0A5A02C102994B9220751DF347F9EFFA95EB108F7C51BB2D7B8C9701B80D6C78B025109FD50D9834ECA0F950853E28129ADD347E9A00AD06B60FEBDCD2254891CAA28CD70DA60C5A7ED8C19B04428776BA0E5617A7779D72C6356BF237BD53F6CB1FAAA66C045785A6B13B8C04F6B45E032FCF2ACC619490D6B2DE7119473ED6916814BE4C0456986D3062E3E6D67CCC02542B95B032E4BA3838C07052E565FD50CB808CF946A0217F89952085C86062EF36625F786B596F3087002BDCD2270891CB828CD70DAC0C5A7ED8C19B84428777B1917A3E3D606052E565FD50CB8082BDF37810BBCF23D0297A1814BABDE64C35ACB79043881DE6611B8440E5C9466386DE0E2D376C60C5C2294BBBDF52D4687420C0A5CACBEAA197011D6E76C0217787D4E042E61ECE42FD4AB9C476BCBF3996611B844FFA948618653FF54E4CF76C6FDA9283AB9DBFC54C4BE248B06A68DAB417C2AB2F7AA66C0455845A8095CE0558410B884045CCA79B4EC04AA3DC1085C12052EF5AEEFD10217D7B683C0252AB90F015C781B8803052EFAAF0A032EF245B9F0B5B854CB82C1291E02CE18C051CFA020B51C7A9B74B013B2463CF6DA4C1ABF1DFF2C6535A119FCE39F7549A1E29A11E062F546098509CB06E94D7D1095811E39B53420C8D08DDC032EA96422B806F01B5272963C58CC0A6B49EC4E024CA2EAAE55458CABDB5EE5E1BB6E8066C62035F1EC7EE4E841201B7F4A7D94BD56CF9435656D996529D56E9898D76E40DAF5710CB44B61F3B57E5CF4B5A31B0487C65DDB2222FAA53BFD48C090800D2C396B7E0C2998AB5083242C4412E6BF0E4AE034CCBD809088E5E3D426623D9FBDCC6BD12011FB380622A6504C0252CDDC4F850A102C1A77AD9E888898EEF42311432236B0E4ACF9312462AE420D12B11089D8D27B5DA7C089987B012111CBC7A94DC4E4B5B52A2206AFAD8544ECE31888D8BCBF388E7E7454681442C4149A05C0A2DE5691888541C474A71F891812B1812567CD8F211173156A908805F945CC7B9DBAD0BF8839171012B17C9CDA444C5E2BB02262F05A8148C43E8E81882914FBD28F8EBE2A888160D1B86B294644C474A71F891812B1812567CD8F211173156A90888548C4FCD7DD0C9C88B9171012B17C9CDA444C5EFBB42262F0DAA748C43E8E8188B50CA711C8A8F240D68BF4360A5B9AD8DB2C68A1504FAB48C4C22062BAD38F440C89D8C092B3E6C79088B90A3548C4025D9AD89547398BECD5112F4D742C202462F938B58998BC967345C4E0B59C91887D1C3B11A32A60373ABAACF06A1D16A55FEB3A1122C69B7E246248C406969C353F8644CC55A841221619119B35AE22117325202462F9389588D897E7D553E69D840513E97D8352897455B57FF6D5C19321171E3CCFFFB46341B3B068611E77C43C20F146BF0F08D3D1EF050043F43B69F93A37DDA449B73AD6F8B8F9BA3F94A232498C3C1623E31DADC307475D6FECE8A017B4C761EDD115F66825BE8A98DE384A024469873109887A3FEDDFCBC09FCD17C157A8DE71A9373C5F20D1215D066CD894B553A782AA473FD412C201C63C1962CCF6694B5FBDF78ABE98977C471EF3431F37DDCC2F279793B6A72CC8BEBDD002E905125C20FD00C20BA41B109FD1EF08194D2A8C062DD38F65BA0209AD52DF6C5675DCDC06153D0245478EC3D66E08ABDCFB400E6C9851C7CD7384E5D43B3C075E511D79CE0FC8DAB387C9BCDEE5D7F097B51B350D32905E60ABD3F4FB012D1ED1EF06C473F43B429E930ACF41CBF46399EE568F342A69B330A13A0661943C07153D0245479ED35C60155235F5E196BF0D30EAB8798EB05A7987E7C00B9623CFF9A18FA66E2FEF6FEE8B763BFEB2E6EEA64106D20B24C840FA0104194837209EA3DF11F29C54780E5AA61FCB740513E6CD42D52C4CA84E191825CF41458F40D191E7B05F36C22A563ED4F79C41461D37CF111603EFF01C783D70E4393FF4D1D4EC7E369F1598B4E32FEBB28DA64106D20B24C840FA0104194837209EA3DF11F29C54780E5AA61FCB7405135A75A059985015F11F25CF41458F40D191E7845B0B7C200736CCA8E3E639C25ADB1D9E032FB78D3CE787DD9A695381BFB45D6294DF8BEDAA6AA27EAC579FE577035CB7A6DB11F29C74D6ADA165FAB04C87CB3ED85763614255237FA4EBD650D1835774E439E196DA0EC181591B75DC3C4758CABAC37366D4C520CFA97EE1AF367479D9659011F562BF7A34BF1FEBC55DF9DD58E739FC8E90E78C81E7A0655AECC63F4C20310F790E2A7AB88A8E3C27DC4AD62138306BA38E93E7F4D61F80971D288FEC405AC3718F1722FF58BEBEDC89F73E8E703A3638ADA0110A477F68B7E9F56485E88AF7361483F995238499F0D4738372D7A8EC61B7A1ACBA1298C294559753B2425F73C095772A82EDA300814BE27E9EFF91583B7B27879E9BFC19989424383CB4F7DD6D00E7C7B8800D0EB5444F20F5813ABC881B1514F320D3BF8069A06AD9EDEAF0564A879017222F445E88BCD02E5C88B0F43132435B938FCC90BD9C961D223774225A6487CA52427688EC30044016233BECFF58685EAC1CD9A199EA213B4476983C4188AE6034B2437B938FEC3010D86EDD0E911D3A112DB2436529213B44761802208B911DF69678AFD821BCC43BB24333D5437688EC307182308FAFCC36B2435B938FEC90BD9C961D223B74225A6487CA52427688EC30044016233BEC2D8C5FB14378617C648766AA87EC10D961E20421C2E2E4C80E6D4D3EB243F6725A7688ECD08968911D2A4B09D921B2C31000598CECB0F738818A1DC28F13407668A67AC80E911D8E912014D029D492EEC80E9D4E3EB2C324EC10D9A113D1223B549612B24364872100B218D961EF210C153B841FC280ECD04CF5901D223B1C2F3B0CB5103EB243A7938FEC30093B4476E844B4C80E95A584EC10D96108802C2876F8B63AACBE1D566FCF646435433C1E57DF369F3799021F88D49BC490DC3DA3B78B2136D9204B043308F5BDF568F1E4E279459FEE72C59B9BE28E05AEF876F754CCB1685A59A4452C583AABBACFCA0059FFD30D1DD17B3807AA74E88C7F7B5B9F261DD53D2BFD5BDD318861E75A9AF794CB8B503DF2BBE7D5EE5BD614BD40DFAC01A10FCBFDEE74CCFB3AAEB7DBDF721BFEF4E175F5FBFEF0F93653FBBC914D86216E8FDB157BF3815E239DE43FE43EB93E12A7402FDF6D9FB674847F9632999489893F17F94B30D74A9F2136A075A6C4AB752621D2D5FB319B6B6276744EF82645345F6E5667B575B46CEB7EF375F5FE72FAA5B4DC5C763D96A669656293F2395FDF37874A06173409A5328710F5BFB8CA84F96D757A3F6CB2D6B2BF15F677CA70C4EAF0B4C846BFF9E3F44E3D5C767BF7FEBACC5C5EFDD3FDCB135103E6075F4A8B2A7FF376D8BFED0FA7ED7E5737B4DE9DFE38DDBE9C5AC7576979EF9FF7B4AB8E8AFDBC3F2B6F093482E6B4FADDEEBFF2F1AE4E6A2ED8305D47B58EA30091CF531E24FFB979E4CC537EE7ECDFB27BFFCEF501F244AB8DE0C9B5F44F1F7EDBBE6692FE79F3E3ECD7FDEB6A575932F7CEFAD8BDAC6CB66652FDAF5D36EA821471044BEFFA912C556A36525E4F1A71517FC827E2E8F9267F2A424A65F49201EF326BE15D67030BD3D94000CEC87B9847EEF6806512368DDAEC4CEA09B6D7927BC267F1E348FC6963EAAA89FA25C33B3FBFBF3E7228CB5B0EAC76C53DBDD971EA5DDBF2EF1F79F76BDE2F2FABED8E7C7DEB1E2C41EE9D919BF0C324AE886F721FE53BDF7C02F8287745FEA74BF8EF96F91FD2AE20E150DEA249A0FEB369AD7725239ED63B93F054EB7DB5322483F456E55D9CF656A46D52FB46CB49F9338E4EEB2B9EA429FA4285756B7D69733089C03467F267234FF23F95D894D2E74B6031461BE97EFBEF0B8BECDDA2E06C64071702BFA2C112237BAD00D7CBFC4FDBE88B0305CB8BC519D6452E131667757B195D60E0996DC39B0F2575A0277710B4821B63A4D14AF849DC95830060E301673117D704C5650B5B0C6BBD21F94118B4E956B465A10DB88AED559968490CDA2419F433C55CBD8D28FAEB8FB7BB96D061DCD67FBDB05D76FFF243CDE17216F998461464D7CEDE577D319DDD7965D6ACE9988FA5855DB298DBAD13C8C65C706DC02B1AAD31E68E33036B23F6E8BED6409C117DB0E30C67B7380DEB92C00569AEA833439714A84BF2B292705BFC9BA23FE6237CB9FF225412A263D8B6F752718240CC93377062D5E7CC35622E7558BFAFCB972126DEF466094CEFE08CD4B769B68050CC73E73EC91CCED421F044F20F25FFDC8E8F9E067CF49AEDE0AF8B2EE845E605C86B71C8457E8BBCA8E2F6B5AAC118563E0B62C1A70F8BFDEEB8CF6246E5E4994BD473338BF14B9F567269C10CA8AEA66E8A503C2FA62BA9EBB9D79BA6DE35BBDAD2545A78CD9179DC9B5BFEFB7D7FDA74E6B7B8DA67722ADB10484B32339CF0E717B86FA9AC163239275647CDF16246BFC2B29B39E6330253889B2BFE467E5223EE7CA77FB10EBD63AA4D04450267F9D4D579FE4705E354CB102D996C2D6AEE749A5A2AA313CAB3D86BA5160599D6D609BEB57E59BDBC9F5679BB9D39666ED9B0DBBA3999F1D2849F8AB19AEB77EB95C40230D5F4B62885E36E8EF57A3A592ECA3D717AD3BAFDB6231AD91D5475C7CAA496ADC9E6F4BA6F4E27D3AB87F3FB86035E5766434DA11082A59D5DCDD7168AC878DA9BB2164A462C0DEAD41A6E8C817B3A7EBE1EFCE9B0E7EC17A497F546CBD9476C127DB91FE9F5F74A096CE2FDF1B43DBD704CA2BC61C52268633283B8A0F97ECB9BADB3B84163E0CBFFBE547D519155373BD4826219317B68E78BB63B265F445EA0A19FD3DBFC8F4A98BDA55EAF7EA5E295CB5AB996604C634A44936F6CEB0D25529E7375D6E16716402C262A5C247092D974BE6C1E5EDF9E57C7ED91AB35591BD57D3DBD71E335AD225F7DA72B93E3AF9BAF9BC366B7E6FBDEAC91FA07A692BCE4DB9996248F99677F59146BC3CCCDCAC256DF62C16C2686AF9BF5E9D8DDEE4BD7CCDE9FD15FC0F7FC5ADCE32C052D345948FF2781AFDEDD34F871FFB27D22A1A95092C579FE27BFD0F8A440DB2D13A66A5FCF1F8BE1F06C7D7E7E5E575B32FF9ECD169B62BFBCCCCFF33F74865E268F55FFBBFDAE7A983CC079B82E1B753A4C1E2BACA2F3289199F922DD1EC928950E635FAF9ED4E8C4A2BA42AB57688AA5CB12D2A6526A1A1F5E925727E00738AD71B5EA2BEAC92432712A7F6633114AF3135DCAF254FF5CCA6EC1D01A165CAF6393A5BC48EBB93E2201CB3C49058653856EFD800E55A0A03D16AA4084225D648B64C2804CA85B68C4E0D695F3B1167911341BB1898851B39D5DE62A1A0321FD110BB68B5112737B7090D0DD89DF0109E0EDF8A18204F28B05EEC449CF0EC4E3C6F01FCA7460F81708A6B92B40C3F1350468C61B54DFB3AE1D64E13DDFD6A7292B4B8BEF89700AE1D400706A9139B5E3762DFA384B6FA7F66556C57C2EC86E1FCE8CE489C17305FB5168A0983DF66D224DF4C8374F3574588E765A288F5D1DA26C9E10A7C64E6AC41F86A131CD2CA2442C3C1D880D0075114B86F912CA5DBEB12DDFA7DC53522FA5D3FC6A821822090C21FA6A536288C83ED9208648044334E6BCC1C8C602271A623EB6B8355D7957091AC8595D2E4F4B055FC41D2FA45A6429F321071DA9420AF55552E3F0250E56E62487B6449FBF4AB415DCB72FE1ACD1FF190C6F89D7B30E01D7A434724C700F1041B8CEA27FA381648B11C2C1F6345033954D832E1CB4E5C38DAC3E70B153319B8A5DA1567A7B162AB732D648DA2D2FDD8CA4E002D389E72DF4F7850C1546FBFB4F268ABA4A9A349D064650892B6F2F020837828E40F045BD2BA731348150C91D37938518D1A831D7204348792F5FDF5F84CB43E8FDF0D68708C312FD1FC728A95E6105CA36A82DD0526A00966DA89F979E5E2D0E1AACE74D325D416574E6365D1191D3E991D620A1395DE1590094C97C65B0A44CF2851CA358E0020604C2B51E25204877B1072ED728469EB1AF093BC4DC067BAC926B8621651F52C824E7DF6031D45A62871A5B7EC6B1400383263C680A3FD9974133B2FDAA56383409433D1E57C2A1551E977A7C9506641C5AE5791087A6064BD53219C8306DC8C802873608F7497CAEEF15A176B4EF91A8D81A2F55041AFD2E8A21E6439E8B3707C1C9317C48507E7FDD09ABD2D2DB4124B625532F0FD0443A0B937211866970A5108E8BEE3C57D2A8948FBE1014B23727E969FF5E1A5E34AE5D9B1BBA12650ABB1C462A0BDE31EF231585F5BA205D02A18B1384EF69BB2E48E33DF3B7B2F09EE3DC1D831B6EE9E53676957C8421D835846F30EC540D8C5D9301680DA9A549F6DCAC977CAC5493CE24C231A12C5A6AD6E03E88D3D2D6171738ED927DC758705ABE6E0D711AE234BB384DF2DD8FE0B4103EFBB15335304E53C931CAD247FD2B6D559E867E27525867ABF278F189F01FD0060A4D4D344189F85715CF38C3BF267689B94CC4C8F18B62CC358E2FDAA68D18D91D5A146E47A76831B2EDE8E6F810714C3C38C68263E0E198B43C8370D8ED503B8261BB483DB536855B599015605885069829198238C0D013C0C7136054888E7091107B9A02609193EA610C4A0D401639B1CF839210D1AF53560BDEAC331EB02E7D2207961B453493034E52483E808486E807930A1E930AE6586577DABCBEED0FABC3FF914E797885F949A12C5E204B2792189DF3CB28B374DB9070E3513DC53D015DA1851145746DAB0B999AB7F7665BFCFE5E9F4B067557810B6EEA466E93D4E566A870DA11E2E165F36DB52B2252373894773DC6057D2A0B23AAFA1B2D589EAAFFB4E9368F064BD57F1C5890AADD00E0537BD47B81BA58D1D9792BABB73442AA3557F5D7C3F649B4D130BF37C6E31575FD94FED3A63BBF0D372AA39F0AC84F717251632B5F93E6B041BE58B47186F8E2742B97A1470A1C393D164349DE2579F92AC02A327E1588357C25366C50F812ED2720E16B8435C4CCA88471FD11432EA1D43F465E4791B7C773A4776246635F5E9E94C5257B189EAC8627D10266129ED23D4CCB30C2D8891048EEE238865CA075621F8181C84220329D84C839E75033208989C6339056A8142DC526A132B275D8584A1223F578C960242747D88CA609386DE1B025212CD561038F870200A10003F14C1688671888130EC4184783FA9C193FD1358DB1860C09BF8BEA2B1D866A813E0418AAAF65A1FA9ABACF284BA961E046069D48E42F3B2835C6CE9112E3A4DCB664397A64604D90F1E733462A8A5103A73919B70038CDA922E0B231328F09D59405C0A47117A5F5932069A97FE3F36B2CBEB821B4E370656EC562D44F9F24F5AD225D698022E04FB953E8444112FF8A5058FCA010A07624BCA21FECC571EE8D7A966CF0992BCD7EB3FA7ADAE4A691BFEECB7697BDFDE4AAFACBAFEF2F9B8658E8E3B6E3E0956042EE96F91FD2EEF3E6B538C53AAF65B0FEFEEDB07FDF3D5D54B7BE3CAF9E36F9030DDF3D4457B2086BBD334938B6DE9734763BEA4D10E82DF716232AD0F6363F6D8F27D18EEFFC9EDF1DDFAC07211ED556C522485A52A57CA2186B1A564F641B00A1EDF2F148B12E04A7B23B885B0063CEA648C7F2BDEFC70005D858D4DB87D94694E64BBF2095237D4AB222959604F0B42A7AB981594495110866F15A194105B3D43FD5C02C8655974714F81BFE0190A04A6F0FCBF5B4F1AACD4AF3F9DFEBEFC518EACDFCF5286A4F4E9A936565470E867A0CF5BC502FAA224142FD08AB480CB3F4C970E952A46823884F6AB90C2BCC668E58525F7E04C51E29CAA51B41244930809E25165A441520486849B702042ECAC5C816CB629104225B43EAC7569E9426682AB9F7932790A7136DE0279E6E841BF855120F63AEEA8C5E6EE83D8329C2D111EC7B037963D12E6EE28D23DBC54D24E17C5D46E2FE3A1977DB3DD5960CF14C026FC49E035DAE47976B4AB3A2FE6C137C386A1BDD64AA677436A29868833389625E37380F1F9FA40BF74C0254FD3478DDA05184AA1F1F27A3082F34D53332BE2585461CC2C87691794531EE319FCF8C07779A2E3A891BF6E5021800F689B66713D8E7757BF6F0B06F2469E4B115A0817CE8029D5797F8A6127D8FC4153E1EC58500100120024043B423145CC400B0916CCF05620B00BEAD0EAB6F87D5DB3379BD0608DC7FBD7D3F3DE7E86DBB3912B1B1609020C7B3FDD7B315F3A3C2029BA090C583BBCD1F1548718F13C5E50DC8ED2D018639FCF8F4613221F27C5EEDBE653F2DFE5EC893340294DF72FBEDFD2093DD57FA8388E4D62F1201A7F8E5B0FFBA391EB7FBDDAA70DB5D6AD1F8094F26B856054F20C732993E96F4C50E2BDA94856A4525340749942FDBD7B7978DA8EA4671D76FDD0D3F7E4E290F6FF8D1044D5D64EA3D660B0B11D17E3F71BBB93506B100DD9A68633E756BC16CCDEF7358F8697AACFBC95C601E4C3CEAEBE0C816A0D94A5C9A31C1C884B6DB58D931CFCA4C73D0E3AC3050FBB354C405843BA2E20414EE6079827A3E583713F71ED24275904442F2458D7C0A668C147DCDFBE3499231227753AAD41A3FF9724908B0D887BE5C63DC2ADEFEE29D678D2C1C4CD020683DF21C3107D3A00CE90B466B77547AE5135B6648D2B76786666889BA8E948026C423097A13A6CD0B6C174DDADC5A226A8CDBA9CD3025C242B1BB18530DB871E1BB1FF28DD05642F59860A1549E087D10FA58843EBFE5672E118174814F71AF10504CA847186A44A753D5D3A37F1C59FDAC2CF8F73F0D3830AC7E18740258FB71CD23BD58C54CFE8CAE7F6E1E45A9DFEC566C2B0573897C792B579067C29B088C0A6674FBF7D371732AF5474415F846A7FB6CD3E8749F6E189DEEC32DA3833D5E199DDEE391B2AB5A175554307FB47C62B80F672A7654E87FE2D020736CA29448EEF3BCE64382F3799935435D9EE6A34D8FA7F970C3E1693EDBF277A0A72B77A7F5347A3BF47603783BD142A2DCDB45B68A68508437D1E355DA0FCB309EC2E31290A7F034A23CF47BC57F23F77B82DDD0DBD30B27FF43AEF23C9ECACEE797EDEE7BA3A5C573368702FF7841D3AE2DFFF8AF65DEE0A9C7318A77439F91D7D8E4265EFDE5D7F7970D3B15EBFDEE940DE17D55EA682165DA28D584C332FBD5316FFAB8DE6E494AECD387D7D5EFFBC3E7DBCCB6F3B637ABE3E9F6B85DB1371FE8B5FCFE73FE43EE93EB2339F39C5EBEDB3E6DA930AA019141FF4729A4EF9B433513135AE7E9F86779654ACB561FFF5CE42FCC5C2B155BAC1DEB6C8A56EB4C78E4B5DE8F996F203A952F19EBE80B994FAECE9CD553DD529CFBCDD7D5FBCBE997520B73B10AD44553557AE3A69729E43A18FB33FBE3E22A13E0B7D529AF557096FF8DDC3C9E56BBA7D5E16951A978F9E3DDFB6B6E5AF54FF72F4F64A6991F542EBBFCCDDB61FFB63F9CEACDFFD98DF5EEF4C7E9F6E5C466CEB5BDCFDF6F3F6F564F595F1D753AED5767CFF41ED4110D5482E171F3757FC82D65527EF90EC0853C16FFA6EB7F6B559AD0339558552AAEC12771D1CD8D9EF66B41565465E2727BF975F3B4F99A796DC14C5E3A2CA671512D61805518F9FBA29B38C905C24F99C423906E5D1633297509572E253ED58A554A5757A652EA9E90964B897F345AAC529ACD4CA5D43D5D299712FF58A558A534AF8E0A844AA97BEA492E25FE7127B14AE9C2DC7D77CBEAE762E2D7D38F564C97C6FEBB5B86361713BFFE6CB4629A1A3BF01BAE98E8405211D3B5B107173181ECD659798F27327A8FA24D752EA02E236032A2E405790A82FC62FF7ECAF3103FFD6F950022AFD0210C8F550774C03554A7571AECF2727E312996B6112AB0A079A3F57AB33B11F64E2E7F795E3D652F7347D68AFD6018C1257D7F961114D7BA8CA0FCBFE37FFEBF00000000FFFF0300504B0304140006000800000021005B6DFD9309010000F101000014000000776F72642F77656253657474696E67732E786D6C94D1C14A03311006E0BBE03B2CB9B7D9161559BA2D8854BC88A03E409ACEB6C14C26CCA4AEF5E91D6BAD482FF59649321F33FC93D93BC6EA0D5802A5D68C86B5A920795A86B46ACDCBF37C706D2A292E2D5DA404ADD98298D9F4FC6CD2373D2C9EA014FD29952A491AF4AD5997921B6BC5AF019D0C2943D2C78E185DD19257161DBF6EF2C0136657C222C450B6765CD75766CFF0290A755DF0704B7E8390CAAEDF32441529C93A64F9D1FA53B49E7899993C88E83E18BF3D74211D98D1C51184C133097565A8CBEC27DA51DA3EAA77278CBFC0E5FF80F10140DFDCAF12B15B448D4027A9143353CD807209183E604E7CC3D40BB0FDBA763152FFF870A785FD13D4F4130000FFFF0300504B030414000600080000002100FBC821F4470100008202000011000801646F6350726F70732F636F72652E786D6C20A2040128A00001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008C924D6BC3300C86EF83FD87E07B62BB5F6C2649611B3DAD305847C76EC6565BB3D831B6D7B4FF7E4ED2A62BF4B09BA4F7D583243B9F1F7495ECC179559B02D18CA0048CA8A532DB027DAC16E9034A7CE046F2AA3650A02378342FEFEF726199A81DBCB9DA820B0A7C1249C633610BB40BC1328CBDD881E63E8B0E13C54DED340F31755B6CB9F8E65BC02342665843E092078E5B606A07223A21A51890F6C7551D400A0C156830C1639A517CF10670DADF6CE8943F4EADC2D1C24DEB591CDC07AF0663D3345933EEAC717E8A3F97AFEFDDAAA932EDAD04A032978205152A28737C0963241CF050BBBE3C24F19A15F761190FBF51209F8E51BF518B25077BD53E56493BC790E6A7CD7B26C8244ECCFAFDCECA7AFCFCB25AA07244E8634AA6299DADE8944DA68C90AF769CABFE0B509F06F82771C646936BE219D0EF74FD6BCA5F000000FFFF0300504B01022D0014000600080000002100ADDD80D8E00100004C0B00001300000000000000000000000000000000005B436F6E74656E745F54797065735D2E786D6C504B01022D001400060008000000210099557E05FE000000E10200000B00000000000000000000000000190400005F72656C732F2E72656C73504B01022D0014000600080000002100F1B8335493010000930900001C0000000000000000000000000048070000776F72642F5F72656C732F646F63756D656E742E786D6C2E72656C73504B01022D00140006000800000021001CF00BD4E4070000EE1D000011000000000000000000000000001D0A0000776F72642F646F63756D656E742E786D6C504B01022D00140006000800000021005FAFC877DA010000CB060000110000000000000000000000000030120000776F72642F656E646E6F7465732E786D6C504B01022D0014000600080000002100C90BBB17A001000037050000100000000000000000000000000039140000776F72642F666F6F746572322E786D6C504B01022D00140006000800000021008E44C0A5B71B00003B5E0000100000000000000000000000000007160000776F72642F666F6F746572312E786D6C504B01022D0014000600080000002100B4461EB05E39000050F600001000000000000000000000000000EC310000776F72642F686561646572312E786D6C504B01022D001400060008000000210042BE4A81DC010000D10600001200000000000000000000000000786B0000776F72642F666F6F746E6F7465732E786D6C504B01022D001400060008000000210044611E3A1F90000000EC32001E00000000000000000000000000846D0000776F72642F656D62656464696E67732F6F6C654F626A656374312E62696E504B01022D000A000000000000002100460095E068600000686000001500000000000000000000000000DFFD0000776F72642F6D656469612F696D616765312E706E67504B01022D00140006000800000021002538FA35BB050000BB1B000015000000000000000000000000007A5E0100776F72642F7468656D652F7468656D65312E786D6C504B01022D00140006000800000021002C822F6A3D0600005F140000110000000000000000000000000068640100776F72642F73657474696E67732E786D6C504B01022D001400060008000000210043329552000100008B0100001C00000000000000000000000000D46A0100776F72642F5F72656C732F73657474696E67732E786D6C2E72656C73504B01022D001400060008000000210062EA2B34F30000004F01000018000000000000000000000000000E6C0100637573746F6D586D6C2F6974656D50726F7073322E786D6C504B01022D001400060008000000210005C95CF40E0100009201000013000000000000000000000000005F6D0100646F6350726F70732F637573746F6D2E786D6C504B01022D00140006000800000021001FCAF261E1010000E60300001000000000000000000000000000A66F0100646F6350726F70732F6170702E786D6C504B01022D00140006000800000021009A2F69A222010000E60100001800000000000000000000000000BD720100637573746F6D586D6C2F6974656D50726F7073312E786D6C504B01022D00140006000800000021000CC41A92C3000000280100001E000000000000000000000000003D740100637573746F6D586D6C2F5F72656C732F6974656D342E786D6C2E72656C73504B01022D00140006000800000021007BF302A3C3000000280100001E0000000000000000000000000044760100637573746F6D586D6C2F5F72656C732F6974656D332E786D6C2E72656C73504B01022D00140006000800000021005C962722C2000000280100001E000000000000000000000000004B780100637573746F6D586D6C2F5F72656C732F6974656D322E786D6C2E72656C73504B01022D0014000600080000002100743F397AC2000000280100001E00000000000000000000000000517A0100637573746F6D586D6C2F5F72656C732F6974656D312E786D6C2E72656C73504B01022D0014000600080000002100BD84622390000000DB0000001300000000000000000000000000577C0100637573746F6D586D6C2F6974656D322E786D6C504B01022D00140006000800000021006F0EBFE4FE0000008A0100001300000000000000000000000000407D0100637573746F6D586D6C2F6974656D312E786D6C504B01022D0014000600080000002100BB29ECCE0E020000080700001200000000000000000000000000977E0100776F72642F666F6E745461626C652E786D6C504B01022D001400060008000000210014E0FE477B070000092F00001300000000000000000000000000D5800100637573746F6D586D6C2F6974656D332E786D6C504B01022D00140006000800000021002D25BB11B50100007D0400001800000000000000000000000000A9880100637573746F6D586D6C2F6974656D50726F7073332E786D6C504B01022D0014000600080000002100503A6749CB000000360100001300000000000000000000000000BC8A0100637573746F6D586D6C2F6974656D342E786D6C504B01022D00140006000800000021004139F2A1E2000000550100001800000000000000000000000000E08B0100637573746F6D586D6C2F6974656D50726F7073342E786D6C504B01022D00140006000800000021009955F41BB9030000CB1700001200000000000000000000000000208D0100776F72642F6E756D626572696E672E786D6C504B01022D0014000600080000002100F5A800746F71000022830B000F0000000000000000000000000009910100776F72642F7374796C65732E786D6C504B01022D00140006000800000021005B6DFD9309010000F10100001400000000000000000000000000A5020200776F72642F77656253657474696E67732E786D6C504B01022D0014000600080000002100FBC821F447010000820200001100000000000000000000000000E0030200646F6350726F70732F636F72652E786D6C504B05060000000021002100A00800005E0602000000, 5, NULL, 4, NULL)
GO
INSERT [dbo].[Document] ([documentid], [documentname], [documenttype], [documentextension], [uploadeddate], [uploadedby], [uploadfile], [departmentid], [isactive], [createdby], [createddate]) VALUES (7038, N'Sandeep', N'.docx', N'.docx', CAST(N'2021-06-15 00:00:00.000' AS DateTime), 4, 0x504B030414000600080000002100ADDD80D8E00100004C0B0000130008025B436F6E74656E745F54797065735D2E786D6C20A2040228A000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000CC96DF6BDB3010C7DF07FD1F8C5E47ACB41B6394387DD8D6C7B5B00CF62A4BE7449B7E215DDAE6BFDFD94E4C29499DD671E98BC1D2DDF7FB39494837BB7AB026BB8398B477053BCFA72C0327BDD26E59B0DF8BEBC9579625144E09E31D146C03895DCDCF3ECC169B0029A36C970AB6420C979C27B9022B52EE03389AA97CB402E9372E7910F29F5802BF984EBF70E91D82C309D61A6C3EFB0E95581BCC7E3CD0704B12DC9265DFDAB8DAAA60DAD6F9F538DF9B516AF724438460B41448D3FCCEA92758135F555A82F2726D2925F7066ECABF20F1807E04935E66B0AD39A7CC2626AD74481F29E080433D73D8609B77439B15B582EC5644FC292C45F17B1F15EF0A795EA67F216AB510BD8494E814589377335668B7E3DFC721D709BDFD630DD708F636FA90CE07E374A2B51E44D4D0ADE1910C17EF80E1D33B60F8FCD60CCDB9746B5B42A49374FA83D949F74224DC1848A7276875FBED019112C600D82AF722DC43F96B348A47E2BD2095F7E83C8EB11B9D742F04383512C34EF9A8758038FC7EDCBB0A107BFD5720D428FEADF091F50FBF9B5F5B7F45960B511A1883602BDD0B81D43041FB1DBE138DCC739614D93C04D480C55794BDEB67EAEC4938EA05E81C497A707D50B74A0AD44BBDDB57EB448FDF1E73DEF4C2F3FF000000FFFF0300504B03041400060008000000210099557E05FE000000E10200000B0008025F72656C732F2E72656C7320A2040228A000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000AC924D4B03311086EF82FF21CCBD3BDB2A22D2DD5E44E84D64FD014332FB819B0F92A9B6FFDE288A2ED4B5871E3379E7C93343D69BBD1DD52BC7347857C1B22841B1D3DE0CAEABE0B97958DC824A42CED0E81D5770E0049BFAF262FDC423496E4AFD1092CA14972AE845C21D62D23D5B4A850FECF24DEBA325C9C7D86120FD421DE3AA2C6F30FE66403D61AAADA9206ECD15A8E610F814B66FDB41F3BDD73BCB4E8E3C81BC177686CD22C4DC1F65C8D3A88662C75281F1FA31971352084546031E375A9D6EF4F7B46859C890106A1F79DEE7233127B43CE78AA6891F9B371F0D9AAFF29CCDF5396DF42E89B7FFACE733F3AD84938F59BF030000FFFF0300504B030414000600080000002100F1B8335493010000930900001C000801776F72642F5F72656C732F646F63756D656E742E786D6C2E72656C7320A2040128A0000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000BC944D4FC3300C86EF48FC872A779A761BE343EB7641483B21C190B8A68DDB069AA46A3C60FF9EB08936C016ED10EDE8378AFDE4B59DD9E25336D13B7446689591344E4804AAD05CA82A23CFABFB8B6B1219648AB3462BC8C8060C59CCCFCF668FD030B4974C2D5A13D92CCA64A4466C6F2935450D929958B7A0EC49A93BC9D0865D455B56BCB10AE82849A6B4737390F9AF9CD19267A45B725B7FB569E198DCBA2C450177BA584B50B8A704FD80FC0910EDE38C4DCBBA0A30238E18DB8C84EE0749C721494AAD11BA016217A73E80A0F58BB5412D5F6CB51E218E07950A0439F6D15C85A431FF9AF2A3783B320AC9A01B78C85FA1C00102640EFC7B159CD334CE853A4814D415B47761A0D9863BD13B27415D39664E46DE264DC3AE8DC215CB1BC7965EF2529CDA136F87825A6270D380BB39DBD86B46503784B4FFF9505E02176C27A671ABAA4310972119D4DA6E6A671775E0E825AF134129F6FFE9FEED48420280E2CA967486E147F1314C4EBD1B131FCD4DE88EFC71A497BC6D09EA490D8CBB73B18BFB1F82BA0466FE050000FFFF0300504B0304140006000800000021001CF00BD4E4070000EE1D000011000000776F72642F646F63756D656E742E786D6CD459DD72E23816BEDFAA7D0795F766B63601DB60F3B30313FED2939AA4434166BAF6AA4BD802D4B12D8F2C43E8AB7D8779C37D923D926C636820A493CCD676BAFC231D7DE7E89CCF4747E2C79F9EC200AD084F288B3A8655310D44228FF9345A748C5F1FAE2F9B064A048E7C1CB088748C0D498C9FBA7FFDCB8FEBB6CFBC34249140001125ED75EC758CA51071BB5A4DBC2509715209A9C759C2E6A2E2B1B0CAE673EA91EA9A71BF6A9B96A99E62CE3C9224A06F80A3154E8C0C2EFC168DC52482CE39E32116F0CA17D510F3C734BE04F4180B3AA301151BC036DD1C86758C9447ED0CE2B230480E696B83B25B3E829FA3570F19661E501AAB9C0460038B92258DB7D3F85E34E85CE620AB53935885412EB78EADFAEB6230E4780DB72DE039E6FB7A501868CB4F235AE619119110C588734CD8D5995B12621A6D157F976B4ACEB59C9701D8FB00F1E275C1F9C0591A6FD1E8EBD06EA2C7024B7ED92FC0CA825C9E5AF23A63A64B1CC317187AED9B45C4389E056011840C81D791A4B5D1858C3363FE46DEC52CC86E639E3D7C426BC914C734218341CB260680D813463513E8833E48731A46081682D40A071D43AA0F881C947CED1875F510630F862B248F050C52024E059358D57D3078BB65EC3147335D6DC09CF2444CD83A430970F94D750E58908651A97FA721623FF721EB424AD66FBFE56FF97C8624F1388D65C2C975DFE20D4B0512D27B5B5B0B177DE0D4978F0BB883AEDC614E5363EE34D76BA6BD85C8470A0EBDB054F813B0D26C0EEC46AD21CD934D0FBCD4A68533CDFC6742174B915B69D5CC7A0E9D8B78FA9ABFE5C16CD8B56D30FD279C0FCB04E3E3D64C86648ED340C81E7BE0F6DD41DE33964D83BED9345BCA4C85C4665F88272D0425F79C2EA4950DC79163FC4DD6D2322D0746ACDA89E4AAB4095188C8E727A09CF9593440DA63C08B847E056B6D0B8870A1AE0662C02830458AB076CCC99C70BD58AC40521808D6AE65C708AFEA574E0017CBBA6AE98BF304C49CD32020A0692E5762CE1EF5B3B244BDA22F8C4689D8C84F26A48270E9A6555BA6C71478A59E11F91D9845E728A01191293942317D22C12DBC7EA2BE5822331BA5259334445726B20E349BF077A5785834C377ECA32B1BC41569F6DA6B48B9412B54CA9E13D284396410987460B07B4473E3B46685D9CC6476277A60FC31A32CB38C50DD75BC8C2CC49C3C099ECA128B3DAA382E38F6292CF58A4AB24D4866782C8A80869AEE9CE8E4C5DA01F31ED14A62740CE25310C5490CBD5C561B72A8565BD0B2E068999FD4326DA09FC6FE5B99B41973D6D23D6DABE9C6E29F4B35D576AB517162651993128A7234C40BE26381116F4B787EE35B9614115428A19231D2F8FBDBD1BDFEB81E94EA513823B0B48F395BDC0C3BC6B80F7E813A47E57FD9B06BAE646A4F4DB6630C5824C06506D2784AD872AD96536F36EB50EF6DEDC93397FEAAD52357D7384B1FA7728ED95049E4AC9C53BB36478322B34CC62A05361CFB7AA09691FD44B42BAE1251D6A490330553198F3C59CA4963986C3457ABCFBAFDC5CBBB0232D7A12F8616D9591BD26A341C572F9C599E9D69F13CEB76EFE77335B7DC4525089538478ED3B34E01C0928E7ABECF6111DF075202B23CC85753C87B09E12B62742B97E80CB5BB93690EEDEBBECCBF8576B53017CBAED93007FA03DC9A7758FB74C962F49155ACD605BAE7DE92FA681CE0AFF8024D70887E49A335E6E861891F538E260CFB17E823819669FF06C11AFC788186784913CC7F18FDFD02DDA5E10CD3CB3A70D66D5676A7A509F7FF459991DB1AE9E5FB48C4EFD8ACF28250A3F6D150BF755CFFD1B24EF36A546B58C3D1CB54755B4EB3095906FEED41CFA0E893BBCFA9C05C560E32F9E8CA0D8760D7E70FAC8FBD471D815C7614F985A4EA781FDE77ABA8D5B42DCB36ED96F93C25F72A27ADB77F5DABB75A6752B29428BE979285F51183B581CD4B337A055B47977798062FE1EB99F95074FFF3EF3FDE18F70D029FD0458445CAC92C6615D866B5AE166FFFF975615B1DC84DDD016AC9164FDF745BB655DB215CDFB5EACDE1216EEDF6286E654D8A22EF8032709D7A6FB4E7FBBDC6F25E62275465E82D03BA967BDAE9DFAEAB2BC2452F80E0E58E4FD218F6976A83B7EF7DB13CC5A5CCF45354BCC31B24B9F17C66D823E64BFDF0C02EDE5847D9735A477F09E997A21EE58204E896CA0D90FFFE6AEF7080FD1F3E9144144500828C805421507F6FF5470A9B74868EAF809A7A43D7766CBB4CBDB4A09C3E07D9635B2F8E03EAA9734D041B9BDCD17D0E95D10CC37A36D09B16E8DFD7AC012AEF1E8B0728C710FC170CD1486EBED086C1AC08C29CA038203821BEECC430958D9A04D693981593885922620C9560B60593B3C502312801B12E6F61CF85E093443312B075FBDDE734BDF9F0B1F7F0EB6484FAE37B341D4D7EBB198CA6EFAFF6586DFCBF61F49905F9F3C6B56A66DFBEFE6EB71CAFF8FF0472C314E1CB44FF62E919DADC41DD6AB887B4EDF694B57DBB28BED2E66BF8C4FE4C02BFF9047AA958324E65DE98AA8A8AF1CD3B85FA6D6C7F1665A7F07839740239715C2C2567E24FD5B10D30CF721DD755FE9D3326089FC803501279727F909DB3684BCA873835AD7949B07F68843A422FCBAB33E5E31ABE917732A72DA65F913AF9B16CBBAE36704B78769AFAD9633E294EDDE3C51D964E102CEE180D5B097079520612752DAF7F5AE818B0CAEA737DD8DE6C7BF5648AB1DAD68ED174D5DE7F910AF59AED0DA1104F50F15B841CA29A7DE6C9E378894D2332A6C2037B6B6E5EA4EB48A947FD6B4975FB436DF7BF000000FFFF0300504B0304140006000800000021005FAFC877DA010000CB06000011000000776F72642F656E646E6F7465732E786D6CC4944D6EDB301085F7057A07817B9B92E1148160398BBA2DB22B92F6000C455944480E4152567DFB0EF5EBA64160C705BAA228CEFBE6CD8CC4CDDD2FAD9283705E822948B64C49220C87529A7D417EFEF8BAB825890FCC944C811105390A4FEEB61F3F6CDA5C98D240103E4184F1796B7941EA106C4EA9E7B5D0CC2FB5E40E3C5461C94153A82AC9056DC19574956669F7641D70E13DE6FBCCCC817932E0F4DF34B0C2E061054EB3805BB7A79AB9E7C62E906E59904F52C9704476FA69C440411A67F201B1980C4549DE1B1A9651E1CEC9DB4B76C01B2D4CE8325227147A00E36B69E732DE4BC3C37A841CDE2AE2A0D518D7DA6C7DDD0C768EB5B8CCC073EC97BD48ABDEF9DBC42C3D6322113129CEB1F067CED18966D2CC89DFD59A93E666379701562F01767FDD70BE3968EC4C93D7D1EECDF3C48A7FF605AC61C8A7A5F9EBCC3CD6CCE21FA8797EBF37E0D893424738B204BB9EC4CF9A6CE71B2769F370B418E085658E0570045FC9B2208BAC8BB3B8C51BAD7C28489ADEECD65FB2DB18D1BDDA898A352A9C9C748AEF2E2EDE328E6E30965541E04D90469D92B13FABF5B47968A23DD6042074BBA193BC678CA6FA23D7075C6EAB970F25BF563D0713A469BA3BE7F16527D2FFDF8857FDFDDBA6CCCF7EFB1B0000FFFF0300504B030414000600080000002100C90BBB17A00100003705000010000000776F72642F666F6F746572322E786D6CA494C16EDB300C86EF03FA0E86EE89ECA0DD06A34E0F0D32F456ACDB03A8B26CAB95448192EDE5ED473B7692AD40913617D326C58FBF448BB7777FAC493A8541832B58B64C59A29C8452BBBA60BF7F6D17DF5912A270A530E054C1762AB0BBF5D597DB3EAF222694ED42DE7B59B026469F731E64A3AC084BAB2542802A2E25580E55A5A5E23D60C95769968E6F1E41AA10A8D4BD709D086CC2D9B734F0CA51B002B422D227D6DC0A7C6DFD82E85E44FDAC8D8E3B62A75F670C14AC45974F88C541D09092EF054D66CEC073EAEE5336205BAB5C1C2B72548634800B8DF6C76D7C9646C1668674EF6DA2B3665ED7FBECFAB21E6C50F4648EC073E497FB246BF6CADF2766E9191D1910878C7324FC5B7356628576C7C29F3A9A93C3CD6E3E0658FD0FF0F565CDF981D0FA234D5F467B70AF07D670A93FC09A9A7CBAB5709998A74678BA8156E60FB50314CF861451CB123AF564F8ADD99A868D4FFA9C8654F9B36069FAED66B5BDBF66B36BA32AD19AF836F278E21A218F389AA7B8338AD674C2146C0B1015323E445EE4EC455D377170F2296DB0E393C6DEFA2F000000FFFF0300504B0304140006000800000021008E44C0A5B71B00003B5E000010000000776F72642F666F6F746572312E786D6CEC7C698FDB3A97E6F701E63F14AA81F9304E5DED5BE5CD6D68F326CB9BBCC9834143BB646BB376A9D1FF7D28C9AE54A52A4925F7F6CC8B9E72503249918F0E0FC9739E4331FEC7BF56817F575849EA45E1977BE40FF8FECE0A8DC8F442E7CBFD76337CA0EFEFD24C0B4DCD8F42EBCB7D6DA5F7FFFAE77FFF6FFF281FED2CB903ADC3F4B18C8D2FF76E96C58F10941AAE1568E91F816724511AD9D91F461440916D7B860595516242288CC05D2A4E22C34A53F0285E0B0B2DBDBFC205AFD1A2D80AC14D3B4A022D03D9C481022D39E7F103408FB5CCD33DDFCB6A800D933798E8CB7D9E848F5788872781DA268FBD40D7AF5B8BE43DCFED9B089191075698754F8412CB07324461EA7AF1D76EFC2E1AB8E9DE408A1F75A208FC5BBD3246F0BF360642A295E0EB2BE07BC437FB4681DF4BFE6344047EC788B4104F2DDE23C2CB67DE2409342FFCFAE0DF52CD33E522C4AF01A0DF02C4CE5F1B9C5112E5F15734EFAFA14DC2F31356BBA87F01EB3AC8CFBB96FE356114578BC10A0C8CC789134689A6FB402230647740EB77EDB4BEFF13189BF8AE7C0446CA5C7FB9876191207192BDBF150996ADE57ED6DE610982A2F9BEC532E9BE94ACF62D50B5D0FC2FF7C328CAACE41EFAF31FD0538DFED2A7C368994491DDDFEFCA805CAC0FDA845A66F151988155DA15F26E047A75B7B62EB997584007608CBBE75E970448C68F5A68B85172677A69B601E2DD7729EE2935031617C131F89A5D7FCDA65E10FBD6324ABBBABD7929ACB1E5392EE8274A2024C910307E7FA75BAE179AC07E7415FDC8385B669FD4EA28CF26216FF9A0DFC8FD9DE6FB51B900A6DED7E2AEA0D5ED55C2096883638488092C76BD61995ED616A3228D223C49B67D8B1F9FE4BAABBAA7D4ED15EA6EC551EAB53670FC24EE3089800D8C35C7EA1B6BBEE7847F1A40835602F47B2BE8924FAD5F60ED7E82A547591605DFC3DA7535ADAA1DB33B03084C5134CD20406C03C88D31044EE2CC557ACBB62D2313FBBA7ED7B7764201DD77571D680CA56E5D2D132D9E0377D8E7CCC85826779ED956B9BF0BB500CCDF6EBDDE81FC9FFFD05A096669765D2FDA6F98D5CE985D91EEF204ACFE7FE7111A13A821F9C0E10CFD80631CF6C0E034F7805028CD1128CB9222FE1F6D1BD3321EC11F5858AD1A6F428092F7ADDAAB24EDC2A5A0AF385F2D2399FE9A014188AB0181D23AB0AA674046ABC25F41BA992208B4FCDB5DC6AFFAAAF73AEA5F67255A80BD53312F062B884CCBC79EE4039D3BFF320A09795F5D8551D1BF014040080E19AE96645F07DBA8A8DF43C25E2391BF8784BE467AA78FFF1609798DF44EBAF12D12FC1A09FB2D24E63510FACB409D40E81BBD437E038A81E8D740BF8CF3ED44FA727F7FD7B975A4F3E89D7DBC7D038BDB7B83CE3C7786DA98172360B95DCF1826C04A2F13A8B5A94E5FF47798E72B94A0655A6FA6FF3AE56B05771E4B27EE135D176225EE646F0B9C3ED73EBDB293A0FD06B8DF78E7DE71FCC8036A8F86BBE8DBDD2808A8F0C0102871BB2DFE0402BA4900BD900BF0C3C732EDC44F5BF1AFAE92B879CA616259AD6EEF8896E87D1DBAE7CE6E384439421CE20F43907AC0610E7FE0449C7918A2182DA2D4904731B2737608F9682456178A4DCCDB8822BF6E22F06F9CC18793FB70721F4EEEC3C9FDBF7272ADD1F87766C82318C3910F0489910F388B710F2C4F620F140AF304C592188C12FFF17D4778B5BE4F86F8E636D27806A2C6B40B799FDF69332948DDE9A50C56D9977B2DCFA2CE44B766FE2E89407C84C034DC7EBAE2ABDF79E63F501466B06F1D10C5603471F31E2806639D8B7AF21EC0D5E46936B2A22EAD1540FCDE4D9B57B7E09857CFB1010FB1031F78ECFF09DDC177E51D4E5C9DD5D72AC8B32A2809DFB9EDF5DB4AE8CF71B01755DE44C19F5501086FE3103FC7217F2E0DF5BD5E41CFF4A4B937D51955782D03A93BADDDD9ED472CEEE3F8569175A7AC1E02D4FA4165B4AFDC8DEB4F2BE37DE5AE073FAD4CF695A9E795FBEFABF80908D1BF0DCE932E38D77B15C55AD6F6FA96BC038EB255DF9D0BE622D93F2C880A6B137535B2AF34E9ABFEBEDE3772DD3338AB795DFB3A66EF296AE57F81F3166A27E3B7203F2F7C1736D20FC11BF23DCDBDB715F10DB41FA5ED7E07D46BF629D15B97978B368D7CCF1C7ABEDF655AB367F17ED23375CD68F77F6E33ED454DBF9B1B61D4E6FBDB7DC95B8C9041504003514001499A7AC08738F1C05030FD00230CC79030CEE0C2B06784F8A3EB99A615CEBCF069F7E3BDFBC1CFAC327C654E604675A4F8753F13477FEA6567146F8A7C510D90FAD0ECB4EE5A9A295ED399E6F97D1A7A29F1F78D796B9A7B23AD47660DCC7461256051B851D2002993768F2FBDE45A0218963F69BD0883E078BB70BA0C4E00AF01D6CFF33BFAF33B611EF0D175E3B0DB22FC729FDD927CD66F8A19DDAB9759A8B4AF7F907E292769B6A9F65A12DFB549D008083D8FFA3DDEB6C2CDA0B7D3E7A9EEB54B7D47AE99A798E18DE0817C1D3CF423F2113C7C040F1FC1C347F0F0113C7C1B3C20348B93300B3F300C46B40E13040F188C3CA0224CF04358A4615CFC67081E8051467B8AF36CF3E9BF50F08082C8E0A7E1435BE9EF081FBE1B863C0F20BE8343FFBC5FCCFF3F61C8772BD37DE5DB0EE83F6FCC82DEC6EFBD85EF8A2EFA1620E47F0ED3665FC51C2DEA4754F4C3A808BD3EE3232AFA888A7E232A425EBD5379BCEB1E71D79DA1F9888E3EA2A38FE8E8233AFA888E5E47470241111825C00F242EC20FB848F10F0CCD0D1F4451E0451241458C44FFC95EAD1034C85D69D79BF11182911843FF6E7C644461987A9975781E27B5F824418268E09AFA2622B835529F370272E0288C81E8E09AFA4EA3C3F370AB8D387EF28C97D57F8AFE3C4E7B773F5E06772F9EF17B31CE73B5D62F1476A5973F0A369E6BEA79E377054CCF15F1BCF18D747E3F72F1BBC8257B57E472D3671BBDDC94D5DEFF368279AAD74FD4674AFD5AD30FBFF3E6A5E3C06FD5798EFA6DCDBF97AADFA4FDA0EA1F54BDA3EAEDB8B3C08ADB5E77F36DE2DE9D8CEACE72B5D6E3EB61B1E7F956254083A9D7586BCBFFEE616A502536B2BD6782A98C7483D5A23F2FBDE66F402F71BF7BB0BA47E80F9AFF89312F70AFA52F81775DFE7A8EBC4D7F3D000F3D1D93EF4ECC0F35DFD735E3FC677B2ADF330050013ADD9E932E5F1C44272958E01882EB7DF3D349EABB084C99B6E4DFAAB6BBFF9622304AB6FF39A96EFFC3C0EDCCF7A3A683E99A67D6E7404B1C2F7CF02D3B7B846FB92C8A41A66C15F44822D81F589C7D76BB6E3D6208F2070EB2CD83179A56F5F874C8FE7390460F5D9387D84ADAD5FFD86ABC2BEEDB3E95038575C537691E4097BC260A33CD7FECCFBD7FEFF6C36D3C1EDBA17859AB5D189E0120FAE3EE6FDF7C03E0DD32B72B0184224018A0A39E667C7A605A1ED116B7037D3DF6F7A93BEFD70E8563572698B95FEEB7622A70DC8AE51C76C282CF64C5A34EE3299003320B9103D74D5BBE87E7851EAE7DF067EFC67E793CCCCD59E866FA5459AFB6942073DCF07FFC4BC57E66E09351DA93FD744B522BD6F149558215988FC623EEBCA9A4D97154119B915B9C88053A8295F57E1E3510458739531AD579288FE60E79C9579719B9663B40382554D24B8822637C0199969C302917F2541AC7633F4E4846B2CDF1A9AE9420F1145B6D065B25DC2F558ACDEDF94433255216A772C5B0B100454207B8F0374994B807D41F8A9E1F180B746DCEB3134F54C29089F97C53AB1C47E81EA9AFF0B48EA698C3EC57700DECEFAC7108C9E40FBE343B15C69E66B00E50D92E2E87326C082171C27136DD548B74658BD264430981A06C79AD2AA9F525A4299A3AA6C15A662C74172C2D6E8EE717B5D8647BEA5478278799437507384D0F9631BBC097C15E20031AA85F80A052665F0F168B43CA1842DAC19AAEDAC19AB5E5076CEAEB63B9988553BF03D4C78BF3591E5ECA8695DD7C2014EA726D1F465A5979A78D3738C1A3221EA782EA05B2B687D51AB51354C6979C1C26FA5687560CEE4336E4CA1E7259F712EE2668BAC8C8EDD43107474F706C7B465BE7A13F54F4620747112EEABCDB8C2ADC66466B534789B19CAAEEC5E7CB11E127B30BA37BC773B55F7817B5034451D5DB241A7A56E51CF1916C256030A42F03AC2CD5395C21B4A3E3046BAEC0AD983841E9904337F07045ADE170331777D8898C18DB5A35498478FD28EF59041F068315AD211A3DE08A1C322153D6D1A94AE4DE527747D0390B71E332DA425682C54651F2DFD37307085646616E740C63B7606594C7767DB4378FE3693343B7B50EAF0BB526707DDFA47B1329D0465DD9D5A084F0F10A2F85E120599D2730BE9E626AD9032E52692A2FB53572F1F4FDA8BE0C873535DE44108553DB6C3D5633D3CA83A1396C18753ADED2986B1726B9596083663F3AF84E74AE88E5494F653A753AC0D98421CEB93E4BEDF10C324A59D84DF7739189AA5046E72E71D4F49A182C498A46E14A75089B562AD771F84DC15599478DAACB25F6E69CB7A5D54BD6016A8770C413BA5097DB8386C4DCAE2EC79EC6E9F88C5A7011E10B2B539FC5539E9E7ABBA95A5917C21EB99602ED673C3E08834A02F3214D442EF50FFDC43ED0276861E3CB594AC51A0F28DD3639ED9D8664BD703F97111756F5DD5C832354055352CB90919359F479870C8B25E2F0F45E33EAB370E1E7FA06EBE72171D6CB8D3244F62A89D6E4A4128913EA1D11AB118E8301C42DCEC28AC39AF3A8B6CE9ACD2B87A9C98D5DD3CB730F4DF2CB6E3BC897929061892AA8703FB1117C1BC4386518D884AFAD60BC39B9D5D8C867B8B9A1AA856666C2628CD63362EBE56E42AE9B75B6C6B843C1CD05B71CCE10433A98AB4B53F196EAF6F3701024157D3C4CD8C154DDB093F2C4D7A5B6AD8AB17CC2AA8C3CDBD3A060A503DE343AE397336922B0A7713346C841B8463C1611235E3AC82784D2FA7928F2883E23D63611EDA9A182AAE6888C295E62F0511A36ECFA345AEA225352A4BA3936D3828089F8DC68D3C09ADB63B9369559330D4FAE2F87C110263A402AE497E34182C08BBAF6B6046B10F670A63290C40C8B6263AB923A1A353303A2572BDE1DE19759B4E3E56ACCA93BFBB80B4EEEA6A40E765EA818364A3BC07A7840F50A56D7237C32F0A2F1E242F9758EA9FBE960819F9123B661731517072BCEBB60C764CBEABE4C463CC3D54681B87E8A71F4A8E2A73A5E0448079822A992C34B4FE0D17A52F0C5747499AA6C6AE08325AA2C8F35BD89CE13D91F585BA16AFC29355855D4749C23FC293A2F358CF5CE5936A512258EB2DE625B7B98D2B891B4D8C544B2607DCA75E0E9A2DE5B553A67EB9AE59DE58915862A8F07FE01A7150719ADF6CBC4978461744AD7DCAE2C81253CDAABD114EA00834C1AAE14DE6F88DD92472E2EE2016B9EFAA83EE256E7F9415DCDA0D3601A41E938CD252D421B73BD66B51CA106CBF9720287D462DE90A70BEF3964EFA456B01CD938B32C485355389F63D6E406C7E590D6B51D8F5D525F1FE8A129ECA266271E1816C7EBDD0657477BFF3056F6C35482034A3B07662C9FF3A603142438958F88795427F456E44EA3D448134C39338AD38C0E5BA222FCCB74B3AF053CF5507C2C12B0A08C708D230D98C6F092979A55B620627145E7B30EB05814C729A460948AECB5A35442823E0FD42389366906E287A15B4E63DE56D5ED7ABA8D4711B33476351638F1999CC08BA317C4F5DAB108923543A55F7AEA493922392AC5B17F01CE5AD11A61B7A942433E3327CDD7085B26376BF8B4D94E086EED13156D8ACEBE76B3EAAC13035C958EB1905655B592A809D377B9AAEC5AA542AE24E0F5D29E17CB34C0C8BA582C9D99E89DE6EA8025E75E621652BC95567B44986C58FD401C2AD19B28EEDE4B16045620D3B5386AF8DE382C056B4F12EB134EC02BC7A2B299E28C3569BEBD6C7276A15E181B4835D9C3517D718661C55C8C7A502E0BAD5C9B1796770979C2A05ECC14FCB834FB519E6B4C3A0F86877AA301FE0189077C5986CEC161E9EDF0C0F2A42730872000FE353C633BB540B9C61E4D4A3BE1757633391169E48E47F2585935683F0FE5B41E07529C9C58EA62A3F82ADB7812C45EA6D17E93D3A99AEF2FFB31AABB5B1973146A200FB9C5DAB96CEB25ED6DAC41BDA1113295E21A372C5CA03A4030A126FB4B7CE006FE657562EC0B1E15F9EEB4AEB6086365EA41A23873801E869EE84A6C988E15F200A9E1617DB8C0B8EDB8F1E54CE8D6209DA1154A76805B40A3D4314A1883C45DE647E270517756C91C6363BC9EB09E176D685197185D0A52748A9D19723BC7C4F4E42E8EEA8C1C5E30E15C91180527E522177B378A1670AD323585E075285563B39AEDB90A9E4F44148A447D353C4B0D9BCEA299EBCAA1EE0C2C687340465E4C056B263865599A44103C2B07A4B4EEA7CD68796E2C559CC5258D9BEB92A2F6B98DABBE3D2A536C8F01AF819F0EF044B48233718C8069A61D39B41B1EE8C6B21BCABF78E8452A20834DF68CDD7BBDCB7031D6748829CD689126C474D7AC66BE44CF4E48194E8EEE60EB7378483183D502DA1F369411CEA8B3A57B9B12D08B2504B125B7524A591CB2ECA80364D996F0B12E3BCA34F1021E053E9C23826BCB15B9B311CAC571C4603AE07FA6D752924A3ED1C802D0BF95BB6026C5648128F33A72F07D6FB125598907DCC858CCD9FD442516858829559E46A63F6B98C435F0D94CD144B5C1083DD1580BC5176B6A5DC6F9AE3A97B1AC1D433F1A8EA9FC1054754FE704E2228FDDDA7502084E253C9FC1B1390201A8A0503A3C9B6E5709B5E293685545D306C3D651B61B10A2E21356631EC747C9D80778606F13DFCCD99ECED5B502546FC1F0E2BC0E9B383D65C5513A9D44861C5003C00E029E69A0C2A16B30A428ACC52459E0060BA63C5B41EAE6749A624A24FACBEC7892AC5EC255A24C06632C3CC16ECCAEF712C1F184CC27E7021A2718FE9C7373AC07B3ADF29FF43ED384C574366833F84AECFD32CBC96DFEF567980980FFC2C73D011F9035618C76CD41E906058CAAC8CF562DA15459BEADCB8BEC6209F7CC0162D4B664CBAEC0B59D0A2F3F455BFE9CE9EBE3F99B8009B6453B408629412F8474041A0A5D4F5E7CF2B677AFD9ECDB52F6FC10899484E9441BB5D208AFA544DB063DE8BA3051A23E1ED4DC1A2129D0EB90EB85001377D503D22D80404FFBB65FBE7485F7ED4E43DABD096DF70F9EFF8FB3B73615A81F6C2A74BB096D7CFCB9DD4940D1DB5E42B7F3FEB493C0A018F23989B2EE6DE92342C39F0B2FBDFE44C96397F4AF117AA2C50FDDC31EFBBDAECFC543BBE1F4D0EF863C8287BC08C27182F8D49E45F871002E940C7EA120A04F7631795700DE6C1351E684714FE7F059210267A46BD158DC07244766E3E10EB655D10B74D341F9A3AF9A0C6499029DE34E641D073A442B8B78C764F150980FB30C8F731E4FC4C5D52FCF191D30296ABFA1B7262F529130A1ACB33A3165ADD66A3C238B55214E92D4942A5701219292BA44B4F2086632358A50A537F109100C47DF8E06D5B403C4FCCD2E3137D6F420C58A988EE6E3DD6C7C2017CAA6CA692866C5C03F8B2C3DC64DC96745594D0C6DAB5887B4990CF678E6AE8EB96995B83CB7A7DBAA77A34B4A4B87CD625855CC0CF2E3E8B43D1F4EA3E04894B57B52D6D315AD4AA3422A1079DF4CCE330CDBEDB78C3FB27D869E926E831B4728DF9E1A9B5AEA1DA03ECE4F83E32A0736656BB3F22B2BFC640884B17940C74A9B3995AD014EC11F671BC12E356A3A6FBF3B40835456E53E1164B61E51F8827198116398B130D2E60B1DDF594A6951BC9F4D37A3E56CCF1F338C220379E88EF4A6B80CA168405B109A357C1CE853BC033C39FA7EB3CAA5283884382A382456A9B6CA2B4E3676ABA92863A2EF60140A515B1C56351F9888E87CF1256FC4B933E5C8685E05C791A018D2FC38EF009BC6772E7BD932C52955AA63380E506C5130C16A663A978BDC9C274CCE0E627AC31C68B742E946690C9F3ED6F01C18F084F4B4D43E5892446C4FECB203DCB1353E93E912669A2D01F31003E63479DCAE450C3940E719BD01C35191E501B0E365AB3F08A20576C8CDD872F5C2D2C835DDEF2C85E756C12C7135196018D6B551338D361A82D5005602DF9AABBA4E3568025871A4D4F0A5499B658A6C6B4498AFB6E7D35CA189656D543D83CD90AD241CC69B6CC729124F4C1B319B3672B854A8DDEE722EB35D2261F860DB09F23DE9E6A2B7DED057F3056C97D6967776B097EEAC63663B0DD06EAD8ACA72B52FF815A7885479804A48120FE715C69FB579E2CD86ABCB681C397A35909D410778460554374F6605E230B34C87277A29DBF23C3513245E8BF60221D4DD8637A6FC62C693713CE3EC90B0F552C4578BBA4AD55A02144CA08A0C1FEDFBB022D0D5E5D29F62FC653F1197EA51BAB8BC26C8B1BD1BAD579B41353B8C613D538FC270446E83CBF8543AD8E958FA8A12CD11B73C48411327DACCB38BA8F7297C82E7218152BE74364FF634B64E4E4EE719ED2B05B2C81B4CAB786E50B032441950369910D0109DCE612EB7DBD5F2B4AA7AFF72D5E157E5D24B4BCA21B8D5A8D7FA17F1B57FE93EDFB38DFD5A6E476D35C9D8971B6715B6635CB85DC613FA69E3ECC587C7B9B7D732F22660332BF7D66A0532C2B92D6A53DF009EF91B3B3350D70544A05FCBFABEBCB9C4D75443584FCE5BA89BEF6857D452BC979FA095E13ADD7AC0E7730E749F5BB54C023CBB5D38CB6D2BCA94ED757975B177EDBBB42FF741EB9E8C4FDDA77556CF2E080ECAC0DDEE5259F777B6E7FB46E4B76F66FE05D7110661EEFE1786C2F8FF6EFD6F12753F646377BEBB7BBBA825495446E7EE354EF4D8BEBFB48C2CABE3F67D6D9E6651F0ACD88F8CF697733E5DCF087F863FC19FAF2FC73FB5B9DBD9E1AF2DB4D0F1DB5FF10135DB7FDD9BAF2B69F81E7B20DE640FF44FD9038AD11D7B78608867EC017FCE1EE00FF6F0C11E3ED8C3077BF8197B38A192E4FC167BC067907AF0F91932C1AC9855525C53B62E2BAD2EB087B9D4B10344D026A2B27C8519FAF630A0F7FC095EC8903CDF12CA294525679928D650290FA3D5C943F37C3F2A0FE313638FA715EB4E821C0ECF212794DB2863E6FDD273F410DD616488AF59FDACB086E1AF1D35AF6A693BCFEAD1501D4C701C58848159791B8ACB638B2A837C36AFFDFD2E2175C1CF467C19D1F10A3A1CFA790826871A3007A07CE8944A168642B59F26B9BF5042440624615EB3DEC91621686E5BDA6A970C66A8A2478281B59B1D1FECE1E7EC61C2785EB4FCBFC91E8A4F0F802DF47FC627106B777F9FD0976CE2E794C2B64D86243B4A41FCA7500A8CC62982A63EE318C1D0544B2C7E8962BC87643C3BC0FD16D760DEBF53D11E177C6BAFA23D7CF59FC336AE87B13EDD8E777DB08E0FD6F1C13AFE4BB00E79D31470823FB10EBD2DFF3EEB582F1B35E1658E1FF014218CE4911E7BC565E6231B513B781B7D438109DFA084DAEF089C9999B8CF208B9F48D8C07607474A3637FC9C24FDCADF1BE3C3929D72E130330D6DECCCE02C5CD6BCB1667475CFAB430193CA8DA19D0443D7B0C2EFDFBA41E6F6308994D243861C7980756510D667A726F33D3A6521B358E0F2A094C8559ECE295EB0E60771B3DEBB977421285B742E0DE2593DC0A29ADF4CA1FEAD1BBB5B34CB21892FCFBAEDC07593F9E665E1FA6851B3B460E3273BC9968BB4B24B2B3F18134E0EDB85F30DDBB8E9B307FC1BD8C68D68F4807F03DBB8118DB7007F8B6DDC884607F8F65E8548538CD4BD1641BBEEFF986DDCA65907F803B621BCCD36BEF150FEA74FB792E456F62DA9A009C334908E54907F1BA9B8D186EB89FD97BB15DF23102FC94389C0DDAFD25E0FB856D7139DD76C7DCDF64DBA3397DD49CDFE14667B4CF3EBD9CC36F7FA078FDB5F43EE9B74573B4BFEFC3F02000000FFFF0300504B030414000600080000002100B4461EB05E39000050F6000010000000776F72642F686561646572312E786D6CEC7D578FEB4896E6FB02FB1F12B9C03EAC564DEFB2FBF6805696F2FE65402B52A2139D280DE6BF6F9094F292E9A4BCB77A6AB65B05542515E63B614EC439E76304EB6FFF96B9CE536A8491ED7B3F9E91BFC0CF4F86A7F9BAED6D7F3CCF6752937E7E8A62C5D315C7F78C1FCF27237AFEB7BFFFCFFFF1B7E38BA5874FA0B617BD1C03EDC7B315C7C10B04459A65B84AF417D7D6423FF2CDF82F9AEF42BE69DA9A011DFD50875018818BA720F435238A80285EF152257ABEC0B9EFD1FCC0F040A6E987AE12839FE1167295709F044D801E28B1ADDA8E1D9F00364C5E61FC1FCF49E8BD5C209AAF0DCAABBC940DBAFCB9D608EF915B56117C2D710D2F2E2442A1E18036F85E64D9C1CF6EFC2A1AC8B4AE20E9579D485DE75AEE1820F8EFCD81102A47F0E727E03DCDD7CB4AAE53B6FC6B4404BE63467288D71AF734A12EF3DA1257B1BD9F827F69682A838B10DF0340DF0204DBDF9B9C56E827C14F34FBF7D03ADEFE152B5FD4DFC0BA4C72B56BD1EF35666A29015881AEF6D2D97A7EA8A80E681198B22730EA4FB95A3FFF1D6C36C1D3F1056C52FAE4C7330C3338490BD8F33549304C2571E23C87E7601A66CA1AA3B0F8338D4F8E018AA68AF3E3B96D28BA113E437FFF1BF45AA2FC4FF9ECF9A3D0F7CD32BF4803ED629DD8083D253678DF8BC12A2D1279CB07BD7A9A1887C40E0D3006608E0BB99725011E8317C5D32C3F7CD2ED289E81E63D174FDCEB531FECB8088EC1979F939F3F23DB0D1C63E44745D9727B498DB6616F2DD04F94404812C768FCF949352CDBD3C1FE5114747C6D6FE8E5A372F293B8E3F18603FA8D3C3F298EE31F8760AB7794A048C8C7F6D2C20EA88321382309127AC930743BCE93618A403096E1F3BE052FAFED7ACA0A29A7FCBF509115F8919DEF81EDD7E64AA10FF6C040D91A6565C5B1B7DEDF3530824608C6F79A503CBED6AE612D7E0B6B519434B27CCE9E34D0608AA2510403CDD640BB11A0CB0449A297E61BA66968B15816768ACEE51A0506BFF8AFFAB3A3C7500906C01896BF745F1B854FB65E0CA9A7B840798BC5FA8480862AB9F47E145FD68AF20B5B6AB1915D909E9210ACFCFFE0111A1328896C72384337718CC39A0C4E734D8442698E40599614F1FFCCEBE886F602FE058B2A1FC26B2340CA7D2BF6D2927CD152D04F9C9FBB22197D6FF34088CBE6014527D7C82A405A3E80DF41BA6E4310A8F9879B8BEFDAA97B8DF4F73D12C5C5EE1C98DA64B9BE6E38D86BFB40E7F6DF462121FBA799D032FA17000808C121CD52C2F8E7646B19F56B48D87B24F2D790D0F74877DAF7B748C87BA43B5D8DB748F07B24EC979098F740E8B7818A06A11FF40EF9052806A2DF037D1BE7AD22FD787E7E2A4C3A5258F3627FBCFE053B6E69098ACDB9D8A6B541DA02FBB6656B520836E95108E57BEAB64CFA23B6E70B94A0C44AB94DFFBEBB97377CFB72DC06E543D185601A146DCF13B6E5AF5C7A66866EFE17E0BEB1CCA5E1F8D2FA292F9A35FCA0A26689B7AA4257D150AD41C0297C394645BBA3BCDD170B89125713298586918FEA1359B192752B274928478812DE94C053138739BCC98938D394508C16514AE2518C2CAC1C42BE68A151C45F1DFD3A95C8F7F706FC8D157858B787757B58B78775FBB3AC5BBE69FC8788B2188C307893C01009EC82ACD4E430816CF238C663148F4AAC28FEE7E716F0B2FBBE6EC4577B11057D102A46459C5BCDC97F44E0E9493DCA6095FD785692D82FB6E8FB2C0C85E279F89A9B098CCAE78CAC5909605392286E197EF1ACA4A099A51DD62FDBFF56BF18881940315D0798E4FF033DC14FC7279ABAD8AA9F45905A11EB0927B0B745D0DB2858A50840F81807AF14A2A98F81884A190CF9A44164A51002D31F23519542288D7F8C44579130EC6324A68A44D01F2321D5B12668E493D1AE0E37857E02551D7000F2095475CC3F85AA8FF96750D551FF64CC91EAA07FA64BD531AFE04015E554ACABBE6A997749034F4F4ACE95C3C52A094A6624D7DE53A1A1250428F54561B42C7C95F77561BC2C4CDC55982C0B537715A6CBC2CC5D85739D297A785F1773BD288ADFD7C97CEE8BE2F775339FE0A278ADA3E5DFCB3C8586F68ED6090B5A472D552150E27C7AAF8F4FC0DDCAD5E4C9FAF19CAB429EEEFAA931F38B12F19B3D10AAE66A896A6B9C717E5FF65539EF4DCCFB5043FB081BC5CA2A703117D754A21C72AC8E4E53652A726DF66D78A69C0CAC0E8F809F7932CAD4F0C19E5626D3F8DD0290CBFCA15431DDAFC979B890279746E435192BBB0BB6B3FB47082F5B85E0B5C6E2F9CB22907CDD0E2E0347973D2B53EFC22F34E51DD03DA9DF82BF98DB7B13DF613BDEE7EA7BCDD31C3FCAA94DA85C07AF0FA5479123FE34E091EFD8BA643B4EF12377750CDE09CBB05CD17272F6DAC75A49A758CB9E9FFFBE0ACF533E8A02190478141C0AC23E92A69AB884134D8682E926F089388684710617A4320AC45F2C5BD70DAF6F7BAF54E7BD2F7E2A9E187C8996C0FA6708A081EFFB196ED5D75EC2C53F1F751244F09E5ECC8C6528BA78798E15DB299FA17A8B3F77E07277AC74CC545F3F01D72C3542B085597E7806AD0C73323F3A244A08A22AA7937B8E0C82E3F93657FCC009E08681DDAE9AA35673BCC4E5FDCB1B82E25DC08FE7F8FAC8C725F9AD15EF58FBDE347FCF5BF2DA4118C5B36CA984C153FE082A81460FFCF2654E5EE0EADCE5EAF35AF6D2A5B223971FAF3CC1478401FA963078792A443CA1557ABDAE320FE2E0411C3C88830771F0AF4D1C0822CB223C4A36598A609B380EB64256A28526418822F0FE481AF844FF65C4C153E8C7856F589ACB27D3B183F6D594D418051CA311E20DAD8050188D52E4857DA61912A5AF26F7BBB482E67B5E64C7C6AA1AF22200902EC2DEABA44BED3795D6B54A344350741E29565AF491A46AD88C50304C6179287B4352AD12C990349347C9372455636F0423E19C13B821A75E852862F11B52AAB17B1E4CDF90502F7E13BD1AF4DF815E2D8EA10C88246E8BA83206080326FFB6981AB543004177F4A4C6F4103049C1C46D41B54A34962BD96D4955EA02213006C6EF98F95A259AC4612C67876E48AA714EF7AE9A5AA58F56CDAF712CD5A57CAA2DD212F24BCAA0BA3AAB95EF6233AA0BAE5AF935A0BBAB7219C556D6C9772A97217965197CA77219565794FB3B95CB88B9A2B0DFA95C920F151DFC4EE53284AFA855A5F2875C8F53703DF15D5CCFAB8DB17E9A983CFF2DE773D1FA924D2895F9D28EAFF91F8442489C29FB8FD03485D5990884028BFD42B420140556639DF328ED46995D9A836BEF6F920738D8122E5C0D8EE0185993CB600C5E2A228351589DE0C92D482931370C1FCABB8750F8A84CB9557F59B0D899CBC2C586FBA6F087635CEEB297312E36CF5A877E29FBAE3146088421F3D0BAA88BE31451A37C100225AFC41842131459B26F3FB38B3DFB925D6CC5DF904CD208FEAA570C55A7FB108261C85CAD4B75A589376CDDA7DAFC46F21F4A0A5DC7F50E52E89F9001C93BC902E7D8B48BCCEFF121F8A77C4849513FF890071FF2E0431E7CC8830F79CB87709820700245820D50909A384F4A4D1AB8464D11C3509C61089A40E1FF867C0841BDA343509C4491FCBD774E87A0244D20E41F4A87A0184C019F010476574997DA5FD121A01D384EE447152A2DBA4587A0380CFCC03CFEBE21E94D258C2C888A1B92AADC068163F9598B1B62EA35D09C4BB821E32D197243C05B32E406FA5B32E4067AB538980B94B8A303556683C0C9FC68CB0D29D51A380902889CA1B821A54A6B600482DF31E5D52AC033A7B13B66BC766E06442D087387A05A258201D39E9F01BA21A9CA69A0080DD3F81DEBA55689C440C470479F6A2778EE5D99B54A1FADCC07E5F2A05CEEA8FC15E572B33253AF5C3B57F4DB7CCDAB11B47EDAC03CFF2D5F73593245532E2BE1D28EAFF91A14C7108CBC9C6501E6066CA797B694D9044A10E8259B40D0FCCC4835BB346C657669AFAEBDBFCDD700C917C1388E22643163D74C0A278852112960D16AFC456EE24A97016C611F4AFB55B6A6B4255F16CC4D4759B6B0086FCA7E485CA0583E7D79153AE7A56AC307A2F472CA7086A24AD1D7BCC27C94FD2CACC2DDE37A310897292BF6F9BACC5FC9BE533281E57A57EA1282E2D78DFB9A4D02FDB9666330513FEF74312FD7ECDC6ADC2F19451106BB4253A0DD75689424AF230D16070DA6B996FDE9DAF947B243D7717DB043970EDECD0EE504F1C7EC10F6382DF360871EECD0831D7AB0431FB343F98B115C64A5260F3370131779B1C9B118DCE4519AE42504137986FC33AED9E46FA4C89C213AE5D609C91DB1D242BF9E8D812918C698920C620818C5AE1EFE1F7334A684CF5FF25F045D6A7FC505E5CCC6CFA6DC2281EE1651AD54C2DF945325748AD3245F4BA816FF40C23F65D0FCDB91D8AB065AAF0A9867BF7B717E2D56093A7E9679F3EEB752B636FC5F45291F167C9C667F9C66FFEFEAADBF7E2FE69DB75EAEE287B7FEF0D61FDEFAC35B7F78EB6FBD7584A6699491C4A680B074136771B449E302D9C46992C25958A4294CFC33BCF5FCFC144196741B8DD20C8E168C79C55B671884064E4A79929DA248B4F4E7FF3077BDC4CF3DDD8BA44F3CDDB7EE7AA52D37FDF57B65D45EDA62348DE7EFD56E08AA9D47BF5750B512D00B84416E0BAABE8965500287EF9053AD7381BF2DE8DD81F6AF65548B7F28E39F3208B959F91FF6E6EEF7C39FEB92B67EAEE83CFF5DFC732D774FFC53295BAE9C2FE39F6AF152FFBF2C5EAA7B51BAAE575F45571F97FCD398FF4778F508AFBE0EAFC877E1D513FD08AB1E61D523AC7A84558FB0EAC3B04A025B1E49485853E071104C1194D46444966DF234260822C3F32C4BFD292F416060BC2F2F416894A25EBDEDD7B08AA41822FF6650115691388803AFEEE56F7D770C296E373285C3582D530B87E8E2101FF2EE8B52F550A6B891F91EE9DD81D0F738B58880C13FC679FB15AC0F706A574B3FC3A91E86C43E01A2EF01AA9E40C48A0395EF816ADF1D4398323A7A3FD8D5D1C6984FA0AAA35D5EB0FE00A916C031F9CB9D8FA0AA038EE6A7863F82AA0E3858539F40D5C6FC3365AADFC4AD68D3AF857A8F6F8FBD2D7EE9E3FF57DF1E2B2E835AF9E92FF4E370F27A69EFAA2937AE9F3265045DBF777833B108E16E5E41BCDC5B7D03732BF15BD8D887385FA57E0FBE7EF3F59A5ABFC4794DBDFFE0DF752CB1FA45D3CB31C22B09744D2DB5BA7C3B7D17FCF542305303BA27F53EF88B8A3197F7E597D4B2996819C85E53AF4761CB6FC4DD3738978385D76DB3C6365CB7C94F94FD1F79FEF04A0F3D5888070BF10B9F2CCBD7C7C7AF75D1FCFF4BF3E01F1EFCC3837F78F00F0FFEE13DFFC0E11C858A38DBE4391469E21C83375986839B2429A1BC443024CBFDD75DD1CDFF5EF807020166872A2FAB50F9359BABEF73E51F5012264806B9DCC8251002A5FFD0539828C12054F189EFABA44BED5BAF752B6DB9F55AF7827C5B46B5D21D32AA81F9DD326AD13C859165ACFEB5A06A707FB7A0DAC7DF110426EF1054E307089CA1C9E26EEED782AA95709AA0E1E26EEED7826A5F1DC37102CB3F2076434E8D97005518BCB8F9F9B5A02A4D81D23405E7A4CE0D41B53A048C51D41DCA50BB6B4B216471ECF786A0FAFDDC02FEB6A02A47452370718AE0869C6A95BBE554692E9C21A9E292F9D7726A7773710680DFB352AB2B3BBF0177C76650AB83A224059757B56F48AA6D0AF76E3CB55A6FFAF36B345675233CD5B6B812F25FF6C4C2CDCA8FBBC6F5BBC6B795E48D8AFDFC36FE7DD5DF2A594DCBCABFBF71C0E4D5B9B07EFA1679FEBB9BCEE55AAD116C37EE385F91AF35BE9F7117D353AD555AF3CF30EFCDFDBE589A44CADBAB1FE6021B5EFF245B35B7F40BEE175B99071C2398EBD734AFB914F8E772B99984E9FAF7D82EEE44995B7809778B2D1D8492522BED7E15F85772EF138BC1047521FF708AA6893AEB889064CED814B90C829514FC6B6F0B57A3CC2D3D880FC5D68F23956EC3A552D5C67C7C7AA930FE77972E4CF8B5B9B9657E53FAA31168523473AD831160F6AB5D6CA2F9D5EF3217C3111AAB8D7B61C8CBCCD23CFF9292BDD1AF7B33DECBF94369D4ABE63EAE715F3A78FFC925FC7172E9C11C3E98C30773F8600EEF640E299A92581C6C7B1CC7B34D9C129926CB225853226829FFFA3186A1C29F73728926F12B7348014FE9FDC925862089CBB7FC1E27971E27971E27971E27971E2797AAC51F2797BE847F9C5C7A9C5CBA84DCD71EFC6B86DC9F04D9E069FB72DCE64FC028814E59B62628B152FD9D0F0282BF44F6D998184EFB29341C1028A78614FAEE8FE740D9E6828B2281162F6D1DCC14529CA2CAD1ABA997DF57A03AEEE26BDCB6616FADF81DF025B98EBC287EBF9463993FBF5CBC64F0EC6A2FBCE503CFF9EF7F038F92E238AAA2ED819C97C0D600500A7AED27C1D311C095001DE042C3282C722CC6960E75AB280126CE074A9227FC7B96B7EADF23044681F247F1C9010E00302476CE27BC282A50B92436FEEA2AE1D6F69A8E61C62FF0F557EC07E0C7311FA0171241FF421141FC57ABE8D60BC5A07F21F2DFE7A6EDE946F682120849E2188DFFD58DFC6651A9191861AEDE2FF9D014C965E5F7E9D7063541A7ECB3EFC58AF3929730C2CFB29BD72979C967A35E2A5F0DB6F609C435F30380FB1B9DEBBF1FEAF9A4E6F1018D22FF17249304990FFCD6CC74A0A73F9EE7622470DC98E5B66C8705FF74C63CBA3DDB53680B7E0CC1ACB1EC2C4F5FC28354F5260EF8D75CB49DE36635D0FB9E15ABDDE9643CA70499E3A4FFFDBF32F6AF0CBCD38E6667D99D93D498DD3AE4BA074F61DE6FB7B8FD2CEBF537AD8C98B5AC74470CD1163C9D2C07FE19A2682F618E5AB697E4D6604B1E92F1A14F4ED802108E88356987441A338E80748F9CD0390EE56EAF1DB49D2024999EA9B777A76CEA86F6D45C9F1BF3A9B71CAD293631071D45EF91B2D89533860D04C8170AC0A1330BFDD05AA18E24DA8EAB0DD1893E88773C91091213F0C9ECB4E63842B549758C4727BF8B6D99E5183EB98ADD3F6F899ECEAF9C5E7F976A4B9AC10AC0E97C78581DBD3321845BAF1D7767D9301A9B62AF33A3045798CE79253B5293834783487213B9139931D0853B32B8019E1CD6E92C5E52BBD4DE6D9901742A00BBD1CAD0FA07F8D0580AA44B83E11720E828B3EF278BC5A1691B42F2C9EA8EF3C9EAE7E92BACEBA86D39ED7B5DA70054DBC3FD5E960EC7332B5B494348D7A389B96A29C7CCDECDECC60E6EA5413B12D6B62B2B4B787D42CD1095F111277BA13A57A131833B900959B28D1C26650B171D341AC6E4BCBBD51B1B5BD89A669F36F692234DD57401FB3E2EAABC756E65B8C9B426BA8A126D395A5B07873FB60827EC1F18D5DEECB3E5D03EAC0B40145DDBB35041F76B39411C241E0B180CA923173B1ED7033843E8AD8A13AC3E065901B18322894367B034A626B0371B880B6C47FA8C698CCFA18FD8E52C2F590497DCC6985610856E706902E9902EAB68774D24F648B55AD03EF670EDD09A434688055A7AE43F1BE702100C3613DB81C98DC184F4BA7ABE3EF2CC4DBB7BEEA3F3930A4FD2F589C0D5E5395AB590B475D6A69047B1D0DA904616B93522CF492D07B177876E01681C17A774DC1FE0466FA4A04ECC9FF4509F46C4CC0B7D9362BCE170DA033B34120F87DB9912D0766FA16BFEFADC6EF70CEB04914C188D0674EA9B3A92148052841D367CAF614FF549BAF1119A5E1D4877760A29DD83D1CE5455D585E2E0B18B2C183975D6EA4935537317AE28925966D02A0A9DC44987E46ECAED0BC078E63696042387A1A932667B022F37E84A67E62EDA507415E34F74E2A60AF835088CB686A9E4969AAAC4A62DFBE4D9A712D7532075E36CD281B7230B40DB61862B7747388489A8A37474A2E341BA4697DD6C08AB4A0AA9D00A92A01904AFE3F4D01886B113987D54715BFA7CB6F4A4597FB119A3BE432E9668580092FD8D3EE23824226CE4AC2804D6C6CF0A4A0EDD28ED67CA7939885845D41B67C237D06481844B921C5224B5F436E916F5E28611F6D7E81C4A4D94DC1580D9246306B8B344C628396D25034B503C28E4988871A76B732772299606537BBA809CCD60872C363369715AEE4FFDC5221B5A4BA22F12B3868961E832450AC0D6D943A70373CAAC21A0D8667B6999C86E44E1632A6D6C4CE46C637D18EF1CA0BDB21E390D7800AD17677FDB208333818EE6CBD81D4A9667E9D3EE70372E0175BC9B892D65B3E9501AA60CDA1E33D6562A631C8E07374A0EFA724871311A8B1B57F54C19F31A2ABD22C95057304A97E521AC91AB83B96A2C17E9AA549B213119C45B6E839AA7411B6182C3C66B089305ADB88A17124BC29CC8DD6811BA9B06E388DE123E4AAD36E4A8E66996EE091A23CFE680126895DC09690128ACB08D2F66B0661AA38D4FB1871689ED96C47CC942CE3C5ABA16D1D1E00DE2746D2B62742FDEA4B180193B30DDF86EE66D8FE73D26AE346430EE93A54D71E444ED6AAA83E1A43DEC1FFA767C861905EFF8B11668161A0C86D211E59693552019BDB533E3B89EBDDA79BDDE62B6873484D33175309DCFB4FEC93A1780BCEFE264D7980FF1C5DE377D67BDE9C74867BF2737FA7CE82FF6CB74D2170F640AC37DD8CE7A4982C944470E90613F88C6DD5948C3D2248D1AED49DF310AC036C4135A176E4862929C339870793E51DBDC12396F8C4DC62CBBAE90F514DFA7E805E9F44EAA304704A98FAE8301DE1321D89F2883C417387AE22F4AB5A1C5BE0945FD236F2D86DBD34CD0F883C6658BD6586A5BF2617BCCC6A7C5C4991DC37E0342B4FEBA27F76449DEF4C4E5DAD5552ED9B5343F61FAF0FC18CF0B408DA3477157EE18439E177AF6106196CB24D61BBB2131ECEE66CE64A0792211ACC89133A029A28136B653144BBB5C18A02A6A60129E6E14130B8F545F2F67B9BF40B961464D850D0EA759DA1737F6509668C9481A5BDE510CD94F668DD3FE24D2FD4CF07A6B8F3C41B3F5214D66C369FB9CB10ED3DDDBE74120A7A5D5931533C3E18ED4CB781742A749C2444A87B7B8FD7633ECC4D8CE923149E794683C0D1267C1196B64256F9783998D49DA71A36630C91A70B7C507E9812F00C701DE9886272E0CD75EB21EB6DB67729C2E8E8C20EE550E527575E0448A454D07FC18F693B465050A3E6DF0EA2674D7DE095D4E337FD60AA9559FD0E3D2B7E9E33CDD235CB0CF22C86CAFC6EA693A3DC39BD03A1C4E9B109F4EA0639F9D8F33652FC2B2DB337BE17021F8314DD9EBECD0A1FBEA60ED18E1025DD27069A4FC39993A944C40ABC379D95D806D275D70D651864E3CADEE5ACC0C8C60369E1C44EC4CB54E697FE7876B081B653DC9EBB6045A39109E9324A41BD26801E851E6621DB9E60E3A2E978D4904350EC1B4259FB7EE50C64EA4D298EBAC7CE6D3BE961D5087F6E009B23ECBCE9E6620F570803DD8ECB7A50D77E86D66E51852FDF362858C7B2D41E92E53736099B1ABAFD273B497A08EA184C8389BCE4E1BB501B51DC7D9CF1436E671193B38D052E6137F130D9008C3285C6796A591F2CFF3866F75498A345B60560F68A743E902BEC0FB9D961A762C621B1F07418A35C622C66DCFB3F638C177A7918E8BDBA14CD01037E287E8769D64F1B95700E2938DDEB7CC3065928416ECD9747B98B8B6C789B631E9E22B59D61701EE4CE7EEF41C1DDA74D4EFD2C88159B89182991D6583929CCCF347580DA7EB52B1990CEEC5C46A98CE03C935D652678A664AD6E2FAFA408AE30E25614A6FD4A1CE564FD8DABC92CE9D8D3B99BBAC3E1FCF8EEEC09B137DC9EA396D66642D4AC51EA8AD58DDAD1D5AF06D56811ABDEDE03458EAC2B83DC58C5EB7DF6D75B323721455CD9F4CD4717B892F58AEBBE1D2318587CB33C7B774622592948D961BEC3C686D8FCC20DB2267BFCFF4F63B69C19EB16461EFCF12AFB6C2FD78771E4AA97F188907660D2BB3BE34C2F91D98FAA1CFB5A7D9EA2C75865333E5CC69A936830E328CB1CEB8D5D81E649CCF56341D2FD9DDECCCDBC7439689FDD639D08F5940E9E659002B18475D9411925660AAA131E1DA91B23265A307AF68A85C298DBDBD3E8FCF4642FB0606A6C3A1547888AB2C93C4844550DDCDB68BB6150359B5DC0081498EF3591EB55AC9A6A565F83E46458E1BA27DD13E1E69BC34F4DE6A0E0F2D91DF0919888836192689FD5D7711A5A8DD1BF5C509D4B13394C526E26A3F9C2B3BDD3DB75B332B8DA4CD903BABBD49C31D1D83C936E9E0A5629BF496E61CD1ED4E027E0C74808E66BB15DE39F1AD58DE7316C92CBCF159A5ACED72C7AC756893A2F8C63B1C06532965A1DD721804CEE6D0D0BA0C425905E0CA82CE7D398E89C89D29DE62680EBAA17DC8266D3C9E3B5D8BDF2D15470BB8D58C1AC9FDBE389F6CC29D0D31CA9971DD38207B3B756EB9E1803FF064B9524EF1C93B9D3AF1093F6D45CC5FE38BC39E6176C95A989930748A0239180E39CA24797DB13AB5844387589D4D7DEDA884060F0ED9201530DC1A753ADB015D006E2D436E6C77B144AF3D383D72DE863DEC8F9D502382E1A99775264BD50B5B86259E7B5D0D3F125B010DA7735A12089B9B9CCCB170584C9776802D77935601D8A578180414FD467B21EEE1C89BF35E7730604DD8989CB6D99456A5D36005CB53C98226B83A14E6B394C60FA3E96AB56137ADBE3845898CE92C64F6981D0B4077DE3AC871A0B4F4B68D38EC46DCB116C48958A28EB7D3F5BC47B67B186F754D565F13874875B8817D98489DFE7C38594CF791233307A1B56B7788F1645AFA36ED96C5464A7F7172FAFBB628A8A32EBA17BBEDC03102151D1B3D3941473B66ECF8A22E6BF184717ACBB94A0A9DF63438A846CA680E0DCCF9346B9B5101B81C62BBE149D9908AB26D0FE7FE16C6303A4303D1623B817B9C9263757618C74477A3B873144861B6C171434A2C610DD6EE30F67A0D5E545BFCE63028039FDE747F9ACD3A31475B0B7E3BEA84E7FDC90D757D7C7286292CCD8608D815570DD3EF4CCF6D0D77B22D1B6623C289F7C3607C4ABD5D9B4F43166A09B346D9657E29AE97BD4E0FF7964683E2F973B0351D61301A4D0F017C34D5833AE02389198C636ED1D5A073BA27F57E4611431F7899336E6DEFA293B49FF4B671BB74DADDDD48DC61A89E09D612A7A025A9ADE688B3DF61AD7530D9386B78E646CC7EB15368866CF9C31DDB9A1D07ED21296F423D320618391A244BDDD93434BE546CD3615067CC0E180A4416FDD178314ADA9B85391FF6E5604CA6CBD606ED1C635640A6DCF8CCB50DE0E68ACB6ED0DBF7025F2537F29AF0D61315F1F045AF5CCBD978B070E14664CE1A2B3F5A11ABC5A83595A6473ED0C5C8B426A3296EC161B4C99C48B0062CB03A23EB709CEA1E9EEDD5163BDE034B8B6DF57DE2F63AE5060BA718E86FEB4C6F1274016F7D6589BA232C0C5D0F95BCB371D0E1E4B8DDC89489CD4E0D113EC63AD24A5AA388503A9EA0CC29D3DAE31B634C2DB72545D0A5E135652D4F47E9D0C2DC99BD6D4C604B4AE6DD313965492FDC1F2DC2DB7B4360FE14CF36F56895F574589D8D7B1B7602B65B075A184C0F8F7D685F8EE1A263A814C6F5129A4FE49DD261C06E2113DB6CAD1FD731D2E3666636DDF1F16971ECF62339592F62A2E50DD5A5BC52E41EDC81875DDC400C714931ABAC049C020F4A9DCB0947E42C597F341CF560C514B873B2578CD18A6B6BA9190ACE38E5853988F1766E4B9376E63AC59410A68F0751C6B294D2708B8A4B9B7268C1C78DBF9FE883AE497B9E759A0ED7C4B16588236C962ED7331C0586AA01CDCC8D424DE3BD60709DC5EA887777983445BBDCB1DD99C982611DD7A2BB2C001D66BB9043569C221D6975CA28D63E67940D77937D20644897963ADDB0A3265A8F3D30FC5AEE8BA9D64B167BDD4677CC3E3ECD6782D51A05B3DD46BF6C0E8C16670366DE22FA5B751DF2C10A272977339779B0CBF8E3B594CCE24E3238CF15C2C154D8DBCE5A2D284290B4DB58B2BD81A99A320F074CACA978547AB0ED4C7086CE791ABA8CC9F5B7C3EC8C12ECA2659C71833F994B428291D1163EB413A05E94D765F62B63D51BAA30664D14EC98B665DE679D8C4D393B2DCD28E2F5E96C35EF47139B6B2446A27176CF628F50B73D0B809F406064160D464BCBEDB7DA3BA23750E80169A47384F2527238022B2748D1D1F8CCF39E62968ABD4DCFA604E1187AA450ADD58D4F283F3FAE9415954DD5B6E9CA23288351D2D4985916CBDDA1BCE676CE1CA7C604DE1AAE8DE5A03FC1B1695F9D8561C98AEC1403CF1AF4215E241B53D6A269FFC40C5AEB733B4CE460A59DC3B4BD839602E69928DD1B500995E1CB96E99170A3DD1311F40011E8B037E8FA24C38805E0BE315F6D196606C981B8EB27D6A005ED75F9CC9E2D041561C45DB6D791AC59C172D172595BDB79DE7C25E829321C304371901DE8502281C914D473D22FEDF2988F134A91FBD348391932B91E6E767A7FC70E1CBBBD3C7A1EBAFB7FEC9D6993A3389380FFCAC4EC475301485C9A8AD908C018DF17188337F603A72F6C30978D7FFD4A50AEAEEA63BAFB7D7B2776278AAAC0C836A90349F9904A9C73BDACCAA9EFF76EB93A82C7DD402DE075A086C8E667FDAC37467D3C33DCF786D36A3D052BC9CC3546C5E0C002DF44FBB89E9CCBEED13C0EECA3E6ECAF23E6B072AD55E778BF44C75579C7045A1EAEA7E0B0DED7A3D2BC1D4FA12B5E589BEFB525EC19CBD21AC8B303BE5911B22E27997C3DB3F094354E6F73CC82DAB57F08E3DABDF415C3BE756AB89486DE6E9D1AC7AB253BE2FDA23AC140064E777C6D676C2D0939E7205CCAAC33AE86F4461DF25CD5CBA028EBEE2CBECE0546818CCC54FC4E0C0A9DDBD9C1361EAFF895BD5E4FE1E2BC544E673DD79C9950A7EDF4A5744EEAE8344BCAD42ABA18CAEF8308CE721822AFBBA417C7C9280EF05DAFAE9E8E4CF7E682A9C81F7A5B96D5F31059A8E67679BA13ABEBB83E0D8BB663073B71ED4D2F1368F2BAE7BB172FC959A7DB49C5BD714026E7E5E7DD09C9D6662A6577BB0BFCBB092FBCB11D475181716AAD5F994ED74DFBDD3298B4020D6878777C5577B9C1158B3B86EB4E325421BF3D69677CEB733B30E1A62EC76A25757A074B5535F66627DC725B2CAE8B40032662D9EC4C0F403D39B6D6B9FBA93ACDFB465C6F0BFF50CD57DC36E486C3B26BA9C1359DEE50CDAADD93741D2445E046E26CEA38B3945787C55ABA7736E1A53842747537503D2C507B47BF3938D3FC30466BDD9F32B73B948E75A04CC27D15ACF58B6B1C32FA0A56E64EE426EBAD599AD2B198DE339A45C64E9AA098955CF7B2DD45E901E06BD5089CDD21774C11D4FDE1E99028F17E329F8130F2678BD95A52CE5C4FB4EEBB5802F9E4EA2DD9F8D6E5B4B33629A5A5E59ED64EA2A45B9AE9F7BD595885693B5246173D5EC58B64CDA3FC500EF6082500F585AB246E56B6E9CC8CD9C2B5D1FC289F879C15D1F61049694C2346CC6130AAB2BC3FD50B3D8BFAE9B1B5DBCC8334B683E3164E536B16D6FE3CAA6F75974EEFE939166D34ABBBD9D5B86DB8AC2F0D6CB53338295291E29A06227DC8E9CA14F674A77B95659A965AD3BDDC53C6F275B19265475689F155D56438D6F95EC090545F5EC8323941D697B55FA3A30783D23F59A059A9D0EAB9C954DD85D2ED89DCB89D0F9DE5593921E6A8A96C3A3DDADA79676A5666F65DDBC5B77C9BB303BDFB0DD0159B14E1EE104A9C07237E566D0A7D748487F5BAE71B63555EDE5CDB6E4B183B2308C3CD49F587FC66008A8D35BE9A98036EA1D53BA427A089B451CED7B807F6F349BC5C8408C5ABEC520F9369E998D59E53D8C2436ABF703BAD0D563C6B23CE752D636906463299EE38C79DC14B72C113B422CCB79DEE8EBDDE76B4170A2E128279BEEF9C0F9D00A5539365ED9A96CB5E8ACE74DF9F38F3462066512D4D26C1BA5B61C8DBCF3B53C4A3747034579ABF3D5E6C7751D778FAA1E972D07F631057E43D23F770CBCA32596D9077F2D87D594F198E3BE41D6EA1C9B23221875F6EBDA2EB019ED9AC79C66697BCAF5B77DB20C6F2DBC2B86AEA78213717B511F8B8B2B339B3A39143122B7265557265DF6F1579FFED7287D79F7E5BE0DC732EF67535C789BD8D4FEC363579B795A4765F9AF43F95B2ED87DFEB7FEF3625D2160FA1CB2A007CBDB19D32D4D91CB76B3B5294B624B80117B2D474E0A3D19EFCE79FCD177E276BAB79F3530F64C9F4D579BB59CDFB621955FC8B65D476AD541445C03D164AA10818F6B9DAE77B6F1FEF8BFA8FE6307E5971CCDCF4A991F647BB60FF5C3D9155F3A7767DF78F2249DF2D354A22A0381E7E6795B17B45DC45A471BBC8B3C10FAD32DE57993651BAFD765470E34A9B3917CF4DFADAFA242842D1EF594CE468FB93176C818AEF4B02448741572AB96D126E3A1E2D19B3D44245DAEB123B0E97962A976933A3B5C44D91C7AA07716D4AAB40D5C4A43B10C3A33308266EEDD65C21548B4A1B647930BAED0CB50A8C7CC7278B3D8F0643BF3A3B92991EEEBABDF5567AE7D6EA0F189B561698E1D01EA58696EBD3BE35EEDBC2CC306FA544A7B2768A8F9A2CF5B96014CBDAC4C97C776584767E1F74D65CB15B6CCA20BC729369345CB580BE988B6EDEBBCF7AB71B1AD3719A1C5647FBA09F36FCB5DE1D8CE570213923BD1A55EC647D1F1CC7105AEB158A757CB7250D85DD9DF33774B93ADC2371EE3502BD7E79E86C1625BAD3AB48C6E3764ED3F255C13D7DA2BD1BE8DD7E60837ED31F0F57DC45E5BCE9D47862CDFD5A22136C7B6FEC0BC6E2BACEBA13B9D6456E86B648477E907675773AF3382B34AEA1A8C6C5D0D4E7E3B5BA29A0289C26BD9DEEDDAB4B8F4E3A524883E2AEA6276FD81A7D0E5B6F6D2ECA5172B2CF1CE86E057873224735F0ADE9EE36C4771C5ABCC57D9716571CE3B8319E0292E3251EED7565373636C8DDDF9834E91AFE68BA99B64AFD1E6F2FEB49186843F1EAF4193C21C359854E8B71B0BD5C26F7E300957227954C644BBB1B90EEC6DD8FA54DCD4CEF1066C2DECD233B1C8DF8D5416E27534BAEB9F144BA32E8BEE2199546B84F0B9BD55283AC4D1FC792892FC74DB8DA53DB9993F6239AEC6B4A6C524BED44703E920696F997D9E0A1C9EEAEDEC3A3018F04954C47759DBBF4E06E69895133977B7E9FE7ECAA66BBD3C5EA78981A123FAFFD5B4B0905BB1A75EDBE59588A3152F9E15D2B86F7C9796E889675395E0B2B1B41AEB36A0AF2ADD2F5A36862F9AB7632C5339C47DEFFB69E35E68B75AE4E96862672766747CBA36A694ECB7C75B9B0BD3CB1BAD762EA8E0B293A3502CB4D01247170BCB85E278C2749A8DC4EFCAE38952B01F4EAA8BE9ABBF54439DA83C1D64BAF00AA15062E61C2EF1575398DDC99E16B9562ED2BB1ECB4378A6B3D867C9ACE4AB41F7567BD45E20CCADB4537268745B05EDC0ED39B72163B7BE9B6D9C79E608370C25F8154D6A39E705CFA533EF1670A3CA497EAECD3ED55CEFB0C724F1D518FBC05ADFB7575C9CC99B73F58FD8B64F48ADE5EDEA7F6764C8B3E5D0C86B57A4691B4ED2C2E351929EF556823F0DDF09A77E13EAB104970DB9F57A1ED58FE4C8FBEF6AB808DC8CD014ECCBFA142CBCF55E8CBE4F05E8FBEEDA85FF4D1F75BFAAA42E134716CA51548D45DD33D48FF5A0C0AF9BD1F4380A49B75C32591A7A4CDE466B4BCDB865B5C06E5E89F27AD117CA323E8E1E206FB87825EE9ED37B160B9CB92A3FDB66DCB5685FE46BCDFFEFCFD44F94441519F7600521CC3523CA0204E49220559A612A92744B11CF5C48A1460A92720F82C2B5040E42916F01410048A85F85C5EA20027E16F12210285B51F2FB1F8A50288A5A8D79D4FF422F5BA8BA95BF8FB6FD13E8EFD2426DE6BFF1145011284DFFE0B0286FF6FA2BFB3E41862B51E35AABF718075B32CB926C7C6D52DF9833C131CFA4551A7E461F9322F92D39BB7E3C4CFFFFC9DA19867866AF4BB203C8B22CFF1B836782F31E819094080380921008879665989E704842BCB4AA2C83CF3AC280900513C6281C43F37C4C0309F27897CE64DBEEE791B876DCEEFFF1AFFC11786F93ACCBCFE96D5D77DC3A4BF801AE206C641897DA11B56841278D00D2B21013E6749D13C9F8693CC7314EFD33F6EBF8A789ADC44DC1D7046406A1AE3837C3EC8E7837CFEFF93CF7A2604A9B4F819F2A9D48582C98719D3577A30AA36863071BBABA992A799DBBF64562A4427A3B53E1866579C967C398D78D1AA775C5FF74E7ABD89BA23C71CC251A7706FDBC99197B55EB02ED86BD6999EACB1206D23ADBB06BDE349594675AE6EC3E5216E510AA4227F62446F35C807CEA6B3DBEE5D6D9ECE0DEBCA6C903EF73426A83C1E2ADA689DA5F6863B9CBB666D2E879B62B8ADA1BEBB6EB88E7E4966E0DE69DDA1AE8A3836D98BC086E838DB2CA33B9CA1F949102ED6707E90E6A2CEEDE485B8EFD328CF324399729113D35B6563934BF83AAABE71E72CCDC35149933BE7EE9E4088F6259C34DBB7E6C6762C7F9D276ED0423B860CE381F4EA17F96E5339E5EB6399FDAAC0FBF8BA0E170B9CE81EC95BE4E83381C75740F1C16E87F9ECC166D7C7CDFE974694DEA13CBB51D3DF41537DE2EDF97E3B9132BC74B756E0DB3E87ABAF2C888D04E74D06CE7C458A3294DBB67C311E3CC887C5FA49C27482351509275549A28091E649E23006B03C0759887107B022C75122A6014C3D2CC227483EC792271D290E538E0029041147F622C4A2A0C040BCE7451053140531EBB042C6229C15E6222CCA677986449AC59942922FF59D74C50204096349185558C43184B14496C7A22194F01E9701CB142496C39F4B121231B3B13C4242AB8249B45DEAB38A7EC65AD7DDBE081BD2927E19697D96E3332B328C08012E091224049EDFB413212642654D533DB74D85C1B361B0F76D81D31031B8AD5949C00D213D7F96CB2FE6AEC668F30577A1EF7017BE382FD8053801B00FEC0282C483FF4DEC6A72630989E39E4A7ED7E403BB3EB0EB03BBFE11062733367C69F22F6017313875565678CAC13AD35CE82CF7A3305B16033FECA3F8DC08D4B24C9C9E4C7B3887D05EF5AFB3C97D32956A701A5D9732BDEE0418BBE2CB62BB57CBF35AE0ACA88F5075B9C99D819A33E6F6A4E0964EFC6DD417DDD687C735A37AEF3835AB0E55A08749229F76B56032D66AB28EC281C095FBC05E4BB7E5F46CAF2A9F5B665BD64F8593014E37DE3B2C1C2D1477972C924E83D663B054D6F39B18C6BAD91140580A7A799FC3CB756E1C18DA0C254F1BE8275FA623B00D0B672CC8021F7132305F17CB9A367D619846E0F7E6C12F37C55B005406BA55063DB40A6D25F659A6E19846E05761E6ABE3F6FD362616AE1EAA37EBDB7D5CF3CDEB5F089C54CA8627A594670B52A82FE4C9A3C52B1DBDF6D976B6693AEED7CD628FFEF5AE6BBDDB54E7D342D0B235387DBE70F376CD062DF0D160DB6D4F7EACD93CB00B40462474823515C7F11C261C282080E10AEB7E4C49AC883525B133B19288553D43208B7A0212234AC0E730950912C5718015444AE4781EB31907259E223F168B774020DC85C5025EC8784E2024C742E4E34CB072E424C26C380F8E13280E89222F60D660394061D29020C91D277161008FB028F2CDBF4C57AC0430AEB0128B8B0C44883FC14488C986E3055C328E8722F201002C821CAEAF88CFC2F5068240F2C7F59738623B7BDF1E9F5BC224DE0F7CB6E133E197F1D967793E038EC1F8451895810266B2D7D67CA1B3B6419F9B06E5044CBCFCF3DB767BFEAC5D705A62A4A68E10091CFEFC7D7E3F426A3FC36AE429E42F598D3C85FC4D566B1E9C24742934D8866B8F9BE1C55EC6605A7D801B8975FFCB4C634430441491497E2AED03D13E10ED03D1FE0988C628A93299BC3858FC08A29980209A8911CD228836B42FCBD21CF557829AC4ABD965E7CC992E5BE4ADDDA9235DF51CA04350D89CE8952A339B5C2722DAA5D57CC696433573257F74DB4EB55B57DB05132BBE5EC049EAD801A134BDCCFB9B99AAC39373E785D6D496A6BB34C0606807EEAEA7F4D5F971D21B268BD3110DECDDFE2E24EB7290C0E09AF9ABC5C62A46301CB0D7135330F5923FDE9CECB0CD755D4AA63D3F6ADDB98091389100B9A9B2ADEEA1782EE715BA6F43489BE7691C66B04CA4E15E53828E2CD1605B165C77DDEB104CEB98F9E798D6B6E10FCC855F6E5FC7B446E0376D4EFF02A6350249E257615A2BF0B5F37E1DD31E7DEC4730AD11F835FF9A2F312DFF06A63D9455F6A2AEE29757EAF1C1DFB264F7C88C797EAF3C31937CD2A25F43899F8087C658F2053CB0DF838726047D030F4D00FA073C20C4A2D7C53612CAF997D1431B7B9A7AC487FEC0870F7CF8C0877F043EC8E1E59EE43FE552F4B0F08C69C73EA93DA44FC7CEE5E81D07196B39D27EEC2D847A2E3602CDC17853E01E73CB0C1A4F40833E19AECE6693A6205D6AE5745433D949E3F6DAC4D8B0867D56338166CB494F9D85CBA9E5AE894BD16CB537A353A71D7AB9B7B1E7B122A2F171A0F59DDB68BF973230496DCB5D2CCCF036B5FB5733736EC2609AFBB85095EC72977069F626004F39E3EE22D1D86C918DEE79D8B6E12AEC76A0D601957F03E2CAEF84FB1CBAE2D9ADC460D45D448170CD0726CFD2BB195D9802DC868B0B1C77B47E3D5B441F2E453FE452A408D96CFF37B9143D3455460128491C8C1F6F48002B47964280E798574546BD1E3CBEF6B798401E9961B278396A0BFB9A6C0BFBFCBEB0983BDEE8DF6FD930BE0F1FBF495F850EF05D8B0509D0FC021DA2081ED041A232BF4207F96DD35F071D1C457E7DED03363E60E30336FE11B0B114CFCB6AF2135E3CF7B5D09D28781CF176DD2D366BE1C2DCD04071B5646E8C06D01DD0479E1F7B4A2350AFBB8ACB2D83444791255C561CD881AA88377C3A4D6F2B15B9F535DBCFFCA53A1B1B42E2648A13A11B3DC91AD8F01AD898CFFCFD1DF893F6B9D41560FBE3D3C1E9AC12AC2DF3550F0FC34038ADB2CB7D980C2BEF70D8713D947B48EB833858A0C3B657AEABA3B1748E0CE82BC965AC1F82158CBDE8E5774BAEBBAA5FB0DBE87E16B369DC39F3D9381E14BC0F794B08D3DB5ABDA9E1F02CD1F411D1EED61A76FBC893B7CA116DF30F2F9E1FF1E2D1429EF1EE4D7FFF3BBC7888FF07F0590431483C76158B5FC9BF4F14186488EBCCA7978A7C06280A366711F71AB27043FC6B180A228AF8A920F1FD4BF5C4E2339EF0D7A8278EE27CE2FBCC02921947B525F81C5AA007252835D022FE3268413C20B5E058C020F48CD53E43FC8218728478967B7304201005F829C90B0C473EC56C20F1B80D008FE033460806127F21207112F30C38C031B83E3C8FCFE19FDF65F68B9D6B1A795FE00FFCAECD85C4876CF0A7890EF9F0B411185E7CF5B421C1677E99574D1B9C887A44B4F9C0A00F0CFAC0A07F0406D5A542235FFB510C5ACE6B90A893A519E0AB3AE71659C03A376BA3ECA783CBAA375AF352CFBB88E648305BC8F0CFD3A3BE648422F47661B7F6A7E27DB3963CDFD02237F747CB7C3251FAFD3498006B9BCF3B9D3BD3D78C517DCB9DDB28DA9FE549D513A4DC573BA05DBFA846F6781C3BFB9D2D27AB813ECC0D70EC8E56BB3DE827EB72AC9D3735D49539831128CCEAB33FAD06875AF00C2707E975AD8CCF9C37920401F7C49A6FFBA1BBF322B8A2B53B3DB360A79F1F60C74B97824E1B99EEEC06915D8FFA1D81B50ECA4C40331BC9F323B7E5BE40A02F9E2BFE771188A8FFF6A2FC220422F4F32D81FF120211FA69047E138126D936A2ED66E5E747108874B576B6F96B04D2BF8E402F01C730F540C44B184ADEBEF80F1DD6C6F4A3FE3289C9089087A2A826861C45DE1519FF21BF8DB1471C9049603DAA0DAA471EA02291F4A8368A1ED546B8A35EA2DBFD751253152EA3F892DB131011F16C2625A19E785E822C854503216E23D13DB470F684414D6000153741E4C8D924805CF5C48B3C2E167E1130923D89647D887A62790C1602C58A1C8F732065E75F2B44FC55DE1F7CD3371AFD3ADF9B97AC306FBDB4FDA7A3F62ABC26DB7888CFEF5BF8F97D1B3EB7B1FDA897B87ECFEFDBEAB989CAF79A7AD760CF4D503CE28F4402E23DBF96EBC7BC73FE2D3B17F77D3B9724702DE891603EAF762EF409F43EEC5C1F80F701781F80F7ADD2D197D9AE23FD844F0E5C672F8B6AEBCE150E4655309DAEF9B551A63D63A458CAAD772844A3D72EAA49C97C93E31E332CF473C059EA986B17D5C67260EE39DEB5D8782D75EBE14251CE561CF8A3F9611371305A74F7F36CAC03534E4A5E5737F3C1B57D4E5FD72B4FE2048155FCFD627AE85D465DA64A4E71D08B874A01B5696E2A356033468E36BD7804811C7297D01A378B6A4ED65D24C769B47157E760F4E2431C7505C08351273B84DE3CEC9F57750551DE3987D6686E32B37E47DACE65D899D377DB3E1D7B12A6C68A5B4483E1A469AA0F9F9CEFFBE43CFAD8DFE593F37FD4D6C5792C6251C349DCAFB375092C46B64FB62E492074486C584D20BF3747AFB6AE97E4C3D6253002A9F3C3D6850424BCB17571227C63EB7A9BD9CFDBBAAE2CF307418E97983BB79790332FC9FA25D99ED2C4846922C9B451624818994FB163484A8E8B303BBB45A826E7223C372169FE6883CFB427EE82EC3FFF4700000000FFFF0300504B03041400060008000000210042BE4A81DC010000D106000012000000776F72642F666F6F746E6F7465732E786D6CC494516F9B3010C7DF27F53B20BF2736513A5528A40FCB5AF56D6AB70FE01A13AC629F659BD07CFB9D2110D65555D24CDA9331BEFFEFFE77075EDDBEEA3AD949E715989CA4734612690414CA6C73F2EBE7DDEC86243E7053F01A8CCCC95E7A72BBBEFAB26AB312201808D227C8303E6BADC8491582CD28F5A2929AFBB956C2818732CC05680A65A984A42DB8822E58CABA27EB4048EF31E1376E76DC93034EFF4D032B0D1E96E0340FB8755BAAB97B69EC0CE99607F5AC6A15F6C8665F070CE4A471263B2066A3A128C97A43876550B853F2F6920D88464B13BA8CD4C91A3D80F195B2C7323E4BC3C36A80EC3E2A62A7EB21AEB5E9F2B2196C1C6F7139024FB15FF4225DF7CE3F26A6EC848944C4A838C5C29F3907279A2B734CFCA9D64C9A9B5E9F0758BC05D8ED65C3B977D0D8234D5D467B302F232BFEDA67B00E439E96E62F33F354718B7FA016D9C3D680E3CF353AC29125D8F5247ED6643DB97292360B7B8B115E5AEE780047F0952A72324BBB408B5BBCD38AC79C3076BD597E4F6F6244F76A234BDED46172D2297EB8B878CB05DAC1585E068957018BBA5AC5062D96E3E6B189FE781380D0F58A8EF29E3198EA8F5C1F70BEAD5E3ED4FC6EFD024C50A6E9AE9DA7B7BD60FFBF15EFFAFBC76D996CFCFA37000000FFFF0300504B03041400060008000000210044611E3A1F90000000EC32001E000000776F72642F656D62656464696E67732F6F6C654F626A656374312E62696EECDD07BC96F3FF3FF0069A4A452A457636214A458BAC4A6621328B060D7B858C8C32CAA6A56C0A15512159515456D1B01AB63856F57F1EF7CFF9F7D0B9EFEE71DDF739F5FDDCDFD7F3FBD5B7735F9F6B7CC6FBBACE7D8E9933AA2C1836A6D6C212FF79352D51BAC4CA55E54A6CB4DAFFB73725FFFDC326254A94FABF3FAF5CB56AD5BFFFF7066C48FEFBCA50967294A70215D9984A548E6DA64415AA528D4DD98CEA6C4E0D6A528B2DA8CDCB363289C94CE1155EE535A6F23AD3788337798BB77987E9BCCB7BCC6026EFF301B398CD1C56FD8FBC56F052C5D835CC97FFE76CDBD235DC8ABA6CCD366CCB766CCF0EEC483D766267766157766377F6604FF6A27E8958DFDC877D69C07EEC4F431A71008D695222BF6F9728712007D18CE6B4A025AD38984368CDA11CC6E11CC191B4A12DED388AF61CCD311CCB711CCF0974A02327721227D389533895CE9CC6E99CC1999CC5D974A12BE7702EDDE84E0F7A721EE7D38BDEF4A12F1770211771319770299771395770255795C8DFF79EFED3C7B56865BB7D6C2BFF1DC9BFAA1BEDB19EB46A55FE7C50DEBC91FF9A12FBEBFC53B9C62BFF2B0EFABF89A4A433D9ED9FA34EEF55BE44A992FFB69FFF5AFB3B62AFFC7926FF55DA556CEF2AB7F9E7EAA5FEAAA4FDFC43C99FF7926DBF0EAD9BE4CF6AF9C7DFC2F9EFEE5AB6D50FF2AF746AAFAA691C7FFEFEE6F7E3FC57FE98CFBF6EFF8EFF7CE1F5BFF32A195BC6D37E95D4734A978FF5FDFF8EFDFCF5BF5DF35E7D7B77F9A71458F31F97371C9B3F7F65F62AFDFF6B92345EF9EFCD5F37FE575FFDB89A6BB896FE5CC7F5DCC08D0CE0266EE6166E652083B88DDBB9833B19CC10EEE26EEEE15EEEE37E1EE0411E6228C318CE0846F230A318CD233CCA633CCE133CC9533CCD338C612CCFF21CCF338EF14CE0055E64222FF13293985C22D64F5FE1555E632AAF338D377893B7789B7798CEBBBCC70C66F23E1F308BD9CCE1433EE2633EE153E6328FCFF89CF92C20BFF05EC4177CC9577CCD372C66094B59C6B77CC7F7FCC08FFCC4CFFCC2727EE537F2F89D3FF893BFF89B15ACE49F8542E7CF5FBC4A519A0DD8908D284359CA519E0A5464632A51994DA84255AAB1299B519DCDA9414D6AB105B5A9C3966C455DB6661BB6653BB6670776A41E3BB133BBB02BBBB13B7BB0277B519FBDD9877D69C07EEC4F431A71008D6942530E2C19AB419AD19C16B4A415077308AD3994C3389C23389236B4A51D47D19EA3398663398EE339810E74E4444EE2643A710AA7D299D3389D333893B3389B2E74E51CCEA51BDDE9414FCEE37C7AD19B3EF4E5022EE4222EE6122EE5322EE70AAEE42AFA7135D7702DFDB98EEBB9811B19C04DDCCC2DDCCA4006711BB7730777329821DCC5DDDCC3BDDCC7FD3CC0833CC45086319C118CE46146319A477894C7789C277892A7789A6718C3589EE5399E671CE399C00BBCC8445EE26526319929BCC2ABBCC6545E671A6FF0266FF136EF309D77798F19CCE47D3E6016B399C3877CC4C77CC2A7CC651E9FF139F359C04216F1055FF2155FF30D8B59C25296F12DDFF13D3FF0233FF133BFB09C5FF98D3C7EE70FFEE42FFE66052BC95FF8F357FE9294A2341BB0211B5186B294A33C15A8C8C654A2329B5085AA54635336A33A9B53839AD4620B6A53872DD98ABA6CCD366CCB766CCF0EEC483D766267766157766377F6604FF6A23E7BB30FFBD280FDD89F8634E2001AD384A61CC84134A3392D68492B0EE6105A73288771384770246D684B3B8EA23D47730CC7721CC773021DE8C8899CC4C974E2144EA533A7713A6770266771365DE8CA399C4B37BAD3839E9CC7F9F4A2377DE8CB055CC8455CCC255CCA655CCE155CC955F4E36AAEE15AFA731DD773033732809BB8995BB895810CE2366EE70EEE643043B88BBBB9877BB98FFB7980077988A10C63382318C9C38C62348FF0288FF1384FF0244FF134CF3086B13CCB733CCF38C6338117789189BCC4CB4C623253788557798DA9BCCE34DEE04DDEE26DDE613AEFF21E3398C9FB7CC02C6633870FF9888FF9844F99CB3C3EE373E6B380852CE20BBEE42BBEE61B16B384A52CE35BBEE37B7EE0477EE2677E6139BFF21B79FCCE1FFCC95FFCCD0A56F2CF4D9F72BD24A528CD066CC84694A12CE5284F052AB23195A8CC2654A12AD5D894CDA8CEE6D4A026B5D882DAD4614BB6A22E5BB30DDBB21DDBB3033B528F9DD8995DD895DDD89D3DD893BDA8CFDEECC3BE34603FF6A7218D3880C634A129077210CD684E0B5AD28A833984D61CCA611CCE111C491BDAD28EA368CFD11CC3B11CC7F19C40073A72222771329D388553E9CC699CCE199CC9599C4D17BA720EE7D28DEEF4A027E7713EBDE84D1FFA7201177211177309977219977305577215FDB89A6BB896FE5CC7F5DCC08D0CE0266EE6166E652083B88DDBB9833B19CC10EEE26EEEE15EEEE37E1EE0411E6228C318CE0846F230A318CD233CCA633CCE133CC9533CCD338C612CCFF21CCF338EF14CE0055E64222FF1329398CC145EE1555E632AAF338D377893B7789B7798CEBBBCC70C66F23E1F308BD9CCE1433EE2633EE153E6328FCFF89CF92C60218BF8822FF98AAFF986C52C6129CBF896EFF89E1FF8919FF8995F58CEAFFC461EBFF3077FF2177FB38295AC22FFA155494A519A0DD8908D284359CA519E0A5464632A51994DA84255AAB1299B519DCDA9414D6AB105B5A9C3966C455DB6661BB6653BB6670776A41E3BB133BBB02BBBB13B7BB0277B519FBDD9877D69C07EEC4F431A71008D6942530EE4209AD19C16B4A415077308AD3994C3389C23389236B4A51D47D19EA3398663398EE339810E74E4444EE2643A710AA7D299D3389D333893B3389B2E74E51CCEA51BDDE9414FCEE37C7AD19B3EF4E5022EE4222EE6122EE5322EE70AAEE42AFA7135D7702DFDB98EEBB9811B19C04DDCCC2DDCCA4006711BB7730777329821DCC5DDDCC3BDDCC7FD3CC0833CC45086319C118CE46146319A477894C7789C277892A7789A6718C3589EE5399E671CE399C00BBCC8445EE26526319929BCC2ABBCC6545E671A6FF0266FF136EF309D77798F19CCE47D3E6016B399C3877CC4C77CC2A7CC651E9FF139F359C04216F1055FF2155FF30D8B59C25296F12DDFF13D3FF0233FF133BFB09C5FF98D3C7EE70FFEE42FFE66052B5945FE37EA4A528AD26CC0866C4419CA528EF254A0221B5389CA6C4215AA528D4DD98CEA6C4E0D6A528B2DA84D1DB6642BEAB235DBB02DDBB13D3BB023F5D8899DD9855DD98DDDD9833DD98BFAECCD3EEC4B03F6637F1AD28803684C139A722007D18CE6B4A025AD38984368CDA11CC6E11CC191B4A12DED388AF61CCD311CCB711CCF0974A02327721227D389533895CE9CC6E99CC1999CC5D974A12BE7702EDDE84E0F7A721EE7D38BDEF4A12F17702117713197702997713957702557D18FABB9866BE9CF755CCF0DDCC8006EE2666EE156063288DBB89D3BB893C10CE12EEEE61EEEE53EEEE7011EE42186328CE18C60240F338AD13CC2A33CC6E33CC1933CC5D33CC318C6F22CCFF13CE318CF045EE04526F2122F3389C94CE1155EE535A6F23AD3788337798BB77987E9BCCB7BCC6026EFF301B398CD1C3EE4233EE6133E652EF3F88CCF99CF0216B2882FF892AFF89A6F58CC1296B28C6FF98EEFF9811FF9899FF985E5FCCA6FE4F13B7FF0277FF1372B58C92AF2BF495F9252946603366423CA50967294A70215D9984A546613AA50956A6CCA665467736A50935A6C416DEAB0255B5197ADD9866DD98EEDD9811DA9C74EECCC2EECCA6EECCE1EECC95ED4676FF6615F1AB01FFBD390461C40639AD0940339886634A7052D69C5C11C426B0EE5300EE7088EA40D6D69C751B4E7688EE1588EE3784EA0031D39919338994E9CC2A974E6344EE70CCEE42CCEA60B5D398773E946777AD093F3389F5EF4A60F7DB9800BB9888BB9844BB98CCBB9822BB98A7E5CCD355C4B7FAEE37A6EE04606701337730BB7329041DCC6EDDCC19D0C6608777137F7702FF7713F0FF0200F3194610C6704237998518CE6111EE5311EE7099EE4299EE619C6309667798EE719C77826F0022F3291977899494C660AAFF02AAF3195D799C61BBCC95BBCCD3B4CE75DDE630633799F0F98C56CE6F0211FF1319FF0297399C7677CCE7C16B090457CC1977CC5D77CC36296B094657CCB777CCF0FFCC84FFCCC2F2CE7577E238FDFF9833FF98BBF59C14A5691FFADB89294A2341BB0211B5186B294A33C15A8C8C654A2329B5085AA54635336A33A9B53839AD4620B6A53872DD98ABA6CCD366CCB766CCF0EEC483D766267766157766377F6604FF6A23E7BB30FFBD280FDD89F8634E2001AD384A61CC84134A3392D6849AB32B16F5C1E426B0EE5300EE7088EA40D6D69C751B4E7688EE1588EE3784EA0031D39919338994E9CC2A974E6344EE70CCEE42CCEA60B5D398773E946777AD093F3389F5EF4A60F7DB9800BB9888BB9844BB98CCBB9822BB98A7E5CCD355C4B7FAEE37A6EE04606701337730BB7329041DCC6EDDCC19D0C6608777137F7702FF7713F0FF0200F3194610C6704237998518CE6111EE5311EE7099EE4299EE619C6309667798EE719C77826F0022F3291977899494C660AAFF02AAF3195D799C61BBCC95BBCCD3B4CE75DDE630633799F0F98C56CE6F0211FF1319FF0297399C7677CCE7C16B090457CC1977CC5D77CC36296B094657CCB777CCF0FFCC84FFCCC2F2CE7577E238FDFF9833FF98BBF59C14A5691FFE1BC9294A2341BB0211B5186B294A33C15A8C8C654A2329B5085AA54635336A33A9B53839AD4620B6A53872DD98ABA6CCD366CCB766CCF0EEC483D766267766157766377F6604FF6A23E7BB30FFBD280FDD89F8634E2001AD384A61CC84134A3392D68492B0EE6105A73288771384770246D684B3B8EA23D47730CC7721CC773021DE8C8899CC4C974E2144EA533A7713A6770266771365DE8CA399C4B37BAD3839E9CC7F9F4A2377DE8CB055CC8455CCC255CCA655CCE155CC955F4E36AAEE15AFA731DD773033732809BB8995BB895810CE2366EE70EEE643043B88BBBB9877BB98FFB7980077988A10C63382318C9C38C62348FF0288FF1384FF0244FF134CF3086B13CCB733CCF38C6338117789189BCC4CB4C623253788557798DA9BCCE34DEE04DDEE26DDE613AEFF21E3398C9FB7CC02C6633870FF9888FF9844F99CB3C3EE373E6B380852CE20BBEE42BBEE61B16B384A52CE35BBEE37B7EE0477EE2677E6139BFF21B79FCCE1FFCC95FFCCD0A56B28AFC0FE696A414A5D9800DD9883294A51CE5A9404536A61295D9842A54A51A9BB219D5D99C1AD4A4165B509B3A6CC956D4656BB6615BB6637B766047EAB1133BB30BBBB21BBBB3077BB217F5D99B7DD89706ECC7FE34A41107D0982634E5400EA219CD69414B5A713087D09A43398CC339822369435BDA7114ED399A633896E3389E13E840474EE4244EA613A7702A9D398DD3398333398BB3E94257CEE15CBAD19D1EF4E43CCEA717BDE9435F2EE0422EE2622EE1522EE372AEE04AAEA21F57730DD7D29FEBB89E1BB89101DCC4CDDCC2AD0C6410B7713B7770278319C25DDCCD3DDCCB7DDCCF033CC8430C6518C319C1481E6614A3798447798CC7798227798AA77986318CE5599EE379C6319E09BCC08B4CE4255E66129399C22BBCCA6B4CE575A6F1066FF2166FF30ED37997F798C14CDEE70366319B397CC8477CCC277CCA5CE6F1199F339F052C64115FF0255FF135DFB098252C6519DFF21DDFF3033FF2133FF30BCBF995DFC8E377FEE04FFEE26F56B09255E47F28BF24A5C8FF0CDF066CC84694A12CE5284F052AB23195A8CC2654A12AD5D894CDA8CEE6D4A026B5D882DAD4614BB6A22E5BB30DDBB21DDBB3033B528F9DD8995DD895DDD89D3DD893BDA8CFDEECC3BE34603FF6A7218D3880C634A129077210CD684E0B5AD28A833984D61CCA611CCE111C491BDAD28EA368CFD11CC3B11CC7F19C40073A72222771329D388553E9CC699CCE199CC9599C4D17BA720EE7D28DEEF4A027E7713EBDE84D1FFA7201177211177309977219977305577215FDB89A6BB896FE5CC7F5DCC08D0CE0266EE6166E652083B88DDBB9833B19CC10EEE26EEEE15EEEE37E1EE0411E6228C318CE0846F230A318CD233CCA633CCE133CC9533CCD338C612CCFF21CCF338EF14CE0055E64222FF1329398CC145EE1555E632AAF338D377893B7789B7798CEBBBCC70C66F23E1F308BD9CCE1433EE2633EE153E6328FCFF89CF92C60218BF8822FF98AAFF986C52C6129CBF896EFF89E1FF8919FF8995F58CEAFFC461EBFF3077FF2177FB38295AC22FF07724A528AD26CC0866C4419CA528EF254A0221B5389CA6C4215AA528D4DD98CEA6C4E0D6A528B2DA84D1DB6642BEAB235DBB02DDBB13D3BB023F5D8899DD9855DD98DDDD9833DD98BFAECCD3EEC4B03F6637F1AD28803684C139A722007D18CE6B4A025AD38984368CDA11CC6E11CC191B4A12DED388AF61CCD311CCB711CCF0974A02327721227D389533895CE9CC6E99CC1999CC5D974A12BE7702EDDE84E0F7A721EE7D38BDEF4A12F17702117713197702997713957702557D18FABB9866BE9CF755CCF0DDCC8006EE2666EE156063288DBB89D3BB893C10CE12EEEE61EEEE53EEEE7011EE42186328CE18C60240F338AD13CC2A33CC6E33CC1933CC5D33CC318C6F22CCFF13CE318CF045EE04526F2122F3389C94CE1155EE535A6F23AD3788337798BB77987E9BCCB7BCC6026EFF301B398CD1C3EE4233EE6133E652EF3F88CCF99CF0216B2882FF892AFF89A6F58CC1296B28C6FF98EEFF9811FF9899FF985E5FCCA6FE4F13B7FF0277FF1372B58C92AF27F18AF24A528CD066CC84694A12CE5284F052AB23195A8CC2654A12AD5D894CDA8CEE6D4A026B5D882DAD4614BB6A22E5BB30DDBB21DDBB3033B528F9DD8995DD895DDD89D3DD893BDA8CFDEECC3BE34603FF6A7218D3880C634A129077210CD684E0B5AD28A833984D61CCA611CCE111C491BDAD28EA368CFD11CC3B11CC7F19C40073A72222771329D388553E9CC699CCE199CC9599C4D17BA720EE7D28DEEF4A027E7713EBDE84D1FFA7201177211177309977219977305577215FDB89A6BB896FE5CC7F5DCC08D0CE0266EE6166E652083B88DDBB9833B19CC10EEE26EEEE15EEEE37E1EE0411E6228C318CE0846F230A318CD233CCA633CCE133CC9533CCD338C612CCFF21CCF338EF14CE0055E6462C5DCFE8CE347DAFB984FF894B9CCE3333E673E0B58C822BEE04BBEE26BBE61314B58CA32BEE53BBEE7077EE4277EE61796F32BBF91C7EFFCC19FFCC5DFAC6025ABC8FF41DCB225A675AAD334FF4701DC10941E9A7F694AF4FBE7BFF33F2050BA64D97F7E9AB762A9D12B06E77F44E09FCF01C77EC2B74CFE4787FEF9DA6615EA96985EA243A9FCCF7EB9722B62FF5BAF44ECD360F99F802DF9CFCFF19A711BD7FCE77F577F2D1E1E12121212121212121252BCA2A02FF49F25FAC642424242424242424242324CA85F434242424242424242D6A584FA352424242424242424645D4AA85F434242424242424242D6A584FA352424242424242424645D4AA85F434242424242424242D6A584FA352424242424242424645D4AA85F434242424242424242D6A584FA352424242424242424645D4AA85F434242424242424242D6A584FA352424242424242424645D4AA85FA3C9C48943E6CC9E24CB962D94BCBCE5B1C4FE18FB2B5F93EDDD080909090909090959EF13EAD74C13AB590B0AD6C489D5B2D9DEA59090909090909090F538A17E4D3F2AD124CBD63513AAD89090909090909090F412EAD7749249E55A9065CB16864F148484848484848484A49A50BFA69CE43F2D904C42091B12121212121212925242FD9A5AA22D5EF3C253D890909090909090901413EAD7D412C92707D62C61B3BDDB2121212121212121EB4D42FD9A72E23D828DFD6E81891387FCE7796AEC576B257E701B1EC18684848484848484249950BFA69C351FC126F9BB5D7D4D78041B12121212121212926142FD9A4E0A1EA6A6FAE9D504256C78041B12121212121212924C42FD9A4E6265687ABFC3355E091B7E236C48484848484848483209F56B9AC9E47169A85F4342424242424242D24EA85F8B2085FE2C57F8086C484848484848484832C945FD5AF003F8AB7F6C34F6D3FA49FEE4D37A96427F09D7BA52BFC6AE5AA157B3A82E65820E16C92E25D87EE61B2FE659F37217938B1E9279621DFB3FBF1D65BD9F9C8B643D0AE3683DCEEAE328C7D737C7EDC67EBD52A18DC6FE98E3A923D3FA75F553567018057FEB18FE735A0BCDB2CC7E877F821F8A4A3E999FEEE4ABA839A9D7AFF18E31A5DD4EA3DDD577A0D0B7AF99488E37C924B34B99F4AE643AF09A556CAAC7BBD643586BD6DC870C93E4C82D48864338674963AE88645E8E64FC4698FFD4AC890F7F1D2AAD0ADDFF82BFCDCD7AB47AB23A8E92DF6CBC443E6F1424C15147D5687158F7931F47B144D5B5723C3F17D436C9B7184BB60BD9E8EBD782DE9964B95390B40B9A22EFC7C974A6D53B50B1AA5F25ED3726C8EA87938DFA358D019C4613C96F7FF50BB14ED7AFA99ED8D553FC6B9D48E68ABCD4E7E5E253BFA6777DD7952AB6D02B15FBAB9CAD47B1E4601CA5B7F1D593BDFA35F1D145D2441AABD29A49BB5767D27A26A32997F373DA656B86ED269F6C3D7F4DEF98D33BCEA2AD5F533AD2D87C51ACEAD7B5CE26990CD4D8EE455EBFA6B74B29F5AE343A55DAF727A936B466A25A87225912B2B728669EA8EAD782234DB2471593FA35C3EB5BFC4BD835F739F7EBD1E25C8DA31C34915ED67AF89174A4A25AF733A920574F1A273F67F373AC72CDBCADD5938DD9232BCF5F733C4B16D57D587AE327C1F949A3AD6CD7AF99CF11F14642DAF56B26BB94FC8294DEF613D4EB79F1AF6F7A6DAD9ECC1F6944352947B53F594AB4F56B2C49AE0785BE379715E17A7F73B2B818AC47B91C47D9DE7EDA59EB1988A4171549FD1AED0492FCF9CF65BF8ABC722D48E4B347F4F56BE6497550AD07FD38AFB83E7F8DEA4633D576E325F3D39E4CBB690FE0D8C6533DDEF4DA5A3D19CE0BD14E8EB1A4FDEC2AABC946FD9A97C4F92FF2FA35C235A9185ED68244758CABA7A88A8C82D6E39DF0CC379E8DBB91648658247573EED7FD6C1476C9CC93B9EC57599A210B12EDEC511CEBD7BC14C755EEFB7136AE7151D5AF79F19F0B66B52BA73785E5E6597B861B5FB7EAD76C4C8E79C5F5116CF6BA74E24E55B4F56BE4475D6C4BD8680FB320493E62CFF138CA7CE3D9A85F939CA233EF4239FEBE6B96A68EB5CE93B9EF57D97BFE9AB8DD34928BFA75D91A3F833FF19FDFC290F8AAE4B863A5349C72BFDE67AF7E4DD06E82C38CDDBDFDA7F558E996E4C949A31F27B8D0FFE96389F72471D30946EF9AADACD98D635F9352A3F19A4B3E99AC438967AB82435EF35AC74E72BC3716CF12274B8B502C69B49B83B3B4D6432E74725E6BAFC8D2DE6698C4475AB0F3D9588F723F8E12349764B251BF2639FF67DE74246339F901B8D6E38AB72666384FE6BE5F253EB1B11613379A789F239CF4B25BBFC6AE6882B727983532EFDF59DAEC5AEF4EFE7369D7DA930A92A0D1785D2AA5AE10555DB5D646135CD664DA8D9778E7308D123CC121A4D1CA7F8E375EA3F1DE1E6F9B996F24ED56624972B0CC59E356211BEB6224496F1C253984131C7524E337BD24D8EDC49729F1282E9E9738C1D5C9CBE67A547CC6516EE68D78497C1E72B34B995C8278493CF6B3777D8BAA5FAD79BC6BDEF5AD35D92BED0A92C5FA35C9BD8C778532BFC52FF4F465A92C4E72E3098641E2E32D3EF56BF22730F1D84BE3FAA65717A6DA0DD26B65AD257BAAC79B9B8A27DE3E67727791F9C8CD5E323FABE90DE1A2AA5F138CC1240772843D24078977B0C91F6F7AEB51F119474578A7B438FE1293CB5DCAC6BA5FE8FEC70E2DD5A348E9FA1655BF5ABD17A5718C05C9520D56906CD5AF299DDF784B4286FDBBD06D66EF3E2CF9F9B1D08B5A54F56B5E9CCA2C9216132C9F698CC042B793DE2D6C36AAF668EBF5942E567A89FCD631D6B7D37B6F6E92D57194603B455555C4DBD5942E53AA075B8489B7AB595D8F8AD538CAC1BC912085363D27CE47B9B23457C4DB87B43798C6784F9C24AF6FD1F6ABD855CB708C67FBBA67AB7E4DB2F958B234B967A3F68F773F94D266537D0EBAB8383D7F4DFB7633A5E35D33999C81CC8F3AC9EB9BDEC3B94293838A275E672E8675495489EAAC4655E264FB5417DA685E44F37331BC57C9EAF1C6BB58C56A1C15554F4BDC74BCBFCAC66E44BEEE17D5F55D0FE6E742F7BFB8D7AF69F4956C5CA7A8F6AD2051CDE369DC221749FD1AD54450E89EE7B29E8B1DF8B2381F758FAA95580A7D7B2C496E21961C3C472974FB19DEE015F344B5BAC7DB4EBCB357245545AA3B9920EBCA521AD5F1A674B051351A498AF0F96BE2876D393B4BD1365484376F393B63D948BC87EED11E4256EAD73426B56C1C67E4F761A93E7449693BC5F0F96BBCE34DF51C46F24D844CCE40F26729F3F39CEDE7CD296D248DEDAF4337F76924C2A32E743BC5AA7E8DB77EA4B1A9084BE1AC26AA939CFCC116B77194ED7923D5760B4E5A1AAB5E7A8976DD2FAA9EBF2ECECF1393FB0544111E42B6FEFDB129254B5D24F26D46B51E14ABFA35C1FEC76B34B6B71996743978689D46323FCFF1B610D5F14635F88BF0394D1126C25521A565B24856A3425B4CBB6228746BC5BF7ECDF67A54DCC651B6E78D54DB2DF8829C0D81425B49BBA316D5F52DFEF373AC5A8D15AC6BAD59B37408C5BA7ECDB06747FEFC35AA0D16ABFA3571BBF14651C17BE7FCFB1DF9047B1249FD9A9BE92F9256E29DAB48F624A58D2448E22B1B6DA2DAE7CCF3BF53BF46DEE23A71C3B3E6EE657B3D2A6EE328DBF346BC24F34DB642772CF25BA068D7FD4816AFA8DACD5252DAAB58C19A765BD1CE7899D6AFB1E3593D69EC5F966E190BDD6626A325AA0DA6B1121455FD1AEF5D99677D7DFEBA38A2E7F4591A146BDD7E3612C90E479208ABBA42B7537CEAD7C8FB4FEE0F218DE47E3D2A6EE328DBF346A149B26FE4A6162C744F42FD9A20C9EC4C26356B4132A9BE0A4DA6F56BE689D7F59339AD8913F9F3D7A82E491A43A208EBD7786FCC30EBF1F3D7641E45E4664F122492F928C944B2C39124AAB39AEA768A49FD9AC9BABB4ED4AF9927D5F5A8B88DA322B94C493E5CC8CDBE45BBEE47329947D56E969260372646F76FAF8DBC785D5CE4F56B82C922F3A38D7CB3516D30C2FA35A5D6939C65E2ED40B4236A3D7EFE1A49E990EDE72839BBBFCFC15C9F7CA25A4153ED8DB9AF2AB2B1EE167A08D958968A2A69AC47C56D1C15C9F3D7E477B8D0AF8CB60B45DB44B4F781B10799ABA738F7ABA8F6217B534451D6AF89CF4EE6E3ED7FE1F96BE6F56B4A433136FC0ADD9354B31E3F7F8D64CA8BE48A2748A85F574FE6D7372FE1A52926F56B869D271BDB2C3E496F3D2A6EE328DBF346F22D167AC652BDF14B23D1F6D268EBD735F72DDEA68ABC5F25B8974B72B373D2FAF44E4A299AFA75AD655024832DF22D473530D218C3F13A53AAD567865B28D899CC4757AAEDE660E25B9CE5FA26A53D89B791A8CAC19CCD8FC5AABEC9FCFA26386F093692DE6250F084268D95A0D00D86FAB5D064B21E15B77194ED7923F9160BFDE21CDCC86572F6D64CB4EBCE9ADB29F2FA35DE9949753B69CF549924A7F56B92754F54232DF2D9B6D00DA6B1B769D49109D6BF0C97DE4CCE76EC82C666FF58E2ED64E6ED86E7AF0549693B696C3FDAE4723A5B6BD2BBBE05FD3CEDC38CEA6C27BF3CC47B7B32EF8D97C82790A24D24EB51711B47D99E37D64CA16D25E869512DA3296D3FED9E1FEF7CA6B1C1423795A5C79FC9A7D07EB5D6715124D5EA9AC951FDBAD61BDCB59ED03452E8C63399C1E35DD4547738DAFA35F9232AAAE5279276A3BD0F8E97E253BF26984132AC420A92F991AE9EDC5CA00C93A55561AD272DDA769725F1DB97D3DBCFC4596FEAD768D7A3684F7586E3E8FFB17707BBB2235B5A804F770323460C19F204F0003C00520B9E01249040082608E9BE483DC3BD43C647AAA7A8C3BC675B3A53A43D84ACF6256F766EDB190EC75A19E1F8AE3E5A4555EEB41D0EDBBF57AE74269C374A16B7B3F9D1278AE6DBBEFA86ADEA563B1BBEFAE29C79B575742CB1B59F92446C7E2DBCC17D1C9D8643D3BCFEBA75116A124DCEDCE5172E37FAC6774B93CBDED60854AC4FC552F2F3EBFE1E6F7298B49D0FCD0FB708CDF36BE1292B2237EF8C6D9369FCD5E8F935E87AD4D5719470DE78B4157476FE646B0D5B9D2B9A9F88B6B6F1E8601E9D276F9C57ABDBDBE1911E955F0FDDE0DE47A7EDD1B5BA949307C9D6CA1F7ADB8A1BD0FDB352E1C43AF3B76734390E2B6EF42BC4E5D7CF46FDAF75A377681115C748CEDE39AF618E3C74BE8AC8AF9FDB7B4A7E7D127A3DEAEA384A386FDC5527D1B6C9EC49DD2AEDD819D2F3FB6567ABDF38AF5A2D375AFBFCFABDEA414B11431351103A3F95B7C667FFE87D79FD7BB95D27EF7A970DAF18BD5677DB5BEF73747DEA96723EBF1E3D3BBFDCE34DEEF79A94162A4ECDEFD22A471E1DF9A0FCBAB526F2EB5DCEF5A89FE328E7BCB1A84EDBA1B7BB11D7FDADFD5B38983BB1617FE7BE6B5EADBEBE6E0C9703B0D5947BD238BFEEDFFC351C9412418B3BB32DD5F378EBACF438BF7796BE73522B9C584F9B7932ACEFAFEDAAD053DE5D3FF975E7A473741877567E7F42BEDCEAFD701074CE3AA3618E3C3481E3F2EBD6BC5A7D71C4DD7BCFF935ED7AD4CF719473DE58541462EEEFBCBA924DC240C43BEF4FA4FD377F3909EBFE36745E35B96A7F7F68D7093A4BB4CCAF876E737F6E3FB9B79588FBB08F82E9F814EF6EFFFCB82377066467A13B07FCCBA5EF2FBAE4E4B875DD5A76E2B2814F6BFBE3D5077647C3CDD6081C7A93EAA5E4E7D79D35F9FA2F7FAC7D15F4712F549CAAEEABBDFFCE3B7F78687B73B4CD91E57585BA795578EA583DA7552CEEA526133B4DF2F5A893E328EDBCB173492A59CFADAD2EF9DB8A773E7FDD3FBA7F4B76EEF2872797FBB7FFEB5FACEEC18FDD5ADBFE72F7CF39AB17FD65B9CBA25737FCE4C96755B3FCFAF224FBB4F187DEBCD5A297A59F5FE2A13363B99D25EE9C95CEAC4CE1C9B1FAFDB7ECEF85E68B5B94CCBABA9CF1646B426EBDFED056FCE98F7F3834E1173B03DE36D22DBACD34111B9B33AF7676FAEA68AFBE3222A2F5B9AFF3AF47F9C7D1A1B76A7EDED87AB7C2C13CF9E73BEF7074430A45ECDFCF82C3E72DE7E7512E0A6DF26BC94C3A7F83BBE5D058375987FCBDBB73FD3BB33225278B8AB3DE4BFB4B6CBEB8C57BF3EBCEFEADD88A8A9B968AADAE1671ABDD44C5FE5D0EB1FD524AC472CBDF64F57D22AA504195ADE6DE753D4A3E8E2ADEAAE17963F5C5E519656BACCA774AFE75FFE4A5F0E7DA23D24B46EC2DE7E788EB7EF3EB4283FCFA72707F8675EF16AEC0A356E7ACE653AA3ABF7ED44EB5C2734DF362F3CBC9D07671E5CBFD1821BFEEAFE78EFD4D68389FBB0DAF1FA7F7EFD681F6F2ACD2645EEDAC40617E3D5902A9DBF664EFBD1E651E4787DEAD7AF55657E37CFAFC38DD42F096EBFE9954B7750F5CB2DCB79C9F9B47D8E625D806F9756723A393EBE22DF3F8E8721FC7E468BED959D67D788FA6CC43BBA6E13C2E5968AB65552CBAFFFC7A5F93A3D3AFE433A393F72A39C7FB19E7F7EFD6B110BDDCFDF7F97A5AAB38C9D42DBAB73DDEC3F528E7383AF49E6DCF1B5B1B78FE3C59FE26EFBAEE9FA916D5D55F176F393F37BCF4FF08F8E18306F9756B4CD3EECB0F0D71DBB53A3AA596A5575C024B2E1EE5E350771EDFBA7D6CBED0EA45EC7B6F7EFD6CD4FFFAB4B687F648C956549FB07AABC3AD6AB27F57C77C7FF31B86BFC2C1DF5AE2D1C5DD9D4C1B69DE7E3D5A241C4787DEF6F10FCF9F37565F76F4EE686B8A16BECF40D7FDFB169DC9AF8BFCF3F35B7273A1B3F9F5E414BCBFC9CFBF6F0D7954BEC1EFBA0F7B5C81973BF8718B2A4A2385D7BF9235393902DF0FFE86CDB26987A6EFA1372FF7DEFCBAB37F4F6E45F9F9A570D72FBBB8F03D7FC63F48A4A1B8FD9B965F0BD3F3D612AB7756C55D77BE1EAE478FEF137A1C95BCED5DC3F3C6D64CA8985A5B2B50F2B7A35CF71F17FDF5F58766E67DB9F9E7E7F2D9F2B4E88A03A75C547E3D7F3D287F87B7CFE3FB6A2CB3EABE9B977FFEBA0BE3F2EBD135396359CAD382EECB3AB3B892FD58A16465E2E6F3CEFE3DB4153B6BFE7577DC7744DDB4FF3A919EDE33F4DC14E12DFBB7D57217AB5791D5FDBBBAC4EA13E0EABB555C7D43F5703DFA2AE8385ADDD22DFBEB76E8BCB13A03EB866875A83FCB6669B7D7FD65005777EBD7A13B7304BDE5FC5C78DDCFB9349CCDAF5BF3AF70F13B6F32DCA591500D1300D38ACB37FB27BD86B377F57D562FCF5BEB59B1D0ADF58F8B05755C8F601E51F5D7C2C52FCA2B0A4CABC99589C98D9E5F0FE5C833C5AD270D4B6EA15C8F601E51F5D7F2F39ABA1A25CC13CE6B328B56F34D4EFFC0D1F3EDEA8B3F0FE6B9AD95EFAD79E0C3F5086612557F2DBF5B6DF821D757CB9B7CFDBF0C47FD95F3CEA793AD7998905FB7DE64E728A85BDB275B0BEDF05CDAF9F5881CAEFB9368F0FCAC3367B7AD93C5F9F3C5D6075ECE44835217E1BC93B368E77CB59F90E272F3E76E18DD89BC85916EE7445AF2E7F9B6D6F6BDD72372B8EE4F25F0F9AF2F67CCCEC9E2F374BF51F595863EA9BF725E458EFC5EF0FBB1FBEF50B7DCC745EF2CF7E59BD405DF65E923A6813EAF47E470DD9F4AECEF6F7DAE3D48A2E462F0A9FECA3FA4FECA793BF5C8335E7E1C1FB4DC92457FBC7AD0D2D7F3F3CBD0DC61E7EB5D9FD72372B8EE4FA5417EFD38FEE3A5254ECE36F76117A3FECA794139F2E5C92A2EBF969C279B2FBDF328D0E1F5881CAEFB5369935F23CECEEAAF3C527FE5BC883355C975F15DB9F9EE651342C442DFA5C3EB11395CF7A7D226BF7E9C3B3FAEFEADFE571EA9BF725EF364537832E921513589B0A38480DEAE47E470DD9F4AB3FCFA517BCA58BA91BEFE7BF5571E6D2580E8E572256D7364F999A4ED72ABAFC42723EC5867CEAEAE47E470DD9F4ACBFCFAF1EA2BABAB278BE5AF9ACF36F76117B3B5439D9528D72447DE4E7147675DABFCFAF4DDA30A474FD18B8A4DEE413FD72372B8EE4FA5717E5DFC28F83AE7E30951FD9597D45F39AF2247DECE24CB97D6CF64C7EAE59E5FF4AA9253F47D35463F61F6703D2287EBFE5442F2EBE2FBFF7F2EC9E27E9A687E2E06E0A8E5147D3F4BDF4FD1F7D01CBD02995C8FE06202F32B00003427BF02003012F915008091C8AF00008C447E05006024F22B000023915F01001889FC0A00C048E45700004622BF02003012F915008091C8AF00008C447E05006024F22B000023915F01001889FC0A00C048E45700004622BF02003012F915008091C8AF00008C447E05006024F22B000023915F01001889FC0A00C048E45700004622BF02003012F915008091C8AF00008C447E05006024F22B000023915F01001889FC0A00C048E45700004622BF02003012F915008091C8AF00008C447E05006024F22B000023915F01001889FC0A00C048E45700004622BF02003012F915008091C8AF00008C447E05006024F22B000023915F01001889FC0A00C048E45700004622BF02003012F915008091C8AF00008C447E05006024F22B000023915F01001889FC0A00C048E45700004622BF02003012F915008091C8AF00008C447E05006024F22B000023915F01001889FC0A00C048E45700004622BF02003012F915008091C8AF00008C447E05006024F22B000023915F01001889FC0A00C048E45700004622BF02003012F915008091C8AF00008C447E05006024F22B000023915F01001889FC0A00C048E45700004622BF02003012F915008091C8AF00008C447E05006024F22B000023915F01001889FC0A00C048E45700004622BF02003012F915008091C8AF00008C447E05006024F22B000023915F01001889FC0A00C048E45700004622BF02003012F915008091C8AF00008C447E05006024F22B000023915F01001889FC0A00C048E45700004622BF02003012F915008091C8AF00008C447E05006024F22B000023915F01001889FC0A00C048E45700004622BF02003012F915008091C8AF00008C447E05006024F22B4094EFDF7FB9895E0AC06CE45780103F7EFBF5F3F3FFDCDCFE217A590053915F011ABB27D747522C402BF22B4033DFBFFFF2F3E7DF7D0DAF8BDB7FD24E00709EFC0AD0C07E729562011A925F01CE5A6D18D8A79D00A09AFC0A50AF22B94AB10027C9AF0035CA1B06F6692700384A7E0538A655727DF4E3B75FA5588042F22BC001271B065EA6D8E8F507B800F915A0C82D5C362FBB7EA59D00E025F915E0858886817D522CC00EF91560D32D4486360CECD34E00B04A7E0558F7C6E4FA488A057822BF023CCB6F18D8A79D00E091FC0AF017BD25D747522CC0427E05F8B34E1A06F6692700905F01C648AE773F7FFE9D140BCC4C7E05A616D730708F9841E1583B01302DF91598545C72FD9A2C3397057079F22B30A3B7D444136ABD0033905F81B9C4B5BA1686C8B8E82CC50293905F815984963F8F7E88AF2916A09AFC0A5C5F9FEDA75DE5698081C8AFC0C575FE79FDED4D34C5021C22BF0297F5F656D71E56552116B81EF915B8A0119F57E5195B0085E457E06A864E819EB105F092FC0A5CC7400D03FB2EB3210011E457E00A2EF92D28CFD8025825BF0263BB76DBA8A65880AFE4576054B7F835498552532CC023F91518D2841DA29A620116F22B3098998B91F3949C0176C8AFC03034832EFCF02C3039F9151843E73F039BCF0FCF02D3925F81DEE9FBDCA19D009890FC0AF44BC340094DB1C06CE457A04792EB519EB105CC437E05BAA361A09AA1036620BF021D11BF9AD04E005C9BFC0A7441C3405BC613B830F9157833492B8EA658E092E457E09D340C24F0E85CE062E457E03D24D7649A6281CB905F816C1A06DEC5C803D720BF0279429FB4AFEC5A48532C303AF91548A261A02B6E248071C9AF40381F5BF7C90FCF0283925F8140926BFF42DB09EC232082FC0A44D13030103B0B1888FC0AB4270C0D2A6EC729C4020DC9AF404B1A0646670F02FD935F816654EF2EC333B6809EC9AF40031A062EC96E05FA24BF02A728D45D9B676C011D925F814A1A25E7615F035D915F811A5A5D27A4D60E74427E058ED11339391300783BF91528E54364169A6281F7925F81D72457BEF2C3B3C0BBC8AFC00B3E2F6687E901E4935F814DB700E1FB3A94D04E0064925F81151A0638CA9C01D2C8AFC033B534AA79C61690407E05FE422F234D98484028F915F89DB219CD29E40341E457989DB645E2985D4004F915A6A6424602D57DA02DF91526A543916471374BA61CCC467E85E9F8D924DEC50FCF024DC8AF3011CD88F4C03C044E925F6116EA5E74C5AFBB01D5E457B83EADAE744B532C50417E852BD3EA4AFFB4130047C9AF705932010371AF0594935FE182340C302853172821BFC2A5F84E0C171097621562E11AE457B8084D845C89F90CEC905F61789E09CF55F9E1596095FC0A63D32FC8E599E4C013F91546A534C53C7CC8003C925F613C5A039993990F2CE457188CAF6633390FD900E45718862E40B87338C0CCE45718809F268255DA09604EF22B744DC31FEC73770713925FA15F715FB8F6092917A39D00A622BF428F5C8CA182676CC124E457E88B860138C3110433905FA117AEBBD08A5FF7806B935FA10B1A06A03987155C95FC0A6FE661EC104A532C5C8FFC0A6FA361007238D6E062E457780F35214816FA5987E30E32C9AF904D4F1EBC9103102E407E853C7E28087A703B587C000243935F2183F63BE88DA312C625BF42064F18803EC51562A3D71C6626BF4286E6F9557285869AA758F91542C9AF90A1617EF5D1244468DB4E20BF4228F9153234B92E4AAE10AD558A955F2194FC0A19CE5F11350C409AF3ED04F22B84925F21C399FC2AB942BE93CFD8925F2194FC0A19EAF2AB860178AFEA7602F91542C9AF90A1E21228B942272A7E78567E8550F22B643874F1D330001D3AD44E20BF4228F915321CCAAFD12B0354F8FEFD17F9153A21BF428643F955E700F4497E854EC8AF9041FD1546A7FE0AFD905F2183FA2B5C80FC0A9D905F2183FA2B8C4EFD15FA21BF4206F5D7CBBBEDB56AD1EB462BF22B74427E850CEAAF9754FD70FBAF6EEFE3B9699D537F857EC8AF9041FDF5621A26D727526CCFCAF7A3FC0AA1E457C8A0FE7A2587EA7015FC6E709FD45FA11FF22B64507FBD8CE8F0BA907EFA640F4227E457C8A0FE7A19E5FBF1248D04BD517F857EC8AF9041FDF51A827A5EB79809BD29DF77F22B84925F2183FAEB05E4740E3C5282ED8AFA2BF4437E850CEAAF17704B935B49E5B6CBFEF4C73FD4B9FDEDD63B97BBADC3F204AE3BB328C2A13D12BD323033F91532A8BF5EC0EA4EBCFDCBEAE4FA9462CB6748B925D4CAB24DA8BF423FE457C8A0FE7A01AB3BF1960E9BE4D79BD0E65ABF8FD0C4A1018F5E199899FC0A19D45F2F6075679DE91C7872BE8BA084145B4DFD15FA21BF4206F5D70B58DD890DF36BE6C30DA4D83AE5232CBF4228F91532A8BF5EC088FDAF3B96AF9D450FDA95A8BF423FE457C8A0FE7A013D3F7FA09A42EC21E5032BBF4228F91532A8BF5E40CFCF7FBDADDB627978D6A1F9266915527F857EC8AF9041FDF51A325B543F4FCF8425CE96ACB35E8242E5FB4E7E8550F22B64507FBD86CC126CC34FF66FABFD72068AB02FA9BF423FE457C8A0FE7A1939113622FDBCECB215B95E7AEF1E04EEE457C8A0FE7A25D1113634FAEC4F45A96B87FA2BF4437E850CEAAF1753F2897C9D840702EC17624DBF1DE5FB517E8550F22B64507FBDA48629F667EEEFBBEE971245D855EAAFD00FF91532A8BF5EDEFD095615A2D76DD54E1AF350D82DE547B1FC0AA1E457C8A0FE4A87761A09DC447DA5FE0AFD905F2183FA2B7DDA9A994AB0ABCA8F62F91542C9AF9041FD953EEDD414A3173D1CF557E887FC0A19D45FE9D656178112EC57E547B1FC0AA1E457C8A0FE4ACF24B012EAAFD00FF91532A8BFD2B3AD12ACA9F8A4FC28965F2194FC0A19D45FE9D95665510BC123F557E887FC0A19D45FE9DCEA54945F9F941FC5F22B84925F2183FA2B9D5B6D2110C21EA9BF423FE457C8A0FE4AE7B6C259F472C7527E14CBAF104A7E850CEAAFF46F7536BA9BBA537F857EC8AF9041FD95FEADCE462DB08FCA8F62F91542C9AF9041FD95FEADCE52F9F54EFD15FA21BF4206F5D7336E03B2885ED0E456BFC225BF3E2A3F8AE5570825BF4206F5D70AB7C0FA75DC6EFFE696A864D9085BB3D4682FD45FA11FF22B64507F3D6435B93E51176C68EBF7B7EE6EBBC3B4FC507F856EC8AF9041FDB55C79954B4438AFE456E16EF208ABFE0AFD905F2183FA6BA14311414A38EFD0CC9C7C727EA8BF4237E457C8A0FE5AA87C940485F38E86D7C5B41156FD15FA21BF4206F5D7122FBB308D5843474BDD7733771E978F92FC0AA1E457C8A0FE5AA27C889EC80A15EA8AAF8BE875EB93FA2BF4437E850CEAAF3B6EDBFBE3B75FB78668F9E6FB9FFEF887E5655B8316BD9217B313C596C7932D03BEB353E67C8AD9D6A0AD0E51F4CAC0CCE457C8A0FEBAEAE597DF6FFFF516A41E6D052F2D0487EC0CE3D380BFDC41F38CBCFA2BF4437E850CEAAF4F0A1FDBF4E3B75F9FE2D456A2F238D843562BD95FEF16766E189EFE709214FB72281EC7247A656066F22B64507F7D54FE3DADAFE5C01B3F737ADED618D6E5D7497681FA2BF4437E850CEAAF774787427E8D10915F3F27086D86023A21BF4206F5D7C5D1EFBCCBAF4182F2EBE7A5739B280FFD905F2183FAEB47D5039BE4D72071F9F5F3D2D1CD204027E457C8A0FE5AF7DB04F26B90D0FC7AD5DDA1FE0AFD905F21C3E4F5D7FDF0BA7C7B7D6B28E4D708E7F3EBCB27485C728FEC6CEF13F91542C9AF9061E6FAEB7ED5EA9E9956FFABFC1AE47C7EDDD9178FBB2F7A4332A9BF423FE457C83073FD7567DB1FE3E9CB17C8AF0DB5CAAF3B2FF8BC6286DBDAD219B61DBA22BF428669EBAF3BE1E6292DADBE467E0DD230BFEE47D82BDD8CA9BF423FE457C8306DFD756BC3BF46A5ADA1905F23B4CDAF5B3BE5F372316E751B67D870E88DFC0A19E6ACBF6E459F9F6BBF53BAFA4AF93548F3FCFAA78DDFF55D7662F4E6E4507F857EC8AF9061CEFAEB4EA0915FDF2B22BFEEDCAE446F4E9AD50DBCFC564387E457C83061FD752BCDAC8624F93559447EDDDA35CB7E8CDEA204EAAFD00FF915324C587FDD8A32ABB9477E4D16945FB7F6E365F6CEEAD6AD925F2194FC0A1926ACBF6E5DD4E5D71EC4E5D7ADA91EBD4509D45FA11FF22B6498ADFEBA75A55FCDA3F26BBEB8FCBAB3EBA3372AC1EAA6AD925F2194FC0A1966ABBF1E6D1E905F93C5E5D7AD5D79811DA4FE0AFD905F21C36CF5D7D5EDDDFAE696FC9A2F34BFAEBEF935F2DCEA50AC925F2194FC0A1966ABBFAE6ED74EF380FC9A2C34BF6EFD49F44645537F857EC8AF9061AAFA6B45E2915F9385E6D79DBD19BD5DD156B76B95FC0AA1E457C83055FD75EBE363F9B51FD1F975AB81247ABB42A9BF423FE457C83055FD557EED9FFC5A67752856C9AF104A7E850CEAAFFB5FDE925F9345E7D74BEE23F557E887FC0A19A6AABF563C7C407E4DF696FC7A8148B73A14ABE4570825BF4286A9EAAFAB1BBBFFF001F93559747E5DFDABD1239DFA2BF4437E850CEAAFF26B57E4D73AAB43B14A7E8550F22B6498AAFEBABA51F26B57DE925F3F079FDBEAAFD00FF915324C557FDDDA28F9B51FF26B9DD58D5A25BF4228F91532A8BFCAAF5D915F2BA8BF423FE457C8A0FE2ABF76457EADB3BA51ABE4570825BF4206CF1F905FBBE2FB5B15D45FA11FF22B64F0FC81D56C24BFBE4B747E5D7D7FCF1F005A915F2183FAABFCDA15F9B582FA2BF4437E850C53D55FB7B28BFCDA8FE8FCBA750F13BD5DD156876295FC0AA1E457C83055FD75351B7DBE4A3CAB7F22BF0689CEAFAB7F32FA3E527F857EC8AF9061AAFAEBD6657EFF2B5CE57F22BF9E179A5F772640F476455BDDAE55F22B84925F21C354F5D78FAA476895FF89FC7ADE5BF26BF44645537F857EC8AF9061AAFAEB47D557B8B686427E8D109A5FAFFAF0810FF557E886FC0A1966ABBF56B4C0AEBE5E7E0D129A5F575F7F811DA4FE0AFD905F21C36CF5D78A16D8F2D7CBAFE7C5E5D70B37BF7EA8BF4237E457C8305BFDF563E34ABFD342B0FA7AF935485C7EDD9AEAD15B9440FD15FA21BF4286D9EAAF1FC75B08B686427E8D10945FB75E7C99BDB3BA75ABE4570825BF428609EBAF3B51467E7DBBA0FCBA35CFAF714BA6FE0AFD905F21C384F5D78FEDAD5E4DA5E5AF945FCF8BC8AF5BAFBC52925BDDC0CB6F3574487E850C13D65F3FB65B08567F4B76F595F26B9088FC7AEDE2EB87FA2BF4447E850C73D65F3FB637FC6B54DA1A0AF93542F3FCBA73AF12BD2D9956B771860D87DEC8AF9061CEFAEBC76EC9EA299B96BC467E6DA56D7EDD0AAFCB1E8CDE9634EAAFD00FF915324C5B7FFDD8DDF6C778FAF205F26B430DF3EB4EAABB5E86DBDAD219B61DBA22BF428669EBAF1FAFAA56F7CCB4FA5FE5D720ADF2EB4EE575D97DD11B9249FD15FA21BF428699EBAF1FDB5FE4BA5FE9B79281FC1AE47C7EBDFDFBFD597DC93DB2B3BD4FE4570825BF428699EBAF8BFD08BB457E0D723EBFEEBBE4EE507F857EC8AF9061F2FAEBE2D020DC87427E8D109A5F2F1CDD0C0274427E850CEAAF8BA311567E0D12975F2F9CDBD45FA11FF22B64507FBD3B3A14F26B84A0FC7AF9D06628A013F22B64507F7D54DE0B2BBF0689C8AF97DF05A23CF4437E850CEAAF4F5E7E7BFD3E145F13D5EA1FCAAF87ACE6D79F6BBFEB5B72B3B13C41227A9D7BF072281EC7247A656066F22B64507F5DF532C57E4D543B8F738A5EDB2B297F60D9CB1D34CFC8ABBF423FE457C8A0FEBAE3B6BD3F7EFB756B889684B424D79D5AA0FC7AC84E14BB0DF27DC07776CAF2B2E8F5ECCDD6A0AD0E51F4CAC0CCE457C8A0FE5AA27C889EC80A158E3E0BE251F4BAF549FD15FA21BF4206F5D71275BF7130F3889D71F4C1587733B71A978F92FC0AA1E457C8A0FE5AA8A228E89B5BD52A6E18668E65EAAFD00FF91532A8BF163A5A1494124E3A7AC33079A9DBCC844EC8AF9041FDB55C79841511CE2B7C90D962F2F0AAFE0AFD905F2183FAEB2125A14ADB40432F1B09A67A4ED68E92E3F73E62D12B0333935F2183FA6B85AD142B4B45D82A2E1AED3BF557E887FC0A19D45FEB6C2586E8E5CEC96C7CA9FC28965F2194FC0A19D45FEB6CE557A1AA3943FD92FA2BF4437E850CEAAFD50C510EA5EE12E547B1FC0AA1E457C8A0FE5A6D75E87C79ABB9D5AF7009618FD45FA11FF22B64507FAD26BFE6905F4B941FC5860E42C9AF9041FDB59A5C95C37DC24BEAAFD00FF91532A8BF56F3BDA2045B832CBF3E293F8AE5570825BF4206F5D76AF26B025FDE2AA1FE0AFD905F2183FAEB19ABA3A434D890268D42E547B1D18350F22B64507F3D43BA8AA6F9B584FA2BF4437E850CEAAF676821086578CB951FC5F22B84925F2183FAEB19BE5D146AB5BC6D1E7EA5FE0AFD905F2183FAEB49AB03282234616CCB951FC5061042C9AF9041FDF5A4AD1AA1AC7F92DA7639F557E887FC0A19D45F4F12B382681E38A4FC28965F2194FC0A19D45FCFDB1AC3E8E55E9BEC554EFD15FA21BF4206F5D7F3B62A854AB0D50CE951E547B1FC0AA1E457C8A0FEDA84A0D09692F621EAAFD00FF91532A8BF36E15B5C0D6929AE507E14CBAF104A7E850CEAAF4D6C452E59A182E2EB51EAAFD00FF91532A8BFB6B2359206ED109DAF75CA8F62F91542C9AF9041FDB51525D826DC0654507F857EC8AF9041FDB5A1ADC1543B2CA4F85AADFC28965F2194FC0A19D45F1BDA2983452FFA1AB646CF8DD33EF557E887FC0A19D45FDBDA1A4FA1E125D5EB33CA8F62531142C9AF9041FDB5B9ADD193C3766C750E987525D45FA11FF22B64507F6D4E143B6A277E09FD85CA8F62F91542C9AF9041FD35822E82430CD749EAAFD00FF91532A8BF4650502CB753AE36DFCA951FC5F22B84925F2183FA6B10B1ACC4CE2809FAE5D45FA11FF22B64507F8DB333B646F2633775C95847951FC5C61642C9AF9041FD35CE7E556CF2086B701A527F857EC8AF9041FD35D4CEE7E3B7919F763C6F1BBE33F1740E54283F8AE5570825BF4206F5D76822EC13E1B539F557E887FC0A19D45F13EC0CF28461C26844283F8A0D3284925F2183FA6B0EA1EDE355E555AEAAA6FE0AFD905F2183FA6B8EFD84314323C17E7835BB4E2A3F8AE5570825BF4206F5D7342F8B64170E70336F7B02F557E887FC0A19D45F33BDCC1997FCF6D2CE37D83EE77E0E43438587F032E0D12B0333935F2183FA6BB29711F662F1627F8209AF4DA8BF423FE457C8A0FE9AAF24C25E60A85F36BC9A510D951CBFF7D915BD323033F91532A8BFBE4549C16CE85E82FD9E814F29AA29F557E887FC0A19D45FDFA5A43C396221B670BBA257633625C7AFC18704F22B64507F7DAF92F11F25C59624D74FBFB01540FD15FA21BF4206F5D7B77BF951FBE2F6B26EC7FFB662855B610A052919FC85FC0AA1E457C8A0FEDA83F2FA596FB5D8C29A6B876B7E25EAAFD00FF91532A8BFF6A37C5FDC5EF9F64FE16F2B50BEC27A06A215EE8865F244AF0CCC4C7E850CEAAF5D3954485BB248F24D4579C1F55D6B3821F557E887FC0A19D45F7B53DE4BFA68E98E0DDA41CB3BD7AD55C4FAF055F94E915F2194FC0A19D45FFB74B4CCF9984E6EA9F1FC97BD96C07AA849E091E49A49FD15FA21BF4206F5D79E55A7D8BBDB9FDF13ED126AEF95DABBFB7F5DD2EAF9259A27F90EEDA0E8958199C9AF9041FDB57FE7536C0EC9F55DD45FA11FF22B64507F1D455D076A8E9E9F4D3B89F29D25BF4228F91532A8BF8EA5AB14BB742648AE6FA7FE0AFD905F2183FAEBA0DE1864C5D60E1DDA7DD12B0333935F2183FAEBE896209BD020DBE4B10644507F857EC8AF9041FDF54A4E3EF4EA49AB477191E0D06E8D5E199899FC0A19D45F2FECF1F158CB83B19E1E8F75FF378F0FD8925687A3FE0AFD905F2183FA2B5C80FC0A9D905F2183FA2B8C4EFD15FA21BF428643F9D58F8242870E3D89427E8550F22B64A8F8A28F2E02E844C56FB3C9AF104A7E850C755F54FFE99742E1ADAA7F55587E8550F22B6438F3A025ED04F016677EBA427E8550F22B6438FFA0502916D29CFFD135F91542C9AF90A1D583EEB51340A8EA8681AF476BF4AAC2CCE457C8D0E48A78BF2E4AB1D05CABE47A3F4EA357186626BF428686D7C585760268E87CC3C013F91542C9AF90A1797E5D2E90522C9CD43CB9DE0FCFE8358799C9AF90A1ED47934F9749ED0450C15109E3925F214FDCF5F2C76FBFBA5E42A1DBC112577675244202F915B2055D383F35C5420107205C80FC0A6FA0FC03F97C00029721BFC2DB68BF831C8E35B818F915DEECC76FBFC6D584A2571EFAE7B30EB81EF915BA107789956299965657B82AF9157AE1234E6825B4D5357AE58197E457E88B140B6738826006F22BF4C8E79E5041AB2B4C427E857E698A85426EF9602AF22B74CD87A1B0CF535D6142F22B0CC0151A56B9BB8339C9AF300C9F90C29DC3016626BFC248E27E78F646C18921F8C90F407E85F1688A654E663EB0905F61549ED0CE3CE23E79905C6144F22B8C4D1720976792034FE457189ED21457E543066095FC0A17A135902B319F811DF22B5C8AAF6673011EB201EC935FE182FCF02C83D2EA0A94905FE1B27CFCCA40FCC81C504E7E852B9309E89F5657E028F915AECF67B2744BAF0B50417E855978C6165DF15D43A09AFC0A13F1412D3D300F8193E457988EA658DEC8E700C079F22B4C4A532CC94C39A015F915A6A61846023F030BB425BFC2EC342312C7EC0222C8AFC0EF54C8684E751F0822BF027FA14391264C242094FC0AFC03DFBFFFA26C4635857C2081FC0AACD0B6C851E60C90467E0536F985240AA9D90399E457E005BF50CF8E5BBE8C981E9F6E72806DF22BF09A8F86F9CA0FB901EF22BF02A5A45816BEE407BC97FC0A1CE3D14893330180B7935F811A712146F9AD5B9E8D0574427E052A692798877D0D74457E054E5193BB3CADAE406FE457A0013D919764B7027D925F8136E2BE93FEA929369DB23AD033F9156849A3E4E8EC41A07FF22BD09ECF9D07A5820E0C417E054284B61348B1CDD959C040E45720900FA3FBE7676081E1C8AF40B85B8E91623BE467608141C9AF40129F5077252EB9DA1D4034F915C8135AF0139B0A793616303AF915C8A629F65D8C3C700DF22BF01EDA09926975052E437E05DE498A4D6090818B915F8137F3A1761CADAEC025C9AF4017A4D8B68C277061F22BD0119F7437A1D515B836F915E88E676C55730300CC407E057AE4E3EFA3B4BA02F3905F817E49B125FC0C2C301BF915E89DCFC47748AEC084E45760007E78F6ABDB6A6B1800E624BF02C3D04EB0086D75557605FA27BF028399F98B4A5A5D013EE45760501336C5EA030658C8AFC0A8E629467A3616C023F91518DBB59B62B5FC027C25BF025770C92FE36B75055825BF02D771990E51ADAE003BE457E06A86FEC05DAB2BC04BF22B704123B68D6A75052824BF029735D0A7F071AB2AB902D723BF0217D7F90FCFFA195880A3E457E0FAFAFC68DECFC002D4915F81597495173D1B0BA09AFC0ACCE5ED4DB19DF73300F44F7E0566F496F2A76763013421BF0293CA6C8AF56C2C8086E457606A093551ADAE006DC9AF00814DB141340C0033935F01FE6C88142BB902C8AF007F11D74E709E86018085FC0AF0ACB7142BB9023C925F01D675D24EA06100E089FC0AB0E9FBF75FDE986225578055F22BC00BF9ED041A060076C8AF00457EFCF66B428A955C015E925F010E086D27D0300050427E053826A29DE0965C955D010AC9AF00355AA5580D030047C9AF00F54EB613681800A820BF029C5591622557806AF22B4003E5ED041A06004E925F019AD94FB1922B4013F22B4063ABED041A06005A915F01DA7BFCE159C915A02DF91520CA2DC56A1800684E7E05006024F22B000023915F01001889FC0A00C048E45700004622BF02003012F915008091C8AF00008C447E05006024F22B000023915F01001889FC0A00C0489E32EBA3968B01008026E45700004622BF02003012F915008091C8AF00008C447E05006024F22B000023D9CBAF7FF36DE4FFFDCDB77FF7ED3F7CFB2FDFFECDB7FFF6ED3F7DFBEFAFFFE0E97FFFECDB5FFFFD08FCE3DBFFBB8DD2FF7DF5FADFFFF7FBEBFFC99FFFF9AF6ECBFFAFDFFEE3B77FF5ED5F7EFBB7DFFEFDB7FFF1ED3F7FFB9FB7FF7FE9FFFEF9B7BFFEABDF97FBFBFB952EFF7FFFD36FDFFED1BFFE7FECDD059415E5FF3F70FE844D372A2A2A20228A01A858082A4A1AA008582016697777177617D8D88A6277077661A2D8A26BFB7FF9BBE7B7670FDC3B7BEFDC99BB177E0FE7FD3A47BFEC9DE79999273E33EEEEB7F5FFFC73D5F6FB6A7D74ADB1FFD38FB179F6A1ADF3FFAFDDFFFD53FD27B45D2B73BD92FA5368FB55FFFCBFFAB56AD5A60E75A9C7222CCA622CCE122CC952D4A7010D6944639AD0946634A7052D69456BDAB034CBB02C6D598EE5598176ACC84AAC4C7B3AD09155E8C4AA746635BAB03A6BD09535598BB559876E74A707EBB21EEBD3930DD8908DD8984DE8C5A6F4A60F9BB1395BD0972DD98A7EF467000319C460B6661BB6653B863094EDD98161ECC8704630929DD8995DD895DD18C56876670C7BB0277BB137FB3096718C67021399C4BEECC7FE1CC0811CC4C11CC2A11CC6E11CC1911CC5D11CC3B11CC7F19CC0899CC4C99CC2A99CC6E99CC1999CC5D99CC3B99CC7F94CE6022EE4222EE6122EE5322EE70AAEE42AAEE61AAEE53AAEE706A630951BB9899BB9855BB98DDB99C61DDCC95DDCCD3DDCCB7DDCCF034CE7411E62060FF3088FF2188FF3044FF2144FF30CCFF21CCFF3022FF2122FF30AAFF21AAFF306337993B7789B777897F7789F0FF8908FF898597CC2A77CC6E77CC197CCE62BBE660EDFF02DDFF13D3FF0233FF13373F9855FA9E0377EE70FFEE42FFEE61FFEA55603F39FDAD4A12EF5588445598CC5598225598AFA34A0218D684C139AD28CE6B4A025AD684D1B96661996A52DCBB13C2BD08E15598995694F073AB20A9D5895CEAC461756670DBAB2266BB136EBD08DEEF4605DD6637D7AB2011BB2111BB309BDD894DEF4613336670BFAB2255BD18FFE0C60208318CCD66CC3B66CC71086B23D3B308C1D19CE0846B2133BB30BBBB21BA318CDEE8C610FF6642FF6661FC6328EF14C602293D897FDD89F033890833898433894C3389C233892A3389A633896E3389E133891933899533895D3389D333893B3389B733897F3389FC95CC0855CC4C55CC2A55CC6E55CC1955CC5D55CC3B55CC7F5DCC014A67223377133B7702BB7713BD3B8833BB98BBBB9877BB98FFB7980E93CC843CCE0611EE1511EE3719EE0499EE2699EE1599EE3795EE0455EE2655EE1555EE375DE60266FF2166FF30EEFF21EEFF3011FF2111F338B4FF894CFF89C2FF892D97CC5D7CCE11BBEE53BBEE7077EE4277E662EBFF02B15FCC6EFFCC19FFCC5DFFCC3BFD46A68FE539B3AD4A51E8BB0288BB1384BB0244B519F0634A4118D6942539AD19C16B4A415AD69C3D22CC3B2B46539966705DAB1222BB132EDE9404756A113ABD299D5E8C2EAAC4157D6642DD6661DBAD19D1EACCB7AAC4F4F36604336626336A1179BD29B3E6CC6E66C415FB6642BFAD19F010C641083D99A6DD896ED18C250B6670786B123C319C148766267766157766314A3D99D31ECC19EECC5DEECC358C6319E094C6412FBB21FFB730007721007730887721887730447721447730CC7721CC7730227721227730AA7721AA7730667721667730EE7721EE733990BB8908BB8984BB894CBB89C2BB892ABB89A6BB896EBB89E1B98C2546EE4266EE6166EE5366E671A777027777137F7702FF7713F0F309D077988193CCC233CCA633CCE133CC9533CCD333CCB733CCF0BBCC84BBCCC2BBCCA6BBCCE1BCCE44DDEE26DDEE15DDEE37D3EE0433EE26366F1099FF2199FF3055F329BAFF89A397CC3B77CC7F7FCC08FFCC4CFCCE5177EA582DFF89D3FF893BFF89B7FF8975A8DCC7F6A5387BAD46311166531166709966429EAD3808634A2314D684A339AD38296B4A2356D589A655896B62CC7F2AC403B56642556A63D1DE8C82A7462553AB31A5D589D35E8CA9AACC5DAAC4337BAD38375598FF5E9C9066CC8466CCC26F462537AD387CDD89C2DE8CB966C453FFA3380810C62305BB30DDBB21D4318CAF6ECC0307664382318C94EECCC2EECCA6E8C6234BB33863DD893BDD89B7D18CB38C63381894C625FF6637F0EE0400EE2600EE1500EE3708EE0488EE2688EE1588EE3784EE0444EE2644EE1544EE374CEE04CCEE26CCEE15CCEE37C26730117721117730997721997730557721557730DD7721DD773035398CA8DDCC4CDDCC2ADDCC6ED4CE30EEEE42EEEE61EEEE53EEEE701A6F3200F318387798447798CC7798227798AA7798667798EE7798117798997798557798DD7798399BCC95BBCCD3BBCCB7BBCCF077CC8477CCC2C3EE1533EE373BEE04B66F3155F33876FF896EFF89E1FF8919FF899B9FCC2AF54F01BBFF3077FF2177FF30FFF52ABB1F94F6DEA50977A2CC2A22CC6E22CC1922C457D1AD0904634A6094D6946735AD09256B4A60D4BB30CCBD296E5589E1568C78AACC4CAB4A7031D59854EAC4A6756A30BABB3065D5993B5589B75E846777AB02EEBB13E3DD9800DD9888DD9845E6C4A6FFAB0199BB3057DD992ADE8477F063090410C666BB6615BB6630843D99E1D18C68E0C670423D9899DD9855DD98D518C6677C6B0077BB2177BB30F6319C77826309149ECCB7EECCF011CC8411CCC211CCA611CCE111CC9511CCD311CCB711CCF099CC8499CCC299CCA699CCE199CC9599CCD399CCB799CCF642EE0422EE2622EE1522EE372AEE04AAEE26AAEE15AAEE37A6E600A53B9919BB8995BB895DBB89D69DCC19DDCC5DDDCC3BDDCC7FD3CC0741EE42166F0308FF0288FF1384FF0244FF134CFF02CCFF13C2FF0222FF132AFF02AAFF13A6F309337798BB7798777798FF7F9800FF9888F99C5277CCA677CCE177CC96CBEE26BE6F00DDFF21DDFF3033FF2133F33975FF8950A7EE377FEE04FFEE26FFEE15F6A3531FFA94D1DEA528F455894C5589C255892A5A84F031AD288C634A129CD684E0B5AD28AD6B46169966159DAB21CCBB302ED5891955899F674A023ABD08955E9CC6A746175D6A02B6BB2166BB30EDDE84E0FD6653DD6A7271BB0211BB1319BD08B4DE94D1F366373B6A02F5BB215FDE8CF00063288C16CCD366CCB760C6128DBB303C3D891E18C60243BB133BBB02BBB318AD1ECCE18F6604FF6626FF6612CE318CF042632897DD98FFD398003398883398443398CC3398223398AA3398663398EE3398113398993398553398DD3398333398BB3398773398FF399CC055CC8455CCC255CCA655CCE155CC9555CCD355CCB755CCF0D4C612A37721337730BB7721BB7338D3BB893BBB89B7BB897FBB89F0798CE833CC40C1EE6111EE5311EE7099EE4299EE6199EE5399EE7055EE4255EE6155EE5355EE70D66F2266FF136EFF02EEFF13E1FF0211FF131B3F8844FF98CCFF9822F99CD577CCD1CBEE15BBEE37B7EE0477EE267E6F20BBF52C16FFCCE1FFCC95FFCCD3FFC4BADA6E63FB5A9435DEAB1088BB2188BB3044BB214F56940431AD1982634A519CD69414B5AD19A362CCD322C4B5B96637956A01D2BB2122BD39E0E7464153AB12A9D598D2EACCE1A74654DD6626DD6A11BDDE9C1BAACC7FAF464033664233666137AB129BDE9C3666CCE16F4654BB6A21FFD19C040063198ADD9866DD98E210C657B7660183B329C118C642776661776653746319ADD19C31EECC95EECCD3E8C651CE399C04426B12FFBB13F077020077130877028877138477024477134C7702CC7713C277022277132A7702AA7713A677026677136E7702EE7713E93B9800BB9888BB9844BB98CCBB9822BB98AABB9866BB98EEBB981294CE5466EE2666EE1566EE376A6710777721777730FF7721FF7F300D379908798C1C33CC2A33CC6E33CC1933CC5D33CC3B33CC7F3BCC08BBCC4CBBCC2ABBCC6EBBCC14CDEE42DDEE61DDEE53DDEE7033EE4233E66169FF0299FF1395FF025B3F98AAF99C3377CCB777CCF0FFCC84FFCCC5C7EE1572AF88DDFF9833FF98BBFF9877FA9D5CCFCA73675A84B3D16615116637196604996A23E0D6848231AD384A634A3392D68492B5AD386A559866569CB722CCF0AB46345566265DAD3818EAC422756A533ABD185D55983AEACC95AACCD3A74A33B3D5897F5589F9E6CC0866CC4C66C422F36A5377DD88CCDD982BE6CC956F4A33F0318C82006B335DBB02DDB3184A16CCF0E0C634786338291ECC4CEECC2AEECC62846B33B63D8833DD98BBDD987B18C633C1398C824F6653FF6E7000EE4200EE6100EE5300EE7088EE4288EE6188EE5388EE7044EE4244EE6144EE5344EE70CCEE42CCEE61CCEE53CCE6732177021177131977029977139577025577135D7702DD7713D373085A9DCC84DDCCC2DDCCA6DDCCE34EEE04EEEE26EEEE15EEEE37E1E603A0FF210337898477894C7789C277892A7789A677896E7789E177891977899577895D7789D3798C99BBCC5DBBCC3BBBCC7FB7CC0877CC4C7CCE2133EE5333EE70BBE64365FF13573F8866FF98EEFF9811FF9899F99CB2FFC4A05BFF13B7FF0277FF137FFF02FB59A9BFFD4A60E75A9C7222CCA622CCE122CC952D4A7010D6944639AD0946634A7052D69456BDAB034CBB02C6D598EE5598176ACC84AAC4C7B3AD09155E8C4AA746635BAB03A6BD09535598BB559876E74A707EBB21EEBD3930DD8908DD8984DE8C5A6F4A60F9BB1395BD0972DD98A7EF467000319C460B6661BB6653B863094EDD98161ECC8704630929DD8995DD895DD18C56876670C7BB0277BB137FB3096718C67021399C4BEECC7FE1CC0811CC4C11CC2A11CC6E11CC1911CC5D11CC3B11CC7F19CC0899CC4C99CC2A99CC6E99CC1999CC5D99CC3B99CC7F94CE6022EE4222EE6122EE5322EE70AAEE42AAEE61AAEE53AAEE706A630951BB9899BB9855BB98DDB99C61DDCC95DDCCD3DDCCB7DDCCF034CE7411E62060FF3088FF2188FF3044FF2144FF30CCFF21CCFF3022FF2122FF30AAFF21AAFF306337993B7789B777897F7789F0FF8908FF898597CC2A77CC6E77CC197CCE62BBE660EDFF02DDFF13D3FF0233FF13373F9855FA9E0377EE70FFEE42FFEE61FFEA5560BF39FDAD4A12EF5588445598CC5598225598AFA34A0218D684C139AD28CE6B4A025AD684D1B96661996A52DCBB13C2BD08E15598995694F073AB20A9D5895CEAC461756670DBAB2266BB136EBD08DEEF4605DD6637D7AB2011BB2111BB309BDD894DEF4613336670BFAB2255BD18FFE0C60208318CCD66CC3B66CC71086B23D3B308C1D19CE0846B2133BB30BBBB21BA318CDEE8C610FF6642FF6661FC6328EF14C602293D897FDD89F033890833898433894C3389C233892A3389A633896E3389E133891933899533895D3389D333893B3389B733897F3389FC95CC0855CC4C55CC2A55CC6E55CC1955CC5D55CC3B55CC7F5DCC014A67223377133B7702BB7713BD3B8833BB98BBBB9877BB98FFB7980E93CC843CCE0611EE1511EE3719EE0499EE2699EE1599EE3795EE0455EE2655EE1555EE375DE60266FF2166FF30EEFF21EEFF3011FF2111F338B4FF894CFF89C2FF892D97CC5D7CCE11BBEE53BBEE7077EE4277E662EBFF02B15FCC6EFFCC19FFCC5DFFCC3BFD46A69FE539B3AD4A51E8BB0288BB1384BB0244B519F0634A4118D6942539AD19C16B4A415AD69C3D22CC3B2B46539966705DAB1222BB132EDE9404756A113ABD299D5E8C2EAAC4157D6642DD6661DBAD19D1EACCB7AAC4F4F36604336626336A1179BD29B3E6CC6E66C415FB6642BFAD19F010C641083D99A6DD896ED18C250B6670786B123C319C148766267766157766314A3D99D31ECC19EECC5DEECC358C6319E094C6412FBB21FFB730007721007730887721887730447721447730CC7721CC7730227721227730AA7721AA7730667721667730EE7721EE733990BB8908BB8984BB894CBB89C2BB892ABB89A6BB896EBB89E1B98C2546EE4266EE6166EE5366E671A777027777137F7702FF7713F0F309D077988193CCC233CCA633CCE133CC9533CCD333CCB733CCF0BBCC84BBCCC2BBCCA6BBCCE1BCCE44DDEE26DDEE15DDEE37D3EE0433EE26366F1099FF2199FF3055F329BAFF89A397CC3B77CC7F7FCC08FFCC4CFCCE5177EA582DFF89D3FF893BFF89B7FF8975AADCC7F6A5387BAD46311166531166709966429EAD3808634A2314D684A339AD38296B4A2356D589A655896B62CC7F2AC403B56642556A63D1DE8C82A7462553AB31A5D589D35E8CA9AACC5DAAC4337BAD38375598FF5E9C9066CC8466CCC26F462537AD387CDD89C2DE8CB966C453FFA3380810C62305BB30DDBB21D4318CAF6ECC0307664382318C94EECCC2EECCA6E8C6234BB33863DD893BDD89B7D18CB38C63381894C625FF6637F0EE0400EE2600EE1500EE3708EE0488EE2688EE1588EE3784EE0444EE2644EE1544EE374CEE04CCEE26CCEE15CCEE37C26730117721117730997721997730557721557730DD7721DD773035398CA8DDCC4CDDCC2ADDCC6ED4CE30EEEE42EEEE61EEEE53EEEE701A6F3200F318387798447798CC7798227798AA7798667798EE7798117798997798557798DD7798399BCC95BBCCD3BBCCB7BBCCF077CC8477CCC2C3EE1533EE373BEE04B66F3155F33876FF896EFF89E1FF8919FF899B9FCC2AF54F01BBFF3077FF2177FF30FFF52ABB5F94F6DEA50977A2CC2A22CC6E22CC1922C457D1AD0904634A6094D6946735AD09256B4A60D4BB30CCBD296E5589E1568C78AACC4CAB4A7031D59854EAC4A6756A30BABB3065D5993B5589B75E846777AB02EEBB13E3DF9EFC73E3664233666137AB129BDE9C3666CCE16F4654BB6A21FFD19C040063198ADD9866DD98E210C657B7660183B329C118C642776661776653746319ADD19C31EECC95EECCD3E8C651CE399C04426B12FFBF14FD51F06C9E3CF7F17A457FF5FFFBB34FE74A323E7D7D1F3DAFFFD74CC7FC3C44CF1F7FF7D77EC7FFEF74F523F5B151212121212121212129254FEADF273FB55FF59926F2C242424242424242424A4C884FA35242424242424242464414AA85F43424242424242424216A484FA35242424242424242464414AA85F43424242424242424216A484FA35242424242424242464414AA85F43424242424242424216A484FA35242424242424242464414AA85F43424242424242424216A484FA35242424242424242464414AA85F43424242424242424216A484FA35994C9F3E79E61B3364CE9C595251313793CCBF66FECAD7A4DD8D9090909090909090853EA17E2D36999AB5B2608D4EA6964DBB4B21212121212121210B7142FD1A3F2AD13CCBD6F913AAD890909090909090907809F56B9C1453B95666CE9C59E13B0A42424242424242420A4DA85F0B4EFEDF2D904F42091B12121212121212525042FD5A58922D5E2BC25BD890909090909090900213EAD7C292C8770ECC5FC2A6DDED90909090909090908526A17E2D38B95EC1667EB7C0F4E993E7799F9AF9D55AD12F6EC32BD890909090909090903C13EAD78233FF2BD83C7FB7ABAF09AF6043424242424242428A4CA85FE3A4F2656AA1DFBD1A51C28657B02121212121212121F924D4AF71922943E3FD0ED75C256CF88DB02121212121212121F924D4AF3153CCEBD250BF8684848484848484C44EA85F6B20597F962B7C0B6C48484848484848483E2945FD5AF903F855BF6D34F3D3FA79FEE4D34296ACBF846B41A95F33772DEBDDACA95B1931C012E952C4F18B3F789967FEDB5D26373DA4F86406F63CBF1D65A15F9C6B643F0AF368214ED57954E2FB5BE27633BF5E296BA3997F2DF1D2516CFD5AF592559E46E5DF3A87792E6BD6CC29EE77F847FC5054FE29FE72E75F45CD2CBC7ECD758E05753B46BB553B90F5E3F32791F3CD33F974A998D195CF009EBF8A2DF47CAB3D856A337F1F8A4C9E33B732454EE19225C65A91C8BA9CC8FC4D30F3D4ACD1A7BF00955659FB5FF9B7A5D98FAA26D57994FF617325F175A33211679D54A3E5B0EFE73F8F32496A6895787DAEAC6DF26F3193B40BD9E4EBD7CAD19967B95399D8054D8D8FE37C0653D5015456F5ABC4FE6044AA9E4E1AF56B8C091CA389FC8F5FF5462CD0F56BA117B66ACABFD64964ADA8287C5D2E9FFA35DEFD5D50AAD8AC772AF35725DB8F3229C13C8A77F0AA49AF7E8D3EBB449A88B12BCD9FD8A3BA98D68B994DA55C9F6397AD45B69B7FD27AFF1AEF9CE39D67CDD6AF059D6966BD28ABFAB5DAD5A498899AE95EE2F56BBC2E1534BA620CAAD8CF278536347F92DA8712D912D2DB148B4F52F56BE599E639A2CAA47E2DF2FE967F093B7F9F4BBF1FCD2ED53C2A4113F152EDE92732906A6ADF2FA682AC9A1817BF64EB73A6722DBEADAA4963F548E5FD6B8957C99A7A0E8B377F22AE4F8CB6D2AE5F8B5F2372CD84D8F56B315DCA7F438A77FC887ABD22F7FD8DD756D514FF4A23A94539A9FEA49464EBD74CF2DC0FB27EB69415E142FF7032BB0CF6A352CEA3B48F1F3BD55E814446518DD4AFC92E20F95FFF528EABC42BD7CA24BE7A245FBF169F4227D542308E2BCAF5FD6B520F9A85B69B2BC55FF67CDA8D3D8133072FF47CE3B5553545AE0BC92E8E99C47E77956AD2A85F2BF2B8FE355EBF26B82795E16DAD4C52E7583535556454B69EEB82177FF0349E46F2996289D4CDA5DFF7D328ECF259274B39AE525A212B93ECEA518EF56B4581F3AAF4E3388D7B5C53F56B45EEF782A90EE5784B5869DEB51779F005AB7E4D6371AC28D757B0E90DE9E84155B3F56BE2675DB6256CB2A759993C5FB197781E157FF034EAD73C97E8E2875089FFBB6B4A4B47B5EB64E9C7557AEF5FA3DB8D9152D4AF73E6FB19FCE9FFF35B18A2EF4A89075641D3A9F4FB7D7AF56B44BB11A799797A9BA7F54CE996E7C589318E236EF43C632CBA27D14D47CCDEF95B997F1867BEA6A0467335977F8AD987A257ABCA539EFF5E672E72AE0F96678993D22694498C764B7095AA3DE5AC8B73B5A322A5DE1699E833ADEC7C1AFB51E9E751447379268DFA35CFF5BFF8A61399CBF94FC06ACF2BD79E58E43A59FA71157D61332D46371ADDE70417BD74EBD7CC1D8DF878C4AA51FCF84EE9B0D53E9DCC736BAB1D4995896834D7902A682824555755DB68C46DCDA7DD5CC9750D6394E011A710A39579CE3757A3B93E9EEB98C51F24762B99E4395966CEF7A890C6BE9848E2CDA33CA770C45927327FE325A2DBD1B7297A1697E72D8EB83B1569EE47E5338F4AB36EE44AF475284D978AB905B9123DF7D3BBBF3535AEE63FDFF99FFAAA4D7AA55D6552AC5FF3EC65AE3B54FC237ED6CB9752599CE7C123A641F4F9964FFD9AFF058C9E7B31EE6FBCBAB0D06110AF956A4BF642CFB734154FAE3E17F37451FCCC4D2FC55FD57853B8A6EAD7883998E7444E70849420B94E36FFF38DB71F95CF3CAAC127A5D9B9B7985276298D7D3F6BFF33A756E85914747F6B6A5C551D4531CEB13229D5609549AB7E2DE8FAE6DA128A1CDF598F99DE7358FEEB63D69B5A53F56B458ECA2C911623B6CF183330EB71E23DC2A651B5275BAF1774B3E225F147C7CCD88EF7D9D224D57914719C9AAA2A7275B5A0DB54E8C9D660727535D5FDA8ACE65109D68D88646D7A668E6FE54A69ADC8D587D8078C31DFA393E7FDADD97195B96B45CEF1B4EF7B5AF56B9ECD6792D2E29E46ED9FEB79A8A0C316FA1E747639BD7F8DFDB859D0F9CE9F62AE40F1679DE7FD8DF7722E6B4A50F1E41ACC6558972495A4AE6A52254EDA973A6BA31509ADCF65F8AC92EAF9E6BA5965358F6A6AA445379DEBAFD2E846E2FB7E4DDDDF85607DCEDAFF72AF5F638C9534EE53527DAB4C52EB788C47E41AA95F935A08B2F6BC94F55CE6C4E7E4F856F7A45AC924EBC733C9F3089994E03D4AD6E317F98057E6496A77CF759C5C57AF46AA8A423B199105652B4DEA7C0B3AD9A41A4D2435F8FE35FA655BC9AE52B20DD5E0C35BC9AE581AC9F5D23DD95348A57E8DB1A8A5719E893F8715FAD2A5A0E394E1FBD75CE75BE8354CE43F22147305F2BF4AC55FE7B4DF3717749018C75F801EEE6324C1B3CE7A9CB2AA5F73ED1F310E9560299C6A92BAC8F99F6CB9CDA3B4D78D42DBADBC683176BD784976DFAFA991BF20AECFD3F3FB0544099E425AFFFFB10525A52192F83193DA0FCAAA7E8DE87FAE4633BD2DB2A42BC14BEB1829FE3AE73A4252E79BD4E4AFC1F734359804778582B6C91AD98DB2B618BB62C87AB4F2AF5FD3DE8FCA6D1EA5BD6E14DA6EE517946C0A646D25F640ADA9FB5BFEEB73A65ACD14ACD5D6AC299D4259D7AF458EECC4DFBF2675C0B2AA5FA3DBCD358B2A3F3BF37FFF8B7C444F12A95F4BB3FC25D24AAE6B95484F0A3A4844A2EF6CB249AACFC5E7FF4EFD9A788B0BC403CFFCDD4B7B3F2AB77994F6BA912BF9FC47B6AC1D4BFC1128D97D3F91CD2BA976534A41BDCA14ACB1DB4A76C52BB67ECD9C4FD5C4E85F4A8F8C598F59CC6C49EA803176829AAA5F737DAAF82CACEF5F6727F49E3EA54951EDF1D348221D4E24095675598F533EF56BE2E3A7F4A71023A5DF8FCA6D1EA5BD6E644D9E63A334B560D69E84FA3522F974A6989AB532C5545F59536CFD5A7C720DFD7C2E6B74127FFF9AD42D8931256AB07ECDF5C122B310BF7FCDE75544697A129144D6A33C93488713495257B5D0E39449FD5ACCBEBB40D4AFC5A7D0FDA8DCE6518DDCA63C5F2E94A66FC9EEFB892CE649B59B5222BA313DB9FFF7DAC48BD7D9355EBF462C16C59F6DE2874DEA8009D6AF05B59EE72A93AB03C9CEA885F8FD6B22A543DAEF514AF67C5F82B53EFF24B583163A1A4B5F55A4B1EF663D8534B6A59A4A8CFDA8DCE6518DBC7FCDBFC359BF32D921946C13C93E07665E64564D398FABA4FA90DE125193F56BF4D5297EBEFD5F78FF5A7CFD5AD054CC4CBFAC3D29340BF1FBD74496BC44EE784442FD5A35C5DFDF8AC85B5326F56B9183278D63964FE2ED47E5368FD25E37F26F31EB152BF4C12F46921DA5C9D6AFF3F72DD7A16A7C5C453CCBE579D899B1BE7BA7A0D44CFD5A6D1994C8644BFCC8494D8C187338D7602AB4FA2CF208959D297E7615DA6E0916BED929D73705F524D741922A074BB63E96557D53FCFD8DB86E110789B71954BEA189B113643D60A85FB3A698FDA8DCE651DAEB46FE2D66FDE2123CC81573F5E64FB2FBCEFCC7A9F1FA35D79529F438B157AA6252D2FA35CFBA27A99996F86A9BF580317A1BA38E8CD8FF8ADC7A8BB9DA991B9A59FD33C9D5C9E2DB0DEF5F2B53D071621C3FD9947239AB36F1EE6FE5388F7D9A495DEDFCB7875C1FCFE7B3B992F80252B349643F2AB77994F6BA317FB2B61531D292DA460B3A7EEC919FEB7AC63860D643A5F4FA33FF641D57D5CE8B1AA956E74F89EAD76A1F70ABBDA03192F5E0C5ACE0B96E6AA11D4EB67ECDFF8C6A6AFB49A4DD649F8373A57CEAD78815A4C82AA432C59F69D594E60615999476856A2F5AB2EDCEC9E3B72FC7EB6774169AFA35D9FD28D94B5DE43C2AC1BA914F7311A79FF64291F8B9673D6052EFAD224E3CEB1797665CE59A1D99B2B57C5E49A45BBFE6F9805BF5EA247869127FFF9A6B134AA43429E6293FCF76D37EF0CD9544B6BD5C5720467F62B452FAFA35FA8E27324D921D0F894FB7349278FD9AE7929546DD1C716D1319C6F36741AF5F53DA8FCA6A1E9560DDA89A5C854EC44772F530A9B522F18528D739167A310B1D273538AEB29E6F19CEF4B4EAD7821E702BAF4EB2B32B6B2B454E925C9D2FE8B0311E40A357A53C0756319F2D2689CCC3180FFA31925EFD5A91D0F7BFC6BB7A053511638E94E6EE149F04EBC882D6AB34EAD78ADC772AD4AFF324D5FDA8ACE65109D68DCAC4AE4493ADCCE649BC2E4524E292167F5F22CEBA06C75552EDA69DE4EBD7E9B17ED1521A97268D1742C50FE55CD7277AF656BBFF557B5E453EF5664E3CC6D54BEA693BD7710AED4FBC568AAF5F0B5D9DABBDE3893CEF25F26A21C6D25C5349AA8E2CF4CAA754BFE6EA49A85F2B539AFDA87CE65169D68D4C6257DBA93EEEA6B1EFE7BABF795ECC88B221FAE6D6D4B8CAFAF5F1AE6166022635E4E649C2F56BF4C35F8217259FA4D45C31E7127B1CE75A95AA8EEF88D62316B53C07D63CA75964B11EDDDBAC4975C9AB4CF9D4AF118B4EA19731A2F3D103B2DAB38E2E0E525AB38A49827564410338BDFA35D7B8CAFAC5693CBD9773FD5AB2FDA87CE65169D68D4C62BC88A93C72D64E26520CA471E4E881147DF06A0761BCCFA63AAE12D9B5A757F9769D94568924EBD7821E73E7E4FECDBD49258DE7B0D9790CC779CA3BFF5CF546465C90884623267CB5AD47379DCFE2986BDFCADCC4CC09CED3DB99D5FD07BB428B9B5C57A0A083C46EA5F4F56B444FE6FF1F6766FB51D0AA7721C65255D9EDE823477CB0A0F32D4D92AD23F37FAF106F5CE5B974645DD36234576D1219D8254B89F7A3329947255B3722B6A47CFA99EBACF3F96C8C2317BFEF177A7FF3B9B9990F16D96EBF69EDB2DEC1D991EFDAA2DB8D5E73B26EFA9976334D673DF122179FAC49AC7EAD76919DE7E40B3A78524D675A2FBEC58256C6FC13D162C4AA544C67F25C1C631F3F57A2EF42E2CD6592CFA88B5767CC935C0332D7D717741653A71C5CD080CF24E282275BD26552B6354D1A275B9A711571D3B35EEDAC5F994689569EF7BAF4FB51E9E75141874A7CDDC875B43C2F66911F8F3842A1279267D2B8BF15794C9F1A599F17944D2199FA359F9154FC036EAE1474AD13E943E9EF6EC4FE574C67F2592C62AC7AD526BAC5C49BCBA466EBD788FB1BE32C623CB4C438EBD849E3513B91C4B8BF992916FD2A258D76F33F48D6E3A4F1162AA5375B89A7A6F6A312CFA318874A70DDC8FAC5F9D728B9AE55FE37A5F4FB7E915BE19C6CBF223D9F2B5623EB731AFB7EE2FB4202F56BB517774E6ADFBD9B6707AA26A9352BF12115BB7E9D1D77A8E5B9D624FEB2B9DAC1906C73F9B73B7B41A85FA3FB1991E85348703C976DF13AFBFFB37777398E2B470246D7ED8DDC35D86B68A057D1BD00BF15D0AF03D4EBC8438F2C4B2495243342F973060703C3AE2E4924257E154A5197F7EFD613EDEDAB4A95E36AE70E14F6EBC511C8B9C79EECB3E7A3CCE7D1A1DF76FAEEADDE8DEBF5F9757909C147CEFB57AA6EEB6FE092DBFDC8EB73F584AD3E82ADD0AF3B0F32BA5C171F398E8FDEEEE33639DA373BB775DFBC472BF3D0AEA9781C97DC68ADDB3A71D3EDF7EBFD9E1C3DFC4ADE33BAF8B74ACEF3FD8AEBFB77EBB9107DBBFBBFE7F565EDC48BCCB99B6E6D8FB7703ECA791E1DFA9D755F37B61EE0F5D7C9F25FF2A9F3FE9569D1B9F9EBE223AFCF154FFDBF03BEF8A042BF6E6DD3B4BFCB0F6DE2BAF7EAE821B5DCFA895360C9C9A37C3B9C7B1DDFFAF3B1FA8D9EBE897D9FEDD7EF4AEB5F9FEEEDA13D52F2284EBF60B536875B5565FFAE6EF3FD875F31FE0A37FED62D1EBDB9BB8BB591E6E3E7A345C2F3E8D0AF7DFC87D75F37567FECE85F475B8768E1EFE9E8BC7F7F4457FA7591FFFAFC916E2E74B55F2F1E82F75FF2E7FF96863C2A7FC09FFA3BECF10EBCDDC18F8FE8C468A4F0FC57724F2E6E811F07BFC3667968870EDF43BFBCDC67FB7567FF5E7C14E5AF2F85BB7ED9C585BFF34FFC85442A8ADBBF69FD5A58CF5BB7787A679DF8AB3B5F0BE7A3C7DF13FA3C2AF9B577155F37B68E841387D6D61D28F9B7BD9CF71F6FFAF5E70F1D99F7DBCD7F7D2E3F5A9E6EFAC413A75C54BF5E3F1F94FF868F1FC7F7BBB11C55F7DDBCFCE7D75D18D7AF47EFC915CBAD3CDDD0FDB6AEDC5CC97E3CA1E4CEC41DCF3BFBF7D0A3D8B9E7AFBBE3BE23CE1DF6AF07D2D3EF0C7D6D8AF091FD5BEB7617AB6791D5FDBB7A8BA75F00577FDB89B36FA816CE47AF829E47AB8F74CBFE7D3BF4BAB17A049EDB44AB9BFABBEC286DF6BCBF6CC0D5DDFABAE9AE3C833EF2FA5C78DECF39355CEDD7ADE3AFF0E6777E4977A74642552C00A615D737FB2F7A158FDED5DFB37A7ADEBA9F276E74EBFEC765C139CE47308FA8F96BE1CD2FCA270A4CABCA9989C9F5DEAF873AF2CA70EB49C5915B28E7239847D4FCB5FC75CD5C8D128E13AEAB7214ADF64DCEFA81A3AFB7AB3FFC7DB0E7B6EE7C6B8B07BE9C8F602651F3D7F2BF562BBEC9F56AF925AFFF9FEE98BF72DDF53AD93A0E13FA75EB97EC3C0BCEDDDB275B37DAE06B69E3E7237238EF4FA2C2F5B3AEBCBA6DBD585C7FBDD87AC3CB2B51A7CC45B8EEE251B4F37AB55F4871DDFCBD1BA33BC95B98743B2FA425FF3CDFD6BDFDECF9881CCEFB5309BCFEEBDB2366E7C5E2FBF27AA3D3671ADA64FECA75273AF247C1F7C7EEFF8673B7FB78D33BB7FBF6979C0BDFE5D67BAC8136CF47E470DE9F4AECF76F7DAF5D48A2E464F06DFECA7F337FE5BA9D79E4156FDF8E0FBADD929BFE7A77A1A5D7D7E7B7D1DCE0CAD7BB36CF47E470DE9F4A857EFD3AFEE5A5252E1E6DFE0E1B8CF92BD70575E4DB17ABB87E2D799DAC7EEB8DA74083E7237238EF4FA54EBF46BC3A9BBFF2C8FC95EB225EA94ACE8B9FEAE6BBB78B10226EF4531A3C1F91C3797F2A75FAF5EBDAEBE3EABFB5FE9547E6AF5C57BD6C0A5F4C5A28AA2A09DB4B04B4763E2287F3FE54AAF5EBD7D9978C6535D2EB7F6FFECAA3AD0288BE5D4652B723CB5F49EADEEEE933F1C584EDEB95B3A9F311399CF7A752B35FBFDE7D6475F5C562F957D58F367F870D666B877A55A25C958EBCBDC41D3DEA6AF5EBD3678F4E38FA12BD38F1905BD0CEF9881CCEFB53A9DCAF8BDF051FE77C7C41347FE52DF357AE3BD191B75792E543EB57DAF1F4ED5EBFE955252FD1F7BBD1FB0B660BE7237238EF4F25A45F173FFEFFBA248BFBCB44F5D762008E5A5EA2EFAFD2F797E87B3447DF814CCE473098C07E050080EAF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B40941F3FFEBA89BE1580D9E8578010BF7FFDFCFEFE9F9BDB7F88BE2D80A9E85780CAEEE5FA48C502D4A25F01AAF9F1E3AF3F7FFEF91AAF8BDBFF643901C075FA15A082FD7255B10015E95780AB56170CECB39C00E034FD0A70DE897255B10017E9578033CA170CECB39C00E028FD0A704CAD727DF4FBD74F150B5048BF021C7071C1C0DB8A8DBEFF0003D0AF00456E71597DECFACA720280B7F42BC01B110B06F6A958801DFA1560D32D2243170CECB39C0060957E0558F7C1727DA462019EE8578067F90B06F6594E00F048BF02FC476BE5FA48C5022CF42BC0BF35B260609FE50400FA15A08F72BDFBF3E79F2A1698997E05A616B760E09E9841716C3901302DFD0A4C2AAE5C5FCB32F3B60086A75F81197D64269A30EB0598817E05E612B7D4B53022E3D259C50293D0AFC02C42C79F47DFC4B72816E034FD0A8CAFCDE5A74DF5344047F42B30B8C6DFAFBFFD128B62010ED1AFC0B03EBED4B585BB6A100B8C47BF0203EAF17A55AEB1055048BF02A3E9BA025D630BE02DFD0A8CA3A30503FB8679200011F42B3082213F05E51A5B00ABF42BD0B7B1978D5A140BF04ABF02BDBAE5D724134A8B62011EE957A04B13AE10B5281660A15F81CECC3C8C9C67E40CB043BF02DDB01874E18B6781C9E957A00F8D7F0D6C3E5F3C0B4C4BBF02ADB3EE7387E504C084F42BD02E0B064A58140BCC46BF022D52AE47B9C616300FFD0A34C78281D36C3A6006FA156888FCAAC27202606CFA156882050375D99EC0C0F42BF0614A2B8E45B1C090F42BF049160C2470E95C6030FA15F80CE59ACCA2586018FA15C866C1C0A7D8F2C018F42B9027F44AFBC6AE852C8A057AA75F8124160C34C51F1240BFF42B10CEDBD66DF2C5B340A7F42B1048B9B62F7439817D0444D0AF40140B063A6267011DD1AF407D62A853713BCE2016A848BF02355930D03B7B10689F7E05AA31BD1B866B6C012DD3AF4005160C0CC96E05DAA45F814B0CEAC6E61A5B4083F42B70928592F3B0AF81A6E857E00C4B5D2764D60E3442BF02C7581339390700F071FA1528E54D641616C5029FA55F81F7942BAF7CF12CF029FA1578C3FBC5EC707800F9F42BB0E916103EAF4309CB09804CFA155861C1004739668034FA15786696C669AEB10524D0AFC07F58CB48150E2420947E05FEC5D88CEA0CF28120FA156667D922711C5D4004FD0A5333212381E93E50977E854959A148B2B83F961C72301BFD0AD3F1B5497C8A2F9E05AAD0AF30118B116981E310B848BFC22CCCBD688A6F77034ED3AF303E4B5D699645B1C009FA154666A92BEDB39C00384ABFC2B034011DF1B716504EBFC2802C18A0530E5DA0847E85A1F84C0C0388AB58835818837E85415844C8481CCFC00EFD0ADD734D7846E58B678155FA15FA66BD20C37390034FF42BF4CA688A7978930178A45FA13F96063227473EB0D0AFD0191FCD66722EB201E857E886558070E7E90033D3AFD0015F4D04AB2C278039E957689A057FB0CF5F773021FD0AED8AFBC0B57748198CE5043015FD0A2D723286135C630B26A15FA12D160CC0159E413003FD0AAD70DE855A7CBB078C4DBF42132C1880EA3CAD6054FA153ECCC5D8219445B1301EFD0A1F63C100E4F05C83C1E857F80C33214816FA5E87E71D64D2AF90CD9A3CF8204F4018807E853CBE28085A707BB2780304BAA65F2183E577D01ACF4AE8977E850CAE30006D8A1BC446DF7398997E850CD5FB55B94245D52B56BF4228FD0A192AF6ABB7262142DDE504FA1542E957C850E5BCA85C215AAD8AD5AF104ABF4286EB67440B0620CDF5E504FA1542E957C870A55F952BE4BB788D2DFD0AA1F42B6438D7AF160CC0679D5E4EA05F21947E850C274E81CA151A71E28B67F52B84D2AF90E1D0C9CF820168D0A1E504FA1542E957C870A85FA3EF0C70C28F1F7FE95768847E850C87FAD5CA0168937E8546E857C860FE0ABD337F8576E857C860FE0A03D0AFD008FD0A19CC5FA177E6AFD00EFD0A19CC5F8777DB6BA745DF376AD1AFD008FD0A19CC5F8774FAE2F6AF6EBFC775D31A67FE0AEDD0AF90C1FC753015CBF5898A6D59F97ED4AF104ABF4206F3D7911C9AC39DE07B83DB64FE0AEDD0AF90C1FC7518D1F1BA503F6DB207A111FA153298BF0EA37C3F5E6421416BCC5FA11DFA153298BF8E2168CDEB1647426BCAF79D7E8550FA153298BF0E2067E5C02323D8A698BF423BF42B64307F1DC0AD26B74AE5B6CBFEF1F7BF9D73FBB75BBFB9DCED3E2C57E0BA73144538B447A2EF0CCC4CBF4206F3D701ACEEC4DB7F79BA5C9F2AB6FC0829B744AD96ADC2FC15DAA15F2183F9EB005677E2AD0EABF4EB4DE8E25ADF8F50C5A10D1E7D676066FA153298BF0E6075675D5939F0E4FA2A82122AF634F35768877E850CE6AF0358DD8915FB35F3E2062AF69CF22DAC5F21947E850CE6AF03E871FDEB8EE56367D11B6D24E6AFD00EFD0A19CC5F07D0F2F5074E33883DA47CC3EA5708A55F2183F9EB005ABEFEEBEDBE2D968B671D3ADE945621F35768877E850CE6AF63C85CA2FA7DF9485872B6E43E5B4B50A87CDFE95708A55F2183F9EB183247B015DFD9BFDDEDB747A0847DCBFC15DAA15F2183F9EB30721236A27EDEAEB2955C6F7D760F0277FA153298BF8E243A6143D367FF50545D3BCC5FA11DFA153298BF0EA6E41DF973122E08B03F8875F8ED28DF8FFA1542E957C860FE3AA48A15FB27F7FB5DF74789127695F92BB443BF4206F3D7E1DDAF607542F47D5BB553632E0ABBA5FC59AC5F21947E850CE6AF34686721813FA25E99BF423BF42B64307FA54D5B47A611ECAAF267B17E8550FA153298BFD2A69D9962F44D77C7FC15DAA15F2183F92BCDDA5A456004FBAAFC59AC5F21947E850CE6AFB44C8195307F8576E857C860FE4ACBB646B00EC527E5CF62FD0AA1F42B64307FA5655B93454B081E99BF423BF42B64307FA571AB87A27E7D52FE2CD6AF104ABF4206F3571AB7BA8440843D327F8576E857C860FE4AE3B6E22CFA76FB52FE2CD6AF104ABF4206F357DAB77A34FA6BEACEFC15DAA15F2183F92BED5B3D1A2D817D54FE2CD6AF104ABF4206F357DAB77A94EAD73BF35768877E850CE6AF57DC36C822FA8626B7FA112EFDFAA8FC59AC5F21947E850CE6AF27DC82F575BBDDFE9B5B5169D9085B47A9ADBD307F8576E857C860FE7AC86AB93E3117AC68EBFBB7EE6EBBC361F965FE0ACDD0AF90C1FCB55CF9944B225C57F2A7C2DDE4096BFE0AEDD0AF90C1FCB5D0A1445009D71D3A32273F38BFCC5FA119FA153298BF162ADF4A42E1BAA3F1BA983661CD5FA11DFA153298BF9678BB0AD316ABE8E8A8FB6EE695C7E55B49BF4228FD0A19CC5F4B946FA2275AE18473C3D745F47D6B93F92BB443BF4206F3D71DB7C7FBFBD7CFAD4DB47CF2FD1F7FFFDBF2635B1B2DFA4E0E6627C596CB932D1B7C67A7CC7915B3AD8DB6BA89A2EF0CCC4CBF4206F3D7556F3FFC7EFB5F6F21F5682BBC2C21386467333E6DF0B73B689E2D6FFE0AEDD0AF90C1FCF549E1659B7EFFFAF994535B45E572B087AC4EB25FFF5AD8F983E1E91F4E52B16F37C5E33689BE333033FD0A19CC5F1F957F4EEB751C78E36B4EAFDBDA86E7FA75925D60FE0AEDD0AF90C1FCF5EEE8A6D0AF1122FAF57B8268B329A011FA153298BF2E8E7EE65DBF0609EAD7EFA1BB4DCA433BF42B64307FFD3A75C126FD1A24AE5FBF874E371B011AA15F2183F9EBB9EF26D0AF4142FB75D4DD61FE0AEDD0AF9061F2F9EB7EBC2E9F5EDFDA14FA35C2F57E7D7B058921F7C8CEE37DA25F21947E850C33CF5FF7A756F7665AFD5FF56B90EBFDBAB32F1E775FF403C964FE0AEDD0AF9061E6F9EBCE637FCCD3B73FA05F2BAAD5AF3B3FF03D62C36D3DD2191E3B3445BF428669E7AF3B71F3544BAB3FA35F8354ECD7FD841DE98F31F35768877E850CD3CE5FB71EF86B2A6D6D0AFD1AA16EBF6EED94EFE1326EF531CEF0C0A135FA1532CC397FDD4A9F3F6BDF53BAFA93FA3548F57EFDC7C6F7FA2E3B31FAE1E4307F8576E857C830E7FC752768F4EB6745F4EBCE9F2BD10F27CDEA031CFE514383F42B649870FEBA5533AB91A45F9345F4EBD6AE59F663F4234A60FE0AEDD0AF9061C2F9EB56CAAC768F7E4D16D4AF5BFB7198BDB3FAE856E95708A55F21C384F3D7AD93BA7E6D415CBF6E1DEAD18F2881F92BB443BF4286D9E6AF5B67FAD51ED5AFF9E2FA7567D7473FA804AB0F6D957E8550FA1532CC367F3DBA7840BF268BEBD7AD5D39C00E327F8576E857C830DBFC75F5F16E7D724BBFE60BEDD7D55F3E46CFAD6E8A55FA1542E957C830DBFC75F571ED2C1ED0AFC942FB75EB9F443FA868E6AFD00EFD0A19A69ABF9E281EFD9A2CB45F77F666F4E38AB6FAB856E95708A55F21C354F3D7ADB78FF56B3BA2FB756B0149F4E30A65FE0AEDD0AF9061AAF9AB7E6D9F7E3D677553ACD2AF104ABF4206F3D7FD0F6FE9D764D1FD3AE43E327F8576E857C830D5FCF5C4C507F46BB28FF4EB0049B7BA2956E95708A55F21C354F3D7D507BB7FF101FD9A2CBA5F57FF55EF4967FE0AEDD0AF90C1FC55BF3645BF9EB3BA2956E95708A55F21C354F3D7D507A55F9BF2917EFDEEFCD8367F8576E857C830D5FC75EB41E9D776E8D773561FD42AFD0AA1F42B64307FD5AF4DD1AF2798BF423BF42B64307FD5AF4DD1AFE7AC3EA855FA1542E957C8E0FA03FAB5293EBF7582F92BB443BF4206D71F586D23FDFA29D1FDBAFAFB5D7F00A845BF4206F357FDDA14FD7A82F92BB443BF4286A9E6AF5BEDA25FDB11DDAF5B7FC3443FAE68AB9B62957E8550FA15324C357F5D6DA3EF77C5B3FA4FF46B90E87E5DFD27BDEF23F35768877E850C53CD5FB74EF3FB1FE12AFF27FAF5BAD07EDD3900A21F57B4D5C7B54ABF4228FD0A19A69ABF7E9DBA8456F93FD1AFD77DA45FA31F5434F35768877E850C53CD5FBF4E7D846B6B53E8D708A1FD3AEAC507BECC5FA119FA1532CC367F3DB10476F5E7F56B90D07E5DFDF9017690F92BB443BF4286D9E6AF2796C096FFBC7EBD2EAE5F075EFCFA65FE0ACDD0AF9061B6F9EBD7C6997E6709C1EACFEBD72071FDBA75A8473FA204E6AFD00EFD0A19669BBF7E1D5F42B0B529F46B84A07EDDFAE161F6CEEAA35BA55F21947E850C13CE5F775246BF7E5C50BF6E1DE763FC4966FE0AEDD0AF9061C2F9EBD7F6A35EADD2F29FD4AFD745F4EBD64F8E5472AB0F70F8470D0DD2AF9061C2F9EBD7F61282D5EF925DFD49FD1A24A25FC71EBE7E99BF424BF42B649873FEFAB5FDC05F53696B53E8D708D5FB75E76F95E8C79269F531CEF0C0A135FA1532CC397FFDDA1D593DB569C9CFE8D75AEAF6EB56BC2E7B30FAB1A4317F8576E857C830EDFCF56BF7B13FE6E9DB1FD0AF1555ECD79DAA1BAFE1B61EE90C8F1D9AA25F21C3B4F3D7AF7753AB7B33ADFEAFFA3548AD7EDD99BC2EBB2FFA8164327F8576E857C830F3FCF56BFB835CF733FD5619E8D720D7FBF5F6DFEF1FD543EE919DC7FB44BF4228FD0A19669EBF2EF613768B7E0D72BD5FF70DB93BCC5FA11DFA15324C3E7F5D1CDA08F74DA15F2384F6EBC0E966234023F42B64307F5D1C4D58FD1A24AE5F07EE36F35768877E850CE6AF774737857E8D10D4AFC3479B4D018DD0AF90C1FCF551F95A58FD1A24A25F87DF05521EDAA15F2183F9EB93B79F5EBF6F8AD7A25AFD87FAF590D57EFDB3F6BDBE257F6C2C579088BECF2D78BB291EB749F49D8199E957C860FEBAEA6DC5BE16D5CEE59CA2EFED48CA2F58F67607CDB3E5CD5FA11DFA153298BFEEB83DDEDFBF7E6E6DA2A5909672DD9905EAD7437652ECB691EF1B7C67A72C3F167D3F5BB3B5D1563751F49D8199E957C860FE5AA27C133DD10A271CBD16C4A3E8FBD626F35768877E850CE6AF25CE7DC7C1CC5BEC8AA317C6BA9B79A971F956D2AF104ABF4206F3D7422786823EB975DA893F1866CE32F35768877E850CE6AF858E0E0555C24547FF60987CD4EDC88446E857C860FE5AAE3C6125C2758517325B4C1EAFE6AFD00EFD0A19CC5F0F29892ACB062A7ABB9060AAEB64ED2879FEDEB758F49D8199E957C860FE7AC256C56AA9085BC3455BFBCEFC15DAA15F2183F9EB395BC5107DBB737234BE55FE2CD6AF104ABF4206F3D773B6FA5554556753BF65FE0AEDD0AF90C1FCF5349B2887517789F267B17E8550FA153298BF9EB6BAE97C78ABBAD58F7089B047E6AFD00EFD0A19CC5F4FD3AF39F46B89F267B14D07A1F42B64307F3D4D57E5F077C25BE6AFD00EFD0A19CC5F4FF3B9A2045B1B59BF3E297F16EB5708A55F2183F9EB69FA35810F6F95307F8576E857C860FE7AC5EA56321AACC8228D42E5CF625B0F42E957C860FE7A85BA8A66F16B09F35768877E850CE6AF57584210CAE62D57FE2CD6AF104ABF4206F3D72B7CBA28D4EA78DB71F8CAFC15DAA15F2183F9EB45AB1B50225461DB962B7F16DB80104ABF4206F3D78BB666845AFF22B3ED72E6AFD00EFD0A19CC5F2F9259412C1E38A4FC59AC5F21947E850CE6AFD76D6DC3E8DB1D9BF62A67FE0AEDD0AF90C1FCF5BAAD49A111EC6936E951E5CF62FD0AA1F42B64307FAD4228D465A47D88F92BB443BF4206F3D72A7C8AAB224B8A4F287F16EB5708A55F2183F96B155BC9A5154E307C3DCAFC15DAA15F2183F96B2D5B5BD2463BC4CAD773CA9FC5FA1542E957C860FE5A8B116C15FE0C38C1FC15DAA15F2183F96B455B1BD3ECB090E1EB69E5CF62FD0AA1F42B64307FAD68670C167DD363D8DA7AFE70DA67FE0AEDD0AF90C1FCB5AEADED291ADE32BDBEA2FC59EC508450FA153298BF56B7B5F574D88EAD95038EBA12E6AFD00EFD0A19CC5FAB936247EDE497E82F54FE2CD6AF104ABF4206F3D70856111C62735D64FE0AEDD0AF90C1FC35828162B99D71B5E3AD5CF9B358BF4228FD0A19CC5F83C8B2123B5B49E897337F8576E857C860FE1A6767DBDA925FBBD5A5B18E2A7F16DBB6104ABF4206F3D738FB53B1C913D6C6A9C8FC15DAA15F2183F96BA89DF7C76F5B7EDAED797BE03B079E950327943F8BF52B84D2AF90C1FC359A847D225EAB337F8576E857C860FE9A6067234F1813B64684F267B18D0CA1F42B64307FCD21DABEDE4D5E75D569E6AFD00EFD0A19CC5F73EC17C60C0B09F6E3D5D17551F9B358BF4228FD0A19CC5FD3BC1D920D1C70333FF604E6AFD00EFD0A19CC5F33BDED8C213FBDB4F309B6EFB9AFC35051E15378D9E0D1770666A65F2183F96BB2B7093B585EEC1F60E2B50AF35768877E850CE6AFF94A1276804DFD76C1AB23AAA292E7EFFDE88ABE333033FD0A19CC5F3FA26460D6F55A82FD3503DF2AAA2AF35768877E850CE6AF9F52329EEC71105BF8B8A2EFC66C4A9EBF363E24D0AF90C1FCF5B34AB67F2F155B52AEDFBE612B80F92BB443BF4206F3D78F7BFB56FBE2F663CD6EFFDB1D2B7C140EA120251B7FA15F21947E850CE6AF2D289F9FB5368B2D9CB93678CF4762FE0AEDD0AF90C1FCB51DE5FBE2F6931F7F17FE7607CAEFB03503D10A77C472F044DF1998997E850CE6AF4D3934485B5A24F98F8AF281EBA7EEE184CC5FA11DFA153298BFB6A67C2DE9A365756CD00E5A7EF3B97B15717F7855BE53F42B84D2AF90C1FCB54D47C79C8F7572ABC6EB1FF65A82F5D0228147CA3593F92BB443BF4206F3D7969DAED8BBDB3FBF17ED12B5F749EDDDFD7F5D6AF5FA2D3A4EF21DDA41D1770666A65F2183F96BFBAE576C0EE5FA29E6AFD00EFD0A19CC5F7B716E056A8E96AF4D3B89F29DA55F21947E850CE6AF7D69AA62979509CAF5E3CC5FA11DFA153298BF76EA83212B5B1B7468F745DF1998997E850CE6AFBD5B423661816C95CB1A10C1FC15DAA15F2183F9EB482E5EF4EA49AD4B7191E0D06E8DBE333033FD0A19CC5F07F67879ACE5C2584F97C7BAFF378F17D852ABDD317F8576E857C860FE0A03D0AFD008FD0A19CC5FA177E6AFD00EFD0A190EF5AB2F0585061DBA12857E8550FA15329CF8A08F5504D08813DFCDA65F21947E850CE73EA8FEC73785C2479DFE5661FD0AA1F42B64B872A125CB09E023AE7C75857E8550FA15325CBF50A88A8534D7BF744DBF4228FD0A196A5DE8DE720208757AC1C0EBB335FAAEC2CCF42B64A87246BC9F17552C5457AB5CEFCFD3E83B0C33D3AF90A1E2797161390154747DC1C013FD0AA1F42B64A8DEAFCB0952C5C245D5CBF5FEF48CBEE73033FD0A19EABE35F9749AB49C004EF0AC847EE957C81377BEFCFDEBA7F32514BA3D59E2C6AE9E899040BF42B6A013E7B745B150C0131006A05FE1038C7F209F37406018FA153EC6F23BC8E1B90683D1AFF061BF7FFD8C9B0945DF79689FF73A603CFA159A10778A55B14CCB525718957E8556788B136A095DEA1A7DE781B7F42BB445C5C2159E413003FD0A2DF2BE279C60A92B4C42BF42BB2C8A8542FEE483A9E857689A3743619FABBAC284F42B74C0191A56F9EB0EE6A45FA11BDE21853B4F0798997E859EC47DF1EC8D81135DF0951F807E85FE5814CB9C1CF9C042BF42AF5CA19D79C4BDF3A05CA147FA15FA661520C37390034FF42B74CF688A5179930158A55F611096063212C733B043BFC2507C349B01B8C806B04FBFC2807CF12C9DB2D41528A15F6158DE7EA523BE640E28A75F61649A80F659EA0A1CA55F617CDE93A559D6BA0027E85798856B6CD1149F35044ED3AF30116FD4D202C72170917E85E95814CB07791F00B84EBFC2A42C8A2599430EA845BFC2D40CC348E06B6081BAF42BCCCE6244E238BA8008FA15F8171332AA33DD0782E857E03FAC50A40A0712104ABF02FFE5C78FBF8CCD38CD201F48A05F8115962D7294630648A35F814DBE21894266F64026FD0ABCE11BEAD971EBCB88C3E3DB1F39C036FD0ABCE7AD615EF92237E053F42B504AC5B2F0213FE0B3F42B708C4B234DCE01007C9C7E05CE888B18E3B766B93616D008FD0A9C6439C13CEC6BA029FA15B8C44C6E7896BA02ADD1AF4005D6440EC96E05DAA45F813AE23E93FE6D516C3A6375A065FA15A8C942C9DED98340FBF42B509FF79D3B65820E7441BF0221429713A8D8EAEC2CA023FA1508E4CDE8F6F91A58A03BFA150877EB1815DB205F030B744ABF0249BC43DD94B872B53B8068FA15C8133AF0934D855C1B0BE89D7E05B25914FB29B63C3006FD0A7C86E504C92C750586A15F814F52B1096C646030FA15F8306F6AC7B1D41518927E059AA062EBB23D8181E957A021DEE9AEC25257606CFA15688E6B6C9DE60F006006FA156891B7BF8FB2D41598877E05DAA5624BF81A586036FA15689DF7C47728576042FA15E8802F9E7D75BBDB160C0073D2AF40372C2758842E75357605DAA75F81CECCFC41254B5D01BEF42BD0A90917C55A070CB0D0AF40AFE61946BA3616C023FD0AF46DEC45B196FC02BCD2AFC00886FC30BEA5AE00ABF42B308E6156885AEA0AB043BF02A3E9FA0D774B5D01DED2AFC0807A5C366AA92B4021FD0A0CABA377E1E3EEAA7205C6A35F81C135FEC5B3BE0616E028FD0A8CAFCDB7E67D0D2CC039FA15984553BDE8DA5800A7E957602E1F5F14DBF87A0680F6E95760461F197FBA36164015FA159854E6A258D7C602A848BF02534B98895AEA0A50977E05085C141BC482016066FA15E0DFBAA858E50AA05F01FE236E39C175160C002CF42BC0B3D62A56B9023CD2AF00EB1A594E60C100C013FD0AB0E9C78FBF3E58B1CA1560957E0578237F39810503003BF42B4091DFBF7E2654AC7205784BBF021C10BA9CC082018012FA15E09888E504B77235760528A45F01CEA855B1160C001CA55F01CEBBB89CC082018013F42BC055272A56B9029CA65F012A285F4E60C100C045FA15A09AFD8A55AE0055E85780CA569713583000508B7E05A8EFF18B67952B405DFA1520CAAD622D1800A84EBF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF42B00003DD1AF0000F4E4A9591FD5BC190000A842BF0200D013FD0A00404FF42B00003DD1AF0000F444BF0200D013FD0A00404FF6FAD5FFFDEBFFFE5700000000FFFF0300504B03040A000000000000002100460095E0686000006860000015000000776F72642F6D656469612F696D616765312E706E6789504E470D0A1A0A0000000D4948445200000395000002590802000000B69786FF000000017352474200AECE1CE9000000097048597300000EC400000EC401952B0E1B0000600D49444154785EEDDDB1EB2FC7B9E77969952D02C3082424180C56A2E00E1C6EE0E824EB6102A1D8A105930D936CB2FFC2FE0BC3C472A868178483611C890D1C5C0ECC0D94C8602E48964017044A8DF7D16DDFEFFDE9FBEBEE6F5577555775F5CB1CCC91545DF5D4FB79BAEA53F57DBAEAF5D73EF9F36BFE8700020820800002082080404F04FEFA9B775EFFED37B316FD6F3DD9C91604104000010410400001041E10A05F8508020820800002082080C09908D0AF67F2165B11400001041040000104E8573180000208208000020820702602F4EB99BCC55604104000010410400001FA550C208000020820800002089C8900FD7A266FB115010410400001041040807E1503082080000208208000025D1388B3609FDA47BF76ED2DC621800002082080000208DC11A05F8504020820800002082080C09908D0AF67F2165B11400001041040000104E8573180000208208000020820702602F4EB99BCC55604104000010410400001FA550C208000020820800002089C8900FD7A266FB115010410400001041040807E150308208000020820800002672240BF9EC95B6C45000104104000010410A05FC500020820800002082080C09908D0AF67F2165B1140A04302FFEDDDFF157F3A348C49082080C0A804E8D7513DAB5F0820509D40C8D6DFFFFD771FBF7C197FE22FD5DBD30002082080C0BF10A05F0502020820B085C0A45C7FF9FE2FA687E32F3FFCFA6754EC16949E410001043209D0AF99C014470081CB13886DD73F7DF8C64DB93EE511FF32FE937482CBC708000820509700FD5A97AFDA114060240293728D6DD7B7DE7C73A95FF19FA200153B92DFF50501047A2340BFF6E611F6208040A704A6848115E5FAD4EE49C54A27E8D497CC4200819313A05F4FEE40E62380407D02214323B775366160BD7149B1F59DA3050410B82201FAF58A5ED76704104824B092EA9A58431493149BCE4A49041040208500FD9A4249190410B81C819454D77428B774029F76A5435312010410582240BF8A0D041040E09E4056AA6B3ABED88895149B8E4B49041040807E1503082080C06302A15C97CEC67AFC705A09E904699C94420001041609D87F151C082080C08F046EA9AE89270CECA1E68CAD3DF43C8B000208D0AF62000104AE4EE0760DEC01CAF5296B676C5D3DF2F41F0104B612A05FB792F31C02080C41E0EE1AD8E3FBE48CADE3996B110104CE4E807E3DBB07D98F00021B0914391B6B63DBCF1E93145B8AA47A1040E00A04E8D72B78591F1140E02704CA9E8D550AAEA4D85224D5830002C313A05F8777B10E2280C04F08543A1BAB146549B1A548AA070104062640BF0EEC5C5D4300817BE5BAED1AD8E3394A8A3D9EB9161140E04404E8D713398BA90820B09140BD54D73F7CF9C7373FFD3EFEC45F361AB7FC98A4D8E248558800026310A05FC7F0A35E2080C03C817AA9AEDFFDF0C3279F7FFEAB7F786B6A38FE12FF18FFB2AC2724C596E5A9360410188300FD3A861FF50201046608544A759D94EBCF7FF797FFFAF57F78DA6AFC63FCCB7A2A36BAC3CD082080000241807E15060820302081907A95525D234FE0B9727DAE62EBA51350B103C6AB2E2180402601FA351398E20820D03781AAA9AE4F1306D631443A418DA4D848279014DB7700B20E01048E2040BF1E41591B082070008103525DEF12061E76AA6A526C6CC446971FDAA000020820301E81D75FFBE4CFE3F54A8F1040E06A0442CCC5C664F15E47AAEB97DF7C7BFB486B73FD61DEFBEFBC1DBBA79B6B587A301215F69B57DC2A1522800002FB09FCF537EFBCFEDB6FA67A9EFE3DFED1FEEB7EBC6A40008196046AA7BA165187514964CD564A8A8D4C5F1BB12D4350DB0820703801FAF570E41A4400814204EAA5BADE9D8D55C8DE5A676C85791FBF7CF9A70FDFA0624B794A3D0820D03901F9039D3B88790820304F20E45A8D9FE343B97EF6EA556E9E6BAE9342687EF4E2450DFBA513E4FA42790410E89680FC816E5DC3300410C82630250C54127FEB676365DBBAF0C074526CBD7402676C95F2947A1040A04F02F207FAF40BAB1040608640C8B2D876ADF19DD6740D6C9154D774CF553A632B0C70C656BA17944400813312A05FCFE8353623703902B754D7E2DBAE95525DD33D54F58C2D49B1E98E501201044E4440FEEB899CC55404AE482094EB07EFBE5763CFF59854D7749F498A4D67A52402085C81C04AFE2BFD7A8500D04704CE4AA0D2A9AE81A3DBEF9C2ED8E5B34627BB1140A03201DF6F5506AC7A0410284DA0DED9584D525DD3F14CE904953EED924E90EE08251140A06702F25F7BF60EDB10B8228103AE81ED1C6B9C4E503529D6C5B39D0700F31040E02101F9030F11298000020711A89AEA5AE41AD883403C69C6C5B3C733D7220208744240FE40278E600602082C1208A1169748D5F84E2B7E8B8FC3560F3E1BAB94A7AB5E3C2B9DA0949BD48300020713903F703070CD2180C03D817AA9AECDCFC62AE5EC4A49B17118998B674BF9483D0820702401F90347D2D6160208FC8440BD13A37A3B1BAB94E3EB11EBF6408652E8D4830002A723207FE0742E633002E3139812066ADC4730250CC45750E34174F1EC783ED5230410D84040FEC006681E4100815D0442B9FEF0EB9F4975DD0CD1C5B39BD179100104C62040BF8EE147BD40E01C04A4BA16F453D533B67CDA55D053AA420081E204E8D7E2485588000233046A9FEA3A6AC2C07A304DE90471DF41E4FB960DBBE9D3AED8292F5BADDA104000812204E8D72218558200026B042AA5BA469303A7BAA68794A4D874564A2280C01804E8D731FCA81708744AA06AAAEB9B9F7E7FD2535D6B784B526C0DAAEA4400813E09D0AF7DFA8555089C9E8054D7262E9414DB04BB461140E06002CE7F3D18B8E610189F806B607BF0B193627BF0021B1040600F01E7BFEEA1E7590410C820E01AD80C58358B564D8A8DD3097CDA55D37BEA4600810704E40F08110410284320044DC89A1AA7BA0E730D6C19D039B5D4BB78361CED8CAD1C57288B00022509D0AF2569AA0B816B12B8A5BAD6B84C2B0E87BAE6D958A562293662AB26C5C6BA2502A094B5EA410001045208C87F4DA1A40C0208CC13A897EA1AEDC5D9588E17281B79A1356B6C9073565937A90D01042602F25F4502020894275035D5D5D958E51DF6DA6B55CFD88A3B816DC4D6F09A3A1140E03901F903A2020104B209381B2B1B594F0F544A27882EC6955D92627B72355B10189600FD3AAC6B750C811A0442B9D6BB4C4BAA6B0D97CDD6E9E2D9C3506B0801046A1090FF5A83AA3A11189380ECC921FDCAAD43BA55A710188080FCD7019CA80B08B424502F61203ED292EADAD2B5959362A513B475AED611189580FC81513DAB5F0894213029D7C86BAC7436961306CAF869772D959262236C24C5EE768E0A1040E09E00FD2A26104060918054D74B0587A4D84BB95B6711383501FAF5D4EE633C02B50884728DE3906A9C153A250C8454AA65BA7AF711A87AF16C04958B67F7F9C7D30820F02301FA551C2080C04F08D44B75750DEC8942ADD2C5B341C0C5B3270A03A622D02D01E70F74EB1A862170348150AE1FBD78513CCF35BA11CAF5B357AFECB91EEDD112EDD58B8AD889FFE2EBAF4445092FA903813109AC9C3F40BF8EE972BD42209740A5439442B97EF9CDB73ED2CA75476FE543C5C6675835AC724B700DAAEA44600C02CECF1AC38F7A81401502A15CE384814AA9AE3FFFDD5F88D72A6E3BB6D2D8258DACE5D09AC59B954E501CA90A11B80201F9AF57F0B23E22304FE096EA5A3C6740AAEB9031E78CAD21DDAA53089C9180FC81337A8DCD08EC2510CAF58377DFABB1E72AD575AF6FCEF07CD5A4581BF66708013622700401F9AF4750D6060267215029D535BA2F97F12C3150C44E815404A34A1040608980FC57B18100023F12A87736966B602F1861B1512A29F6827ED765047A2020FFB5072FB00181EA045C035B1DF1551B90147B55CFEB37022D09D0AF2DE96B1B81630854BA0676FA482B4E187084E7317EECB61517CF76EB1A8621302A01FA7554CFEA17023F12A87A0D2CE52AC89E1270F1AC78400081C308D0AF87A1D610028712A89AEA1ADBAE3E123FD49DE7694C52EC797CC552044E4C807E3DB1F3988EC02C8103525D250C88BD75029262450802085425E0FCD7AA78558EC0D1042A1D69E454D7A31D394A7B1190EFBFF376F10B32028FC3DA468911FD40609180F3B3040702E31390EA3ABE8F4FD8C3D8888D3CE97A17CF46D89F900A931140602F01F9037B097A1E81E604A4BA367701035AA513C41D727FFAF08D7805B80001042E4540FEC0A5DCADB3031288C9BBC68FB31206068C950EBA54F5E2D92FBEFE4A6676074E660202C508C81F2886524508F443604A18282E5E43B9C6AFBDCEC6EAC7D1235952F58CAD8F5FBE944E3052B4E80B022B04E40F080F04CE472026E9D8768D5F4E8B9B3E295767631507ABC2A704AA9EB1158B3AE904E20D81E109D0AFC3BB58078722704B75ADB1EDEA54D7A162A5FBCE543A632BFA1D1BB19262BBF73F0311D84540FEEB2E7C1E46E03002A15C3F78F7BD1A7BAE525D0F73A2866609544D8AF56382A843E0BC0456F25FE9D7F3BA95E5172250E954D720E810CD0B8551DF5D15E47DFB8775083420E0FBAD06D0358940110255CFC67AF3D3EFED4E1571934AF61398D209EA9D142B2976BF8FD480403F04E4BFF6E30B9620F01302075C038B38025D1188D3092A25C546BEB8A4D8AE7CCD18047612903FB013A0C711284FA05EAA6BD81A5B5CCEC82CEF33359626E0E2D9D244D587C0F908C87F3D9FCF587C5902B2002FEB7A1D7F4EC0EB202A10B83201F9AF57F6BEBE9F8640D5545767639D260E18FA84C074526C1C91519C8A8B678B23552102471290FF7A246D6D21304FE0805457390382EFBC04E24E8D58801557B153526C6CF1FAB4EBBCB1C1F2CB1290FF7A59D7EB782F042AFD421A93FD97DF7CEB78815EDCCC8E12042ABD2C619A83E44AF8471D081426207FA03050D5215084404CC671D7658D2B095C035BC4412AE98D40D58B675DD9D59BBBD983C00A01F903C203810604EAA5BAC6B6AB54D7061ED5E481049CB175206C4D21D02901FAB553C7306B5402B5535D235350AAEBA8C1A35F370211E4B59362D14600819E09D0AF3D7B876DA311888481F85E24BE1A29DBB1D8739D120628D7B260D5D6398149C556BAB22B727BE285ED9C00F310B82C01FAF5B2AED7F14309C44418D975525D0F85AEB16B1090147B0D3FEB25023F2140BF0A0804EA12B8A5BAD6D87695EA5AD7796A3F0F0149B1E7F1154B112840C0F9590520AA02815902F5AE818D8481CF5EBD922D20F010784E20DEBB8F5EBC28BE5C8C862251E18BAFBFF2DE893A040E23E0FED8C3506B0881BF117050A55040A021012F6043F89A46A01401E7BF9622A91E041E13A87736566CFF481878EC00251078EDB5299DA0D2A75D4E8A1562083427207FA0B90B18300E817A3F5C4A1818274AF4E45802DECA63796B0D819204ECBF96A4A92E049608D4C8BA7336967843600F817A676C458A6DBCF27B6CF32C02086C26E0FC81CDE83C88407502AE81AD8E5803D72050EF8CAD6BF0D34B04BA2340BF76E712062110045C032B0C10284EA0D2195BC5ED542102083C2440BF3E44A4000287129894ABCBB40E85AEB1CB10A877F1EC6510EA28025D10A05FBB700323109808B8065624207000817A49B10718AF0904100802F4AB3040A00B02A15CDFFCF4FBF87DB30B6B1881C00508488ABD809375715802F4EBB0AED5B1B31090EA7A164FB173480292628774AB4E0D4F807E1DDEC53AD83501A9AE5DBB8771D7202029F61A7ED6CBA108D0AF43B953674E44604A187097FA895CC6D4B109488A1DDBBF7A371801FA753087EACE690848753D8DAB187A25025F7CFDD595BAABAF089C9500FD7A56CFB1FBEC04E25ACBB37781FD088C47C04F22E3F9548F8624F0FA6B9FFC79C88EE91402C713F8D3876FC4959289ED46F2406249C57A2030AD373E78F7BDF8FFF7DF79FB66D2CDE3F11DDEF42FBFFCE6DBE92FD34E1E3DD483FBD26D08477FFCF26562F9707A1CD59C5858310410C825F0D7DFBCF3FA6FBF999E7AFAF7F847FA3517A6F2082C12C8D2AFF1E51665D37330858EB9A9D5F465C9528F42E84CBA36442DBFF7ECF7B0ED875FFF2CD142FA35119462086C2340BF6EE3E62904F20864E957FBAF79700F293D69D6D85EDD2F58D7ED8DAFF768D9435C9ADD88FDD76C641E40A01A8115FD2AFFB51A751523B04A40FE6B3F0112BEF8FDDF7F17BB6EF1C3F12FDFFF456DF11A1D8F56E24F34176B9E685A30F4130C76C7FBF1054B10582140BF0A0F04DA10304DB6E1FEA4D53BD9DAC49ED0CA846C13F24B8D5A4B74E50EC620B044807E151B08B421609A6CC3FD5F5A9D94EBB4DBDAD08CA74DDF84ACEDD8B61EB1B06CCB5FEB082412A05F13412986406102A6C9C240D3AA0BE51A3FD977A55CEF0CBF6DC75AE1A4B9B47029D80B03551D027508387FA00E57B55E9240D6F75BCE1F38384642977CF4E2C59EDCD6E984ACA7C763C5C75E77C7DD4F47164CFF9B8ED9DAD9E267AF5E59EA1C1C2ACE1F3818B8E6105822E0FC01B181C01104B2F4ABF3078E70C9BFB4B159B9963AF46AE7515C715881DBDA8E8C16E7BF1E465B4308AC13A05F4508024710C8D2AFF65F0F70C9241C73935C432FD6BB7AE0760FC206ABA8D80362269AB0FF7A0C67AD20F09000FDFA10910208142090A55FEDBF1620BE5A45D6419E5153ECB61EFC637DEEC6F0F116D6F65187F567858DFB0B3AF420934622E0FCD791BCA92F8310F0994855474E1F69A534111224365C63391117811E9C691ACD45A3D1741870BB7E76C5E648A58D4EC5010529FD52661B818363609B919E420001E70F880104DA10304D56E21E0B83F8FD37E5ABA9908C91C5110AB2F9EFF261409811C6A4A8D8483C08756EFD532F7E2AD5AC5A04102848807E2D085355086410A03F326025179D4E757D583CF63B27E5DAD52A62DA8E0DC3A6DB651F6EC40AA1878EDE50A0AB90D860BF4710B80801FAF5228ED6CDEE0898268BBB2476251F7E1435EDB9C67E67B7FCC3B0302F652F562E41F1108A0AAD0A6A50552702C509D0AFC591AA10812402A6C9244C6985A65B09D673066ED902DD2AD7A77DBDEDC5AE67144CB9046990944A22708AF048EA8942080C4D807E1DDABD3AD73101D36429E74C1F8CAF8BD7F845BEB76C8194EE4F2A763D9D203A4EC2A6C04C2C636199084A3104DA12A05FDBF2D7FA750998268BF8FEE16947B7848122CD35A9E4613A4148D8F8644D4415F18E8565118C2A41A03601FAB53661F523304FC034B93F3252C4EB19B75D9F93993662D77309E2765C12B64850EDAF440D0820509B00FD5A9BB0FA119827406AEC8C8C87E275CA19D8D94A578FAFE712C42E2C09BBDF5F1696FB19AA01810308D0AF0740D6040233044C937BC2E2A1789D0E19D8D3449FCF4EB9044BB64D171C581AEDF11D7A7BE8791681C308D0AF87A1D610023F21609ADC1C10EBE2754A781D7879105D5B3F5D8B84DD1C5AF1E0C091B3078B6711E88D00FDDA9B47D8731502A6C9CD9E8E5FC9979E9DEEA31F9E6D74F0B357AF56D26157106DC67E91072D2C2FE268DD3C3B01FAF5EC1E64FF59099826B7796EE59CD749BC6EABF6744FAD7FD1E550ADCD0E1D7EF1B3998C0711E88A00FDDA953B18732102A6C90DCE8EEB6197CE790DF11A5B921BEA3CF5232BBBB0012A709DBA774D8CB7B06C825DA308E412A05F7389298F401902A6C95C8EA1C696AE879DC4EB059704EB8904818B84CD0DB30B46512E22E511E88100FDDA8317D8704502A6C92CAF87DC5F12AF51CF35C5EB047092B04B30039A95526EA46595571801049A10A05F9B60D72802AF51155941B0F241D2D8A70DA4509A4E24582AE95BAE1486B732169659B81446A01501FAB51579ED5E9D8069323D0256D25E89D7DB2E6CDCD7308B54226C7AA445490BCB2C5C0A23D08A00FDDA8ABC76AF4EC0349918012B9903A1D82C036E18E36A8325092B8B2031D8A298884A67A524020D09D0AF0DE16BFAD2044C9389EE5FFAF93BBED91AF286AD442CB3C502C8D2A1B0B20812C15A582682520C81B604E8D7B6FCB57E5D02A6C914DFAF640E5CE7A8D71450B7324BDF72C92248C4686199084A3104DA12A05FDBF2D7FA75099826537CBF74E6C0D20FE529758E5D26E26A258B60ECBE17E99D8565118C2A41A03601FAB53661F523304FC034F93032E2AAADD9323207D6D1AD6411380EF661D459583E44A400023D10A05F7BF0021BAE48C034B9EEF5D0F74B576DC91C78F8C22C21F221D7437416960F112980400F04E8D71EBCC0862B12304DAE7B7DE97B239903896FCB12A80FDE7D2FB1866B16B3B0BCA6DFF5FA7404E8D7D3B98CC18310304DAE387269F355E6407AF42F6511D8827DB8F19F0E594904106845807E6D455EBB572760FF75250296365F572E4ABD7A3CCDF5FFCB6FBE9DC5620B76255A2C2CBD4A089C8200FD7A0A3731724002A6C925A7AE6CBE8296F526AC6CC166D573A9C216969772B7CE9E9700FD7A5EDFB1FCDC044C934BFE5BDA1DB4F9BA21E297A039886009A635D28630F30802C713A05F8F67AE45047E24609A5C8A83D9335F23F315B10D6F4E409BBD916BE960DD0D4D0CF68885E5600ED59D5109D0AFA37A56BF7A27609A9CF5D0D2BEE0522A67EF6EEEC0BE2574B660679D6399D441CC320181C704E8D7C78C9440A00601D3E42CD5F7DF797BF6DF472A670D2F5CA1CE25744BA8AFC064A58F1696170F00DD3F0B01FAF52C9E62E768044C93CF3DBAF4E596335F7746FF2CC0A5EB2176B675F6C72D2CCFEE41F65F8400FD7A1147EB6677044C93CF5DB2F4E5D6175F7FD59DFF4E65D012402904B38BA853F996B1085C9400FD7A51C7EB767302F65F9FBB60F6176D5F6EED8FD5A5AFB8A4103C676B61B93FDED480C00104E8D703206B02811902A6C93B284BC903BEDC2AF2FECC62944260FFB54874A90481E309D0AFC733D722023F12B0FF9A180792071241AD175BC2280EEFB859581689379520509B00FD5A9BB0FA119827609ABCE3329BFC2A79A0D4FBB39442E02ED9E7BF039462AE1E0410A847807EADC756CD08AC11B0EF754767F6447DC90305DFA259985260EDBF168C315521701801FAF530D41A42E02704ECBF3EC5B1A4E6250F147C6D66614A81B5FF5A30C65485C06104E8D7C3506B08819F10B0FF2A203A21E014ADA78EB0B0EC242C9981C03A01FA558420D0868069F22977C9AF0744E1520AEC014D9FA8090BCB13398BA9572640BF5ED9FBFADE928069F229FDD92C4CC9AFC503540AEC43A416960F112980400F04E8D71EBCC0862B12304D5ED1EBFADC3D010BCBEE5DC440047E2440BF8A0304DA10304D3EE53EFB15918FB78A87A64FB81E22B5B07C884801047A2040BFF6E005365C918069F2E67552BEF90BC005A2B179103200812C02F46B162E851128468062788892C47F8828B700A40F8941F410910208F440807EEDC10B6CB82201D3E4E4F5D0F11FBD78F13C02E2E62D12BFF88BB184345C80F62D208B6357210208142740BF1647AA42049208900B41E04F1FBEF1F1CB97B3C9AFF12FE33F399A342998D20A05CC403A5B76A21DEE1096169669D1A414028D09D0AF8D1DA0F9CB12B8F834193A6949B93E0D89B8543644D56583A454C7A7A5C2EC0DBD4F9B9854ECC525ECC5BB5F2AE4D483406D02F46B6DC2EA47609EC095A7C949BC264646882A123691D552B1480F48BF27F6E212F6E20BCB9D91E671040E2340BF1E865A4308FC84C095A7C9D984D795F808ED259160F3FB13E8D2C5EBD44AAE8336DBD6E183575E5876E80E2621B044807E151B08B42170D96972839C0A0FC56FDF9725B6274003DAC3B481E7F55F79C170E585E59E48F32C020713A05F0F06AE3904FE46E0B2D3E40639655370F36BB3792775B39B369BDAC98396499D38821908AC13A05F4508026D085C6D9A8CFEC6CEEB52266B9C96F5C9E79FFFDFFFCFFF1BFFFF872FFF38EB92D814BC1AB49DA119B896320702F20D78C09F6D289C152EBB1AF3CB2E2C77069BC711389800FD7A3070CD2170B9FDD7DB3959B1A5372BA7423FFDF7FFF9FB7FFAEE9F034DFCFFFFF8C77F0C692550EA1108BC01F9063CE0CF4AD87056B8EC6AE76A5D4DAFD70B333523509500FD5A15AFCA11582470856972FD84D71B9ACF5EBDBAC314D26A56517DF0EE7B422A9DC02CAE003B29D7A7FFFBF29B6F57AABDD4E9B0F65FD3034C49041A12A05F1BC2D7F4A5090C3F4D4EA7E5E77EF97E8B89754575E9D0D9D7F959B05F7CFDD5C35A2F72A3C41516960F7DAD0002FD13A05FFBF7110BC72430F63499725AFE987E1DBD57C3DF2831FCC272F408D5BFAB10A05FAFE269FDEC8DC0C0D36488D7CDDBAEBDB9893DCF098C7DA3C4D80B4BF18CC03004E8D7615CA923272330EA3449BC9E2C1037993BB0841D7861B9C9D51E42A05302F46BA78E61D6F004869C26B7DD4D30BCAF87ECE0A8771C8CBAB01C320875EACA04E8D72B7B5FDF5B12186F9A0CF1BA72E8FD74C26B4BE2DACE27102E5B3A1D362A0B778F77AFEF900BCB7CCF7B0281DE09D0AFBD7B887DA312186C9A5CBFA7344ECBBF9DF03AAA4387EC579CB4158E5BBA516292B083ADC406EBCE9061A953080401FA551820D086C060D3E4CA3DA5D369F96D286BB50481F51B25365F515BC2B4F2750CB6B02C0F488D08F441807EEDC30FACB81E8191A6C9957B4A43BC3E3F2DFF7ADE3E7D8FC38917B9D777B085E5E9234F0710582040BF0A0D04DA1018699A5CDA810BC543BCB609AF0AADC62EEC92841D690B76A485658528502502BD10A05F7BF1043BAE4660986972E9CC81F8EE47DAC060511D0E9DFD9C2BCE2218663D364C47068B3DDD41E08E00FD2A24106843609869F2FD77DE9E25F8D9AB576DC86AB5268125B70EB3053BCCC2B26614A81B81F604E8D7F63E60C135098C314D2E65BECA1C1835AA232164EC2DD8611696A346A07E213011A05F4502026D088C314D7EF0EE7BB3F8640EB489AA435A5DDA825D0A86438C2AD6C8180BCB6238548440AF04E8D75E3DC3AED1098C314DCE5E58B0725CE8E85EBD44FF96B660576EAF3811973116962702CE5404B611A05FB771F314027B090C304D2E75E18BAFBFDA4BC7F37D1358DA821D20AAC75858F61D3EAC43A00001FAB500445520B081C000D3E4D2EFC5CECCDA100FE77A64C9C503A4100C20C1CF154BAC45601B01FA751B374F21B097C000D3E4ECC9039207F646C6499E9F75F4D2611427E9D38F660EB0B03C116DA622B09900FDBA199D0711D845608069324EFD7C8E40F2C0AEB038CFC3B38E9E0D89F3F4E9474B0758589E0B386B11D846807EDDC6CD5308EC2570F669F2ECF6EFF59FE717089C3D300658588A4D04AE40807EBD8297F5B14702679F2625BFF6185507DA346A0AECD9F5F78121A029045A12A05F5BD2D7F695090C394DCE9E6C7F652F8FDDF721DD7DF685E5D821A77708DC08D0AF8201813604CE3E4DCE7EA9F3E537DFB6A1A9D5160466DD7DF64FB8865C58B6880E6D22509700FD5A97AFDA115822609A141B087448E0EC0BCB0E913209811A04E8D71A54D589C06302434E930E1F78ECF8814A0CE96E0BCB81225457462640BF8EEC5D7DEB99C0D9A7C9014E4AEA393CCE6BDBD90363C885E579C389E5082C11A05FC506026D089826DB70D72A02AB04CEBEB0E45E042E42807EBD88A375B33B02A6C9EE5CC22004DCBF250610380901FAF5248E62E67004ECBF0EE7521D1A818085E5085ED4870B10A05F2FE0645DEC92C0D9A7C921CFFEEC32524E66D4D903C3C2F26401C7DCAB12A05FAFEA79FD6E4DC034D9DA03DA476086C0D917969C8AC04508D0AF1771B46E764760C86972E952D9EEE833A8048121DD6D61592234D481407502F46B75C41A406096C0D9A749576D09EC5902670F8C211796621581F108D0AFE3F9548FCE4160C869F2EC77879E2374BAB17248779F7D61D94D74300481BA04E8D7BA7CD58EC01201D3A4D840A04302432E2C3BE4CC24047612A05F7702F438021B099C7D9A9CBD3BF4EC772F6DF4E5551F9B75F7D92F95B5B0BC6A38EBF7C908D0AF27731873872170F66972C9FE7FFFD6BF1BC6473AB24260C9D1670FECB32F2C052D02172140BF5EC4D1BAD91D8101A6C9D9933E87FC26BDBBE8E9C0A059479FFDF0D7E07A76FDDD41683001812308D0AF4750D60602CF090C304DCE7E69FECBF77FC1DD572030EBE8B31F3E108E1B60617985F0D34704E8573180401B02034C934B998E5208DA84D481AD2EB9F8ECC9AFF65F0F0C224D21B08B00FDBA0B9F8711D84C6080FDD7A52E7CF4E2C5662C1E3C058125170F10D5032C2C4F11428C44602701FA7527408F23B091C018D3E41FBEFCE3F3FE3B8560634C9CE7B15917CF06C379FAF4374B0790E0A763CE60043610A05F3740F3080205088C314D2EFD5EFC9FFEEEEF0A3052459704969C3B40F240F01E6361D965E0300A819204E8D79234D585403A8131A6C950E1B39F9CC7C73DB260D383E14425C3ADB35F6E45188CB1241BA317278A28A622B08D00FDBA8D9BA710D84B609869F2B357AF6659C882DD1B225D3EBFE4D6A530E8B2136B468DB1B03C1D760623904B807ECD25A63C0265080C334D2E6DC1468AA42C8232B1D24D2DE1D0D9CCD761365F83F4300BCB6EA2862108542140BF56C1AA52041E1218699A5CDA7B8B1F9A49D887917096024B990361FF309BAFD19761169667892B7622B08D00FDBA8D9BA710D84B60A46972690B36184984DD1B287D3C1FE2F5E3972F676D1969F3D5FE6B1FE1C60A041E13A05F1F335202811A0446DA7F5DDF810BDD6317B646081D5667B86F49BC0EB6F96AFFF5B0A0D210023B09D0AF3B017A1C818D0446DA7F9D76AD568EFF8C5DD8FFF21F7FE544828DB1D2EEB17059386EE54EE070FA602BB1C1BAD32E76B48C405D02F46B5DBE6A476089C078D3E4AFFEE1AD15091BDFFDACECE189933E0984CB566EA3087787D3FBB47CB355832D2C3773F020029D13A05F3B7710F3862530E434196A66F638D861BD78E18E85A3C713AFD32F0917F6AAAE23701A02F4EB695CC5D0C1088C3A4DFEFC777F2161078BD5E7DD091787A387ECE6900BCB213DA553172740BF5E3C0074BF198181A74912B659541DD2F0C0E2D5FEEB2111A411040A10A05F0B405405021B088CBAFF3AA10809BB920BBB0197473A21106E1D75E775223CF0C2B293106206024508D0AF4530AA04816C02C34F93911CF9C9E79FA7E4127CF0EE7BCFF1BDFFCEDBD94C3D90406033D870653874C89CD7A7D8C65E5826048822089C8300FD7A0E3FB1723C02579826A38FB157F750C53E5754716CD3EC67EF5F7CFDD5789150AF47B3B802ECF383CC3E7AF162C58C49B9862BAF10B4C32F2CEBC59B9A11389200FD7A246D6D21F06F04AE334DDE546CFCF43CBB1D1B8AEA763A6C48AB95D3F2AFA09F0E7849A61B2526153B9DF03ABB5A086785CBAEA35C27F262EC8008D40402FB09BCFEDA277FDE5F8B1A10402008FCE9C337560ECBBC43F4E6A7DF5F13DA0FBFFED9B68E8FFDD9D036260F9FCA8A49211A046261997E50B1987C18810A20B087C05F7FF3CEEBBFFD66AAE1E9DFE31FEDBFEE01EB5904B613B8CEFEEB1DA3CDDF757DF6EAD576DC577D7233B4CD6E3A3B69FBAF67F720FB2F42807EBD88A375B33B02979D26B77D00141B5D9725B62776035ACA2774CF9BB86CAAF16517967BC2CCB3081C4F807E3D9EB91611F891C095A7C948A9CC0A02BFD266E1BA2BBCE138DE70D065570B97EDF89E18F32C02C713A05F8F67AE45047E2470E56932FA9E2E6189D7FD2F4C6411A4EFC25E59BC5E7C61B93FD2D480C06104E8D7C3506B08819F10B8F2FEEB24DF1F9EAB15C5863F2DFF98B7623A02E2614AEB744ED6955756175F581E138D5A41A00801FAB508469520904DE0E22A61120A4BA7C3DE4E6EDA962C9BED8C6B3C1030E3D48BA58DD8AB9D93B5E4F38B2F2CAFF12AE8E508049C9F358217F5A11302596715D9E8BAF3DA4D3750F655E3F9F77FFFDD2FDFFFC55D13B1356BA97063927EC49BE496AAB1AA72049C9F250610E88E009576E7920032FDE9CE556319B4F9FED8B1302CF6C6FEEB451CAD9B6727207FE0EC1E64FF59099826CFEAB993DB9D7EC5C6C93BBAD17C2BA88DE03C86C0B104E8D763796B0D817F25609A140BFD10B8EC69AFCF5D6061D94F58B204811502F4ABF040A00D01D3641BEED76E7529EAACA66E7101C5B55F11BD3F0D01FAF534AE62E860044C938339F414DDF9E0DDF79EDB997E34EC29FAB8D3480BCB9D003D8EC03104E8D763386B05817B02A64931713C81E7270F840D5F7EF3EDF19674DBA28565B7AE6118024F09D0AFE2018136044C936DB85FB8554BA614E7A394424919049A13A05F9BBB80011725609ABCA8E3DB757B367920CCF1F1D6539F5858B68B502D239041807ECD80A52802050998260BC254550A81D9E481487E158A4FE95958A6C4923208342740BF367701032E4AC0347951C737EA765CBB35DBB2E4D73B2CD47CA308D52C027904E8D73C5E4A23508A8069B21449F53C24108BA5D9CDD778D0B5B177F42C2C1F86930208F440807EEDC10B6CB82201D3E415BDDEA8CF1FBD7831DBF21FBEFC63238BFA6DD6C2B25FDFB00C812704E857E180401B02A6C936DCAFD76A640E2CDD19EBCBADE7E1606179BD57448F4F49E0F5D73EF9F3290D673402FD11F8D3876FA45F2EFFC9E79F93B0FDF9F081457BC44D137787C11FBF7CB9B4F92A796096CC0FBFFE596264C6D76F3FFFDD5F120B2B860002B904FEFA9B775EFFED37D3534FFF1EFF48BFE6C2541E81450259FAF5CD4FBF87F214044202C6EFEFE92B93954E85DC89EFA50E538D2BE2358CB4829AF5D43AB4BB47E8D753BCC28C3C2F8115FD2A7FE0BC6E65F9B909ECD9C93B77CFCF637DF828D624B17F5944BC46BFA39EF88E2AB6F7964E0328C8269A58DA79255E573837D9262FE8775521701102F4EB451CAD9BDD11304D76E7929F1A34EDC39552AE779D0D151BCAB81E81A87CE9C08168D499AF2BE42D2CEB85A59A112848807E2D085355086410304D66C03ABC68D68FC8DBAC0B655C43C2C6B66BECEFAEC86E3F79AFFBCBC2725B3C7B0A818309D0AF0703D71C027F23609AEC36140E10AF53DF4365164C2498B21D56B65DA79DD7CF5EBDEA967C0F865958F6E0053620F09000FDFA109102085421609AAC82B544A54BA7A596A8FBBE8E909B3B23211E0F119C92A73B89570B27FBAF3522599D081C4C807E3D18B8E610B0FFDA750C841CAC94F3BAD4ED0FDE7D2F9148D836FD09C13A69D648158824DD10C10F6D9ED20688D787A8772E271ED6AF0002081421E0FCAC22185582C08F04B2CECF727A519F4113BA70F627F869F3F29FBEFBE76D66FFFBB7FE5DE8D4F51FF7B7D59CF254DCB375D8A15D29F6745EC6F9AF9D3B8879D721E0FCACEBF85A4F4F43C04E589FAE7AFF9DB79F1B16E2F5BFFFCFDF6F16AF51613CFB3FFEF11F63D17270AFC3F26894784DC76EFF359D9592083424207FA0217C4D5F9A8069F244EE2FF5CD53A8D8109487753CB65DE50CE4D2B6B0CC25A63C024D08D0AF4DB06B1481D74C937D06C1C344D29D66C7FD5B3B6B48793C946B5CF066DB3585D55D190BCB0DD03C82C0F104E8D7E3996B11811F099826FB8C83D9FDD1F44FAC1E766A363FE1E1538905C278CA3591D552310BCB9D003D8EC03104E8D763386B05817B02A6C913C54429D1195F71D5D8DF9D646BE4B946B6803DD79D716561B913A0C711388600FD7A0C67AD20704FC034D9674CCCFEBE1FA2F3BFFCC75F85FADC6C733CFB9FFEEEEFE2ACABCD35C483A15327A97AFB139A35F20426D96A45B487EDED59188B60540902B509383FAB3661F55F8840D6F959213B2E84E63C5D3DECF2AD1B12875B75151D5901E032DEAE7CC798F108383F6B3C9FEAD1E909D87FEDD385B1FD76E4110101E18BAFBFEA13C535ADB2FF7A4DBFEBF5E908C81F389DCB183C0801D364B78E8C9FE30FB32D365F45C261B4531AB2B04CA1A40C02CD09D0AFCD5DC0808B12304DF6ECF8632E1A888D5E9F5BF516069613BD79843D08CC12A05F0506026D089826DB704F6B35BC535BC24E17D2A699A3D471042C2C8F63AD25047610A05F77C0F328023B08982677C03BE2D149C256CA857533D6112EDCD48685E5266C1E42E06802F4EBD1C4B587C044C034D97F24848F2217B6A08A75BF40FF4EB7B0ECDF472C442008383F4B1820508C40D6F959A18A48D862E88FAA688FB8E1EEA3BCB4B79D1F7EFDB3C42A9C9F95084A3104B61158393F8B7EDD86D45308CC10C8D2AFCE7F1543087448C0F9AF1D3A85499725E0FCD7CBBA5EC7FB25B06727AFDF5EB10C819313B04D7E720732FF2A04E4BF5EC5D3FAD91B01D3646F1E610F0241C0C2521820700A02F4EB29DCC4C8010998260774AA2E9D9F8085E5F97DA807972040BF5EC2CD3AD92101D364874E61120216966200815310A05F4FE126460E48E0F77FFFDD80BDD225044E4EE08377DF3B790F988FC02508D0AF9770B34E7648E097EFFF228EE9B1D9D3A16B98744D02B1A48C2344E2C5BC66F7F51A817311A05FCFE52FD68E46E0E3972F63CAA46247F3ABFE9C8A40BC8093727DEBCD374F65386311B82E01FAF5BABED7F34E08C494192A563A4127EE60C6A50884728D572F5E40CAF5527ED7D90108D0AF03385117462030A51350B123F8521F4E426052AE12064EE22E6622F01302F4AB8040A0230231954A27E8C81F4C1994C02D6160D0FEE91602E313A05FC7F7B11E9E8BC0944E40C59ECB6BAC3D0B8149B94A18388BBFD889C01201FA556C20D0230149B13D7A854D272720D5F5E40E643E02FF46807E150D08F44B40526CBFBE61D9A90884728DFC72A9AEA7721A6311582340BF8A0F048A11F8ECD5ABEF7EF8A15875FF5A91A4D8E24855781D02F5525DE3658F57FE3A24F51481AE08BCFEDA277FEECA20C620707602315F7EF4E2458DE378FEF0E51FBFF8FA2B17CF9E3D42D87F0C817813E332AD1A7BAE9372F5261EE347AD5C99C05F7FF3CEEBBFFD6622F0F4EFF18FF4EB950343DF2B1288DF2B6B4C9C6171A8D85FFDC35B154D573502E727E0053CBF0FF500819F68D63BFD2A7F407C2050854048CC373FFD3EB466F1DAA5131447AAC29108D4BB06365EE74F3EFFDCEA71A468D197F312A05FCFEB3B969F80404C7531E1154F8A75C6D6097CCFC4C309D4BB06365EE149B9CA1938DCAB1A44609E80FC019181C01104624FE8FD77DEAE94146B43E808176AA36F02951206A4BAF6ED76D60D4E6025FFD5FEEBE0BED7BD4E0884C4FCF9EFFE52299DC0C5B39D7899194D08D43B1B2B5ED8786DEDB93671AB4611582740BF8A10048E2350299D203A2029F6382F6AA91B02F5CEC60AE51AF9EB7ED9E8C6D50C41E09E00FD2A2610389440ECE5C48E8EA4D843A16B6C3802F5AE81BDA5BA0EC74C8710188A00FD3A943B75E62C0426155B239DC0C5B3678901766E2650E91AD849B94A18D8EC170F22702401FAF548DADA42E027046A9FB115D33CE2088C4440AAEB48DED41704F610A05FF7D0F32C020508544A8A8D8D5849B105DCA38A3E08544D7575AA6B1F4E66050219049C9F95014B5104AA1270F16C55BC2A3F2F813F7DF8468DB3E79C8D75DE9060F94508383FEB228ED6CD7313A897141B1BB11FBF7C299DE0DCF17149EBA784811AE2D5D958970C289D1E8780FC81717CA9276310A89A141B52207679C700A5176313A87A0DACB3B1C60E1EBDBB0201FAF50A5ED6C7F311A894141B206223367E8DA562CF171397B1F8806B602FC3524711189680FCD7615DAB636310A89A14EB78F6318264985E44B47FF0EE7B91EE52BC47525D8B23552102071058C97FA55F0FE0AF0904F612A874B77B9815598054EC5EF778BE0401415E82A23A10188A80EFB78672A7CE5C90C0944E50E3BE03676C5D309C7AEB72D5B3B1A4BAF6E66EF620508480FCD722185582407502713A41A5A4D8E9CA2E49B1D55DA88167045C032B281040601B01FA751B374F21D086C0ED8CADC8E72B6B818B67CBF254DB430295AE818D765D03FB10BE02089C9D00FD7A760FB2FF8A046223366E69AF944E10676C3929F68A5175609FAB5E031B0903B1CC3BB0379A4200810604E8D706D03589401102D349B1C53762C33649B1451CA492E704AAA6BABA0656C821701D02F4EB757CADA76312888DD898B68BABD85B3A819362C78C9BC37B7540AAAB6DD7C3BDAA41049A11707E5633F41A46A02C01C70F95E5A9B682042A05672CDBBEFCE65B07C015F494AA10E88A80F3B3BA72076310A842A0EAC5B34E27A8E2B30B545AF51AD8F8F18178BD4010E922023304E40F080B048622E08CADA1DC79E6CEB806F6CCDE633B02BD13903FD0BB87D887C03602552F9EFDE2EBAFE41A6EF3CB159E720DEC15BCAC8F081C40C0FDB10740D604023D12A89477185D75F16C8FFEEEC0A64A2127D5B503DF320181A309C87F3D9AB8F610E88480A4D84E1C710533AA9E8D25D5F50A21A48F08A41390FF9ACE4A4904CE4A4052EC593D7712BB0F381BEB2424988900020711A05F0F02AD1904DA12982E9EAD7A526CDB0E6ABD15814AD7C046C2806B605BF954BB08F44F807EEDDF472C44A0188149C5BA78B618D06B5754F51AD80854DF085E3BBEF41E813502F4ABF840E0720424C55ECEE5A53B5C35D5356E4576AA6B698FA90F81D108D0AFA379547F1048242029361194624F094875150F0820D00301E7BFF6E0053620D09240FC0AFCFE3B6FBFF5E69BC58D70C65671A46D2BAC7736D667AF5EC91668EB5CAD23D02101E76775E8142621D00B81D8889514DB8B337AB543AA6BAF9E6117021725207FE0A28ED76D04EE08544A2788567EF9FE2FFEF4E11BF1BB33E667245035D5354E1890EA7AC6A8603302CD09C81F68EE020620D017817A17CFC689487E26EECBD9ABD6B806F644CE622A024312707FEC906ED529042A12A894E918164B8AADE8B672550B80722CD58400021B09C87FDD08CE63085C9640D533B67EF8F5CFA413741B5A5513069C8DD5ADDF1986C0B908C87F3D97BF588BC0A104EA25C57EFCF2A5A4D8437D99D098B3B11220298200025D1090FFDA851B188140E704EA25C54A27E8C1F5525D7BF0021B1040E08E80FC57218100020508C8892C00B1BF2AB8B53F9FB00801047E2420FF551C208040010292620B40ECA90AA9AE3D79832D0820904140FE6B062C4511402008488A1D200CA4BA0EE0445D40E0CA04E8D72B7B5FDF11D84820AEFAAC7465575C631B9F76C52FDA1B2DF3580281C01B906BDC181CF7114460B80936C1098A2080C02E02F4EB2E7C1E46E0CA046AA71350B1C5A3ABEA35B0713616E55ADC652A4400815902F4ABC04000815D04EAA513B8787697637EFA70D55457D7C016F494AA1040208580F3B35228298300028F09D43B63CBC5B38FE92F977036D61E7A9E45008186049C9FD510BEA611B81601873175E5EF4AEE8815C597DF7C1B5BEF5D7596310820301801E7670DE650DD41A05F02533A41DC4A50DCC4299D40526C22D8AA0903F19116F19AE808C51040A00601F9AF35A8AA13814B13888F782A25C5C627F392621FC696B3B11E2252000104CE4E807E3DBB07D98F40A7049CB1D5C43195CEC68A840167633571A8461140609600FD2A301040A02201676C5584FBD3AA2B9D8D15CA35B2419CEA7A981F358400022904E8D7144ACA2080C02E0295D209C226E9040141AAEBAEE8F43002089C9000FD7A42A7311981131298D209E237E8D8CF2B6BFE7465577CDA1532AE6CCDFDD726D5B57F1FB11001046A10A05F6B5055270208CC1390145B3032A4BA1684A92A0410381701FAF55CFE622D0223109014BBD38B95525DC32AA9AE3B5DE3710410388600FD7A0C67AD2080C03D0149B11B62A26AAAEB9B9F7EEF54D70D4EF10802081C4F807E3D9EB9161140E06F0424C5A6874228D7AA0903946BBA2F94440081E6045E7FED933F3737820108208040A59B4E036CFC267E767156094E7C4BF7D9AB57B18A107E082080408704DC1FDBA153988400023F21503529F6BC17CF86720DE3E398B0E2E122D5B53852152280C06104E40F1C865A430820F09840A5A4D8335E3C7B4B750DE31F83CB2911CA350E323BFB9E744E8F95450081D108C81F18CDA3FA83C0180442BD7DF4E24571E91670FA4F2788BE7FF0EE7B35F65C250C8CF176E805021721B0923F40BF5E24067413815312A894F7D9B38ABD60974F199A8C460081FA04E4BFD667AC050410A840604A27881DD3E2757778F1ACB3B18A7B59850820302A01F9AFA37A56BF101884407C1D5F2F29B6938B675D033B48B0EA0602081C4540FEC051A4B5830002BB09C46FEBEFBFF3F66049B1951206A4BAEE0E37152080406302F2071A3B40F308205084406CC4FEFC777FA9944EF0C3AF7F1652B2889D8995B80636119462082080C01D01F903420201044E46603A2936F6178BDB7D5852AC54D7E2BE532102085C8A00FD7A2977EB2C02E310888DD8F8B4ABB88A8DE484AA49B1525DC709413D4100817604E8D776ECB58C0002FB08C4A75D95D20926155B3C9D202A8C6A6BE4EF86940F146E82DD17509E460081D310A05F4FE32A862280C02C81535C3C5BF51AD8C8A6A05CBD1D0820702902F4EBA5DCADB3080C4BA0DE195B3B93625D033B6CCCE9180208B423E0FCAC76ECB58C0002150854BD78F68BAFBFCADAE9743656050FAB120104AE42C0FDB157F1B47E2280C044A092708C9AE3F4AED8EB7DC8B99201F1BDDA97DF7C9B62C0430B15400001043A27E0FCD7CE1DC43C0410284CA076526CECF22E595CF56CACF8488B782D1C2BAA430081131290FF7A42A731190104D208D44B8A9D3D63CBD958696E510A010410D84B807EDD4BD0F30820D03381E98CAD7A27C5DECED8AA743656240C381BABE700631B02083421E0FBAD26D8358A00020D0854CA49ADD413A9AE95C0AA160104CE4240FEEB593CC54E0410A848A05E526C71A3E32B31A9AEC5A9AA1001048621207F601857EA0802082411A894149BD47642A12961C0475A09A814410081EB12A05FAFEB7B3D47E0B204EA25C5EE412AD5750F3DCF2280C0A508D0AF9772B7CE2280C0BF1198546CFC52DF0394296120EB72841ECC6603020820D08400FDDA04BB461140A01702533A4143151B4DBFF9E9F712067A0908762080C01908D0AF67F0121B1140A02681D8F56C92142BD5B5A657D58D00022313A05F47F6AEBE2180403A815B3A41C8CAF4A7B69594EABA8D9BA7104000818900FD2A12104000817F23101BB1B59362A5BA0A38041040602701FA7527408F2380C080042AA51384727536D680E1A24B0820703801FAF570E41A4400813310287BC6D62DD5D5090367703E1B1140A07702F46BEF1E621F0208342450E48C2D09030D3DA8690410189200FD3AA45B750A01044A12D87CF1ACB3B14ABA415D082080C0BF12A05FC5020208209044202B29D6D958494C15420001043611A05F3761F31002085C92404A52ACB3B12E191A3A8D00028712A05F0FC5AD3104101880C04A52AC54D701FCAB0B0820D03F01FAB57F1FB11001047A247097142BD5B54727B1090104062540BF0EEA58DD42008143084C49B14E753D04B64610400081BF11A05F8502020820B08B40A41338D57517410F238000029904E8D74C608A23800002082080000208342540BF36C5AF71041040000104104000814C02F46B2630C5114000010410400001049A12A05F9BE2D738020820800002082080402601FA351398E2082080000208208000024D09D0AF4DF16B1C010410400001041040209300FD9A094C7104104000010410400081A604E8D7A6F8358E0002082080000208209049807ECD04A638020820800002082080405302F46B53FC1A47000104104000010410C82440BF6602531C010410400001041040A02901FAB5297E8D238000020820800002086412A05F3381298E000208208000020820D09400FDDA14BFC6114000010410400001043209D0AF99C01447000104104000010410684A807E6D8A5FE3082080000208208000029904E8D74C608A23800002082080000208342540BF36C5AF71041040000104104000814C02F46B2630C5114000010410400001049A12A05F9BE2D738020820800002082080402601FA351398E2082080000208208000024D09D0AF4DF16B1C010410400001041040209300FD9A094C7104104000010410400081A604E8D7A6F8358E0002082080000208209049807ECD04A638020820800002082080405302F46B53FC1A47000104104000010410C82440BF6602531C010410400001041040A02901FAB5297E8D238000020820800002086412A05F3381298E000208208000020820D09400FDDA14BFC6114000010410400001043209D0AF99C01447000104104000010410684A807E6D8A5FE3082080000208208000029904E8D74C608A23800002082080000208342540BF36C5AF71041040000104104000814C02F46B2630C5114000010410400001049A12A05F9BE2D738020820800002082080402601FA351398E2082080000208208000024D09D0AF4DF16B1C010410400001041040209300FD9A094C7104104000010410400081A604E8D7A6F8358E0002082080000208209049807ECD04A638020820800002082080405302F46B53FC1A47000104104000010410C82440BF6602531C010410400001041040A02901FAB5297E8D238000020820800002086412A05F3381298E000208208000020820D09400FDDA14BFC6114000010410400001043209D0AF99C01447000104104000010410684A807E6D8A5FE3082080000208208000029904E8D74C608A23800002082080000208342540BF36C5AF71041040000104104000814C02F46B2630C5114000010410400001049A12A05F9BE2D738020820800002082080402601FA351398E2082080000208208000024D09D0AF4DF16B1C010410400001041040209300FD9A094C7104104000010410400081A604E8D7A6F8358E0002082080000208209049807ECD04A638020820800002082080405302F46B53FC1A47000104104000010410C82440BF6602531C010410400001041040A02901FAB5297E8D238000020820800002086412A05F3381298E000208208000020820D09400FDDA14BFC6114000010410400001043209D0AF99C01447000104104000010410684A807E6D8A5FE3082080000208208000029904E8D74C608A23800002082080000208342540BF36C5AF71041040000104104000814C02F46B2630C5114000010410400001049A12A05F9BE2D738020820800002082080402601FA351398E2082080000208208000024D09D0AF4DF16B1C010410400001041040209300FD9A094C7104104000010410400081A604E8D7A6F8358E0002082080000208209049807ECD04A638020820800002082080405302F46B53FC1A47000104104000010410C82440BF6602531C010410400001041040A02901FAB5297E8D238000020820800002086412A05F3381298E000208208000020820D09400FDDA14BFC6114000010410400001043209D0AF99C01447000104104000010410684A807E6D8A5FE3082080000208208000029904E8D74C608A23800002082080000208342540BF36C5AF71041040000104104000814C02F46B2630C5114000010410400001049A12A05F9BE2D738020820800002082080402601FA351398E2082080000208208000024D09D0AF4DF16B1C010410400001041040209300FD9A094C7104104000010410400081A604E8D7A6F8358E0002082080000208209049807ECD04A638020820800002082080405302F46B53FC1A47000104104000010410C82440BF6602531C010410400001041040A02901FAB5297E8D238000020820800002086412A05F3381298E000208208000020820D09400FDDA14BFC6114000010410400001043209D0AF99C01447000104104000010410684A807E6D8A5FE3082080000208208000029904E8D74C608A23800002082080000208342540BF36C5AF71041040000104104000814C02F46B2630C5114000010410400001049A12A05F9BE2D738020820800002082080402601FA351398E2082080000208208000024D09D0AF4DF16B1C010410400001041040209300FD9A094C7104104000010410400081A604E8D7A6F8358E0002082080000208209049807ECD04A638020820800002082080405302F46B53FC1A47000104104000010410C82440BF6602531C010410400001041040A02901FAB5297E8D238000020820800002086412A05F3381298E000208208000020820D09400FDDA14BFC6114000010410400001043209D0AF99C01447000104104000010410684A807E6D8A5FE3082080000208208000029904E8D74C608A23800002082080000208342540BF36C5AF71041040000104104000814C02F46B2630C5114000010410400001049A12A05F9BE2D738020820800002082080402681D75FFBE4CF998FFCA4F87F7BF77F7DF0EE7BEFBFF3F6F46FDF7AF3CDF8FFEF7EF8E1CB6FBEFDE2EBAFFEEBD7FF614FE59E4500010410D843601AA2A3866994BE0DD1F1F718A5E3FF7FF50F6FEDA9BFAB67CD475DB9833108EC27F0D7DFBCF3FA6FBF99EA79FAF7F8C7EDFAF5F77FFF5D0C88D368B8F4BF10B29FBD7A35A9D818593E7EF9F2AEE4279F7FBE47E3FEE9C337960CD859F37EE86AD840603648A29E373FFD7E436D1EB92681A5285A1FA96E7A6EF3C27B73BBFB9B9EED5ACA103D3DF874A03E69CCA474B6F67C745274A733DBBC7F3A97ED317845BF6EC91F88613A02E897EFFF625DBC86C55120346B8C2C7BAC5F7976DA3F98FDDFB4E5E07FE722B0E4B508B9737584B5E722102355FC89312DFEC490F5C3AF7F1643DC015137B57BD7740C983B9B4E1FA227374D03F5315D2E1E18E99DAD3D1F15EF9A0A670998F705C644205BBFC6D81A23DD43E5FA946F4C099524EC2D6FE1B93B6313858F4F4760C96B7B36E94F0781C13D1098B44E08D99D5272435F260DBD79CCDC30443F55B1C7F77703A2DB231B3A5B6F3EDAD311CFA61330EFA7B31ABB649E7E8DC1225EFE0D44E2A9D9ADB59DBBA4D6611B7CD1F3233BE3A1E7AEB1EDA404F648C93D5D8E3173837ADE3C44DF4C8DFE9E45C26EEE6CA5F9688FBB3D9B4EC0BC9FCE6AEC9219FA3506B56DE2752238FBECCE5D52EBB0C1A273291ECE32A10EE60EDDB98D5D9B77437732CC52939BF5DC9D91598DEEECE0E6C73B9C8F36F7C5835904CCFB59B8062E9CA15F3F7AF1A23710D661BD7964A73D4BFBAFF2077682F5F84E02B1FC6EB5884A54933BF5DCE9246C87F3D1CE18F3782201F37E22A8E18BA5EAD758D9AFE4BCC6779D7FF8F28FF1C97F7C273EFD89BFC7BF897F5F95A0755855BCC7576EFFF578E65A4C24D05030A534FDFC7497A7FD7A3E3E4F43F44ADF531A4D4457BC589FF351F16EAA709680795F604C0452CFCFDA7C62C5FA4F5A3180EE397D70A5F29D358B8F2604961CEAFCAC26EE3869A34BE758AD9CA937EDAD4E4759AF2CD4D74FE5DBD06E347A6B7A3D3B6BBDE995913036117EFEBBBF2CB9325A0F9D7ABA5308FB9C8F4EFABE9CCE6CF3FEE95CB6C7E002E7676D1EE0429EAEACF2E5BFEEF1EB78CFDA7F1DCFA7A7E85124A8C49F18AC42EAAD8C5735BE2FBC351D8BB495A6577643573207A2C215F11AAE89D6A3C0D20F65EB7BBA0D3DDBE77CD410C8A59AB6FF7A2977AF7436297F6029F12B06C794C4C47509BBC71331F24EB90ACFFF3FC5B03D4D7BB60601F9AF35A8AA338BC0CA78B532716635B154389A8ED16CF6BFAEEC0A2FBD35A14A137FDD5ADFA02DD2B58295743B1F15ECA3AA560898F785C7442049BF2E8D8FE9BBA7E92537386692AACFFF7F43551E694BC0FE6B5BFE5A9F0884ECAB9DBBBF843AC6B1A55DD825DDB69478B0BEF37A67C0926EEE300BB6F3F9C84B740C01F3FE319C7B6E2549BFEE3F553E426D763EA8F17B5CCFB8D9B64EC0FEAB08E984C0EC37CE59F7B66CEEC8D2783BFB762C1DECB5FE6DD673DB9686E8E872AB831796009A8F3687960711188940927E2DA23267E783AAFBB223F9E9227DB1FF7A1147EBE60A8122B94F1B86D6CF5EBD9AB5AAC8F85FD0E345EC311F15F488AA10684220E9FC816DDFD5DEF567F69BC1F58F6A9FD6B064C32CB57A870F8419D347CAD1EEB41933ED2BC7681813C6D38967B6BF0FBF059EFD60629652BA257B026B6A256A78DAE55BAF673B9ED85CDC2D945832AB584A44D58BE715FF66F577E9BC855977DC22304025E63BDEBD597721FD34AAE3EF77819DE58E26859BF8377A5AA4DD89D8ECF7F5B3C3DA6C5C6D1E00676B5B1FB58E777111CE3BE7A3E7BD7E3E2017798F5A8D1B4B273CA40CB029537F944989D26EE7FDC9B9CFE7FDD99777CF1B5429AED65FDBC4793F2A29B2D85E37A6C0F903B30D64A546C52C185EBCFB73FCD8B7B9C5F068BCD2A12F23DB2C94EBED97C4E9EFD395E551E080DFDA522CD9795D50341135C4D039F5F7AECBC170EAF5ADE351F298BE6F76DFB91E7C1E454F9DBE1481D38DA389AE9F5C3C1BD237FF4EAE9F023BB1DA7371CEB576E5E0F4DCAA8A942F3EDACC661D1C9335B11F4893F9A8ABF7A8E0B8B114EA1B36BF97BE7ADCB0D8DE1F24B9352CCDB6D320596F786C12575367D3E7FDDBD4507C204A745352FEC04A6A54FAAC361DD472F7275DBC6F786D12113C2C768BE087E3781458BF2DFD610D0F8D09E0D1C4C37AE2BDDA26289F6A9A87C63C2D30F57D5BA3590DF55CF8A15F128D7FFA5EA487DF5479CA0FC753144D3A38C5A469A44E17C72975765EA6F65103EBDD4FF4CB5225C59541ABF969B6833DCC479361BDBD4705C78DA510CA7D2F2272668339F1FBC8B3CCFBD3845B6A4C3B3EAE7267995B4F0FDEBCBB239CA45FE399A5D5D8669D94EBE9945939B7CE94F2D3EF1759D3C94A2827BEB44B86C51BB27EC8F99DA08C0D89F48967DA704DD734B3464E2A36BDD114179CA8CC4EFFDE7A7A03981B7E61C0FA9A701AA7D2A3E80EFE61EF7B5BA72F5DEF545C17CE7633FDF5999DDDF70461AB6136D7DDCDE7A33EDFA3B2E3C66C20E57ECFB724409792ADEF22A1554026EE13DD4DB8FB256C93B8DAD0D9E72FEC6DF32E7DF8CA7DEB9F974FD5AF2B6134F0C6DBA41E36509E16251B1E5C7964FDCAC4253599F89BDA1E4DF3BCE92B4BD8224E9F34E886F05B9F1572D5F03597284BB7FBE47ED1BF3912D2CF87CADD0C7B68D2D2E2A7E136D8ACCD6DE7A36EDFA3B2E34691EFF9964234FDA7D787415BBCC0FAA5A12BCDC5BC3FFB8B74E2FE5793B8DADCD9590E217B12254711AFA5EAD7955309273B6E2A363DA3A04807EA55B2413D5435669B204E5C2E174FECDBA6FBEB013C57CDD31276C340B0322B948DE7C1962801E79670B6F4A21DB6F9BAED4DBF45F8CE7779CFF6ED616F59C3F9A8E7F7A8ECB8B13498A4AF9A9692070E5B0A6E08C89D7A6E164ECA3BD524AE767676166FE2CEFA06D76CDF7F8D2753AED17A9A2757761BF9F80D800DEAE1A14B12D761CFEBD9634CCAB335E6E66156320FDD7A2BB0D9BF774DFCD377FFBC61BB7D6556283B384ED6A6C4553ABA034A86E68E0C99D93FF19FD61382978EF72F6BF6F443DE6C9DB39921A5E2ED612FD225CBC3AA4A1568321F75FE1E151F3796BEE74B9CDCD37F49588A8A83E7FDE8D7CED5E3F459736E903789ABFD9D7DDECD87096CB964D6CB279D9FF5B48AA5633596C6DCD80CA8A18D6ECDA51F349305EEE1BA245EECA7E70A4DEF73BC6CEBD1BFEDFCAC68EBAEDAE7ADAF379D72E8C9D2815FD1AFE99490F8CBDDF701D3B94B2BAF6B4ABB4FFDB2F41A2F9D2795E5D35BE1A556B2ACDD703EDA736B572C79AE63A6B9E4EE34ABA8E1E68515FBD75FDBD983609ED6BCC479CFB930DB7C97F254D9C920FA183B0A293F776E8BABC4A123FDF0ACAC307ECEB34860A7B8A9489983E7A34EDEA3C3C68DA586528EBE0AFF2EE1DA3F9E579AF773FD9B3248068787E3E4C376FF8FFFEF3FFF5FFFFBFFF97CFE0D71B572C2DA7ABBEB2267D21877937EFCE36DBC8ABF3F9FFD770E3EB363C2CAF959D9FA351A78A8ED9E1B9118EE1B46B4B2C71FDE0C588989877D59E1B34DBFC653378DB8D2FACAB49D18554F7B7D2791575C13EDC656DCAC8A7DC8EAAEDA257489F627C6CF369D9162EAC3712AA59269BC7BCA330563746A4963AD07E44371B6E2DF30B5AC6B123DB85EACA07E4D21FF705DB4BF534B715563F43B977E3D723EEAE73D5AB2A4ECB831C5EDACB44A19E8766ADFF5B7E6B0C8BF99B13E143C14452B92BD555C2D89E6DC41EFB6779612151B06C3C2E7BF86E48F492B25A5E3666BBDC377B2CC4864B7F2C37774FCE176F2063EEB86A588D7699DB4F42B67E2AF30D30E5FFC7FBC6CD18B943DA7A9DD52292FFB6F864C747127C596FA7BF37884774AC84D5E58EAD4D28FBF51739C67F7D0CBD3C9774BC909A7CB2248777D22F9F40A37979C7DBF967EC36DF5C9F6E6DEED7C70C378BB6D3EEAE73D3A66DC98FCB27491F2C31482FDC9032B815163DE5FF26FCA20BC9ECDB26E6DABB82AB2E514B3C3ED052C2503D20784D4EFB7EE6ABC4D69596154E3F09D0DB9260FE92CE500C414FE70B29F2A8F62C5EF4F0FD40FA5F3CE8CFBA87F52AE0F113D8F87D948C84D9B5B1AF21E8E95B906572A9F1B8DEBEB8A69399B18724B3D5ACAA34D0FE6A9E6A5013AF103C14AC0AB56DBC979C6B99EAACAA4CFCA0F988FBA7A8F0E18376E8E5ED2CA0FF74496BE64DA39A04D86E58EB40FE376E57B8387BF50AD8F90EB4D7715570F292D15985EC0229ECDB261A37EBD392C8C8E5D8AF4CF0923ECB20E257DD8992C01FDB0B628B0249552E4E3C3FAF7581BA81FD61F05F6349152FF52999D5F3D4FD59E7DFF3517FEFA565991E5ECD22CB26195128FCC76F0E14CB627AEDA3EDBFC70C0ACDFF2DAB26ADE7AC467BDF9A8ABF7E88071E3E6CDA5DB22D6BFF488697456621699266A4C732B9BA0E9B26C69845C7935BA8AABB03377CBA9ED5BBF4BBF4EA64F1BC8B16F17436DCAFC5DF688FBE2EBB09DE72D577267FA0AA1D40051A923EBD50EAC84663BBED2DF52BB6EB32FC866653C1B5D3BBFD86D1269598D961DB2129B7EF8AB65FAB49AD8E218C52ACD475DBD47078C1B4F8361694E59F9596CC9C20DCBE6D9B02C3EEFCF5618EF60EE5B96FBBB6BC3B89A556B61CF745BF8297EF3DCF2FDD6FA30377D91F7704A2B95EA5BFC3BC4CDE9EA7758367C06B1FF03ACB06143BB290E7DBA324B1F3B72BD5CE4CBAA87D37091568A705EF1F8FE4F748343C12F99D6A976F515D736FF4E0357747365EC5AEF6629DAE99F4E1EF6154BEE8BFCF01D3CAC4091F9A894671FF63AF13DAA3D6E3CB73337D24A4DA34BC4CACEFB053F359BAD6AE9F5691B570FBF390BB327397E77E8CDC3302E5BA0F0F75BEBC6252E7F430315391F345D4BED615A6A53739BB51B56817B3A3B3D1BAF56382886ADE95CCCE95ED96D87DBA51BB3B46ACF5D04A7B758B664AE7F97FA9BF23B468AE587ED671FD6504AAFB7959906AEDB4F49B395D4B8B5217C1D7F42B3C69F902F599F4E6EEBE9FA53B33F20961A006B187CC07C7458782736547BDC788E74F607C0A595DE52F2C0E69F7D9EDB933BD2AE0749C1DDE2ACA92AD1DDFBDF9AD9861EEE8507E469EABF9D9C3D6DCDF6B33B5B207F6009EE948DB4F2C37770D9BF475D6AA6BFF5A2EC8B7107679BB5074F1E119D11A6936CDDFFE664D5B094D7B53F4EB2CCD85C38D7BF4BFD3DD8E39BFB7B7BF05C59530FFBBBF235F186296752A54B7F62908C3F9374CE9AFCA217B9F1F6B0E3031738663EDA0930F13D3A7EDCC81A990FD8863820F23737B1F9C19DC1B3F2F84A766F56A3778AB679A64145FD3A7199CE565862B46132B8ABAAAADCCC726DCF851329854C8C889CB65A9B74E78081AF49BF72E3FF6A472075E594DBC095B5E7D44F171235D092C1ADDEFD6300D69E8F8EE945D5A3A966BBB0B4B29A3D3E6F76E323FD138E14863D4769EC3E4C3FAADCFE74BB1F116EDDE39749CE4EBBB3457E4E4F71FDD332D5F56B34B6722EE9FE1DBE0ED73AB93E78587EBF9A49A134DD5DD9765CC85AE53FE456B5C04E9530D9B6DFB3EB7D2C62640AC6B6619362E18632FD4763F179F10A67CA6E988F7A7B8F6A8F1BB32FCBACD079FEE21F134229335AFA2B5FD6BFD34EFFD33F4BBFD4976D77A5BF2BE3F386E393671BDA76A672BA8F664B26E9D729E3E1E99FDCDF7357647E6E5577DD38D7C4D9ADB50F53B977C659E2E367DF7FCDF5EFFEDF1FD6C116D737897E1CA3D8D29E536DAFEDA41741B87350DD6940EDC78F9F8F7A7B8F9A4460E2726ED6B6E29F70E48EB47D8E939DC4D5B6E3939754EC911BB149FA75CAE17DFA67C3A53B95968C65D761E192E2153E7573D5CA374F1BEBE275FAB8249240A63F4B697C7B7E86B8599E38446EEE69C10797CE5BC96AE2ECE7DD6675F68C85FB7C611FBE2F9B519F6201D9F37CB4997CD6834DC68DA58360EFC4C0EC6FAAC5855AE72F6696373B293C6D1B4F07A1269E85BA24610F5B3F27E9D7AA7C772E25CBAEC3967ABA3FCFA12AC38795AF508A505BEADD7402E5F471490C5ED39F876DED29708AE9333A58EAFD5CEA6FA9FA977CB1F239D1E6FFB4C7EF9EDD46202B2B31A58903321753CC6858266B3EDAFCB2AC3C98D2F756E3C6C3C34D8F491E084407CCFB0734D1E7F83C7D4B3A69D9E976AA49CEA6AF19221131258CF797D9A85F37FC445549FAA4334D84B5E1ACE6C49A1B165BA1B4341446C866DD0857249567CFFE6B6DCDF7D47D5993DC8ADF6BEFA3ECE1D9305CFB69BAE11C960861F6D5DE66F6916F5062EF128BD59E8F7A7B8F6A8F1B4BD897DABDFD647C4CF240985776DE7FD8AFC438CC2DD65B5C3DB7FF76AAE094CE7B53B40FF91F33986CD4AFD1CFDA537862286C1BA937488A0D2913CF5B296E6D22A59562B3BA73C3AD95CDBB1601195F41DE4EF4A8FAFE2CED58E74228F5122DF9F7A4199CFBA3BA480D5543A8888551C9D2999A1BB2D09686B84AA95FA5084CF5947A95663BDBDB7B54AAB3B92E584A21B84D22C7240F84D9B9236D6E4FA7F2453665569AEE2DAE52284D8AF69669B024648F09D1EDFA35F727F54A93C1C375408A4B9E96597A45E385D93025DCB55EDCDADCDE254AEADC196B3F99FD1D9902F276A247FC84115A76B6DA9DA3C64A6773FD7BC0FA7BD6A422472FEF7759E7351C7F4AD106204BC1BC617C5E4AE9AEF4D3D986CEAE3CB2A1BF590674F51E1D306E2CC1995D2F4DFBDF4B53FCC373F2B31C3115CE1D69D79B5899F42BE9969B3D5DC555AE2326213BFB546DE93F35BA5DBFC6C34BFA60B63F95F4788D75D8520A410C9189422D82FE18FF2506DC12A5222FE74A066DA279B7629B9565918EA4585BB0B3D1DC01F9BE4BFB739B7F4F980E094E6175EA329D9CC891C270E9D3C92C372DA5AC15BC3329A52F7BCA64F537773EEAEA3D3A60DC5872C4CA103D3BA494159A37AB8ACFFB4B93FEE62BF712C7C9B67135DD55B473F6ACE4E294A160977E4DDF925C9AF5F71FAB5183DDCA7A3145C2F67090EA9DEF97286DD68BB7FAC3B36593B597D6A3EBD13C3B74AE7CF4BAAD95E8EC66D9376BFF01FB282B5B0B59F3FD64FF2DB6373C9B321E75526645BCEE1FB28AF771298AD2C7E7256F76D8D9157AE9FDDD301F75F51E1D306EAC709E5D2FC57ECDACA6ACB4FE293EEFAF4CFA31E6E72ABCF471B2615C4D6F41786DFAAD32B78FEBE358F11327669BDBA55FA3C6E8FFC39EAFCCFAFB3B597C1D36615ABFF676BA6DE2E92F26D3DFE35FC67F5AF925AB92B5C567C494DF97A7F56559F11A1D590A8915C114FF6916EC4A16C48656A630BE3554F0BB99E7EE2BFB8BEDD214127D49BF37655AA9DF623B5D2B140FCE4A1526BEC2FB87ACE2F6AF9CAEFD70BD3DBDC54BE352879D5DA757753EEAFF3D2A3B6E2CA19E1D579742A892493566D2A5497F5278893FBD6E18275BC5D5D35DFC9B8A9D844DFA18B5327AA457B2B9E4EBAF7DF2E7870FC724F7B04C4CE731D84564DFE275A2F074CA7F5E499CCE9018DF45F6F9D29B0B536B3826282DE58B448B4B7DCC327B76EB68A5DD956EC653D3ABF5D4476164C4FDD26AFBCEC5EBFD9D0DAA1547DFC5D8BA25EB4DAF6FB03D8DE4D9309E2C79BE50596934E5255A7FCB367C5477ABF0E111BF53979FFB3AFE4DB87B69499615990FC79052058A8C154BC6C417B84BFFA9C8FBBB0DC2C32E47F03C1F9C573C1B666C7879B7199FFB54CAAB54693E3AFE3D4AE96CBD7163A9E6C4C971CF903535FD30B05382277D987AD8AFA53971E738797C5CAD839D5E9FE8D4CAA410FF7565AB2E9DF9430FFEF537EFBCFEDB6FA6624FFF1EFF584CBF3E34E27981ACE03E388E4BBD3977BD6EA55FC38CA579B708D825EF6F9B028BA41E3E7C7FF64C0C51F9ECDCDFAD7EBDDB3CDEF0B6CE3EB2CDBFA55ACFD591FBDB5D0FAA86FAB5C678F5F00DDACF735B0D7BDEDC951653E6A3E3DFA3FD9D4DE957AE231287E8FD2194D8D0BAFDE966549A0D1F8E93C7C75511B065E7FDA5DA56F4EBDEFC81DCB8BF950F8FD6F82C71B33DCF1F8C4DC788FB821536AC6A255B6829FF26D7DA22F76F4D8DE69E7EF0DCD494BCBDCD06A7549E4BAF76F9F0726CA5174F1A9B64536DE33BA93F0226F1C7A22606AF64116CB0277DCADF5079878F24CE47DEA3F421BAC838B97F2EC80AB6B22FD1D3A6D7C7C983E36ACA7CCD229355B852D2F3731B36EAD7E94A86AC2EDD15CEED61EEE7A27B6CBB3DBB59C22EF1A991B5B3BFA7B9BE78DE6259A1BF19FB64D8ED279E75329B974F2BB8AAFA77E78916C587C86953A16749B7FFD5B8D5506313ABA079535511D23B87E5A99ECE95FA736E47CE47A77B8F768E1BB3519AB2EB71BAE4E9DB4B54763A4B1C278F8CAB7A32FDE0D163A37E8D5722C6CA6DDB39F1D486C5FDC1EBB0A712367E79CFEAE9CA5497554FF1E96DA9C29DD1BCC19B0FBBB6D9A449BC268AAA0DE3D47A67ABFA77FF7C105842719692382B99DC0FFD7BA202812B9CBE79B573704FF74BD81375F6C6F6E0F9E85CEFD1FE716336861F56DB6ACADEFFC64D1B284506F3E91ACB44938E8CAB1828A6BB61136D4B2C76F0E8B151BF4EB1BB612E4C5C8B24C23AAC58F43425A02769DEE154F7705F70DBB417FD0D719F2816739D35BD605983486E74E56EF4D650EAB958F697DF00F669A3DD06F97E327735DC946BA5082F6EF0D30DA4AC17677A70DBCE42A55E6455DB643EBAF87BB43ECD15491E881868F2BB6BB4BB5F4A6E1E270F8BABE8E34DC56E182EEEDED026A3C746FD7AFB49229DF5D4BDF4B548D6F87540E129A0A7254BF4E5E6EFE9EFD354D7EDCFA929D199B520BBF5B72AF9F441647374252EB5A3BFF5947A5586B395DF823925306E35DC209F4BCFA5E09DDEE2E9459E623BDC1D6FC4497B7A7B7112FD7B76CFB69A8F2EFE1EAD44D7C3DDD994B732CAB4DDC48D1120C68169C64F34F8B60EDC23068E8CAB49C53ED536E93D9D4A36143F49E70FA4F4E7769851149E76FB2697DF4E6138E94C90D2F7D932B9E7586D6EA8C683D35977D3AC70E7CDA7A7F0D4687AA9CE95002B62D24AFD1D6EA89725FFDCDD53FDB757B808E1B236AB2D91C014D8D3EB7C777AF1C0837393F9C87B941893672CF6F43DBA4D8BC78C9307C7D5F4A9D96DD078DAD99B8E3F72E8D87B7ED619A3ADB9CDB327C94D3F7037B78D01082080000208208040E7047A3C3FAB736493797BCE069A4D392DF5ABCA29E831120104104000010410A8416063FE6B0D537AAB733ACA38F1D6B83BE3F708DFDE38B0070104104000010410E88A00FDBAE88EB8F936FE5BCA85DACFC56B08DFD97ADB66A37715798C410001041040000104B611A05FE7B9C5B6EB2D0120FE326DC4A6ECAAAE5C4057EA48916D9EF6140208208000020820300601FA75DE8FCFEF2C898DD850B1F155D62464EFB46CFC63FCFBF8AF4B3BAFD1CCFE6BAEC68839BD400001041040000104F61028767ED61E237A7B76F6E8AB9D463A796027408F23800002082080C0A508387F20CFDDC52F8C0EF16AF335CF074A2380000208208000020B04E40FCC8089235AB3EEDB78185D215EAF767DC343260A208000020820800002DB08D0AFF3DC42C2C6AD68DB983E7DAAC9A5C0FBCD56030208208000020820D02D01FA75D135B7BB8F373B2F14F09E4B9037B7EB410410400001041040606002F4EB03E7DE546C7A4641940CE5FAE6A7DFC7B303878EAE2180000208208000024D08387F20037B1C92F5C1BBEFC503D3075EB7036227693BDD0D1B37144875CD60AA280208208000020820304760E5FC01FA55C8208000020820800002087447C0F959DDB9844108208000020820800002DB08C87FDDC6CD53082080000208208000026D08D0AF6DB86B15010410400001041040601B01FA751B374F21800002082080000208B42140BFB6E1AE55041040000104104000816D04E8D76DDC3C85000208208000020820D08600FDDA86BB5611400001041040000104B611A05FB771F314020820800002082080401B02F46B1BEE5A45000104104000010410D846807EDDC6CD53082080000208208000026D08D0AF6DB86B15010410400001041040601B81FF1FFB4A06ACBE6942F80000000049454E44AE426082504B0304140006000800000021002538FA35BB050000BB1B000015000000776F72642F7468656D652F7468656D65312E786D6CEC594D6F1B4518BE23F11F467B6FFD159B24AA53354EDC4093364AD2A21E5FEF8EBD53CFEEAC66C6497D6D7F01823B07242EA88044118706FE4C005138F42FF0CEECDADEB1278DDB0481441C293B33FBBCDF1FFBAE7DEBF6D38493632A1513693BA8DDAC0684A6A188583A68070F8FBA375603A234A4117091D27630A62AB8BDF1E107B7605DC734A104E953B50EED20D63A5BAF545488C7A06E8A8CA678AF2F64021AB7725089249C20DF8457EAD56AAB92004B039242826CF75103910227BB546B2A630A51B03191B1CDF15FAA953908B93C3412684138C393DD9D6AD31245C39AB92839E875B824C7C0DB41D57E82CAC6ADCA14C0758E1BAB290CF58BC4494038288D87EDA06B3F055D41100DEB17F1B700AE177173FC2C00C210CD5BD47965B3B6565B2BB02550BEF4F1DE5A6BB51C7C897F6301BFDAEC6C756A0EDE82F2E5CA02BEB1D9586DAC3A780BCA97CDB7DB5A02E5CBD632780B8A394B876FD77E0AE90BBEE38577BBA500CD5095524AE5F4A97612EC8E64C06D5A25F044C82EDEB7B105CD52A2C719ED433885910C52A1705BAD5737ABADEA0A5E277F2B4636AC532851E547A15A38326A10154A96E976F009720D4A9037A72FDE9CFE40DE9C7E7FF6ECE5D9B39FCE9E3F3F7BF69D877007D24199F0CF1F5FFEF5F5A91FA8CAC0D7AF3EFBF5E7CFFD405D06FEF6CBB77FBCFAF2F7175F21C5EB6FBEF050DC91D02B53E48EF270A63DB90CEE280656C675848C1890FBF4C403DED6B103BE3F060E1EDC26751DF548621FF001EF8E9E385A1EC672A49907782F4E1CE0168CD27D9AC63EA81155821E8DD2815FB61C95710700C73ED19DB9606E8F32CC67E663D989A9A3E53EC7F8C280A65413734F0C29F5903D66CC71EB1E0BA550A2AFC963463681793D72C47A4EEACC887658826119FB14C4683BBED97B443605F7B1DFA2C72E1273DF9F40943B6EBC0B230D895763487819B90B3AF629793896A1E370A5254AA75C90ED882AE5A37920C78EBAF700FB9137EC7B7C9CB848A9D9D087DC05219C9C13C34E0C49E6D599612E96B01FABA1101CC8BED05E25845B20668F7180F4DC703F62D409F779F5FC900D1C45666961EE8CA4AF10A8708B70CCFB405383ACCCB5E984A5D73DFBBA675FF7ECEB9E7DDDB3FFC33D7BD6A6ED743E99C12D9BC41DC81FF4FB2CA47622EF33CE0FF598D35D651BBC42F3A22E1EDA8D259ACEFF598CCB429C831B48B06B2285FE94E9F830860CC5D4AC84812A580F14C984C287843DF6F23637F001A3F3B3E6E47503D1A0F74454BC4395DF13A76CEC6E605F7027821A86C1B2C21A1F5D4E582D072E29AD66555B943635D92BCD5E0A6F62DD1030DF30D45AF55C34260A701A19BFE70C2661B9F210A918225AC4C8D8BD6848CDFA6D09B7AD5EECB592B435C3F612D296095259DCCA39E226D1BB4C94260C665132753B578E3C7577E404B56AD69B0109216B077D9CC7709964C84F9956057C90B6835017A65C58CCF306FBD3B2563DD76047442695DE0215E754F65641C4D399FEF5E68AF1C3D518E0E946CB69D158ADFD8B5AD84B39B4B4DFA7A13EE764B62DEE8991A6F2308E4E488F8FE401A0DE2655D19E88297C54D85C331B89156AEFE0CEADFCA20A3C5FC09973E0590C454F32253AB13087DBF55407BB2BA937DDCDE9FE9EA6D892BF2253CA69FC3F33C5642E0EB88DC82C431C03241093A3ED40481D0BEC4259CCC2AEC4C1C1CA42BD089685518970F3C5B6D1951ECFFA56CEC316144E2CFA800D8864D8E9742C29DDD7859D1730AB155DB1A88C8251D167A6EAAA2CBFF6E831E547A67A5BC6FE80C4936E5238C2E2E683E6EE0B67F406A650FFAB934F9E36EF3A1ECC04E5F4CB0A2B35FDD2A360ED722ABCE3A336EF580BE2EACDA51FB519BEA610F30F1B3793219FCDB747E200A34FF864A224988837F2C1839852CC573DD4393FCCA51956B9847F6A8C9A85602A77CED9E5E2B842674FC7A53967BF5DDCFB3BBB5839BE2EE791C7D595C512AD945E64EC6EE1972DD17B82B2B7F0FD68C4B5B2F6D1A7F852DA99FC3C817C72899674E36F000000FFFF0300504B0304140006000800000021002C822F6A3D0600005F14000011000000776F72642F73657474696E67732E786D6CB4585B6FDB36147E1FB0FF60E879A94589BAD8A83BE8BA6568DAA24E7F002DD131118914283A69F6EB77A84B6DA72745D6614FA1CE77EE179A276F7FFFDA368B07AE7BA1E4C6216F5C67C165A56A21EF36CE97DBF22A7616BD61B2668D927CE33CF1DEF9FDDDAFBFBC7D5CF7DC1860EB17A042F6EBB6DA380763BAF572D95707DEB2FE8DEAB80470AF74CB0C7CEABB65CBF4FDB1BBAA54DB312376A211E669E9B96EE84C6AD4C6396AB99E545CB5A2D2AA577B6345D66ABF17159FFECC12FA357647915C55C7964B33585C6ADE800F4AF607D1F5B3B6F667B5017898953CFC288887B699F91E89FB8A701F95AEBF49BCC63D2BD06955F1BE8702B5CDECA09027C3F43B45DF6CBF01DB5388832A1027EE703AF73CF8770ABC670AFAE635918CD07BB1D34C8F7D3285D156EBEB3BA934DB35D09510CE023C72DE415BFEAD54BB785C775C57501BE869D7759616D0BC550FFC13F4BA92ACB996A31DA8FF199A33C31359DF8A960F54660C0317EA5BDE76D02C7CA1D7A2DE38FABA26A3D2DE3C35FC1393BC1CB495A2315C83F90706F105AE4B1DF8604DB3B57CFDC671ED7775EC8D6A2F4856B934338958D2A0BABF965F7A3E311D38B3837921288FED8EEBE75463F37241A985E69519BDB463FB517E3ECA97C14F4CB33BCDBAC3CB2C1F66CB2F72DC5A2FBE05DD70A64FE814A4519DFF2712D683E8C55908032FB3B99590A881FA81B523F7651DB64A9B1B6E0EAA9EABE0BA7307D47CCF8E8D01B7B66077C6236F82AB03045D818D6DC72A702853D268D5CC7CB5FAA04C06179786B91A250EB5DE1E58C7F35171FFEEAD5AF7963059EA170F6BFE159A90D7C2C045DA89BA655F378EE7D295D5B0C4543CAEF74A19A90CFFA4CFBFC00FDB7B5753E73D230F312C9FCB72597FF7F14CCF257556732138DED6A7D376BCF96DF7411136CEC56D7EA36A6EAB75D4E2F537C450729B6418E2B116A8219850AD45CD87C61ABAA0841A6DC5DF7668FF82A912A07198E9FFE0C18F1CE0D25AFE0817D5ED53C74BCECC11BAE17F3236345CD988EE4668ADF4B5ACE18AF8DF8C89FD9E6B302060C06EA01385568F439EED78C2A5F91FED2ECFDB089E1BF5D0E9F6F0193AF634AB7EE9165936DDD8809E4F3109CA18450809B20245622F2E298A94240D703B65408A179088781E861042132F4291941645892361BC42EDD8DF397F1A846708F18A1C8DD40B68E1E62892856988DBC96992872852044132F5CB25E2C79007D48E1F07498646FA724DA9E745019A37EA8785EBA34814E42BD46B1A453442AB4D63378D50DF6842E2156E27A30945B505C40BD21445BC902638E247255EED2008BD55822291E7E1FD16E47E9EA03908725A10744A421206212A1352AF58A1D50E334A225CA624AB1CCD5B4469910C3F6FDF218157666846A1090A3C3B514A33DCB7288F60203124F6DD2C40AB1DFB34F151AFE3555814A89D38233446AB10675EE4E31EE46E92BC8078658ACEF6CAA52E41276B4548ECBF8078898BF6CECA77530FCDC18A86315EB9844484A05E274110C5687D9228F413F4464A329284289252B87D51AFD310728D469A863EC12B97666E89E720236415CFAFFF4BC48F5621DA895918503C9E2C756317EDEBACA461867A90BB9478A8D7B91B061EDA0739A1AB12EDC4DC0F898B4E23206182C693875E80DF217916C514CD4E5EFA297E2B17C42D287ABF157E44F05FA62208698866A7887D0F9FAC220B320FCD01FC04E7119AD1123A31C565120ABF682892D2553678B01C217895B46BBBCADB97EF78B24FCC453B4A64ACDD69C1163776D95F5A8E9DBE4F859CF11D87AD929F23DBE36E06AFAE46A06F61212C61D59881A1082D2C507D076BC0706E6E98BE3BE99D38344A8565E3AF6FBAECD2CBF51F5A1DBB117D842D6E7C3ACE2C848E656FD7429AF7A29DE9FD71B79DA524ECDB67D051D61F1FF490A7537A607B8327E0F0047FCF86A7E4C0CBE5D597ED98ECAAD15BFB4CE437ACEBC6D7E6EE8E6C9C46DC1DCCB8FFC157CDF4FDF0B1BBF326CC1B306FC4860F56D9C8807B3A9C68DE4C3BE3F3679A7FA2D19936EEE4C3319869C18916CEB470D8B9E19DAF1B21EFE1E13B1F2D7DAF9A463DF2FACF13FE1D694CC2B010FEEC86387137EC491DCD05AFC52C7377A9A16686CD4FEE0BE1A1C59FF96257E24A403B6E9FDADD69D37D333ADE881ED6840E9662A3F48CFD36602418B665730B5D7C0F85FDCCF729EB793D0ED2FC9FC177FF000000FFFF0300504B03041400060008000000210043329552000100008B0100001C000000776F72642F5F72656C732F73657474696E67732E786D6C2E72656C738C903B6B03311084FB40FE8310A4CCE9EC2204733A6362075CB831E74ECD22ED3DF0E981B409E77F9F6D0C31A448B5EC0EF30D3BCD76F1B3F8C65CA618B45C55B514186C745318B4BC749FAFEF521482E0608E01B5BC6191DBF6F9A939E30CC4A6324EA908A684A2E54894364A153BA28752C58481953E660FC46B1E54027B8501D5BAAEDF54FECD90ED03531C9D96F9E8565274B784FF61C7BE9F2CEEA3FDF218E88F080544C07ED7A14F7C4766431E90B4ECA71999AE3E36E652B80EB3B398CD2EA53D10987304CF8D98D364732CB12773271473804CE3CBBA26EEA7F09C9108F388E02A1769B9479CA2E3270E0B6B0166A9DA463D54D8FE000000FFFF0300504B03041400060008000000210062EA2B34F30000004F01000018002800637573746F6D586D6C2F6974656D50726F7073322E786D6C20A2240028A0200000000000000000000000000000000000000000000000000000000000000000006490416B84301085EF85FE0799BB265677D1455DB6ABC25E4B0BBD8638AE019391242E2DA5FFBD919EB63D0D6F1EF3BEC754C70F3D4737B44E91A9214D384468240DCA5C6B787BEDE30222E78519C44C066B3004C7E6F1A11ADC61105E384F162F1E7514162ACC4B5BC3D78EEFDAB4EBD3B8E06511E77D99C745DEE571D9ED4F1D3F3D67E773F60D51409B10E36A98BC5F0E8C3939A1162EA1054D3047B25AF820ED95D1382A892DC955A3F1EC89F33D936BC0EB773D43B3F5F9BD7EC1D1DDCBADDA6AD53F8A56D292A3D12792347393B0B8900AE1B78C49323E70FCE7826CABE1803515FB03D9F4DD139A1F000000FFFF0300504B03041400060008000000210005C95CF40E0100009201000013000801646F6350726F70732F637573746F6D2E786D6C20A2040128A00001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009CD04B6F83300C00E0FBA4FD8728771AF32C4140457948BBEDD0ED8E426891488248CA8AA6FDF705EDD17B6FB16C7FB6931E6E62440B9FF5A06486DD1D60C42553DD20CF197E3B354E8C9136ADECDA51499EE1956B7CC89F9FD2D7594D7C3603D7C8125267F862CC9410A2D9858B56EF6C5ADA4CAF66D11A1BCE67A2FA7E60BC52EC2AB834C4038808BB6AA38433FD73F8C74B16F328D929B66DA7DF4FEB64BD3CFDC557D40B337419FEACC2B2AA42081DAFA6A5E3827B74A84FF70EC400DED12B1B5AD45F184D5BB187916C853DBD54D2D8191BFAD2597531C9387D6833E770036B00EC69E3BA6E5DF961139765B0A7414023A0755C00F5FC224AC9BD27257F5BD9E7FD33F36F000000FFFF0300504B0304140006000800000021001FCAF261E1010000E603000010000801646F6350726F70732F6170702E786D6C20A2040128A00001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009C53C16EDB300CBD0FD83F18BA374AD2B4D80245C5906EE861430BC46DCF9C4CC7C26C4990D8A0D9D78FB61B4FD9769A4FEF91F4D32329A99BD7AE2D0E1893F56E2316B3B928D0195F59B7DF88C7F2CBC5075124025741EB1D6EC41193B8D1EFDFA987E80346B2980A967069231AA2B0963299063B48334E3BCED43E76404CE35EFABAB6066FBD79E9D0915CCEE7D7125F095D85D5459804C5A8B83ED0FF8A56DEF4FED253790CACA755895D6881507F86484D41DC4B2A5A24C2D820544A4E05AAF4046D693BD4730E4F443DC01E935E2A3902F5EC6395F4C74B2547A4B60D4430AC98F4D525D7655C7D0AA1B50688A7ACBF59137DF23515F783F5A2FF5FC9BC44713B3B342FD1D2B1B79153F5D5B279BD5272046C2CC23E4268925EF4EE26A676065ADCF220740D6D42257F07D41DB7CD4B7E00DBFB3BD0FA80867C2C92FDC96B5E8AE23B24ECC7B7110788161C89B16C24036E43A2A84B4B2D6B4F7C8079598EEDAA373982F3C2810C1E189FBB1B4E48F735F746FF30BBC8CD0E1E46AB999DDCD9E98C3F54B7BE0BE078BE72423CE01FE93194FEB6BF196F333C0F665B7FB6D4EC0218DEC9F57295EF3FCBA81D47B1E2854E3B9902EA8E3B886DAFCFFFBA3D56A79ABF13FD8D7A1A9FAD5E5CCDE6FC0D57E814E38B30BD27FD0B0000FFFF0300504B0304140006000800000021009A2F69A222010000E601000018002800637573746F6D586D6C2F6974656D50726F7073312E786D6C20A2240028A020000000000000000000000000000000000000000000000000000000000000000000A491CB6AC3301045F785FE83D15E91FCA86D429C90870DD995D242B7428F4460698C342985D27FAF4CBA494B575D0D778639F70EB3DABCBB317BD3215AF01DC9179C64DA4B50D69F3AF2F23CD096641185576204AF3BE2816CD6F7772B15974AA08808411F51BB2C356CAAC743473E0E7CA89B5DDDD37DDED7B42AB73D6D07DED37C376CABA26987A26C3E4996AC7DC2C48E9C11A72563519EB513710193F669682038814986130363ACD4079017A73DB282F39AC94BB277AF6E24EB39CF75FB499B782BE76897607FB9382B034430B890E0BE0DAE60A751CCD7B129A42801AD8E84FD036ABD8149E079A637EC5104F43AECC16380F16F72930B531655494BA52A5A8956D1567245956A6A2572C30BF1302FB31FB7CFFAE637EB2F000000FFFF0300504B0304140006000800000021000CC41A92C3000000280100001E000801637573746F6D586D6C2F5F72656C732F6974656D342E786D6C2E72656C7320A2040128A00001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008CCFC18AC2301006E0FB82EF10E66E534516599A7A59046F225DF01AD2691BB6C984CC28FAF6863DADE0C1E3CCF07F3FD3EC6E615657CCEC291A585535288C8E7A1F47033FDD7EB905C562636F678A68E08E0CBB76F1D19C70B652423CF9C4AA28910D4C22E94B6B761306CB15258CE532500E56CA98479DACFBB523EA755D7FEAFCDF80F6C95487DE403EF42B50DD3DE13B360D8377F84DEE1230CA8B0AED2E2C14CE613E662A8DAAB3794431E005C3DF6A53151374DBE8A7FFDA07000000FFFF0300504B0304140006000800000021007BF302A3C3000000280100001E000801637573746F6D586D6C2F5F72656C732F6974656D332E786D6C2E72656C7320A2040128A00001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008CCFC18AC2301006E0FB82EF10E66E531516599A7A59046F225DF01AD2691BB6C984CC28FAF6863DADE0C1E3CCF07F3FD3EC6E615657CCEC291A585535288C8E7A1F47033FDD7EB905C562636F678A68E08E0CBB76F1D19C70B652423CF9C4AA28910D4C22E94B6B761306CB15258CE532500E56CA98479DACFBB523EA755D7FEAFCDF80F6C95487DE403EF42B50DD3DE13B360D8377F84DEE1230CA8B0AED2E2C14CE613E662A8DAAB3794431E005C3DF6A53151374DBE8A7FFDA07000000FFFF0300504B0304140006000800000021005C962722C2000000280100001E000801637573746F6D586D6C2F5F72656C732F6974656D322E786D6C2E72656C7320A2040128A00001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008CCFC18AC2301006E0FB82EF10E66E533D882C4DBD2C8237912E780DE9B40DDB644266147D7B83A7153C789C19FEEF679ADD2DCCEA8A993D4503ABAA0685D151EFE368E0B7DB2FB7A0586CECED4C110DDC9161D72EBE9A13CE564A88279F581525B28149247D6BCD6EC260B9A284B15C06CAC14A19F3A893757F7644BDAEEB8DCEFF0D685F4C75E80DE443BF02D5DD137E62D33078873FE42E01A3BCA9D0EEC242E11CE663A6D2A83A9B4714035E303C57EBAA98A0DB46BFFCD73E000000FFFF0300504B030414000600080000002100743F397AC2000000280100001E000801637573746F6D586D6C2F5F72656C732F6974656D312E786D6C2E72656C7320A2040128A00001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008CCFB18AC3300C06E0FDE0DEC1686F9CDC50CA11A74B29743B4A0EBA1A47494C63CB586A69DFBEE6A62B74E82889FFFB51BBBD85455D31B3A768A0A96A50181D0D3E4E067EFBFD6A038AC5C6C12E14D1C01D19B6DDE7477BC4C54A09F1EC13ABA24436308BA46FADD9CD182C57943096CB48395829639E74B2EE6C27D45F75BDD6F9BF01DD93A90E83817C181A50FD3DE13B368DA377B823770918E545857617160AA7B0FC642A8DAAB7794231E005C3DFAAA98A09BA6BF5D37FDD030000FFFF0300504B030414000600080000002100BD84622390000000DB00000013002800637573746F6D586D6C2F6974656D322E786D6C20A2240028A0200000000000000000000000000000000000000000000000000000000000000000006CCE3D0EC2300C86E1ABA0EED4031B32E9529810532F1042AA46AAE328363FB93D298201A9F363BD9FB123E1ADE3A83EEA5092EF0C9E38D3E029CD56BD6C5E34473934936ADA03889B3C596929B8CCC2A3B68E0964B2D9270E51E1B1836F4D6B0DC6DA92C6601FA4F68AE9D9DDA9E2395CB3CD659942F8211E6F41D74F3E8217FF5CE70510FE1E376F000000FFFF0300504B0304140006000800000021006F0EBFE4FE0000008A01000013002800637573746F6D586D6C2F6974656D312E786D6C20A2240028A0200000000000000000000000000000000000000000000000000000000000000000008CD0BB6EC3300C05D05F09B4DBB2E334090CDB193AB6010264E94A48942D202605898ED3BFAF53A48FA143372EF75C92CDE1365E56578CC933B5AACC0BB542326C3DF5AD9AC4657B75E89A5087C801A3784CAB2541A90EAD1A4442AD7532038E90F2D19BC8899DE48647CDCE79837A5D145B3DA2800501FDA3A807734BFE1B9AE7399FAB9C637F8F95FAEDF87AFEB4334F49800C7EA582F95FBB27C70164B87B3B7D822884F19949225F92EA1ACB661A91E408043DDEA7AE39A2F570C6785D80177C3FB127791CDDAA5D09AE5A6FAAACB276936D606FB3BD296C66ED6E6BA174C51A9E962593AFC95F5A257142A5BB46FF55A47F7FB5FB000000FFFF0300504B030414000600080000002100BB29ECCE0E0200000807000012000000776F72642F666F6E745461626C652E786D6CD494CB8EDA301486F795FA0E91F7439C704703A30E1DA4D974D1611EC01807ACFA12F91832BC7D4FE270132985E9AA5808E73FF69FE34FBF797CFAD02ADA0A07D29A31495A9444C270BB94663526EFF3D9C38044E0995932658D18939D00F234F9FAE5B11865D6788870BF8191E663B2F63E1FC531F0B5D00C5A3617068B99759A797C74AB5833F76B933F70AB73E6E5422AE977714A698FD436EE16179B65928BEF966FB430BEDA1F3BA1D0D11A58CB1CF66EC52D6E8575CBDC592E00F0CC5A053FCDA439D8249D0B232DB9B36033DFC2C3D41D5556B83DA1D54CABA341F73E83F460A0F9E87565AC630B85F0B19308CDC8A4A61F1523C33416DE767A6155A5E7CC58100996B64C8D09EDE24868D9559FF6F0B74BFB242E17F23573204A8FB0300D72C6B454BBBDEAAC66261472E9F97AAF6F9993654FA1047285850D2C28FAD41F1294044375AEA4176BDAE70AAF7C06E74A72B206DF1907001720E6520B887E8822FA5975DE4424C5D1A36D24D1C16F8AB34E3391EA4DFF4EE4057B4E5F66B32391292AFD41F7F982C8F01A91EA31093EB713F9866D352723A5CFC8A153F108E31E0E504880FF88C39B585911BDBFFE11451985124600D2FE1C0A63FDDC6DC47C978B4F5C9AF611CDE9B16FBF34B590DC87668AFF9B5631B8929261C807DE95FB52A2ED52B8A6EB92C90FB16CCE08ED9D66A41466D3837204511DF27A46867FCB483D81C96F000000FFFF0300504B03041400060008000000210014E0FE477B070000092F000013002800637573746F6D586D6C2F6974656D332E786D6C20A2240028A020000000000000000000000000000000000000000000000000000000000000000000EC5A5B73DB361A7DEFCCFE070EF759222952D789D271AD649B69DC646A6DBB6F198804256C488221405BFEF7FB81F7ABC48BD2F1761A3FC424710E3E1C7C37907EF3E3D975A4271C3042BDADAC4D5559C29E492DE21DB772C8EDC94AFEF1ED1B936F4CEA71ECF1FD8B8F1FCD1376910437BF6C65597251F67F61D0AFC8C55B7947CDD0853BD5A71F765B593DAB1AFCA8CBF57B4DD3DEEDF4F9FBD5FDBDB15C1BC67AA1AEDFADEED4F54CBF5B54B1BF67D66AD5473BCCCC80F83C7A7C1F60C4B184240F3F4B5662C8B40A7934A98F13F3131D84719A39C38725D26778B1B00F0B6CCC16AAAD2F97DADC58A0399EC91208E7B18DC9B7F289737FA3282C92854D5D620694519B4F4DEA2AD4B689899599AA2E14177364218E94C2FC29918B8610F901581F70825974EF8EF3801C428E99FCF61F3FBC39336B1393491C0547CCC5A6301F9978DC5C915801A5B0761E8438BAB409762C16EDAB81357B01FB681AAB83BA5A2F8D035AEA87B989D64BDD58AD65C963B3D8653CA6C7BFC41A80BD9961CFCFCFD3677D4A83A3304353FEF3F031F6BB7C70F7B1FED8F5C63460F7565E6AC8D667863ED12DCB981868654D56A66A4D2C6BB9B09066AB3334CF013AB8D2C254E7CBD97282D0723E31B08126EBC31C220BAD54A4698BF96AAD65DB455C9F065CF2F28DEA349FD28EEF347D86C70E166112116CE58204E90090CB77F059B86EE662F85B084923BB2E73A491F7803C748C1E5CE2428E53A509B0BD9585CB3C608BA0471C3CC15E3D24BB04BE47BC4FA61906E00E6A7D1D8DE0F788F151049FEE7F1B84BB0B39DDA3A308A0FEE0774FF0E867C44EF7D41231D79FE15FD8C30112D9714FDCAE14FAE6F184026CFD41F8E9DF0C32E400DC0EC426CEB0650BCD7EC12F9F29F1F8308671E81D14913DFA8ABD26B452F0D9E8F78A4B47F712FAECBA182FDD4151E2BA96D5BB25A784FB3D0DDC1DB651E84022FF1622874012B7BE7B32B6DC7CF0F5745C4F1F0A079DB29CEC9BDDC88867531FF193605D2A9F51C02116EEA10E07D4C9B35B3D7D8E37F4426E1E6F784BE26E499568433C0B9FB7F20A6A2F711C747070A1865B84F90E7A895BB7568A13B12CEC1560105A38F090730507ED98F5C9735E1264E6CA44387FB1060498411B638A3C251D101335C4659B5F29C785A02BC3AA217359914AFECF5411AD490F556A343D94A9615F8F3A7171CB44D1D47EAAE4F0B6B5A7236EB1E474888BCE1FB177E427E90939218C98CD93AE285A7C81E1261A150A792E94D64FA80A479B5AA5612325DBE333BF919754BB915C86593F19EA443DC2A80E7E3D0AD5BAAD5C22BD9F440D4C3D346A40BF1E91AADD5DAED1A27F3495897A485407BF9E74DCACCEF2BA3A5560DBE2DB166E2387FD7F65E562AB9E4BD5B3D72993F470A232F0CF0CB11E07844E6F03FE3E20FCE50F08F5337D1E30C6F58089E192C037444513794B3C34BC024A6E891514A3FE0C57E2ED6C214804FB033827C9C3EBE2AB2831FE03A825974FF260DE39BD0ABD030D41076BF80BAF5D2E942C891DDECA1108A2DC3B56A66ED99D3BD3042BF8072B2548572BEE946DAFECD465C2F88573179B46BCA8A882B29DABD21476B80BFB2527CE5F30E56E3CEFE5C65299A2D99D8B635EF5E9A54745A8A418EA630F12A70DA91F7116656918F7153256ED1B468027C577E4578A064ABF4D9406845E61C8C1A1E6D7ECD13F91E32449FC86560EAA5DE4FAE009F11847E0F75915CBEB8E1F064E04B14C25518929DA5453F2B1E06F85AA5704444FB29114AAC895B2903AAF420F79166B2D2D176C8BE93F52333A3C64082B3C38C413C246B8C40805EC63CA3760015D7445351475069C5398BC43816B5AF02DA68FB8CA36945388E0F95C708F3837DEEFBF541E64F042924A28EA83D3B16D1F332C73638A8F9334B850891A3ECA24E068513183889A010C1B024D2D1751D7D38254B4C2E7CB0BF0A64A93E5E76870391D2705418A885B6DE7843B57E6CD6731EAB3EC237C2B3D0B0FFFC5A6F8623D40572BFF003D44D8AFF8E5990656F543C535555BCD7190770C21290EDA64F0AE230D5EC6DA12B3259FD66F4316E02732802D0B4BCFA33C4A2AE99DB4354F6F4A2DFFF627C2E2122D817F11211193F8093241E81E7020515B62E809EED1404A8D6453806109F9BE2300A20B001228E93E3C23D09C4850C5A4D087720546025B3605B221D2258CCC5346366DB62DAEF7D555C477CBABBDDE5439E2CD34B5A292FCD3E8DD2FA52C37A11D91731E6129E1A0F888C5B8F2A9AED8328DFAD389CB87B21BF44AB73CDCF639A327DA9437E73344378463F2AC7662AA1C98CACEE19B9BD289A9B4B36FC5B694FDB5862E1C9686621B2A590D2D2E2B679B06176A99EFC2C930CB4E57E1B553E10070F904D81DFED3EEFE8E316A12D173BC83DE81BF0CDE6EE04A183A9DC3AF6D045C66F192CD114F90056DC2928DEB80EB0C797C611CBB1F92F6BF1734951492731BAE939BE5CCF16E5557DFB2E1ED065669863234683390A92A55479A9A178FF4DD183E2E61C51CA928BF611B0762C6E14C96687987626723B0FA08ACE8CC8762E77F42B26ED8E9FE69B375AB075389BD1E0E9E8D01EB63C0C618F07C08782F7ACEC1812ED0DDDF157F07FFCB0C18B38281192A9AFB6A3F75A3450E8DADD4C8ABC8C8CEACB1579AFE98FDEDFF000000FFFF0300504B0304140006000800000021002D25BB11B50100007D04000018002800637573746F6D586D6C2F6974656D50726F7073332E786D6C20A2240028A020000000000000000000000000000000000000000000000000000000000000000000B4944D6FDC201086EF95FA1F2CEE18E34F12C51BED3659295223456D2AE53A0B7817D58005B8DBAAEA7F2F76F692E66313B53DA1C19EE79D195E383BFFAEFBE49B745E59D3229A662891865BA1CCB6455F6ED798A1C40730027A6B648B8C45E78BF7EFCE843F1510C007EBE455903A891B2AAE57172DFAD9AC56CB26A7355EAF2ED7B85CD611735930CC5605A3655966ACC87EA1244A9B88F12DDA85309C12E2F94E6AF0A91DA4891F3BEB348418BA2DB15DA7B8BCB07CD4D2049267594DF818E5F59DEED162AAE73EFB93ECFCC3702A6D74EA918A56DC596FBB9072AB0F02F7602D034CDD116E4D8872B73F0689C83FA30E2E36E882927EDE5B86E0D4660CD21FD3D8EFF7E9BE98E7118994DC5D7FFC3CFFFB5F8A7B16DA50E88ABC2C702144894B6002339E092C44530BA05D9643F56C32AD7956357983019A0A97B2047CB2A93ACC806540695DB113FAF7ED888351AEC1C056CE9609F1108F4EF845B2329D1D20EC268986DC800B46BA0FD122CEF6AF263FE1ED01F8D758E523EF39895F711A07FE30BA7EA6094E643FB7EC094D29794B62904EFBA3194F0F49C5ABE20CF4C46EC444207F5CC9297EF0642C7E030000FFFF0300504B030414000600080000002100503A6749CB0000003601000013002800637573746F6D586D6C2F6974656D342E786D6C20A2240028A020000000000000000000000000000000000000000000000000000000000000000000AC8F416AC3301045F785DC41CC3E969B4528C64E08A4592605B75D7523CB635B20CD1869129CDB5784B627E8F2338F37FFD7FB257875C3981C5303CF45090AC972EF686CE0E3FDB47E0195C4506F3C1336400CFBDDEAA9EEAA96AFD162522D7AB4827D2B779F81AFC3DBA1758B4CAFBD932CBD0C83B37821EF088B2579500FF06C4286330BEAF3F7FB16546E43A9EA1A9844E64AEB64270C26153C23E5DBC03118C9318E9A1FE223DB6B4012BD29CBADEE5CE71D8FD1CCD3FD47F62FAA5DADFF06E7F5DF000000FFFF0300504B0304140006000800000021004139F2A1E20000005501000018002800637573746F6D586D6C2F6974656D50726F7073342E786D6C20A2240028A0200000000000000000000000000000000000000000000000000000000000000000009C90C16E83300C86EF93F60EC8F73440A1B08A5095D249BD4EABB46B1A0C4422094AC2B469DABB2F68A7EEB893F5D9B2BF5FAE0E1F6A8ADED13A693483641343845A984EEA81C1F5F599941039CF75C727A391813670A81F1FAACEED3BEEB9F3C6E2C5A38A4243867A69197C9DB665D314BB8414659B92ECDC34E458E409498F4F59768E4FDB3C2FBF210A6A1DCE3806A3F7F39E52274654DC6DCC8C3A0C7B6315F701ED404DDF4B81AD118B42ED691AC73B2A96A0576F6A827ACDF3BBFD82BDBBC735DA62E57F2D37799BA4192C9FC74FA07545FFA856BE7B45FD030000FFFF0300504B0304140006000800000021009955F41BB9030000CB17000012000000776F72642F6E756D626572696E672E786D6CCC98DB6EDA3018C7EF27ED1D50A45DB639400EA0D18A51983A4DD3A4760F6082016B3E44B68171BB97DA63ED15E64302ED48184DC8D4DEB8E4F3FFEF2FFED9FE0CEF6F7F10DCD9402E10A343C7BFF69C0EA4299B23BA1C3ADF1EA75789D31112D039C08CC2A1B383C2B9BD79FBE6FD7640D76406B9EAD8511E540CB6593A7456526603D715E90A1220AE094A39136C21AF53465CB658A014BA5BC6E76EE0F99EF92FE32C8542289F31A01B209CDC8E1CBBB10C52155C304E80541FF9D225807F5F6757CA3D0312CD104672A7BCBDA8B0614367CDE920B7B8DA27A425039B50DE140A7ECEB85672C7D23581549A115D0EB1CA8151B142D9E135EABAA9E0AA30D99C7A890DC145BF6DE6F79A31B8E360AB9A83E139E9CFAD88609BF96947DF3B8388B6D82BCE49E1F998452604207A18B8D6D43C995C3F7C9941F0B741B66C06E72367EBECE0869AB9DDD3EF7B2FBDB55FE095437EFA6AA259320F2B90A91D48D2C1FD92320E665865A49075D4AC77F4B2766ED4910366427290CA2F6BD279F6E97E3E743CD3850A3457B10DC043676AFEE2B1E3EA085963893EC30DC48FBB0C167DF4E0189AC7B69B24192E82BDE9244AE224B211BCD101A49A62307532725974F66D2F752C4EC9FEE11CA68880DC3A7B903BBC1FF933123A757586867BFF47F8632F7DE75FEF9F7F4A8BA7182E64EEF6959B7CD534E46DD147A5E0A8FF33A6A0F889E7E9FEEEA127A27A86B4511E569F56802ECD99DF8D8AEEC6DF35C39BF6C974FF93855FC5E2AE368B281C25DD7EBF6D16BD3659F47A2759E8F0E55904552C26B55984711C7861306A9945B74D165E7292850E5F9E45B78AC5B4FE191584A349121FD66D3B2C821659A8C57402858E5E9E842D28C724ECAAA845C28BFBE3E8C3A80189D91A63584CDD11880F265A5E2C7EFFFC75894DD1AC586C073C6FA68C4AA1275DA4485D531E7664C6B0918ED4943F7B80A8D44B7001D484E766C6A526D7B08A6B3EE135B88E935ED0F5FD96B996179E0B716D56785E03D7A88A6B7E30D5E03A1D8749187B0D6E14E7702D2F6217E2DAAC88BD06AE7115D77CDE6A70ED4FBAA37E3C69703B39876B7941BC0CD74605F135504DAAA826B5A986519444D35E6ED0DA3DA794EA65AE39074E655475F404D59A20FA5520FAB54124FE281879410310E76CAF167757230EFF69775103933EFD36FD8C6CF15E06A36B7A1EC9EC17BF52597C4266BFA394CA4CA9AC901DFD427390992B6B85CCDED74A65E6465421B3D7815299599815325B6D4A65A6DE54C8EC71562A3365A04266375FA9CCEC8B0A996FF751A9AE588B46675BFB23FCCD1F000000FFFF0300504B030414000600080000002100F5A800746F71000022830B000F000000776F72642F7374796C65732E786D6CEC7D5B73E336B6EEFBA93AFF41D54FE73C646C49962CA776EF5DD66DA76B27999EB833F34C4BB4ADB42C7A7489BBF3EB37098224480024B0009014B5DC5571CCCB02B0AEDF028185FFF8AF6FAFDBDE9FFEFEB009761F3FF4FF76FDA1E7EF56C17AB37BFEF8E1F72FCB1F261F7A87A3B75B7BDB60E77FFCF0DD3F7CF8AFFFFCBFFFE73FDE7F3C1CBF6FFD432F24B03BFCF8BAFAF8E1E5787CFBF1EAEAB07AF15FBDC3DF82377F17DE7C0AF6AFDE31FC73FF7CF5EAEDBF9EDE7E5805AF6FDE71F3B8D96E8EDFAF06D7D7E30F94CC5E854AF0F4B459F9F360757AF57747F2FED5DEDF861483DDE165F37648A8BDAB507B0FF6EBB77DB0F20F8770D0AFDB98DEABB7D9A564FA371CA1D7CD6A1F1C82A7E3DFC2C1D01E1152E1EBFD6BF27FAFDB8CC0488FC02025F0BAFAF1D3F32ED87B8FDB90FB614F7A21B10FFF19B27F1DACE6FE9377DA1E0FD19FFBCF7BFA27FD8BFC5A06BBE3A1F7FEA377586D365FC2964322AF9B90DE4FF7BBC3E64378C7F70EC7FBC3C613DE7C89FE47786775383297A79BF5E6C355D4E22AD806FBF0FE9FDEF6E3876BF2133D4E1E9E45F73E7E38FADF8E83F4E2C38BB70EC94C97F1FB87BF92970783E4CA2C1A41EEDAD6DB3D27D7FCDD0FBF3FB023612E3D86FDFAF8C1DBFFF0701FBD78451913FF66D8F556FC8B34FCE6AD36A41DEFE9E8871D1FC663D96E224318DC8E933F7E3B45B2F14EC780364208C4BF53B2579CC442850DD5F721B6A2F0AEFFF473B0FAEAAF1F8EE18D907911F9F0E2EF9F3EEF37C13EB4948F1FEEEEE8C507FF75F3D366BDF677CC83BB97CDDAFFD78BBFFBFDE0AFB3EBFF58126DA71756C16917FEFFF0B64FB4687B582FBEADFCB7C876C2BB3B2F92E9AFD10BDBE8E9D3266B9CBCFEEF84589F4A42F4FE8BEF450EA4D78FDE38305D2517589A770A5488AE5450892E1486AFD2C12194B42E276EEA6A6854574344FBEB68E8B6AE8626753544C8B86C68B35BFBDF64D6A76126311D89FD69D391189B361D892D69D391988A361D892568D39128BA361D891E6BD391A8A9069D63B0528801436DF71DD1AD8E0A30BAD5210146B73A02C0E8563B7C18DD6AFF0EA35BEDCE6174ABBD378C6EB5B3D6A71BE3ABDEA7D0CC7647632B7B0A82E32E38FABD08581B53F376212D924AD9A117053D7F6F659016C8C49E8D0662636A2B8FFC5DAD21C448E1F1FC18657FBDE0A9F7B4793EEDC30CDCB4E3FEEE4F7F1BE6C23D6FBD0EE95924B8F78FA7BD8423109DDEFB4FFEDEDFAD7C9B8A6D8F6894FEF576A7D7470BBAF9E63D5BA3E5EFD696D99750B4E21452850E93E697C848361694FAD55BED03F3AE059E35FFF0F3E660CEAB88486F7ADA6E7D4BB47EB5A3628496796E40C898A706848C796640C89827068CCC6CB18852B3C4294ACD12C328354B7C8BF5D316DF28354B7CA3D42CF18D5233E7DB97CD712B71F10C0CE9ABCFE0CDB641341BAED83155AA0F9BE79D17E203D568A44A97CEAAF63E7B7BEF79EFBDBDF4A279EF6A7EE8B2791AACBFF7BED8088029255B4900D1A75938EACDEE641EEC73D46C59624ACF922DA6F42C59634ACFDC1E7F09317584E67EB293FC3C9C1E8F6A166E6AA0DEF6146364DB16EA1D6D1B7D6642CBCDFE60CD90C4642DD8C0AF117A8E14C206B2CC7A69DEB18C96B96116FD9AD5EE5192167AB90D565FED38F29FBEBFF9FB300BFC6A4C69196CB7C1BBBFB647F1E1B80F64BAC63A0D327FA564738BD7B717EFB091E46A0CCD813AD448BEE3F77EF1DE8C87FC79EB6D767624BBF8E1D5DB6C7BBA98A54455BEFCF273EF4BF016E5BD1163EC109C06C763F06A8D269D9AFC7FFFF21FFFBF9D0EDE8759F9EEBBA5D1DE5B9AAF22C4661BE5A0544529585BA21442D9CD6EA311812BE8FD8FFFFD31F0F66B3BD43EEFFD78E9CCD1B744F1C17B7D93011B6DDB0A3DE77BE87F2C202E42EF9FDE7E134D54D932AA2F568831F39887D3E31FFECADCD5FD1AF4AC4C55FDFD742413A2044E93B7ED913307123972E6208248330C0F91FE5A186C8E9CF96073E46C0D76B6F50E878DF49B2E989EADE126F46C8FD73CC1A4F4A205704FA7AD3D062604AD713021688D85C1F6F4BA3BD81C31A16771C0849EEDF15A541942CFC21C21A1F7DFFBCDDA9A3008315B9220C46C898110B3250342CCAA00CC970C31C4CCD70D31C4CC170FC5C42C410086982D3DB31AFE2D7D766288D9D23342CC969E1162B6F48C10B3A567C379CF7F7A0A41B0BD10C390B4A5730C497B816677F45FDF82BDB7FF6E89E462EB3F7B16A650636A9FF7C153B4A722D8C54BC92D908CE6C1B716C1764CCE9690FFE53F5AEB5A44CB66BF2CCC997ADB6D10589A5BCB020E799399381C95ED08885F23FB518CBBF079EBADFC9760BBF6F79231C9DF0DF3E587787388B81BD5DF187B8A93A33F6F9E5F8EBD688F0C6D8CA53DBEAE7C3349EB73AF55372892CC38D97B237AED177FBD39BD261D8DCD20F7F250FD65A2F7B9976FAA5FCEF046EECD91E29B7C9BE3EA37332C9D7BF356F14DBECD89E29BC49A736F9659CDDCDB7F152AC26D99FEA499A044F96ECBB4287D59D86C9922A56F8A54F0B64C8B72A6D2BB5FADA26F0ABC74D46C46FEBE9AF1C8DFD7B12239151D73925351B62B39893203FBCDFF7313C57F1DD74ADA4BD77154BAD721C1DE4AAEF41FA74036DDCF7EB852FF18F6290460BB83DF53233C54FF2296734C72D62B7B28390965572527A1ECB3E424949C97F4752D2F26A7A2ECCEE42494FD9A9C84B683E383889E83E3DFD77370FCFB1007C75381383803E02027A18C20E424B40D9527A16DA806E0424E42CB50B9D74186CA53D136549E84B6A1F224B40D95C76C7A86CABFAF67A8FCFB1043E5A9400C95A7A26DA83C096D43E549681B2A4F42DB507912DA860A4C07A4AF830C95A7A26DA83C096D43E549681B2A41940686CABFAF67A8FCFB1043E5A9400C95A7A26DA83C096D43E549681B2A4F42DB507912DA86CA93D03254EE7590A1F254B40D9527A16DA83C096D438D3755C20D957F5FCF50F9F72186CA5381182A4F45DB507912DA86CA93D036549E84B6A1F224B40D9527A165A8DCEB2043E5A9681B2A4F42DB507912DA864ABE421A182AFFBE9EA1F2EF430C95A70231549E8AB6A1F224B40D9527A16DA83C096D43E549681B2A4F42CB50B9D74186CA53D136549E84B6A1F224CAF4937EFB545ED0AFB14920991755DF2CA0FE3D8C76FBB7F26DED0CEDA13AEDA4DF1AC4C9BC80E26EA5E06B4F6D9BE69024316A54378FDB4D40A6CA258B0058BA640187D667DABFCFCA772CB1D40D6B56D19D1BE40B2F47FCA6CC2CD937B9899A1BD536B9CCF1A6CC02D93739287B536678EC9B5C6CBD290B06C4D8932534618CE35E2E0B03CCCB7DC9EB652180799D677199E3675EE4395CE6EE99177906973979E6C5512FF2F8C5B74765CAC4BC3D4E57C37214CA948AA1702BA750A65CBCAC121FCF1B86AAD0E41454A527A7A02A4639052D794AC9E80B564E4A5BC272523051F366A62B6AB8A1CA29E88A9AA700123547062E6A9E1458D43C2998A879C7A82B6A9E82AEA8E1CE594E01246A8E0C5CD43C29B0A879523051F3A14C57D43C055D51F31474456D1890A564E0A2E6498145CD9382899A0777BAA2E629E88A9AA7A02B6A9E0248D41C19B8A879526051F3A460A2E6526F6D51F3147445CD53D015354F01246A8E0C5CD43C29B0A8795265A226533339516B4998795D0F84312FEA0564E6453DE7CCBC08C89698B781D9124301982DF1B24A64AE972DB142935350959E9C82AA18E514B4E42925A32F5839296D09CB49C144AD972D89440D375439055D51EB654B5251EB654BA5A2D6CB964A45AD972DC945AD972D8944AD972D89440D77CE720A2051EB654BA5A2D6CB964A45AD972DC945AD972D8944AD972D8944AD972D89446D1890A564E0A2D6CB964A45AD972DC945AD972D8944AD972D8944AD972D8944AD972D4945AD972D958A5A2F5B2A15B55EB62417B55EB62412B55EB62412B55EB62412B55EB62415B55EB6542A6ABD6CA954D4926CE9EA3D776855449B1C02173E7CFCFEE64725CC998D3BEBB82A2BFD08481EFCB44E0F978A5E8E7AD2A3C778D1CBA4C3F48321F9FFFD21CCEAD2F3C4A637D7CBFE7DFC143DE36C15F53D798239842B39E98B345CD1D5B473F46B677C3616DBBDEC482BD2F6A377F0D77F8FB8C9757E17952A145C8F4AFA25D79366662FDE3EBE9B313B7986AA53F6D155C08EEBE5A8BF98C50FD253CBBEFAFEDBAF6117C8B5E88F9F373BFF10934A0F347B8CCA78F991D6935D49F47C33AA79415C27E9E73FB7694394A5B489D2C3E5BC3F4A0E978B6E2EE8B5E87EEE7CB9DC9BD9F972D1E5697ABEDC63FCDF593CA29CECA7C3C9983F6DCE231A4DC0277BDEDC840E96396F8E7A80DC7973E49AA1320DA4CA44FDA71D651AE82B13446506318BAB5486D849EB5566308EFE1555263AE280F82C72F1CB263A2F6F9E7030D3171AB572FA42AE19EACB50AA2F745D811D7D19EAEB4B7E7507B92477D5A3DBC12039AF11E49B94F42C894B2DD0B3BC668DAE67D733B133CA748B3AA35BFEF04BBA1024A75CE49AA172DD48958BB66847B96E3AA15CC4DEDAA15C9BF8BF2227369CF407FD2CC095AB5A7CCEAAA112C507D08A94882E41B2A344A34E285162B56DF350F5ABCD58AA363494DA519B7127D486585237029BA1DADC4AD58666FD76D4E6B6136A9300D07687ACFA95682255229AF6D951A249279488D8551B7DCF6DF4AFA836C2744D94CC2739A9891EDD49F5884AD78E1EDD75428F92D993963BA35AB46A150AD45BD1DAF492A9517A8E555AFE889C6255D437C96157125DA1F39555BA22EFF7319A222EE93399422E9DD38D6799A5CAACACCDC7C76DAC40E1FF7CDA45CAFC1EE95EDAD3F5372F2615DE9FF9DBED2F5EFC74F0267F74EB3F452619DEED5F9392A485FB8FF1E91AD2F7F7E4C38694C055BE33F19FE57A121F00BA8977DC48A7D0A3D97B01BBC99E32534E433C63A8D6C5DE447ED1A73EACC429169D9FBF2F757D2AB3E2D3F1B03FA47365D4F5641E2CF5593DD2B61FCDABA47FFC76DAFAB98F08E47545A35E9D0EA1AE3C440F1405C60CACC8A6F8562F1B748157429F20E19C11D706A39BC5F59CAA75CC35AB9F5696F109CEC5F1D3839D75D424A664AE26B3EBE535FD9664A226615821DE28F2251F3FFC701B9F7D443C03FD933CF4C72A693A42B9F19021B15112FB481BA6DF4334C35889C633322A4A3CBE65AAF1549D2C6BFC79F13FE53653CC96D4B22DB29C2B76ABC777207FEFFA83FBC4C0441E65BA8CFE891944161BB00C8A67A0DED939F264EE5FC71D95A86C54513B64EDA7DD53C03190DEEB919B55BE8A67170D46723C3E990D6E87743A43EE8B0A7E84B818A11B6198947EE7CC206BDFE8AB2639CAB1C81F72B18A2F6CFEC39C34C9997644ACCCBBD32F155A09CFB83F1E25450E38062759CDDD984D6BA2BF18E69AFBC4745C22EE99FAC34C025286C939E222DE27470873A644AF6B694B7A081F376E4AAE4C5FE820B5F4858D0D3283A4EA521B8A64872AE1AAA916E58423E5A42BE0A803A737C9F2992227E8CD5EDF06A68E5A9131C31DC4A8750D4483CB6634E51DAF7091C97B6049DE7456ACB3F26E6ACD4B3A91948A95CC0B45BBB63899C6EB12C92D913CD9392789B09273240AD39EFDC1683A2DF7EA3A3E3D9DCF21FF533529350DF6210027CB26E34929D2ABC8DF52C6FC1585EAE87FC23EF9940C911D9B6CD2292BD0BBE97416E8ED64B20BF4F226D4D8B5FF93D9EBFF84BD1ECFBBB1EC3FE7194231DCA2E7B308D3BFDCD92D228392CDB4304401D32D02C055F915C2D01C853E37C48FFE73E0F77EFF14BD4E9C69FED2EAC0FCCD3938D57449359A15995A262DD398C66A859EF0E492B2C5E3AFFE3E1D4D3F0D2CC995A4355E12EFFD9B708CCF241F086F857FC52EE1E8EDD6DE7E4D0EC6FA763C517D0E6FEF4EAF11CECF1E0DB66B2219E6017A9E4FF6CCDB3E780BF651829A115AED8EDF8EF7DB631455A16951AE6417277AF66695A1CA3E270AA61FE8CC02DC3EB547B90D565FC5BE28BAA3E689EC391AC13AF9B7E99A71FE82A042B02F0D2A7D36AADC4CFB7771393C1E30134B7FDA931D16C9EE0B69BCB6D5425954B7D54649ECB7D344E4C3A948D8E9F47E7F44E8D3E974F2277D5AECF18B587AB363B034194A3B96524E83F577B181843700919A926B2A4CF7E389467B931DB9014979641C1F1329E8B1AC32382AC5B6F38E639473FCEE964C3894279A2A5CBE91C5B10E478E87804DBA35CAE57C5E7EC0256CB4A5E5F2A90D54F30A35E737E564F2A9DE96231246F9FE9BFA5C752ACC1CD2569CD4D155F578D025ACB4A5EA542635ABBA8087DD50FFE5667F387EDA85DC2A012C3DF2548F3E2692613EDC8AE4C634D4947D0CAFE924778C439FA21EFD4C62C2D0F61741D9A8D5582CB7151E0D56F0BA116BE98465541A45893954858866ED80C6897C3EE6CC0494B4BF4AEFF56204AABEB5A0509605E45C9638251049A4C263359625341B1EAA72853CB3AB2344D1C554711DADC52C5094194AA989A8C58A96E7CEB5C6922A53A936124838410B31B490B24C9B8A0C967053F26D8653B5E6E22C3FAA596ED74A303DD7B49C9C701951065FE343857801A6E70DE9C94CF0F5900AAB2012B5CD85543C8F7127E83797FC1798CC52C8FBB48484E13AEF9445338FD43DE318B4A2D745DC017E654D7A6E775F26E74806F16A3DDD3511259FBDAEC94F44A7B8244C64378ACB21F8F55E84EED3692B5CF295DC345AF5951C79D69A85288A6CCEED217DCF2D2A23BEE5B7E07D1A3AA487CD5F29BFE877D9E4899098FC894FEA0BD340CBB496E4A738B0476FF5F5791F9C76EB647867B7082BFC9F15558797545D565BDF8B632CB3CAAC176582DB488FC94FCA8B25B918CB98BD16AFB08C5D6BD41E6D2611E7E74869E23E9204335400623102775A509B58A6BABDBE233F8ABD8E770DA4BD8ED945BB2D19C4D62B1D8391A1B473C4446C61CFD921E706A96A34E6432DB05336D487C2B2063DE95EC8501F4327DBFFA7BF8F677C0D7A3AB98EFE29EA5F5A0245B3A33F05FBBF5AD4512858F8212E4BCB5765CD8186A4786DB22A0AD103A207D2C733420F8BFB597F96372C7EFD590BF1C37C3CB99910012BF5BB1308C2FD985B84210A2B23E583ED028AA861B0D670C46C361E8DB3DDF2555AD82492B0DA55432CC17F87116209F1B718C4128825DA8F254246DC2E8AC0BDB8AFB7855862B95C2C251848D4EF4E6009F7636E1196582E6703A6FAA77CB05DC012350CD61A9608B5703A15E31E9116368925AC76D5104BF05FAC855842FCD51AB1046289339897182F474BB1B991C3FEDA8A25668BC5749115BBA8EA7727B084FB31B7084BDCDC4D87F762E0941F6C17B0440D83B5372F31588C25D987480B1B9D97B0D955432CC19FCF23C412B4A21B6209C412678725E693F9782E8E4FF9D9F4966189E9E07E7E3F57EE7727B084FB31B7084B0C6683FBC1BDC260BB80256A18AC352C71B714ACD5916B619358C26A570DB1047F4C9B104B88CF6C432C8158E22CBE71B0BC60CD2DFFA1B175DF38B4FADD916F1CAEC7DC222C51A86D2F1F6C17B0440D83B5F88D434B0B9BFDC661B1AB8658823FBB53882588CD2296C8588F58A20B58223F5B713E5842D4EFAE63094B633E0F2C911F6CC7B184ADC1D68125445AD8522CA1DF550896109E58986288ECDC4200744836A92274D0810E9D5CA510FD2B28B96CAB529F541A308BDFB6BDE471C5A0ACB2B2CEF1EA741340C7B6A4B3986DDC5F08BD487E710875CE335273DB21D62874880EB7D8A3626FD4F82FAD0C2E657EB5AD43D92E70DE2299AA3259046E582E273C02420728A9AAC02C13CF6E93947D616AADA717F376945ECE55344FAF16B2A8C2F5F4FC117A1D2CD1D975F44FD1530D9B5C1B61B09DDD126AA8DEFD193D65BEFB136104C288D8DD8E16D792F54008241048209028E8350289E680C462341D4EF3AB14CB7C559350C26C6FBB5D3051B2FD930513F0ED9F0826104C242E77BA1483897CA44330516809C10482090413E46A4D602214E7682E5EBC28F2554D8289A5D1E676BB60A264FF270B26E0FB3F114C209888B57EB0BC5FC64D14B55EB45309C184BE0F1C2C07B38178BFBE705DBC733051E8500E4C643D4230816082BBDCECCCC4F572B010AF38106E196F7266C26877BB5D3051B201940513F00DA00826104CC45A3F5B4C1753A1D68BB62A2198D0F781A3D1F4EE5E05AFD505260A1DCA8189AC470826104C70979B5D2FB1142C4390FBAA26C184D9F676BB60A26407280B26E03B40114C209890BBDC58EB457B95104C007CA0682956CC62E1CA78E760A2D0A11C98C87A846002C10477B9E9CF1C3ABEAAE1CF1C5A5D7509264AB680B26002BE0514C10482892AAD176D56423061154CE41D4B1BC044D62304130826B8CB6D0513225FD5523021ECAA753011596F687F641C421C913C104B5B1F41D0A88908420B41A878CA81BC82C4FC6E9CA94FCE6F5396B2B6AC5696A28255E511154C34E7472CD174579583F36458F143FFBB6FCDFB852188452724DAB3D9F6C5541394A4BB7CD726F897BA542280DA817FC163C9749E02EDBBBCD24311693DEC75071ECD83417231C757EB86E35CB8CEEBC4742731D09345A3E5751D1F856D2D81717D66F2CE8F708554B91501BC524BEF0E5A3248C9AAF7D8D307CDB7D9638ED68D1CED66DABFEB675E2347D4204B53200BC8D314A862A6D6E62F02F59764C05C4D4D3298AB39CBD506F3EBE5B578C216B335D36CADC0DC4248482EBBCDD76A1030666C6D9286B59C6D3E9EDC4CF2EB49CB026293599BFB13EA2F3E6F2B296752C8DBE0154D306FEB46DEA6401492B7E9E2546B54316F6B73DE567FF51BCCDB542583795B65F330DECEC7F7FCD4BF48EB316FD377DD05E6160C2BB9EC366FAB41C098B7B5491AD6F2B6E572B19414411405C426F3B6B0ABD369BE53655DC5BC4D3F6F2BA91C55C8DBE0C5A3306FAB3D6F1B4E8793A164973D2DDCA19FB74D46B339E339724413ED00E46D0A6401799B0255CCDBDA9CB7D55F68AC25799B82ED62DE566D246799B70DA793E5440CCE84E55A306FD370AF05E616424272D96DDE568380316F6B9334ACE56DB3C562CA6D159007C446BFB70D1663C95A195157ED1FF597CF714A0ADA15721C784D3BCC716ACF711410BE7E8EA300BE20398E2EA6B34615739C16E7380DD43F6C498EA39BF3638ED39D1C67301CF40762D095D77ACC71006B0AF3CC2D8484E4B2E33585EE058C394E9BA4612DC7990EEEE7F77385BE369FE3DC2D055BD6E45DC56F53FA795B49EDD042DE062F1F8A795B036B0A45BE39361D5ABA0DB2A6504E34D10ED09AC24AB2A035859554316F6BF3B7A93C2F58DF3FCA5DEDE09AC24ADBC5BCADDA48CE326F136ED217693DE66DFAAEBBC0DC4248482EBBCDDB6A1030E66D6D9286C535855A01B1D935855A5DC5BC4D3F6F2B29D35CC8DBE0959A316F6B55DE46B316BB795BA21D96F336114EB54615F3B6F3CCDBF20B2B2E2A6F13CD6360DE7611795B5EEB316FB39BB765DC6D2C6FB32560CCDBDA248D3AF23651406C69DE26EA2AE66D59DEB67AF1F6DE2ACC6D880FCB72B7D7D79079BFF94FFEDEDFAD7CD21D3669F376BBE0E81D37C1AEB74F1F8ACD2E9FAFCDFD27EFB43D7E0E5B79DE7B6F2FCB60778C1FE413B7C4059A246E946787BF92DBC98DC35FB34372AD9FE86AC22B0973DE925E8B98F325E479195F22990859C266AF61F6F835B9CED09D855271C9252EBD554C6915F568753A84AE97685F94814A984706596420BDDF8B1EE8656C50D62A0943359959A95F5FFD7DDA99589B043AD7BF09BBF3EC1D4F7B3F54BDF02F72F3700CDD9EB75FCFC23E873D3B5155086FEF4EAFCB5037B24783ED9A309179E0211159F2CCDB3E780BF691C6658456BBE3B7E3FDF658381705A2E50FA7C73FFC55A9A21FE82322417122D8457295DD14088FB6EFDA204AB2336B3ACF0E45A6F6F419B9E60B9D849C6FB6F59E6550B7AC809FC09C7BFBAFD1D1719CB0A21BE45039A184546628AFCD35D6DD0C2504AFD3FF2172C213E574F16B01D4C5F895C5746733C9D4278C824F63B6B5263E2B06D59C38110A7446C8949767931597F09DBD46736240F6969B82AA737EC1AE405B290EC0D110EC8491A134EC32F8FC8DC3C1411DDD997DAB879525135AC84A112B21985C7A22488ACDCD8F0241908E209D51F9C2211DEC2433C2F496F89E122F23940AC2740DBE0F46D7B36BF1A1DC08D49B00EAC3497F109F11AE261084EA672F8FCB01EB7531F322E0BA5D661A0076FE28080EB0C3CF8040C08E803DB72A2457E39E557A226D04EC08D83B0DD8A7FDC948A7F2380276C702592E6703490625140802F6B397C7E500F6BA98791180DD2E330D003B7F060007D8E1C5FF11B0236067947E922FFCC72A3DD13104EC08D83B0DD887FDDBDBF1546200EC5504ECF508E4E66E3ABCD7A8018E80FDECE5713980BD2E665E0460B7CB4C03C0CE17B4E7003BBC923D027604EC2C5EC9D79867959EE818027604EC9D06ECFD797FDA17037661FD6404EC8E0532980DEE07F7EA0241C07EF6F2B81CC05E17332F02B0DB65A60160E72B9973801D5EC21C013B02F6DC67A51CC759A5273A86801D017BA701FBED32FA273100F62A02F67A04325D46FFD4058280FDECE5713980BD2E665E0460B7CB4C03C0CE97B0E6003BAD8583801D01BB33C04E740C013B02F64B05ECF9AD1D08D81B0FC3428120603F7B792060B7CDCC4B07EC0066CA01BBB87EE93C589DA24298BF786F84D339BC4EEFF5A29B31FFD44AF43244677597E83541F1FBA8406E54FED83BAC369B8F1F1EFCE7C0EFFDFE297AFDE53E147BFED2EAC0FC1D8F04503D79A5581EB5C8D4326999960466B5424F787249D9E2B15235558124CEBBCEF0E287576FB37DD83CEFC80038E9C7F77BD9033AF65A207E0E366B6E4FA2415771D5D4AE8A52B46C5B5D2A349C136326B4D7B717EFB039F0924A6EE80987E7FD403CB5F4EF8807DE514D0E1BF2C786967F2E4A003CF6DD7A171C7DF969037EFCC0B91C35F0670895EF43554C7B7638BD85E069B5DFBC910E815D65CC06E1C103098BB44F1D60885E887B2C0C983338CA491B2710B012D363EC45B94499BAFFE96F8337FF7EBD0EBBCF7B469FDEEF79F4812AB577AAD54FFBB06B24CF7BFFF8E1F66E40F4F82594CDDD24FEDF589FFD6FA18E92BF233E46CA19DF7E0F879F2550215E5CBD4419D59BF74C662FBE117F122A79885D630DFF4EAFC4991F1D06C4B2A2BC2F1A5A9457868F4D26244E54A4105FA2DCEDE38757EF8F60FF53046E23DABE7738DE1F361E7B7341AFA52858F8E6EA4092417A79BA596F3885A69B1658F81B5F3355AFDFFCD03C7672EDDAC7F71B552E1759602D2284428265B0DD06EFFEFAA7F0997DE45139F9F04FE8B9697BF2BA5E8EFA8B59CE39E7BE9A4D8793317F64533C1132482FD34990D8FA44A8E2945CA0739A46DC0D8EE588EB893E71E9902BE1941073A54CD2065D2CD9CB405DDC88797BA6CCB481BB7262D3E3ED45012F7EADC37FEF376BB24EA1FF733477CC8929BADF230FF4FABDF811919814963ADC50DEB90E7E75AF4250F97CAB776268BEAE3A7BDC62D9C72E7B6D947DD4B7D74AC9A7517B8D143E7DB86D26FD92E2A6992B4EDDCE62098CC3652AA5AB4F08D412B07D4C7E54D8CE9CC69A364AFEA24E566BE587A5E538EBE094B8F070902D18A3E8B867D12055F9A54FCA20DC498F95E0C39EF1F91218FF783D9D8F2737936CFB552E55B2170121AD406220A41D40148434038A83F0863423A17E43180BC96FD35838EBDF8C6FB8382166FCF946C35A47D98578C8576D97C7431ABB301EDA8887CBE562C95444CC696A3675681A0F21AD40E221A41D403C8434038A87F08634E3A17E43180FC96FD3781832FEF63EABDF55CAF8F38D87B58EB20BF1902F8A2C8F87E0EAC8180F05C86DB1982E24C82D5360D378086905120F21ED00E221A419503C8437A4190FF51BC278487E9BC6C3E968D19F7353D462C69F6F3CAC75945D88877CCD51793C04171FC57828D0D4C1FDFC7E2ED6D46CFECC341E425A81C443483B8078086906140FE10D69C643FD86301E92DFA6F170329D8C262335C69F6F3CAC75945D88877C493F793C04D7F6C378289AC910EDE38E35355360F3F952FD5660F3A5FAED80E64BF59B01CE97421BD29E2FD56D08E321F96D3E5FAACEF8739E2FAD71945D88877CC52C793C4CFC25C6437ADF553CCCE6CF5CC643592BB6E3A1AC1DCBF150D68CF57858DE90C578286E08E321F9ED321E1619DFCD78687D94671A0F4B97D0C0D7CCDC5E6ECCB3B5D6B9DCB4EDB5521A226C3723091036D7876378A8AAD455CB7684DACA7915BC7C5CCEEB91ABFDDAC1DD104549D65D48CD3AE79B8FA14252557506951936233F0586E5E51B5D8B653CCC9F2DADDCD1921A7E4D7414864A5436BC0CCCB7BA204CE19C90FE2274185081B403822AF08634C10A6CF93EC2152770C5827A216071615A0859CE0AB22CEE677D66893F5B2CB76DA0C56A578D604BF9A48AF98E24842D82B93EDDBD0230D8026907045BE00D69C216D82E0B842D4E608B05F542D8E2C2B410B69C156C09B975BB88FD47110B64126E076CB1DA5523D852BA7D2C852DF08D63085B3857A4BFA503065B20ED80600BBC214DD802DB0C83B0C5096CB1A05E085B5C9816C296B3822D8BF172B4CC477D5EC22D996DB1D95523D852BACB2F852DF0FD7D085B3857A4BFF306065B20ED80600BBC214DD802DBB384B0C5096CB1A05E085B5C9816C296B3822DF3C97C3CCFBE03B2582093703B608BD5AE1AC196D2CD98296C816FC344D8A2B5203CF350363E12E9B703FC48046D48FB23916E43085BC86F371F898CD50B618B0BD342D87256B045C8B0A2845BF391C85E578D604BE99ED914B6C077CB226CD172451994750B5B64ED58872DE50D59842DE28610B690DF75C31645F542D8E2C2B410B67405B6E427365A0D5BF4BB0A822DA56B5AE04B5926D4635F204A911573D0DFBDA85FD1C3EE1E6A7BAD00AA7958DEA86DBB19CD4A1EB8519B50B60CB35803492FE674EDEC83B52DA024649504D8748B8339B843E3C61FABA43364ACF9A04219BA8947E7484B3B86290538D01AFF2E424B710FBDED8EEEFC2846497A99937A1D1828AF697A0379EFC8400ECA12710EAE4D46A12C8E968CE20A9417AA5498189A5798C04491D302C8AE71C0613996EB58D86C0772588EED7219F61BD23D2C07CB6510DF8349634A5C078D63D2884923268DDDD652AC62E2A2AB6E134758586F65EA58EB501C268FF58EC35DFAE86A1C5726096469AD9F348184D7FAC10452B0C641BF7E07E8F471AB15856CB6033B7DDC6EE122FB0D699F1E80858B08E5F8B1C7B81B9840B21C93F00F13484C20CF444D31816C4302B9BCD07A52C2AEBA4D206161BD950964AD43719840D63B0E7709A4AB715C992490E52B54CDABAE6102C9E901A49212E07872CBB5DD6CB603399EDC760939FB0D69269058420E13484C201BE220269098405ED217C80BADEC27ECAADB041216D65B9940D63A14870964BDE3709740BA1AC7954902595AFF324D20E1F52F3181E4F40052D34E3F81B45D65D3663B8004D27A314FFB0D69269058CC1313484C201BE220269098405E500279A93556855D759B40C2C27A2B13C85A87E23081AC771CEE124857E3B83249204B2B11A70924BC12312690822FD1B93893D3834C3D4C1348482BB0750EFAED8096B0EA37035CC20A6D487B09AB6E43B1DD63028909242690861CC4041213C80B4A20853D2B869A762490EEBBEA7A092B24ACB73281AC75284E97B0D6390E974B58DD8CE3CA24812CAD099F2690F09AF098406AE94136F5E6328194B562DBCBC8DAB19C40CA9AB19E409637643181143714DB3D26909840620269C8414C203181C404321F6A5A9F405AEA6A7309A43CAC9F5D02697D280D2590F6C7D14C0269328E2B480259BA7415BE6235C910305F4CC5AE7F0E847EB6A8DF06C4A1E8B702C814F51B01E589D06634B34448DDE58BC8112987126E8A7D230FBEB411A79A98AEC98F584C4093AC2409B1C04AA20083ABA45913FC2EF423468E6937B43317A767C0017969804BBA7EB4DA251E2E01036E2AE5F36FCCCBE72392E3AC1BCBE703C20B96CF475497E7546DA8EE66DABFEB4BF68C82719D025188352A9005189F02D59AD05DA127ECBCE019E1BB4A7E22C2936AC0A55682374279A535AE539407AF718D284F304D8B35AE01EB3BB0C635A2BC4650DE7239BFE3A758134181CDB39228CC1A2BC9828CAF926A6D9FD0733D610327E9C879A0BC4A7E22CA2BD180CB2CD76C84F24A0BD1A6280F5E8816511E67E35888161068B0102DA2BC3CA76A437993D16CCEA4E4054101CD538128A8F44335594811AF6AAA35A1BC424FD8C0A91FCE1B437995FC449427D5804BADA96A84F2CA97DC99578B4494C7DB38568BC46A91582DF26C50DE703A9C0CE3210B0405344F05A2106B54200B303E05AA35A1BC424FD8C0493A721E28AF929F88F2A41A70A9850F8D505E6949B714E5C14BBA21CA13CCD7CB37D66451DFFC8BAD7E2B58D2CDA4212CE9D6D52FB6658272629E8EACD18DF1896CADD64DCF4C47CE03E555F213511E4C03D8ABADF8626BAFAB4628AFB4EE528AF2E0759710E569D97886FC5DA23C592B5877C9A421ACBB7479288F3A46DBE6E9C81ADD189FC8D61A4079A423E78FF2B26120CAD3D600F66AAB519E7E5741286F34F7F65FC93024086FD4234FC442D54677A36BEA5210DD55D8762158D98B181C617B5183236D2D7270942D2235096D2BE08C871CE788C774DD9849A100D687A57DEC02FCABCFA06BB3BAF3AF87E25471D0639FB7EE540163F43A352965BBDD4BD734E48CBD4B1B55C45A1E7B477E847D62AFC5A86AAC3FB9612D8BB5D851780EAB522B2ACE658D0B4661528B49AD0B8884496D9B925AB3CA28AC5B4B7B89696D2BEDAE0B85A030B145EDC1D4B6FD6AD97617D3351DC1E4D6B292D8DB72319EDC4C08A394F0559309AED5AE1AA7B8A585F2F2292EB85A1EA6B898E2BA004B98E2B629C55D1A958562DD5ADA4B4C715B69775DA88287292E6A0FA6B8ED57CBB6BB98AEE908A6B89695C4E24AE4C552F2094184AF9A4C71AD76D538C52DAD129A4F71C1A54231C5C514D70558C214B7555F718D6AE2B16E2DED25A6B8ADB4BB2E9400C51417B50753DCF6AB65DB5D4CD77404535CCB4A622DC59D2D16D38538F116E1AB26535CAB5D354E714B4B24E7535C709D644C7131C575019630C56D538A6B561094756B692F31C56DA5DD75A1FE31A6B8A83D98E2B65F2DDBEE62BAA62398E25A56126B29EE74703FBF9F4B7AC55E6D3EC5B5DA55E314B7B43E7C3EC5051789C71417535C17600953DC962D546679C1FAB551EE2AA6B898E2EA6B906EBCC61417B507AE3D98E2B6442DDBEE62BAA62398E25A5692A60EC66876A1B2C5AE1AA7B8A58763E4535CF0091998E2628AEB022C618A7B2629EE387715535C4C71F53548375E638A8BDA03D71E4C715BA2966D77315DD3114C712D2B4953A702B534C5D5EF2A28C51D1355793AC5C629496FC7BDF4A958F7F533DB44B51D67B6D427E4FC49A1E237B50DB6E437EB495891B7382D1E931FF1A0928BA6C746EAB701718AFAAD00FCA37E23A0141ADA8C6636ADDBCC9926D6FA79AE322A2853D43ED9446C89ED59A336933208FA513B8EB0C63176FD744293B3B26A4521163B6A8641544E76C8B088F9E90E0D8292E1A43F881D0D6B6731F4CBD8FEF0E2AD4392D3E5F9029559FF667CC33994E2404DA10AA415085881B403802B9066408005DE902664D16F08410BF96D0A5A608C3F37D852EB28BB0E5CCCCE43A915BA58EDAA15F0525AB39B072FF0BADD0D8297E57236B8CE0063CEDA324CD301F0B25C2E6EEFB3920192819A8217482BB0E967FD764073D1FACD00172C401BD25EBDA0DB108217F2DB14BCC0187F6EE0A5D651761DBC2C8D2ADDD70A5EAC76D50A7829ADC6CA83177845D606C1CBCDDD74789F81C39CB56546D801F0321D2DFAF3EC3020C9404DC10BA415087881B403002F906640E005DE902678D16F08C10BF96D0A5E608C3F37F052EB283B3FF36254C3B856F062B5AB56C04B699D3D1EBCC06BED35085E06B3C1FDE05E6C6DC442BB025E26D3C96832AA1AA8297881B402012F907600E005D20C08BCC01BD2042FFA0D217821BF4DC10B8CF1E7065E6A1D65D7C18B5975CA5AC18BD5AE5A012FA5159478F002AFA2D42078992EA37F626BCB8CB0139F8D44ABF18B0335FF6CA4DF8ABD5D0BE5ED58DBC250DE8CC57DAE2A0D59D9F45AD6108217F2DBFCB31184F1E7F7D9A8C6515EC0672396992C22C878D99ACF46F6BA6A05BC94D6C6E0C10BBC3E464BC14B86243B0E5EB281BA042FB2566C8317593B96C18BAC19EBE0A5BC218BE045DC108217F2DB25789133BE4BE0C5FA282F18BCE427395A0D5EF4BB0A022FB7091C21439180965BF31DCF149134815570C7331B549CB6813B9E71C7F3596011C6DED2C242AC81A41773BA56A841D44C6DA247BE4C5CED0047C8AABCF177948339F04483CE1FABA43364ACC288B48947E7484B25AC3F67352DA04A6BFCBB082DC55DFBB63BBAF3A31825E9A5729A6B33A003B3BFDD7B47067250968873706D320A6571B46414574659A64A4D8B2CDB34AF69D160DA89352D7203354D46B1A605D6B4C0B414D3524C4BA51A98A44C9896625ADA4A06624D16175D759B9AD65A4BC86D725AEB501CA6A7F58EC35D82EA6A1C573652D4D2CA457C8A0AAF5CD4608A8A958B7203354D51B17211562EC2141553544C51A51A98A44F98A2628ADA4A0662E52D175D759BA2D65A31CE6D8A5AEB501CA6A8F58EC35D8AEA6A1C573652D4D2FA747C8A0AAF4FD7608A8AF5E97203354D51B13E1D2C45C5FA7498A2628A8A292AA6A898A2762645BDD4FA8AC2AEBA4D516BAD0BEA3645AD75280E53D47AC7E12E4575358E2B1B296A6915523E458557216D3045C52AA4B9819AA6A858851496A26215524C513145C5141553544C513B93A25E6A155D6157DDA6A8B5567F769BA2D63A1487296ABDE37097A2BA1AC7958D14B5B4D6349FA2C26B4D3798A262ADE9DC404D5354482BB0D520FAED582ED7286B06B8D017DA10D69AC614B53EEC8F292AA6A898A2765B4BB156BA8BAEBA5EE80B09EBAD4C516B1D8AD385BE758EC3E5425F37E3B8B291A2969E28C0A7A8F013055A9AA266B36A78A280C3566CFB31593B9653545933D653D4F286F044014C51EBC3FE98A2628A8A296AB7B5144FC470D1D5E6525479583FBB14D5FA501A4A51ED8FA39914D5641C57D21475F5E2EDBD5598E0915E9C0EA10A91B7A25429EA6392B8FEE47BEB7008C359F83C193A9BAAD29BBD618FDC8EDD773E359DFB4FDE697BFC1CB6F6BCF7DE5E96C18EC45F92457E2D10A2DB58F9EC95A2F183FFBAF969B35EFBBB38244873591A7DF6516B87F011EFB0DA6CBE443CFCF8E1D5FB23D8FF741F068868A07E18C9EE0F1B8FBDB9A0D7A2FB2FD183C237570722147A79BA596FE2B673A9EF60743D939561E22A05DF92D4F7FDC7AFFE3EE55F9F66FC87BF52927425F5E1AF593434F65AFF26E4EAB3773CEDFDF056F857AC82C7D0837BFBF52C6486FFED78A29304E1EDDDE97519EC5FB34783ED9A6801F3C043321F903CF3B60FDE82FD7113EC3242ABDDF1DBF17E7B2C1C0C6547F76E4A75EFC692EE51AE9EB7EEB120ACA089809AD5959A188FB89B5A372AD5BA9125ADA34B4E3AE4F150CFF4F46C5CAA67634B7A46798A91F562F5ECB654CF6E2DE9D96D17F4AC248AA2D6E969DDA454EB2696B46ED23DEF761BFD2BEA99E88097391DBC9292E59386F8A3583715EFAE54F1EE2C291ED5AFEEBA3B54C33235CC94EECB2F3FDFAFF6C1EEFB2BAF73E1BD5E72534FE3047A2556ACD3EE65B3F6FFF5E2EF7E0F49ABE95A512AD5637F4B7AC88F7DBD0EC576908C9DDE148D9D5DB490B3AF8C6866A96ED86175DD83E82B88059F56E046199B8D3D1B234E3DAE576A5CDED1741615E5C436DB1C7DB1BCC89D16F983BC74F4BD43090F82B58C07D19D16F1201F7F3F7E0815EC106CBD431A58994B6285CD87B66B53D6857CD8EC36916A8A19C8DCBF0855FA1FFFFB63105ABE981BE95D542979ACFEBCF79FA2A87B3CFA1236E69E10B1B22C6AB32F9F55E8D61494DDE8CE71AD523036E23C2F687BC15E5BEF2F030F3C78AF6F5B4934A4F73AE2BCA49F294DD8F725BCFF1E0ED697580873BF236C74022BFEE9ED37648DBA9089E9DD16B1D011A408EFED23AFC83322BDD31413AE97A3FE629663426E6EA63FEFCFFA92A9E86CE73D9D8A9E10951129D629B94057AA2871538C2E3EEDD6FE37FEFCE74D745972D0338B2476A1EB165D8F22F66FFE3A42BABE4345330113D182C3886CB4F633B24FF2D88BB77B0E29C57FC76C256D80D8CA9F5916B39576FE12D87AE380AD7C9DFD98ADE282FA9D64EBD8015BF9DA90315BC545203BC9D68903B6F2F54C62B68A0B977492ADFD6B077CE537E1C57C15EFB6EB265F5D04AD5B095FE92A818BE0AB8BA83591F0957E83BB08BEBA085B7712BED2915F045F5DC42DFAB55CC2DD177A5787C734D570C8D226BFC83FC6FF857C4564187FF477077FF1FAF6E21D36FCA7597ABF973E2062BF4E9E4BBFE31799FEEF68FECD3B0AB82D48706DAF5FB6F58D9B32EB1FA740F0352FE1647C17EA29D8B959B6B9B239F46192D543584E7DC6DB744D7E2BED59E9B39B566EA6FDBBBEA43A7D92ED2BEE4DD2A31BF922DAEBCCE33D4653D921A9E198D0A20E30FA8BF3719331699BEC288CFF228F64BB44A396E219C4C4ED39D2504DE32EF988C0A94CA9969A7E3CC8D9839E72D6EC030CDDE76FFE93BFF7772BB9D5674FE8B153C0B064AAD7C081B29123649EF7964E1A27D2081DCE76165EB7C25DD600090D9A89EAFB5DBE64CACF917946C55038D6933B3D724BC473856A286331AB1BF8F8C8155368417913520442B04BF19AFC1415245E0D18BB08692D1330C9B20802265A52A5044CB3B42489215549FD1120D52B4E11BA506C8433C70410B07040CF36DB9602506EC4A6ACB5EFF85C2CBADF6693961597B06694C07DE96CCD18B4829C15AC8353022B42D1909DF418D73A6904B9B23F2D9CBB51B2E2B6F6BFFB81A745266760045555855066B5C8EC5DBD26D22CDA4E9AD18D6B22C564D96BB4225232A361AF78136A84E3C0E93240B64CCF06A867DDD43399268066F368DD637E996036AB97143B4E2481D37BE9132EA7F714BEE7E8DB99E1472203B2005B53A00A9AE653A6AB69C52A5FCA70AA0FA7FADA6ADDD2E9BEB698B7D96C879279E2A45F33937E18EDBA640E38FD87C1A85BC6D7DA6940949DA6ECDED5A76916A3E9703A4C29B325D2CF62421075A3D154AFC53AE76E721075AE253AE7629A90DFF6CA4F138AB7C0E234A1A369C2E5727E37CE0E25C86905658ABEBD291085D89B025980BD2950054D132AD3D5B4E34ABA384D88D3842DB66EE934615BCCDB6C5E44C93C719AB09969428C765D32079C26C460D42DE36BED3421CA4E5376EF5A27298EE65962CE4ED964FBF75A3C4D88BAD168AAD7629D73374D883AD7129D73314DC89771E3A709C525DD709AD0D134E164349BCFB20F0839ADA0A2D0B73705A2107B53200BB03705AAA0694265BA9A765C4917A709719AB0C5D62D9D266C8B799BCD8B2899274E1336334D88D1AE4BE680D384188CBA657CAD9D2644D969CAEE5D6365D7F572B058A694D9299BFC7AAF964E13A26E280755B7C1B3753AE76E9A1075AE253AE7629A903F96809F26141F5180D3848EA60987D3E16418CFE7705A4145A16F6F0A4421F6A64016606F0A5441D384CA7435EDB8922E4E13E234618BAD5B3A4DD816F3369B1751324F9C266C669A10A35D97CC01A709311875CBF85A3B4D88B2D394DDBB466DB8E52CFC4929B35336D939A22D9E2644DD6834D56BB1CEB99B26449D6B89CEB99826E48FD9E4A709C5476EE234A1B34DC7D18F582BA82820AB772B89C256EF569205ADDEADA40ADC74AC48577B5570055D9C26C469C2165B77C9A6E37698B7E92E4B05F3C469C266A609DB680F680E384D78E6C68750B3796370BDE91865A725BB77AD0DA02C6576CA6694BBDADA4DC7A81B9554EB089EADD339979B8E51E75AA1732EA609C74465CAA709C7541E384D983ED1D4342115855D7B4BE46BD9DE2859CBF646A95A9F26CCD1B568C7842E4E13E234618BAD1B344D58A779BB9B1749CD13A709DB374D88D1EEDCCC01A709311875CBF8CE729A10652790DDBB95291B12C7D2AB67384D88BAE13CD56BB1CE35334D883A57A3CE599B26FC79738843173F3D486EC5ECD79F15A4D368382BA8A304787CB89426CEAEE9CD263CC62323B905E571220FB1AB79F4565F9FF7C129842C94A0341F510E770599C6E12E7F76BB4ECE562FD7DC4D87A0994B695A9E9610C91338430025E53641445572A14A6E13379499A1CC4020977E0BEF13918AC16EF22D3CE119A2DEF40997A817CFC5543ABF12D1EF99A1DF8254D9C99ECBC6BF68F02E0F55BF481C8C2AE552A5DCE261945D53E75733B858767E358B8B9383821017A74FE0F9D5CA64411F5BF03CE8EEE1E28254F307B425CEEE1271311A7CDD47EA8AE4DA295C8C2AE5FC605A3C08B2EDB233C1C5B2031B595C9C54C6475C9C3E8107362A9305D8452555C4C567888B0B52CD9F489238BB4BC4C568F04A068FB81863483B540A4FDB3A0BD999E062D909452C2E4E4AC1222E4E9FC0138A94C902EC024FFCE9222E2E48355F823B717697888BD1E0EB3E344524D74EE1625429E7478F60A9FFB6CBCE0417CB4AF2B3B838A97D86B8387D024BF22B93B5BC6935AD4187B8F8ECD651E45ACAD79C4C9CDD25E26234782583475C8C31A41D2A85F594CF427626B858568396C5C549B10FC4C5E91358835699AC8B622E888BBB858BB34A3A888BD1E025068FB81863483B540A0B089E85ECB471F1C38BB70E3B48A4CA43E2E46ECC2C7D307C1DDF691E0C53CF958301650540928B11034282D3A4FA211B0E594B39E74A6E0E0AB22058AD177459D204D6C7A645BF1DA847C14316EA8B57D61DA7D70DA2D979406994EAE5C15EA1B0ECF3F55D3D879D5D47FF52A9B39513D96BF594A6EE347BA0E0ADA29E187DCABCA458ABD1DC70D21FF40745E71403E84EE1B9A6CA8920A66B63F4D7AC586314FF752BCE20AE43C922B66B3378598CA6C3E930957BBE2E207BF552D19D550619E23B595DAC02BE8397C66A35BE5B2E6783EB99D84565B0AF03F8AEA9B21888EFDA8802342BAF18A100DDCA2988EF50B288EFDA0C5F96CBE5682EAEFB9CC5CC4BC67756196488EF64F59D0AF80E5EE2A9D5F8EEE66E3ABC971612482E7700DF4D1A2AEF80F8AE8D2840411BACA10085B610DFA1649D4816F19D325F35E0CBE27A395888D717E727AD2E76FECE26830CF19DAC4E5101DFC14B15B51ADF0D6683FBC1BDD845DDA4973B80EF9A2A5380F8AE8D2840B31286110AD0AD6481F80E258BF8AECDF065B69C853FA9DCF3F5C6D8AB17BBFACE26830CF19DACDE4E01DFC14BEEB41ADF4D97D13FB18B1AA5973BF17D56BE53C7E5767BC477EDFC8A57A90D16BFE255B685F80E25EB44B288EF94F9AA015F0A7267E14B16332FFCFBAC3D0619E23B59DD9802BE4BB6165F10BECB5696741CDFB9DC368EF8EEDC5080A03281331420AA2C80F80E258BF8EE4CE14B163311DF5962901CDFAD5EBCBDB70A3D12B1CF0CE3EDFC5F4FAF8FE1E5E81516D9455EAAB78BEFC5AA9B877373FFC93B6D8F9F43B2CF7BEFED6519EC8EF1833CAEBBBB8BEF98E03A6A4687BF92DBF10DC69424237F4B7A5818F921B6A83C9A3DD03114065B0E5B6D0C8FFAFF0D8175919686A21E1307FAE2ED9E43171BFF4D9E5D85ACF6BF1D4FDEF6210E3D311F0809081F44DB6A0EB26D348DB0E27650132B442B500FB215A78DB02244A735F142B45AE3205B9DD10C2F6E6244E59E17A22F1B07D9978C667831890B93B8E7C5F4B4DDFA62E7D9A3F71AE54A18B4D2FFF9943E4A52E72BE6AE1BB6487C697CB369972AE64C12471D7346E25A29671AF6B062CE24ABC61D7346E26829671AF6B762CE24EBAD1C7346E27629671AF6BE62CE245F2A9D716616D2DBEC4EBE9835E9DD4659C3CDBEF607341815012EB9E88A4512679CDC6EDA1DAB7129C2BE4EB92471CC29971A76CD6A5C22B0D8299B245E3A6553C37E5A914D116276CA2689CB4ED9D4B0D356645304A69DB04932DB427844EF35CA1F71504B3ECF380B6AF1D025FE3ABED94EF07C5B0F67243E9A72A695E079520F67246E9972A695E099D077CF198927A69C692578EE13AFEB9235E97CB59839D96D7DEE0CA9B215B8F3EF65F4D6518D2D16819F6845C7E1485661F4C9B20D3107C803BD7E2F7E44C40585851C37C9273DC7CB34EA5E5571FEAB114C3E30977DF7256BCD05DF7DC7E4878C80F9EE9BAF0E1B7FD98A9D4B34160B9FE69D7C476FC118CFF423B5FA6E06F293722DFE1A2AAD259C5675B0F6B1B8898E1AB8F092BAC745576E5CFC187D3AFAF4D81266FD9BF18DA4965677BC7AADA3ECBA5F5FDCCFFA4C790E76954BDB3CBBD5AE9AFB76C99C88D0B78B6748D0B767F68FBE3DD2B812AFB75C2E6EEFB3C22039AF97D5833B77DF5EEB28BBEEDB97CBE5ED22B68AA2C31456106CD0B75BEDAAB96F97CCEA0A7D3BB8E821FA76F4EDB12D4C478B3E53EA33E7F5326778EEBEBDD651761EB78F97A365DE35F2BC6C096EB7D95573DF2EF92E25F4EDE08267E8DBD1B7C7B630994E46936C4370CEEB657560CEDDB7D73ACAAEFBF6F9643E9EE7F718F1BC6C876FB7DA5573DF2EF9B22EF4EDE06247E8DBD1B727B315F2BDB399333CFF39991A4779017332B25DA5C2AA21CDCEC9D8EBAAB96F17D53891F97670A113F4EDE8DBABBD5E0678BAECDBAD8FF2827DBBB062403B7DBB7E5741BEBDF4F329FC7B2959F6DD3DFF5DE72A3898BFD46FA550C7C3DD92BEEE95AEB2E03C2D91C2758FB8EE31F6E72A4B1E07E68B1DD1C15B58100773F19076404E1EB6C20FDD3CBA795C0659A3AB2F87F0E66B1FD1D55B581F079DFDD06F07E4EA610BFED0D5A3ABC7559135BAFAD20591A9AB872F8544576F61B91CCCD543DA01B97AD8FA3F74F5E8EA7191648DAEBE747D64EAEAE12B23D1D55B583D0773F5907640AE1EB61C105D3DBA7A5C3359A3AB2F5D2E99BA7AF8424974F51616D3C15C3DA41DE0048E6E43E8EAD1D59BF8CF92B52B99C2B56602C75E578D5C7DE9EAC9D4D5C3D74DA2ABB7B0B6CEBEAB97B563DDD5CB170BA2AB47578F2B2A6B70F5A573F4F0A9F9097AF6A223BC263F4547182FB6627D974D9290C850493477C09A159A17E3F1294312E68963E3A3B7FAFABC0F4EA18FA13DA0940C1C4D4100B1A3C9F15FD9F939D876B00E4E89833253227B67F6F14250E7906A80AD6491E828C3F60C5331F6578E52708A637B0659854AA42369B5B305EEC5A9C23D66DB8A9A8966E283410D98B4F3A368A1AB2E92E3782D74E75DB53BC296559C90567F0ECAECB11D20143C8DDE489439FBBFEC5D6D73E33692FE2BAEF974F7E16A6DD992E5AA99ABB2656BE7AAB2D95C26B7FB59963563656CC92BC937B9FCFA234190044900041A00F1C2CE54251952048846BF3C4F1368D81F097C52FE0262092AEBF42FCDD7E9236DE8A8C2D5DDC5CD8560010C983828340A71B60ACD02E2596FAB8586237D70471F5A53C0E6292222104A8A84140229445414C2A3D30D9246F88B6D482592A1129AA82B6832A1EB2086A313D2BD60159D80EF05433AC1F91C7B7FD32D85502803158A7E08526814F68DBAB7594064EB6DB5D070A413EEE8446B0A583A51CD40F874424991904E209D888A4E7874BA41D2097FB10DE9443274421375054D27741DC4707442BE96C97CBF31D2898E32CCA78B7BA6AE484319A8A0F5439042A3A08D6CFDCD02225B6FAB8586239D7047275A53C0D209FDB59DDEE8849222219D403A11159DF0E87483A413FE621BD28964E884C26C474327741DC47074425AD3A2A213F09A1648273ACA70797739BF2C706A4719A8A0F5439042A31097ABD02C20B2F5B65A6838D2097774A235052C9DA866207C3AA1A4484827904E4445273C3ADD20E984BFD8867422193AA189BA82A613BA0E62383A21AD9B54D10978DD24A4139C4F553CCC5828031534E403796FA3F66B2F41235B6FAB8586239D704727B810AB3503E1D3092545423A8174C2EE209D2F76F2E67483A4130AF27014DB904E24432714663BA2C54E7A0E62383A21ADCD57D109786D3EA4135ACA40056D370495B367BDBE9F8BC8465A2D341CE984173A51CD40DC74A21E06D289E1868974423692E09D6E7474C26D6C433A310A3AC1415DD1D2099E83704F27A48B9CE06B9B68C568640FF5DCEB9F75AF1F80F4FB80F85FFD5E00514FBF13507972DD6E0A9B4382A34D70CC908456693F4B4D424CC3433D4F35B0F3635CB58221660D840BA997D35F907FB8EAC05EF35F4CDFE28BC2A0944A91CC2BF3229988AD3AE6BEB8B89A5D75CCBDC0D5F6D015A417481081F403882B906E40184BBF2344595E5016D69AB554E54F236AA5515A1566E288B8B82AF170BBB810EC670F0D73597D5523D425AD2558A12E782D41445D9C6CE6C3F56D7DD078C3E8275CA3877D54D1EF05F65541BF1FD0D71CFD6E8007EFE97684A8CB0BEAC2929C968AA169C4AD542A50424C1C5197402596D70FEDB4675B9661A02EABAF6A84BAA425D72AD4052FB986A8AB63F477D3878B7B0145AD7D8129EA82F4020928907E001106D20D0875E97784A8CB0BEA9A63E5423B35A334E256AB47366E4554A80F66E288BAB82AF1305B4E974DD0D2956520B92E9BAF6A84BAE48BB6CC2B5321EAEA3ACBBBF9743EE51B3D79C60AEA82F4020A28807E201106D00D0875E97784A8CB0BEAC2026F964AEB68C4AD34EA99C14C1C51175725EEE7F7B37B7EFAB3966518A8CBEAAB1AA12E69019F0A75C10BF820EAE224B8C5FB256A5F60FE8551BF17FB6510F8FD582F3FC1EF06F88551B723445D5E50977CA29C588D23237163133C1370B27795E9300ED4053371445DFA2AC15E0DE20BA3BD5735425DD23A2715EA82D73941D4A565F435127789BA44BDD8DF2DCEEFC7FA2E7D7E37D65117BF23445DC1A12E2C17A451A8C14EDC4AA63A4E79195197B94AB05783465DFAAF0A425DD3FBD5E13B198600714DCFC82F8A49D5465BD373EA4B1CA32DAA7BC6D1809DF00000DB44E4300CB6C7C3DB94C51978AB9230036D3452FCA3EB3D14F7EDB35EA27A9D3E64A51CEB644A7141C6AF1CEFBAA6090D710E02B90900B2373037B5E9C2189B8B8274618CCC4B15BAD6EB0739E5B9602628187D84398097B2C92BED09C6A82C9F49BFCA35E24228B45755FD0BA0509E850A847FA1CC256F458FD9A8546829188E719916A43A6EA88E518D0A93564174C7AC4A05BCD9C26292A73CCAC533580752BD10921E95C121E91978D26C0C0D490F921E243D487A90F420E9512990D4243DE02A49487ADC901EA3123126AD82488F59911878B385C5244F7A946BD7B00EA47A21243D2A8343D233F0A4D9181A921E243D487A90F420E941D2A3529FAC497AC045CA90F4B8213D73930A4D26AD82488F42BB10D2D3DB6C6131C9939E961C58D2D35C05CB3A90EA8590F4A80C0E49CFC093666368487A90F420E941D283A407498F4A79C026E901D70844D2E386F4181548336915447ACC4AA4C19B2D2C2679D2A35CB98D7520D50B21E951191C929E8127CDC6D090F420E941D283A407490F921E95EA9C4DD2032ED189A4C70DE9E18FAD00BABDF5094D5A052E6FEB6D17B6BCADA7D9C26292273D2D39880B27B20EA47A21243D2A8343D233F0A4D9181A921E243D487A90F420E941D2A3521CB7497AC0157291F40C4F7A7ACB839AB46A9DF4F4170885375B58CC98494FB36E29EB40AA1742D2A33238243D034F9A8DA121E941D283A407490F929E51939E19D1BDAFEFC5FB0A08CFECACFA55A1F2FA5CA774221EB84E7F11E380598EC88318159106365AE85B7494C113AC37107238785EED580577434AFD0C8505F9A7921C5B5A9CBDE6FF04058B2F6A16A7542A8DD6F1CABCDAA8C7C07539BF985C4CDA6655242F6AB17F795E3D654DDE2DE30D66864542C1CD624023FF350C684A628E2DA4B91C54EA41EDE1767121D8521C5A58B3FAAA56029BB49A5C37B0C12BCA790C6CCBE562725E83898671D5F12E81C06658080EDC2C0636F25FC3C0A624E6D8029BCB418DE0C4BBEB879AE7360B04B2578338F1CEDEAB5A096CD28A41DDC006AF1AE431B05DDDDC5DDE0A8BCA949713086C73B3623FE06631B091FF1A06362531C716D85C0E2A79C6365B4E97CDB8D0755B8130369BAF6A25B049AB4274031BBC3284C7C036594C6E27B77CE32206994A60332CE8006E16031BF9AF61605312736C81CDE5A0520F6CF7F3FBD97DCD769B853ED8ABFE039BD557B512D8A43B7FBB810DBEFBD76360BB5BE67FF8C635AD2E27918AE42D392B070A0E6CBDCD626023FF354E452A8839BE54A4BB418D2015C9CA8E8D16B5DB0A261569EF55AD0436E9EEAE6E6083EFF00A34B0D52823F1C0A6B0310BDC2C0636F25F8781ADDEA0955060331DD488035B931C051DD8F45F1514D8AECB504586220868D7E6ABF7CBC3E570F57E1DB392F1F587E57E773AE673765C6FB7BFE552FEF4E175F5FBFEF0F97677DCE63D6E3247717BDCAED89B0FF45A7EFF39FF21F7C9F5914C1BBD7CB77DDA16A3DA16FF267E2677A6A5FC27A57F741772B456AB9BBA8347CE9E2E83F815F35CD9DEE312CE44356232F565BFAFCB972106CC757431CF26603B685486D7C245314F95FE96E068660A37E2D87E51DC3A3CD080D5B7090FBC25B822152A5BAD6A7261BED5CA23CB886AAB15328F489987E6A622E41EFEB847445385EC2345E31B35FF8868AE70D7A48B57451632D080A36121D27DB15D1602DF17EB918544B52F165948A42C44730728B2107F2C24A2A9421692A2F18D9A85443457B8C5DDC5AB220B1968C0D1B0106911832E0B811731F0C842A22A62802C24521632D7DBAE8F2CC41F0B8968AA9085A4687CA3662111CD15D62371F1AAC842061A70342C445A71A6CB42E015673CB290A82ACE200B89948568D6564116E28F85443455C8425234BE51B39088E60A8B47B978556421030D381A16222D0FD66521F0F2601E594854E5C1908544BB22AB11025B5A165470C51559D14C15B290148D6FD42C24A2B9C24A7F2E5E1559C840038E8685486B39765908F15029B1909AF4230B4116E28A8594BD230B099E85043655C84252343E642171CC15966575F1AAC842061AB05F16F2B63AACBE1D566FCFC40F944CE46FABF561FFDBE68FC2A458E2F19ADF297C5386F0BF9797AB0716CF99D692DB5D7A717353DC396E5EB79FB74F4F9B5DF1C3DDF3F669F3CFE7CDEE7F32C2422EF512908C3C15A862F558FE2E9F957C106FFB63E6D6E6E7C5EF453FB899F5FCE0E2EAAAEF1737939E5F6454A8EF17F3BE17BDBCEC7BD3CB79DF9B5E5D166F9A6B05151C87C1153F9021944F1F16FBDD719F05C7BC6912CD984BE415BE6F0E15E3BC2888E8C555A62ADF56A7F7C3266B29FB5B11864E992F5C1D9EB2C7F3CA7EEF949566B777EFAFCB8CA6D63FDDBF3C114D667EF0A57CFDF2376F87FDDBFE70DAEE777543EBDDE98FD3EDCBA955E75B6009EB4C7357EB4C16C4E9BE1F336E417ACD7921D73688AAB7ED83DC3DCB6F9FD5A6D062E2F79BAFABF797D32FA5E9E532969894A639896DC7E29CB250A4683D9259EE665DFEB679DABEBFFEF5B07DEA16012CEE9DE537E135FF66D7D6DC9E61DEA5931D08E0C80B92D5E095473ACFFF90761900DA2C025A809B22192403B9F6FA90E51CECF522E156F63AD96696FEB4F93C4C37FF70DB4D017758758B2247A78BFA17E7F99F4A0205EA17D6C5AD24536249B594E063316AD0411B964F22692ACB854D6D0182F5D44F26999FE77F1435ECBAA961CA2F6A83005B7C51205810560E6E8006E38AC1881E643E41E4126EE69793CB7AC75A237D650F3F407A812008483F000C01E9068422E01D69E208FD8E4682241EA6779777CDBD9B5DB98C114BC03406D1041FAF2E66D35973558C4CCB7CE209ABAF6A8628BA5540B988025CFD131185CC33881CC372F93099F7D62D354514905E208802D20F005140BA01210A78479A8842BFA391208AE57239BDBFA924C03AD05A2E634414308D414421D0B287BBBBA63EC9B4CC27A2B0FAAA6688A25BD18F8B28C095FC1051C83C83C831DC5EDEDFDC77D2968586D4D4CC1451407A81200A483F004401E9068428E01D69220AFD8E4682281ECE979307FE1A276ED5A9D1200A98C620A2E06AD962F230135458E66999D71C85CD57354314DDEA5C5C4401AECA858842E619448E61763F9BCF0AA7DC710C75890C534401E905822820FD001005A41B10A28077A48928F43B1A09A2582C39E70AB7E532464401D31844145C2DBB59DE64FF286B994F4461F555CD1045B7D20E1751802BEC20A290790671F252BC0DA8FE5A66FED543BF17D8570FFD7E405F3DF4BB017EF58076A4FDD543B7A391200AC93EAC5A2EE3FCEA01D118441436B4CCEF570F8BAF6A8628BA5533B888628688221444516F5D75892844BDD84614A27E2C230A5137D61185BC238B8882DF11220AEECE6E4414528D41446143CB024514FAAF0A4314F21599F08598F3500004554B2F254EC8A4D783CBFF691B79B1AFA7EB5E58D50B18F2F40C0A826F7A9B848099DE4601C8A5B74D104C516C551393F42BDF1800C8E09B4C8D5C002CA63CCCF23F8A63BC207516B4825F0F4AB23762454C45161C9A7A265A71A6ED5BAACBBCF2341DFB6E5DAF2C945BCEC614253CDAAAE9E6650E2B518D771278D0B9923895C322072CEC159C978E4B27FFA8BA746059B314B69F37C42B45262478584726C056C18AE15ADED2626E83B81520E153DADC3F31DFDC8F0CF0E31818E0D5DDC5CD45BDCE820EAA48628039A042A3A07245FDCD42EA13F5B70A2B48A4DAAE6E05A2BE7647C2063D140AF0C00797D38773C1CA6A6484C8089111063309C808ADCCCBC3EDE262D1746D52B7EE9113FA2F2262CE0A4D510AB85DB082B8977AECDCB0E7A3A0799916E4861FC7C00D97CBFB9B59FD2DA261C3741A21EB9F7A1B852D77EA6D16B4BAA9B755E06226C576B5D72EF5B43B126EB81CBEE48B0F6EB85CDE2DF9DC90374AE48611C05FE486294E0272435BF3722D488671DDBA476EE8BF1C943937344529E0760D14C4B5D463E786F2825B15378417DC426EF8710CDC703E5DDC3369BA860D53E5D1E7860A8D42B8A142B3006EA8D02A881B2AB7ABC90D7BDB1D0937F450BCCB07379C2C6F978520554689DC300EF88BDC30B949406E68655E1E66CBE9920FFDB96EDDE77743EF85FDCCB9A1294A01B70B5610F7528F9D1BCA4B2756DC105E3A11B9E1C73170C3CBBBCBF9658D3D1B364C95479F1B2A340AE1860ACD02B8A142AB206EA8DCAE2637EC6D7724DCD04319460FDCF061F170F770A73C4AE48611C05FE486294E0272432BF3723FBF9FDDB737554BDCBA476EE8BF44AB3937344529E076C10AE25EEAB173437911DC8A1BC28BE02237FC38066ED8D2E0860D53E5B15DA5971396AC356BBD062F2F2C5A6ED76A855DEA70B0A06E22DC507394C80D2380BFDC39456E88DC10E745DFAD7B5D53AAF5AA81AE29354329E0768752901172437939F38A1BC2CB992337FC38766E4895C776BD754E58B2D6ACF56AEABCB068B95DABB5D2A9C3C1D2E8E97343DE28911BC60A7F911B2237C479D177EB617243DEAB46C70D55500AB8DDA1146444DC50BECF10BEBD90608A10A860FCC4AA35FFF6C855A7617B04ABD3B43592D569D9A20B13B46DC58D71AC188F827041B7B6E59B51B8B4950328D5D932A428319AFC84ACA989C0E645B8D2629F60E8D102E8AC05B0CA6E857587A9FAA66A84E10E55BF3F5BE155F79DA9A8448F4CCD6A206E6ED9FF85AB037D1914BBB317621AC6E254F7E55BD2055DB1071E53250AEA001FD42CEF0CDE4ADB41C1228B1A0ECCF9299D4D74697E36112601D18504E042660E5D8851DB2349027A390108D380B68C1ED38016827EEB9C8DA60DB0EA8E89400C79A8FC980AD4D1A4485281D67D60B85A80C940AB938DE9C0B1A603033BBB0D75CB3B9B4F2F216855C7CD5282F223E9AA9420FC483A4C09A21309C089CC1C3A11A3B64792125CFA38F80D5382B68C1E538216C27EEB78A5A60DB0EA8E29410C79A8FC9812D4D1A4485282D67D60B85A802941AB938D29C1B1A604033BB21375CB3B9B4F2F256855C7CD52823D3B84CD4F22C594203A91009C0801269812F4B74AD0C7799F9812B465F49812B410F6E7CD53F59A36C0AA3BA60431E4A1F2634A5047932249095AF781E16A01A604AD4E36A604C79A120CECA466D42DEF6C3EBD94A0551D374B09CA0FA0AE5282F003A83125884E2400273273E8448CDA1E494AD0CB31CF9812B465F49812B410F65B87A9366D8055774C0962C843E5C794A08E26459212B4EE03C3D5024C095A9D6C4C098E3525E8FEA8784C09624AD04ADB61E8B8594A704A8CA03725589EF28E29C1EA1798128CC989CC1C3A11A3B64792126CC9827579D3C6554C098668F49812B410F6A536C0AA3BA60431E4A1F2634A504793A2D9386C510D302528F25F61A404AD4E36A604C79A1294AA117B155382C9EA56EA2941AB3A6E96129C1123E84D09D213A3312558FF02538231399199432762D436A60489F85A2E0F538261193DA604DD867D125F312588210F951F5382204D8A3F2508F381E16A01A604AD4E36A6043125A8C41D3025983C9B1F554A505FC7F553823F6D8F27E149C3F94D830386E97242FF19401AB61B21FF9CFCD39ED5E2A0E76EB067DD47C0E9C39E41C13C42BFA462CC63A9A5950ECBFDEE9443C7D571BDDDFE968FFFD387D7D5EFFBC3E7DBCC97E43D6E322C7A7BDCAED89B0FF45A7EFF39FF21F7C9F59108945EBEDB3E6D399AA7148EAA00EC687EEB6EEDA62A142DB2AC3FED28FFE6CB6A8052EDE3C0A5A02C102994B9220751DF347F9EFFA95EB108F7C51BB2D7B8C9701B80D6C78B025109FD50D9834ECA0F950853E28129ADD347E9A00AD06B60FEBDCD2254891CAA28CD70DA60C5A7ED8C19B04428776BA0E5617A7779D72C6356BF237BD53F6CB1FAAA66C045785A6B13B8C04F6B45E032FCF2ACC619490D6B2DE7119473ED6916814BE4C0456986D3062E3E6D67CCC02542B95B032E4BA3838C07052E565FD50CB808CF946A0217F89952085C86062EF36625F786B596F3087002BDCD2270891CB828CD70DAC0C5A7ED8C19B84428777B1917A3E3D606052E565FD50CB8082BDF37810BBCF23D0297A1814BABDE64C35ACB79043881DE6611B8440E5C9466386DE0E2D376C60C5C2294BBBDF52D4687420C0A5CACBEAA197011D6E76C0217787D4E042E61ECE42FD4AB9C476BCBF3996611B844FFA948618653FF54E4CF76C6FDA9283AB9DBFC54C4BE248B06A68DAB417C2AB2F7AA66C0455845A8095CE0558410B884045CCA79B4EC04AA3DC1085C12052EF5AEEFD10217D7B683C0252AB90F015C781B8803052EFAAF0A032EF245B9F0B5B854CB82C1291E02CE18C051CFA020B51C7A9B74B013B2463CF6DA4C1ABF1DFF2C6535A119FCE39F7549A1E29A11E062F546098509CB06E94D7D1095811E39B53420C8D08DDC032EA96422B806F01B5272963C58CC0A6B49EC4E024CA2EAAE55458CABDB5EE5E1BB6E8066C62035F1EC7EE4E841201B7F4A7D94BD56CF9435656D996529D56E9898D76E40DAF5710CB44B61F3B57E5CF4B5A31B0487C65DDB2222FAA53BFD48C090800D2C396B7E0C2998AB5083242C4412E6BF0E4AE034CCBD809088E5E3D426623D9FBDCC6BD12011FB380622A6504C0252CDDC4F850A102C1A77AD9E888898EEF42311432236B0E4ACF9312462AE420D12B11089D8D27B5DA7C089987B012111CBC7A94DC4E4B5B52A2206AFAD8544ECE31888D8BCBF388E7E7454681442C4149A05C0A2DE5691888541C474A71F891812B1812567CD8F211173156A908805F945CC7B9DBAD0BF8839171012B17C9CDA444C5E2BB02262F05A8148C43E8E81882914FBD28F8EBE2A888160D1B86B294644C474A71F891812B1812567CD8F211173156A90888548C4FCD7DD0C9C88B9171012B17C9CDA444C5EFBB42262F0DAA748C43E8E8188B50CA711C8A8F240D68BF4360A5B9AD8DB2C68A1504FAB48C4C22062BAD38F440C89D8C092B3E6C79088B90A3548C4025D9AD89547398BECD5112F4D742C202462F938B58998BC967345C4E0B59C91887D1C3B11A32A60373ABAACF06A1D16A55FEB3A1122C69B7E246248C406969C353F8644CC55A841221619119B35AE22117325202462F9389588D897E7D553E69D840513E97D8352897455B57FF6D5C19321171E3CCFFFB46341B3B068611E77C43C20F146BF0F08D3D1EF050043F43B69F93A37DDA449B73AD6F8B8F9BA3F94A232498C3C1623E31DADC307475D6FECE8A017B4C761EDD115F66825BE8A98DE384A024469873109887A3FEDDFCBC09FCD17C157A8DE71A9373C5F20D1215D066CD894B553A782AA473FD412C201C63C1962CCF6694B5FBDF78ABE98977C471EF3431F37DDCC2F279793B6A72CC8BEBDD002E905125C20FD00C20BA41B109FD1EF08194D2A8C062DD38F65BA0209AD52DF6C5675DCDC06153D0245478EC3D66E08ABDCFB400E6C9851C7CD7384E5D43B3C075E511D79CE0FC8DAB387C9BCDEE5D7F097B51B350D32905E60ABD3F4FB012D1ED1EF06C473F43B429E930ACF41CBF46399EE568F342A69B330A13A0661943C07153D0245479ED35C60155235F5E196BF0D30EAB8798EB05A7987E7C00B9623CFF9A18FA66E2FEF6FEE8B763BFEB2E6EEA64106D20B24C840FA0104194837209EA3DF11F29C54780E5AA61FCB740513E6CD42D52C4CA84E191825CF41458F40D191E7B05F36C22A563ED4F79C41461D37CF111603EFF01C783D70E4393FF4D1D4EC7E369F1598B4E32FEBB28DA64106D20B24C840FA0104194837209EA3DF11F29C54780E5AA61FCB7405135A75A059985015F11F25CF41458F40D191E7845B0B7C200736CCA8E3E639C25ADB1D9E032FB78D3CE787DD9A695381BFB45D6294DF8BEDAA6AA27EAC579FE577035CB7A6DB11F29C74D6ADA165FAB04C87CB3ED85763614255237FA4EBD650D1835774E439E196DA0EC181591B75DC3C4758CABAC37366D4C520CFA97EE1AF367479D9659011F562BF7A34BF1FEBC55DF9DD58E739FC8E90E78C81E7A0655AECC63F4C20310F790E2A7AB88A8E3C27DC4AD62138306BA38E93E7F4D61F80971D288FEC405AC3718F1722FF58BEBEDC89F73E8E703A3638ADA0110A477F68B7E9F56485E88AF7361483F995238499F0D4738372D7A8EC61B7A1ACBA1298C294559753B2425F73C095772A82EDA300814BE27E9EFF91583B7B27879E9BFC19989424383CB4F7DD6D00E7C7B8800D0EB5444F20F5813ABC881B1514F320D3BF8069A06AD9EDEAF0564A879017222F445E88BCD02E5C88B0F43132435B938FCC90BD9C961D223774225A6487CA52427688EC30044016233BECFF58685EAC1CD9A199EA213B4476983C4188AE6034B2437B938FEC3010D86EDD0E911D3A112DB2436529213B44761802208B911DF69678AFD821BCC43BB24333D5437688EC307182308FAFCC36B2435B938FEC90BD9C961D223B74225A6487CA52427688EC30044016233BEC2D8C5FB14378617C648766AA87EC10D961E20421C2E2E4C80E6D4D3EB243F6725A7688ECD08968911D2A4B09D921B2C31000598CECB0F738818A1DC28F13407668A67AC80E911D8E912014D029D492EEC80E9D4E3EB2C324EC10D9A113D1223B549612B24364872100B218D961EF210C153B841FC280ECD04CF5901D223B1C2F3B0CB5103EB243A7938FEC30093B4476E844B4C80E95A584EC10D96108802C2876F8B63AACBE1D566FCF646435433C1E57DF369F3799021F88D49BC490DC3DA3B78B2136D9204B043308F5BDF568F1E4E279459FEE72C59B9BE28E05AEF876F754CCB1685A59A4452C583AABBACFCA0059FFD30D1DD17B3807AA74E88C7F7B5B9F261DD53D2BFD5BDD318861E75A9AF794CB8B503DF2BBE7D5EE5BD614BD40DFAC01A10FCBFDEE74CCFB3AAEB7DBDF721BFEF4E175F5FBFEF0F93653FBBC914D86216E8FDB157BF3815E239DE43FE43EB93E12A7402FDF6D9FB674847F9632999489893F17F94B30D74A9F2136A075A6C4AB752621D2D5FB319B6B6276744EF82645345F6E5667B575B46CEB7EF375F5FE72FAA5B4DC5C763D96A669656293F2395FDF37874A06173409A5328710F5BFB8CA84F96D757A3F6CB2D6B2BF15F677CA70C4EAF0B4C846BFF9E3F44E3D5C767BF7FEBACC5C5EFDD3FDCB135103E6075F4A8B2A7FF376D8BFED0FA7ED7E5737B4DE9DFE38DDBE9C5AC7576979EF9FF7B4AB8E8AFDBC3F2B6F093482E6B4FADDEEBFF2F1AE4E6A2ED8305D47B58EA30091CF531E24FFB979E4CC537EE7ECDFB27BFFCEF501F244AB8DE0C9B5F44F1F7EDBBE6692FE79F3E3ECD7FDEB6A575932F7CEFAD8BDAC6CB66652FDAF5D36EA821471044BEFFA912C556A36525E4F1A71517FC827E2E8F9267F2A424A65F49201EF326BE15D67030BD3D94000CEC87B9847EEF6806512368DDAEC4CEA09B6D7927BC267F1E348FC6963EAAA89FA25C33B3FBFBF3E7228CB5B0EAC76C53DBDD971EA5DDBF2EF1F79F76BDE2F2FABED8E7C7DEB1E2C41EE9D919BF0C324AE886F721FE53BDF7C02F8287745FEA74BF8EF96F91FD2AE20E150DEA249A0FEB369AD7725239ED63B93F054EB7DB5322483F456E55D9CF656A46D52FB46CB49F9338E4EEB2B9EA429FA4285756B7D69733089C03467F267234FF23F95D894D2E74B6031461BE97EFBEF0B8BECDDA2E06C64071702BFA2C112237BAD00D7CBFC4FDBE88B0305CB8BC519D6452E131667757B195D60E0996DC39B0F2575A0277710B4821B63A4D14AF849DC95830060E301673117D704C5650B5B0C6BBD21F94118B4E956B465A10DB88AED559968490CDA2419F433C55CBD8D28FAEB8FB7BB96D061DCD67FBDB05D76FFF243CDE17216F998461464D7CEDE577D319DDD7965D6ACE9988FA5855DB298DBAD13C8C65C706DC02B1AAD31E68E33036B23F6E8BED6409C117DB0E30C67B7380DEB92C00569AEA833439714A84BF2B292705BFC9BA23FE6237CB9FF225412A263D8B6F752718240CC93377062D5E7CC35622E7558BFAFCB972126DEF466094CEFE08CD4B769B68050CC73E73EC91CCED421F044F20F25FFDC8E8F9E067CF49AEDE0AF8B2EE845E605C86B71C8457E8BBCA8E2F6B5AAC118563E0B62C1A70F8BFDEEB8CF6246E5E4994BD473338BF14B9F567269C10CA8AEA66E8A503C2FA62BA9EBB9D79BA6DE35BBDAD2545A78CD9179DC9B5BFEFB7D7FDA74E6B7B8DA67722ADB10484B32339CF0E717B86FA9AC163239275647CDF16246BFC2B29B39E6330253889B2BFE467E5223EE7CA77FB10EBD63AA4D04450267F9D4D579FE4705E354CB102D996C2D6AEE749A5A2AA313CAB3D86BA5160599D6D609BEB57E59BDBC9F5679BB9D39666ED9B0DBBA3999F1D2849F8AB19AEB77EB95C40230D5F4B62885E36E8EF57A3A592ECA3D717AD3BAFDB6231AD91D5475C7CAA496ADC9E6F4BA6F4E27D3AB87F3FB86035E5766434DA11082A59D5DCDD7168AC878DA9BB2164A462C0DEAD41A6E8C817B3A7EBE1EFCE9B0E7EC17A497F546CBD9476C127DB91FE9F5F74A096CE2FDF1B43DBD704CA2BC61C52268633283B8A0F97ECB9BADB3B84163E0CBFFBE547D519155373BD4826219317B68E78BB63B265F445EA0A19FD3DBFC8F4A98BDA55EAF7EA5E295CB5AB996604C634A44936F6CEB0D25529E7375D6E16716402C262A5C247092D974BE6C1E5EDF9E57C7ED91AB35591BD57D3DBD71E335AD225F7DA72B93E3AF9BAF9BC366B7E6FBDEAC91FA07A692BCE4DB9996248F99677F59146BC3CCCDCAC256DF62C16C2686AF9BF5E9D8DDEE4BD7CCDE9FD15FC0F7FC5ADCE32C052D345948FF2781AFDEDD34F871FFB27D22A1A95092C579FE27BFD0F8A440DB2D13A66A5FCF1F8BE1F06C7D7E7E5E575B32FF9ECD169B62BFBCCCCFF33F74865E268F55FFBBFDAE7A983CC079B82E1B753A4C1E2BACA2F3289199F922DD1EC928950E635FAF9ED4E8C4A2BA42AB57688AA5CB12D2A6526A1A1F5E925727E00738AD71B5EA2BEAC92432712A7F6633114AF3135DCAF254FF5CCA6EC1D01A165CAF6393A5BC48EBB93E2201CB3C49058653856EFD800E55A0A03D16AA4084225D648B64C2804CA85B68C4E0D695F3B1167911341BB1898851B39D5DE62A1A0321FD110BB68B5112737B7090D0DD89DF0109E0EDF8A18204F28B05EEC449CF0EC4E3C6F01FCA7460F81708A6B92B40C3F1350468C61B54DFB3AE1D64E13DDFD6A7292B4B8BEF89700AE1D400706A9139B5E3762DFA384B6FA7F66556C57C2EC86E1FCE8CE489C17305FB5168A0983DF66D224DF4C8374F3574588E765A288F5D1DA26C9E10A7C64E6AC41F86A131CD2CA2442C3C1D880D0075114B86F912CA5DBEB12DDFA7DC53522FA5D3FC6A821822090C21FA6A536288C83ED9208648044334E6BCC1C8C602271A623EB6B8355D7957091AC8595D2E4F4B055FC41D2FA45A6429F321071DA9420AF55552E3F0250E56E62487B6449FBF4AB415DCB72FE1ACD1FF190C6F89D7B30E01D7A434724C700F1041B8CEA27FA381648B11C2C1F6345033954D832E1CB4E5C38DAC3E70B153319B8A5DA1567A7B162AB732D648DA2D2FDD8CA4E002D389E72DF4F7850C1546FBFB4F268ABA4A9A349D064650892B6F2F020837828E40F045BD2BA731348150C91D37938518D1A831D7204348792F5FDF5F84CB43E8FDF0D68708C312FD1FC728A95E6105CA36A82DD0526A00966DA89F979E5E2D0E1AACE74D325D416574E6365D1191D3E991D620A1395DE1590094C97C65B0A44CF2851CA358E0020604C2B51E25204877B1072ED728469EB1AF093BC4DC067BAC926B8621651F52C824E7DF6031D45A62871A5B7EC6B1400383263C680A3FD9974133B2FDAA56383409433D1E57C2A1551E977A7C9506641C5AE5791087A6064BD53219C8306DC8C802873608F7497CAEEF15A176B4EF91A8D81A2F55041AFD2E8A21E6439E8B3707C1C9317C48507E7FDD09ABD2D2DB4124B625532F0FD0443A0B937211866970A5108E8BEE3C57D2A8948FBE1014B23727E969FF5E1A5E34AE5D9B1BBA12650ABB1C462A0BDE31EF231585F5BA205D02A18B1384EF69BB2E48E33DF3B7B2F09EE3DC1D831B6EE9E53676957C8421D835846F30EC540D8C5D9301680DA9A549F6DCAC977CAC5493CE24C231A12C5A6AD6E03E88D3D2D6171738ED927DC758705ABE6E0D711AE234BB384DF2DD8FE0B4103EFBB15335304E53C931CAD247FD2B6D559E867E27525867ABF278F189F01FD0060A4D4D344189F85715CF38C3BF267689B94CC4C8F18B62CC358E2FDAA68D18D91D5A146E47A76831B2EDE8E6F810714C3C38C68263E0E198B43C8370D8ED503B8261BB483DB536855B599015605885069829198238C0D013C0C7136054888E7091107B9A02609193EA610C4A0D401639B1CF839210D1AF53560BDEAC331EB02E7D2207961B453493034E52483E808486E807930A1E930AE6586577DABCBEED0FABC3FF914E797885F949A12C5E204B2792189DF3CB28B374DB9070E3513DC53D015DA1851145746DAB0B999AB7F7665BFCFE5E9F4B067557810B6EEA466E93D4E566A870DA11E2E165F36DB52B2252373894773DC6057D2A0B23AAFA1B2D589EAAFFB4E9368F064BD57F1C5890AADD00E0537BD47B81BA58D1D9792BABB73442AA3557F5D7C3F649B4D130BF37C6E31575FD94FED3A63BBF0D372AA39F0AC84F717251632B5F93E6B041BE58B47186F8E2742B97A1470A1C393D164349DE2579F92AC02A327E1588357C25366C50F812ED2720E16B8435C4CCA88471FD11432EA1D43F465E4791B7C773A4776246635F5E9E94C5257B189EAC8627D10266129ED23D4CCB30C2D8891048EEE238865CA075621F8181C84220329D84C839E75033208989C6339056A8142DC526A132B275D8584A1223F578C960242747D88CA609386DE1B025212CD561038F870200A10003F14C1688671888130EC4184783FA9C193FD1358DB1860C09BF8BEA2B1D866A813E0418AAAF65A1FA9ABACF284BA961E046069D48E42F3B2835C6CE9112E3A4DCB664397A64604D90F1E733462A8A5103A73919B70038CDA922E0B231328F09D59405C0A47117A5F5932069A97FE3F36B2CBEB821B4E370656EC562D44F9F24F5AD225D698022E04FB953E8444112FF8A5058FCA010A07624BCA21FECC571EE8D7A966CF0992BCD7EB3FA7ADAE4A691BFEECB7697BDFDE4AAFACBAFEF2F9B8658E8E3B6E3E0956042EE96F91FD2EEF3E6B538C53AAF65B0FEFEEDB07FDF3D5D54B7BE3CAF9E36F9030DDF3D4457B2086BBD334938B6DE9734763BEA4D10E82DF716232AD0F6363F6D8F27D18EEFFC9EDF1DDFAC07211ED556C522485A52A57CA2186B1A564F641B00A1EDF2F148B12E04A7B23B885B0063CEA648C7F2BDEFC70005D858D4DB87D94694E64BBF2095237D4AB222959604F0B42A7AB981594495110866F15A194105B3D43FD5C02C8655974714F81BFE0190A04A6F0FCBF5B4F1AACD4AF3F9DFEBEFC518EACDFCF5286A4F4E9A936565470E867A0CF5BC502FAA224142FD08AB480CB3F4C970E952A46823884F6AB90C2BCC668E58525F7E04C51E29CAA51B41244930809E25165A441520486849B702042ECAC5C816CB629104225B43EAC7569E9426682AB9F7932790A7136DE0279E6E841BF855120F63AEEA8C5E6EE83D8329C2D111EC7B037963D12E6EE28D23DBC54D24E17C5D46E2FE3A1977DB3DD5960CF14C026FC49E035DAE47976B4AB3A2FE6C137C386A1BDD64AA677436A29868833389625E37380F1F9FA40BF74C0254FD3478DDA05184AA1F1F27A3082F34D53332BE2585461CC2C87691794531EE319FCF8C07779A2E3A891BF6E5021800F689B66713D8E7757BF6F0B06F2469E4B115A0817CE8029D5797F8A6127D8FC4153E1EC58500100120024043B423145CC400B0916CCF05620B00BEAD0EAB6F87D5DB3379BD0608DC7FBD7D3F3DE7E86DBB3912B1B1609020C7B3FDD7B315F3A3C2029BA090C583BBCD1F1548718F13C5E50DC8ED2D018639FCF8F4613221F27C5EEDBE653F2DFE5EC893340294DF72FBEDFD2093DD57FA8388E4D62F1201A7F8E5B0FFBA391EB7FBDDAA70DB5D6AD1F8094F26B856054F20C732993E96F4C50E2BDA94856A4525340749942FDBD7B7978DA8EA4671D76FDD0D3F7E4E290F6FF8D1044D5D64EA3D660B0B11D17E3F71BBB93506B100DD9A68633E756BC16CCDEF7358F8697AACFBC95C601E4C3CEAEBE0C816A0D94A5C9A31C1C884B6DB58D931CFCA4C73D0E3AC3050FBB354C405843BA2E20414EE6079827A3E583713F71ED24275904442F2458D7C0A668C147DCDFBE3499231227753AAD41A3FF9724908B0D887BE5C63DC2ADEFEE29D678D2C1C4CD020683DF21C3107D3A00CE90B466B77547AE5135B6648D2B76786666889BA8E948026C423097A13A6CD0B6C174DDADC5A226A8CDBA9CD3025C242B1BB18530DB871E1BB1FF28DD05642F59860A1549E087D10FA58843EBFE5672E118174814F71AF10504CA847186A44A753D5D3A37F1C59FDAC2CF8F73F0D3830AC7E18740258FB71CD23BD58C54CFE8CAE7F6E1E45A9DFEC566C2B0573897C792B579067C29B088C0A6674FBF7D371732AF5474415F846A7FB6CD3E8749F6E189DEEC32DA3833D5E199DDEE391B2AB5A175554307FB47C62B80F672A7654E87FE2D020736CA29448EEF3BCE64382F3799935435D9EE6A34D8FA7F970C3E1693EDBF277A0A72B77A7F5347A3BF47603783BD142A2DCDB45B68A68508437D1E355DA0FCB309EC2E31290A7F034A23CF47BC57F23F77B82DDD0DBD30B27FF43AEF23C9ECACEE797EDEE7BA3A5C573368702FF7841D3AE2DFFF8AF65DEE0A9C7318A77439F91D7D8E4265EFDE5D7F7970D3B15EBFDEE940DE17D55EA682165DA28D584C332FBD5316FFAB8DE6E494AECD387D7D5EFFBC3E7DBCCB6F3B637ABE3E9F6B85DB1371FE8B5FCFE73FE43EE93EB2339F39C5EBEDB3E6DA930AA019141FF4729A4EF9B433513135AE7E9F86779654ACB561FFF5CE42FCC5C2B155BAC1DEB6C8A56EB4C78E4B5DE8F996F203A952F19EBE80B994FAECE9CD553DD529CFBCDD7D5FBCBE997520B73B10AD44553557AE3A69729E43A18FB33FBE3E22A13E0B7D529AF557096FF8DDC3C9E56BBA7D5E16951A978F9E3DDFB6B6E5AF54FF72F4F64A6991F542EBBFCCDDB61FFB63F9CEACDFFD98DF5EEF4C7E9F6E5C466CEB5BDCFDF6F3F6F564F595F1D753AED5767CFF41ED4110D5482E171F3757FC82D65527EF90EC0853C16FFA6EB7F6B559AD0339558552AAEC12771D1CD8D9EF66B41565465E2727BF975F3B4F99A796DC14C5E3A2CA671512D61805518F9FBA29B38C905C24F99C423906E5D1633297509572E253ED58A554A5757A652EA9E90964B897F345AAC529ACD4CA5D43D5D299712FF58A558A534AF8E0A844AA97BEA492E25FE7127B14AE9C2DC7D77CBEAE762E2D7D38F564C97C6FEBB5B86361713BFFE6CB4629A1A3BF01BAE98E8405211D3B5B107173181ECD659798F27327A8FA24D752EA02E236032A2E405790A82FC62FF7ECAF3103FFD6F950022AFD0210C8F550774C03554A7571AECF2727E312996B6112AB0A079A3F57AB33B11F64E2E7F795E3D652F7347D68AFD6018C1257D7F961114D7BA8CA0FCBFE37FFEBF00000000FFFF0300504B0304140006000800000021005B6DFD9309010000F101000014000000776F72642F77656253657474696E67732E786D6C94D1C14A03311006E0BBE03B2CB9B7D9161559BA2D8854BC88A03E409ACEB6C14C26CCA4AEF5E91D6BAD482FF59649321F33FC93D93BC6EA0D5802A5D68C86B5A920795A86B46ACDCBF37C706D2A292E2D5DA404ADD98298D9F4FC6CD2373D2C9EA014FD29952A491AF4AD5997921B6BC5AF019D0C2943D2C78E185DD19257161DBF6EF2C0136657C222C450B6765CD75766CFF0290A755DF0704B7E8390CAAEDF32441529C93A64F9D1FA53B49E7899993C88E83E18BF3D74211D98D1C51184C133097565A8CBEC27DA51DA3EAA77278CBFC0E5FF80F10140DFDCAF12B15B448D4027A9143353CD807209183E604E7CC3D40BB0FDBA763152FFF870A785FD13D4F4130000FFFF0300504B030414000600080000002100FBC821F4470100008202000011000801646F6350726F70732F636F72652E786D6C20A2040128A00001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008C924D6BC3300C86EF83FD87E07B62BB5F6C2649611B3DAD305847C76EC6565BB3D831B6D7B4FF7E4ED2A62BF4B09BA4F7D583243B9F1F7495ECC179559B02D18CA0048CA8A532DB027DAC16E9034A7CE046F2AA3650A02378342FEFEF726199A81DBCB9DA820B0A7C1249C633610BB40BC1328CBDD881E63E8B0E13C54DED340F31755B6CB9F8E65BC02342665843E092078E5B606A07223A21A51890F6C7551D400A0C156830C1639A517CF10670DADF6CE8943F4EADC2D1C24DEB591CDC07AF0663D3345933EEAC717E8A3F97AFEFDDAAA932EDAD04A032978205152A28737C0963241CF050BBBE3C24F19A15F761190FBF51209F8E51BF518B25077BD53E56493BC790E6A7CD7B26C8244ECCFAFDCECA7AFCFCB25AA07244E8634AA6299DADE8944DA68C90AF769CABFE0B509F06F82771C646936BE219D0EF74FD6BCA5F000000FFFF0300504B01022D0014000600080000002100ADDD80D8E00100004C0B00001300000000000000000000000000000000005B436F6E74656E745F54797065735D2E786D6C504B01022D001400060008000000210099557E05FE000000E10200000B00000000000000000000000000190400005F72656C732F2E72656C73504B01022D0014000600080000002100F1B8335493010000930900001C0000000000000000000000000048070000776F72642F5F72656C732F646F63756D656E742E786D6C2E72656C73504B01022D00140006000800000021001CF00BD4E4070000EE1D000011000000000000000000000000001D0A0000776F72642F646F63756D656E742E786D6C504B01022D00140006000800000021005FAFC877DA010000CB060000110000000000000000000000000030120000776F72642F656E646E6F7465732E786D6C504B01022D0014000600080000002100C90BBB17A001000037050000100000000000000000000000000039140000776F72642F666F6F746572322E786D6C504B01022D00140006000800000021008E44C0A5B71B00003B5E0000100000000000000000000000000007160000776F72642F666F6F746572312E786D6C504B01022D0014000600080000002100B4461EB05E39000050F600001000000000000000000000000000EC310000776F72642F686561646572312E786D6C504B01022D001400060008000000210042BE4A81DC010000D10600001200000000000000000000000000786B0000776F72642F666F6F746E6F7465732E786D6C504B01022D001400060008000000210044611E3A1F90000000EC32001E00000000000000000000000000846D0000776F72642F656D62656464696E67732F6F6C654F626A656374312E62696E504B01022D000A000000000000002100460095E068600000686000001500000000000000000000000000DFFD0000776F72642F6D656469612F696D616765312E706E67504B01022D00140006000800000021002538FA35BB050000BB1B000015000000000000000000000000007A5E0100776F72642F7468656D652F7468656D65312E786D6C504B01022D00140006000800000021002C822F6A3D0600005F140000110000000000000000000000000068640100776F72642F73657474696E67732E786D6C504B01022D001400060008000000210043329552000100008B0100001C00000000000000000000000000D46A0100776F72642F5F72656C732F73657474696E67732E786D6C2E72656C73504B01022D001400060008000000210062EA2B34F30000004F01000018000000000000000000000000000E6C0100637573746F6D586D6C2F6974656D50726F7073322E786D6C504B01022D001400060008000000210005C95CF40E0100009201000013000000000000000000000000005F6D0100646F6350726F70732F637573746F6D2E786D6C504B01022D00140006000800000021001FCAF261E1010000E60300001000000000000000000000000000A66F0100646F6350726F70732F6170702E786D6C504B01022D00140006000800000021009A2F69A222010000E60100001800000000000000000000000000BD720100637573746F6D586D6C2F6974656D50726F7073312E786D6C504B01022D00140006000800000021000CC41A92C3000000280100001E000000000000000000000000003D740100637573746F6D586D6C2F5F72656C732F6974656D342E786D6C2E72656C73504B01022D00140006000800000021007BF302A3C3000000280100001E0000000000000000000000000044760100637573746F6D586D6C2F5F72656C732F6974656D332E786D6C2E72656C73504B01022D00140006000800000021005C962722C2000000280100001E000000000000000000000000004B780100637573746F6D586D6C2F5F72656C732F6974656D322E786D6C2E72656C73504B01022D0014000600080000002100743F397AC2000000280100001E00000000000000000000000000517A0100637573746F6D586D6C2F5F72656C732F6974656D312E786D6C2E72656C73504B01022D0014000600080000002100BD84622390000000DB0000001300000000000000000000000000577C0100637573746F6D586D6C2F6974656D322E786D6C504B01022D00140006000800000021006F0EBFE4FE0000008A0100001300000000000000000000000000407D0100637573746F6D586D6C2F6974656D312E786D6C504B01022D0014000600080000002100BB29ECCE0E020000080700001200000000000000000000000000977E0100776F72642F666F6E745461626C652E786D6C504B01022D001400060008000000210014E0FE477B070000092F00001300000000000000000000000000D5800100637573746F6D586D6C2F6974656D332E786D6C504B01022D00140006000800000021002D25BB11B50100007D0400001800000000000000000000000000A9880100637573746F6D586D6C2F6974656D50726F7073332E786D6C504B01022D0014000600080000002100503A6749CB000000360100001300000000000000000000000000BC8A0100637573746F6D586D6C2F6974656D342E786D6C504B01022D00140006000800000021004139F2A1E2000000550100001800000000000000000000000000E08B0100637573746F6D586D6C2F6974656D50726F7073342E786D6C504B01022D00140006000800000021009955F41BB9030000CB1700001200000000000000000000000000208D0100776F72642F6E756D626572696E672E786D6C504B01022D0014000600080000002100F5A800746F71000022830B000F0000000000000000000000000009910100776F72642F7374796C65732E786D6C504B01022D00140006000800000021005B6DFD9309010000F10100001400000000000000000000000000A5020200776F72642F77656253657474696E67732E786D6C504B01022D0014000600080000002100FBC821F447010000820200001100000000000000000000000000E0030200646F6350726F70732F636F72652E786D6C504B05060000000021002100A00800005E0602000000, 8, NULL, 4, NULL)
GO
SET IDENTITY_INSERT [dbo].[Document] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

GO
INSERT [dbo].[Employee] ([employeeid], [employeecode], [firstname], [lastname], [dateofbirth], [joiningdate], [mobile], [emailid], [gender], [maritalstatus], [employeetype], [departmentid], [positionid], [imagename], [username], [password], [usertype], [address], [status], [isactive], [isdeleted], [createdby], [createddate]) VALUES (1, N'NEN-0001-APR2018', N'Ninad', N'Manjrekar', CAST(N'1975-04-04 00:00:00.000' AS DateTime), CAST(N'2018-01-01 00:00:00.000' AS DateTime), N'7083738738', N'ninad.manjrekar@outlook.com', N'Male', N'Married', N'Full-Time', 1, 1, N'CorporateProfilePhoto.jpg', N'ninad.manjrekar@outlook.com', N'Pass@123', N'Employee', N'Vasai', N'Employed', 1, 0, 1, CAST(N'2018-04-22 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([employeeid], [employeecode], [firstname], [lastname], [dateofbirth], [joiningdate], [mobile], [emailid], [gender], [maritalstatus], [employeetype], [departmentid], [positionid], [imagename], [username], [password], [usertype], [address], [status], [isactive], [isdeleted], [createdby], [createddate]) VALUES (3, N'REM-0002-MAY2018', N'Ritesh', N'Varma', CAST(N'1987-01-01 00:00:00.000' AS DateTime), CAST(N'2018-01-01 00:00:00.000' AS DateTime), N'9819223344', N'ritesh.varma@gmail.com', N'Male', N'Married', N'Full-Time', 1, 3, N'NoImage.png', N'ritesh.varma@gmail.com', N'Pass@123', N'Employee', N'Mira Road, Thane.', N'Employed', 1, 0, 1, CAST(N'2018-10-06 16:06:19.480' AS DateTime))
GO
INSERT [dbo].[Employee] ([employeeid], [employeecode], [firstname], [lastname], [dateofbirth], [joiningdate], [mobile], [emailid], [gender], [maritalstatus], [employeetype], [departmentid], [positionid], [imagename], [username], [password], [usertype], [address], [status], [isactive], [isdeleted], [createdby], [createddate]) VALUES (4, N'ADMIN-1000-JAN2018', N'Administrator', N'Supervisor', CAST(N'2018-01-01 00:00:00.000' AS DateTime), CAST(N'2018-01-01 00:00:00.000' AS DateTime), N'1111111111', N'crm@netragenix.com', N'Male', N'Single', N'Full-Time', 1, 1, N'Admin.png', N'crm@netragenix.com', N'admin', N'Administrator', N'Mumbai', N'Employed', 1, 0, 1, CAST(N'2018-01-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Employee] ([employeeid], [employeecode], [firstname], [lastname], [dateofbirth], [joiningdate], [mobile], [emailid], [gender], [maritalstatus], [employeetype], [departmentid], [positionid], [imagename], [username], [password], [usertype], [address], [status], [isactive], [isdeleted], [createdby], [createddate]) VALUES (5, N'SAM-0003-APR2018', N'Salim', N'Pathan', CAST(N'1990-02-12 00:00:00.000' AS DateTime), CAST(N'2018-04-15 00:00:00.000' AS DateTime), N'9863254178', N'salim@gmail.com', N'Male', N'Single', N'Full-Time', 1, 3, N'', N'salimlive@ymail.com', N'Pass@123', N'Employee', N'Dahisar(E)', N'Employed', 1, 1, 4, CAST(N'2021-05-08 13:21:13.990' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Event] ON 

GO
INSERT [dbo].[Event] ([eventid], [eventname], [eventdescription], [isRead], [createdby], [scheduledon]) VALUES (1, N'Annual Bash at Head Office on 31st December 2017', N'Annual Bash at Head Office on 31st December 2017', NULL, 4, CAST(N'2017-12-31 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Event] ([eventid], [eventname], [eventdescription], [isRead], [createdby], [scheduledon]) VALUES (2, N'Aadhar Card drive on 01-01-2018', N'Aadhar Card drive on 01-01-2018', NULL, 4, CAST(N'2018-01-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Event] ([eventid], [eventname], [eventdescription], [isRead], [createdby], [scheduledon]) VALUES (3, N'Picnic at Vikramgadh by January 2019', N'Picnic at Vikramgadh by January 2019', NULL, 4, CAST(N'2018-01-25 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Event] ([eventid], [eventname], [eventdescription], [isRead], [createdby], [scheduledon]) VALUES (4, N'New Year 2021 Celebration', N'New Year 2021 Celebration', NULL, 4, CAST(N'2021-01-21 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Event] ([eventid], [eventname], [eventdescription], [isRead], [createdby], [scheduledon]) VALUES (1004, N'Republic day Celebration', N'Republic day Celebration', NULL, 3, CAST(N'2021-01-26 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Event] ([eventid], [eventname], [eventdescription], [isRead], [createdby], [scheduledon]) VALUES (2004, N'Garba Event', N'Dress Theme Garba', NULL, 4, CAST(N'2021-04-25 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Event] ([eventid], [eventname], [eventdescription], [isRead], [createdby], [scheduledon]) VALUES (2005, N'fdsfdsf', N'fgfdgf', NULL, 4, CAST(N'2021-04-25 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Event] ([eventid], [eventname], [eventdescription], [isRead], [createdby], [scheduledon]) VALUES (2006, N'uiyiyi', N'ioiuoui', NULL, 4, CAST(N'2021-04-25 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Event] ([eventid], [eventname], [eventdescription], [isRead], [createdby], [scheduledon]) VALUES (2007, N'Holi Celeb', N'Dress Theme Holi', NULL, 4, CAST(N'2021-04-28 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Event] ([eventid], [eventname], [eventdescription], [isRead], [createdby], [scheduledon]) VALUES (2008, N'yjghjghj', N'hjghjhg', NULL, 4, CAST(N'2021-04-28 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Event] ([eventid], [eventname], [eventdescription], [isRead], [createdby], [scheduledon]) VALUES (3007, N'hjgjghjgj', N'ghjghjghj', NULL, 4, CAST(N'2021-04-29 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Event] ([eventid], [eventname], [eventdescription], [isRead], [createdby], [scheduledon]) VALUES (3008, N'testdata', N'testdata', 0, 4, CAST(N'2021-04-28 00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Event] OFF
GO
SET IDENTITY_INSERT [dbo].[Leave] ON 

GO
INSERT [dbo].[Leave] ([leaveid], [appliedon], [appliedby], [leavefrom], [leaveto], [reason], [status], [createdby], [createddate]) VALUES (1, CAST(N'2018-09-23 00:00:00.000' AS DateTime), 1, CAST(N'2018-10-01 00:00:00.000' AS DateTime), CAST(N'2018-10-05 00:00:00.000' AS DateTime), N'Family Function', N'Approved', 4, CAST(N'2018-09-23 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Leave] ([leaveid], [appliedon], [appliedby], [leavefrom], [leaveto], [reason], [status], [createdby], [createddate]) VALUES (2, CAST(N'2018-10-09 02:23:43.613' AS DateTime), 1, CAST(N'2018-01-01 00:00:00.000' AS DateTime), CAST(N'2018-01-15 00:00:00.000' AS DateTime), N'No Reason', N'Approved', 1, CAST(N'2018-10-09 02:23:43.613' AS DateTime))
GO
INSERT [dbo].[Leave] ([leaveid], [appliedon], [appliedby], [leavefrom], [leaveto], [reason], [status], [createdby], [createddate]) VALUES (3, CAST(N'2018-11-08 12:49:14.200' AS DateTime), 1, CAST(N'2018-11-15 00:00:00.000' AS DateTime), CAST(N'2018-11-18 00:00:00.000' AS DateTime), N'Diwali', N'Pending', 1, CAST(N'2018-11-08 12:49:14.200' AS DateTime))
GO
INSERT [dbo].[Leave] ([leaveid], [appliedon], [appliedby], [leavefrom], [leaveto], [reason], [status], [createdby], [createddate]) VALUES (4, CAST(N'2018-11-08 12:51:41.520' AS DateTime), 1, CAST(N'2018-11-15 00:00:00.000' AS DateTime), CAST(N'2018-11-18 00:00:00.000' AS DateTime), N'diwali', N'Approved', 1, CAST(N'2018-11-08 12:51:41.520' AS DateTime))
GO
INSERT [dbo].[Leave] ([leaveid], [appliedon], [appliedby], [leavefrom], [leaveto], [reason], [status], [createdby], [createddate]) VALUES (5, CAST(N'2018-11-08 12:52:53.313' AS DateTime), 1, CAST(N'2018-11-18 00:00:00.000' AS DateTime), CAST(N'2018-11-21 00:00:00.000' AS DateTime), N'new year', N'Approved', 1, CAST(N'2018-11-08 12:52:53.313' AS DateTime))
GO
INSERT [dbo].[Leave] ([leaveid], [appliedon], [appliedby], [leavefrom], [leaveto], [reason], [status], [createdby], [createddate]) VALUES (6, CAST(N'2020-12-03 13:47:35.630' AS DateTime), 3, CAST(N'2020-12-03 00:00:00.000' AS DateTime), CAST(N'2020-12-06 00:00:00.000' AS DateTime), N'Wedding function', N'Approved', 3, CAST(N'2020-12-03 13:47:35.640' AS DateTime))
GO
INSERT [dbo].[Leave] ([leaveid], [appliedon], [appliedby], [leavefrom], [leaveto], [reason], [status], [createdby], [createddate]) VALUES (3027, CAST(N'2021-05-09 13:37:46.207' AS DateTime), 1, CAST(N'2021-05-09 00:00:00.000' AS DateTime), CAST(N'2021-05-14 00:00:00.000' AS DateTime), N'marriage', N'Approved', NULL, CAST(N'2021-05-09 13:37:46.207' AS DateTime))
GO
INSERT [dbo].[Leave] ([leaveid], [appliedon], [appliedby], [leavefrom], [leaveto], [reason], [status], [createdby], [createddate]) VALUES (3028, CAST(N'2021-05-09 13:42:43.133' AS DateTime), 1, CAST(N'2021-05-09 00:00:00.000' AS DateTime), CAST(N'2021-05-14 00:00:00.000' AS DateTime), N'Marriage', N'Pending', NULL, CAST(N'2021-05-09 13:42:43.133' AS DateTime))
GO
INSERT [dbo].[Leave] ([leaveid], [appliedon], [appliedby], [leavefrom], [leaveto], [reason], [status], [createdby], [createddate]) VALUES (3026, CAST(N'2021-02-08 14:05:21.047' AS DateTime), 3, CAST(N'2021-02-04 00:00:00.000' AS DateTime), CAST(N'2021-02-10 00:00:00.000' AS DateTime), N'ghcbhbjm', N'Pending', NULL, CAST(N'2021-02-08 14:05:34.180' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Leave] OFF
GO
SET IDENTITY_INSERT [dbo].[Message] ON 

GO
INSERT [dbo].[Message] ([messageid], [sentto], [messagecontents], [sentby], [sentdate], [isRead]) VALUES (1, 1, N'You need to submit previous certificates by 10-10-2018', 4, CAST(N'2018-10-01 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Message] ([messageid], [sentto], [messagecontents], [sentby], [sentdate], [isRead]) VALUES (2, 1, N'Common Department Meetings on Weekends', 4, CAST(N'2018-10-10 07:15:59.787' AS DateTime), 1)
GO
INSERT [dbo].[Message] ([messageid], [sentto], [messagecontents], [sentby], [sentdate], [isRead]) VALUES (3, 1, N'Meeting with HR regarding Performance', 4, CAST(N'2018-10-10 07:16:38.233' AS DateTime), 1)
GO
INSERT [dbo].[Message] ([messageid], [sentto], [messagecontents], [sentby], [sentdate], [isRead]) VALUES (4, 1, N'Kindly don''t take holiday this week due to work', 4, CAST(N'2021-01-28 15:25:07.983' AS DateTime), 0)
GO
INSERT [dbo].[Message] ([messageid], [sentto], [messagecontents], [sentby], [sentdate], [isRead]) VALUES (5, 3, N'Kindly don''t take holiday this week due to work', 4, CAST(N'2021-01-28 15:29:14.673' AS DateTime), 0)
GO
INSERT [dbo].[Message] ([messageid], [sentto], [messagecontents], [sentby], [sentdate], [isRead]) VALUES (6, 1, N'The given task can be completed within this week', 3, CAST(N'2021-01-28 15:31:28.123' AS DateTime), 1)
GO
INSERT [dbo].[Message] ([messageid], [sentto], [messagecontents], [sentby], [sentdate], [isRead]) VALUES (1004, 1, N'ryughg', 4, CAST(N'2021-04-26 01:15:15.820' AS DateTime), 1)
GO
INSERT [dbo].[Message] ([messageid], [sentto], [messagecontents], [sentby], [sentdate], [isRead]) VALUES (1005, 3, N'fgdfgfd', 4, CAST(N'2021-04-26 01:15:52.047' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Message] OFF
GO
SET IDENTITY_INSERT [dbo].[Notification] ON 

GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (185, 3, 0, 0, 1004, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (186, 3, 0, 0, 1004, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (187, 3, 0, 5, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (188, 3, 0, 0, 1004, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (189, 3, 0, 5, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (190, 3, 0, 5, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (194, 3, 1, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (197, 3, 0, 0, 1004, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (198, 3, 1, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (199, 3, 2, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (202, 3, 1004, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (203, 3, 2004, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (204, 3, 2005, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (206, 3, 2007, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (210, 3, 2, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (211, 3, 1, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (212, 3, 2008, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (215, 3, 4, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (217, 1, 0, 0, 2, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (218, 1, 0, 4, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (221, 4, 1, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (222, 4, 3, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (224, 4, 4, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (225, 4, 0, 0, 2, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (226, 3, 0, 0, 1004, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (227, 3, 0, 5, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (229, 3, 1, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (230, 4, 2, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (231, 1, 3, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (233, 4, 3, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (236, 1, 0, 3, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (237, 4, 3, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (239, 4, 2, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (244, 4, 0, 2, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (249, 4, 0, 0, 2, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (250, 1, 0, 3, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (252, 1, 0, 1, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (254, 1, 0, 1004, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (257, 1, 0, 1, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (258, 1, 0, 1004, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (260, 1, 0, 6, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (261, 1, 0, 2, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (262, 4, 0, 3, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (263, 4, 0, 1004, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (264, 1, 0, 1004, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (269, 3, 0, 0, 2004, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (273, 3, 1, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (277, 4, 0, 3, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (278, 4, 0, 0, 3, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (280, 4, 0, 1005, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (281, 1, 0, 2, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (284, 1, 0, 0, 2, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (285, 1, 0, 0, 3, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (288, 1, 0, 0, 8, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (289, 1, 0, 0, 6, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (291, 1, 0, 0, 8, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (294, 1, 0, 0, 3, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (295, 1, 0, 0, 7, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (297, 1, 0, 0, 2, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (299, 4, 0, 2, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (302, 4, 0, 2, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (1287, 4, 0, 0, 2, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (1288, 4, 0, 4, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (1289, 4, 0, 1005, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (191, 3, 0, 1005, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (201, 3, 4, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (207, 3, 3008, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (209, 3, 2, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (214, 3, 2, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (220, 4, 0, 0, 1, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (228, 3, 0, 1005, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (242, 4, 0, 0, 2, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (248, 4, 0, 1005, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (271, 3, 0, 5, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (193, 3, 0, 0, 2004, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (196, 3, 0, 1005, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (200, 3, 3, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (205, 3, 2006, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (219, 1, 2, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (232, 4, 2, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (235, 1, 2006, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (253, 1, 0, 2, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (255, 1, 0, 6, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (266, 1, 0, 6, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (267, 3, 0, 1005, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (270, 3, 0, 0, 1004, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (275, 3, 4, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (276, 4, 0, 0, 1, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (279, 4, 0, 0, 7, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (283, 1, 0, 0, 1, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (287, 1, 0, 0, 6, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (290, 1, 0, 0, 7, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (293, 1, 0, 0, 2, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (296, 1, 0, 0, 7, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (301, 4, 1, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (208, 3, 3007, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (213, 3, 3, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (216, 3, 0, 1005, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (223, 4, 2, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (238, 4, 2006, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (240, 4, 0, 3, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (241, 4, 0, 2, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (243, 4, 0, 0, 3, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (246, 4, 0, 0, 2, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (247, 4, 0, 2, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (259, 1, 0, 3, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (272, 3, 0, 1005, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (274, 3, 2, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (192, 3, 0, 0, 1004, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (195, 3, 0, 5, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (234, 1, 2, 0, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (245, 4, 0, 0, 3, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (251, 1, 0, 4, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (256, 1, 0, 2, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (265, 1, 0, 2, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (268, 3, 0, 5, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (282, 1, 0, 1004, 0, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (286, 1, 0, 0, 4, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (292, 1, 0, 0, 1, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (298, 1, 0, 0, 5, NULL)
GO
INSERT [dbo].[Notification] ([notificationid], [employeeid], [eventid], [messageid], [taskid], [isRead]) VALUES (300, 4, 0, 0, 2, NULL)
GO
SET IDENTITY_INSERT [dbo].[Notification] OFF
GO
SET IDENTITY_INSERT [dbo].[Payroll] ON 

GO
INSERT [dbo].[Payroll] ([payrollid], [employeeid], [grosssalary], [netsalary], [status]) VALUES (1002, 1, 35000, 30000, N'0')
GO
INSERT [dbo].[Payroll] ([payrollid], [employeeid], [grosssalary], [netsalary], [status]) VALUES (1003, 3, 30000, 25000, N'0')
GO
INSERT [dbo].[Payroll] ([payrollid], [employeeid], [grosssalary], [netsalary], [status]) VALUES (2003, 3, 30000, 25800, N'0')
GO
SET IDENTITY_INSERT [dbo].[Payroll] OFF
GO
SET IDENTITY_INSERT [dbo].[Performance] ON 

GO
INSERT [dbo].[Performance] ([performanceid], [employeeid], [communication], [conflictresolution], [planning], [problemsolving], [management], [employeecode]) VALUES (1, 1, 75, 66, 56, 87, 77, N'NEN-0001-APR2018')
GO
INSERT [dbo].[Performance] ([performanceid], [employeeid], [communication], [conflictresolution], [planning], [problemsolving], [management], [employeecode]) VALUES (2, 1, 5000, 4587, 5, 0, 1, N'NEN-0001-APR2018')
GO
INSERT [dbo].[Performance] ([performanceid], [employeeid], [communication], [conflictresolution], [planning], [problemsolving], [management], [employeecode]) VALUES (3, 1, 454512, 522, 85, 540, 1, N'NEN-0001-APR2018')
GO
SET IDENTITY_INSERT [dbo].[Performance] OFF
GO
SET IDENTITY_INSERT [dbo].[Position] ON 

GO
INSERT [dbo].[Position] ([positionid], [positionname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (1, N'Manager', 1, 0, 1, CAST(N'2018-04-22 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Position] ([positionid], [positionname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (2, N'Executive', 1, 0, 1, CAST(N'2018-04-22 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Position] ([positionid], [positionname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (3, N'Developer', 1, 0, 1, CAST(N'2018-04-22 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Position] ([positionid], [positionname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (4, N'Vice President', 1, 0, 1, CAST(N'2018-04-22 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Position] ([positionid], [positionname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (5, N'President', 1, 0, 1, CAST(N'2018-04-22 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Position] ([positionid], [positionname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (6, N'Managing Director', 1, 0, 1, CAST(N'2018-04-22 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Position] ([positionid], [positionname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (7, N'CEO', 1, 0, 1, CAST(N'2018-04-22 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Position] ([positionid], [positionname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (8, N'Secretary', 1, 0, 1, CAST(N'2018-04-22 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Position] ([positionid], [positionname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (9, N'Team Leader', 1, 0, 1, CAST(N'2018-04-22 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Position] ([positionid], [positionname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (10, N'COO', 1, 0, 1, CAST(N'2018-04-22 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Position] ([positionid], [positionname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (11, N'CFO', 1, 0, 1, CAST(N'2018-04-22 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Position] ([positionid], [positionname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (12, N'Receptionist', 1, 0, 1, CAST(N'2018-04-22 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Position] ([positionid], [positionname], [isactive], [isdeleted], [createdby], [createddate]) VALUES (13, N'Accountant', 1, 0, 1, CAST(N'2018-04-22 00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Position] OFF
GO
SET IDENTITY_INSERT [dbo].[Recruitment] ON 

GO
INSERT [dbo].[Recruitment] ([recruitmentid], [candidatename], [interviewdate], [confirmationdate], [takenby], [status], [isactive], [isdeleted], [createdby], [createddate]) VALUES (1, N'Vishal Bhatia', CAST(N'2018-05-07 00:00:00.000' AS DateTime), CAST(N'2018-05-25 00:00:00.000' AS DateTime), 1, N'Confirmed', 1, 0, 1, CAST(N'2018-05-25 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Recruitment] ([recruitmentid], [candidatename], [interviewdate], [confirmationdate], [takenby], [status], [isactive], [isdeleted], [createdby], [createddate]) VALUES (2, N'Prakash Jain', CAST(N'2015-06-02 00:00:00.000' AS DateTime), CAST(N'2018-06-07 00:00:00.000' AS DateTime), 1, N'Confirmed', 1, 0, 1, CAST(N'2018-06-07 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Recruitment] ([recruitmentid], [candidatename], [interviewdate], [confirmationdate], [takenby], [status], [isactive], [isdeleted], [createdby], [createddate]) VALUES (3, N'Aftab Sheikh', CAST(N'2015-06-05 00:00:00.000' AS DateTime), CAST(N'2018-06-10 00:00:00.000' AS DateTime), 1, N'Confirmed', 1, 0, 1, CAST(N'2018-06-10 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Recruitment] ([recruitmentid], [candidatename], [interviewdate], [confirmationdate], [takenby], [status], [isactive], [isdeleted], [createdby], [createddate]) VALUES (4, N'Sahil Bakshi', CAST(N'2015-06-23 00:00:00.000' AS DateTime), CAST(N'2018-06-29 00:00:00.000' AS DateTime), 1, N'Rejected', 1, 0, 1, CAST(N'2018-06-29 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Recruitment] ([recruitmentid], [candidatename], [interviewdate], [confirmationdate], [takenby], [status], [isactive], [isdeleted], [createdby], [createddate]) VALUES (5, N'John Dsouza', CAST(N'2015-07-01 00:00:00.000' AS DateTime), CAST(N'2018-08-15 00:00:00.000' AS DateTime), 1, N'Decision Pending', 1, 0, 1, CAST(N'2018-08-15 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Recruitment] ([recruitmentid], [candidatename], [interviewdate], [confirmationdate], [takenby], [status], [isactive], [isdeleted], [createdby], [createddate]) VALUES (6, N'Sujeet Chauhan', CAST(N'2021-05-20 00:00:00.000' AS DateTime), CAST(N'2021-05-25 00:00:00.000' AS DateTime), 3, N'Pending', 1, 0, 4, CAST(N'2021-05-08 13:59:14.247' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Recruitment] OFF
GO
SET IDENTITY_INSERT [dbo].[Salary] ON 

GO
INSERT [dbo].[Salary] ([salaryid], [BASIC], [DA], [HRA], [PF], [LTA], [Medical], [EmployeeStateInsurance], [ProfessionalTax]) VALUES (1, 45, 5, 40, 12, 2, 2, 1.75, 2)
GO
SET IDENTITY_INSERT [dbo].[Salary] OFF
GO
INSERT [dbo].[SalaryOld] ([salaryoldid], [basic], [hra], [da], [transportallowance], [professionaltax], [medicalexpenses], [telephoneexpenses], [foodcoupons], [giftvouchars], [lta], [flexipay], [pf], [incometax], [loan], [advances], [employeecode]) VALUES (1, 74000, 14800, 7400, 0, NULL, 0, 0, 0, 0, 0, 0, 11100, 0, 0, 0, N'NEN-0001-APR2018')
GO
INSERT [dbo].[SalaryOld] ([salaryoldid], [basic], [hra], [da], [transportallowance], [professionaltax], [medicalexpenses], [telephoneexpenses], [foodcoupons], [giftvouchars], [lta], [flexipay], [pf], [incometax], [loan], [advances], [employeecode]) VALUES (2, 74000, 16000, 7400, 0, NULL, 0, 0, 0, 0, 0, 0, 12000, 0, 0, 0, N'REM-0002-MAY2018')
GO
SET IDENTITY_INSERT [dbo].[SalaryStructure] ON 

GO
INSERT [dbo].[SalaryStructure] ([salarystructureid], [salarystructurename], [salarystructurevalue], [minvalue], [maxvalue]) VALUES (1003, N'BASIC', 45, 10000, 30000)
GO
INSERT [dbo].[SalaryStructure] ([salarystructureid], [salarystructurename], [salarystructurevalue], [minvalue], [maxvalue]) VALUES (1004, N'DA', 5, 10000, 30000)
GO
INSERT [dbo].[SalaryStructure] ([salarystructureid], [salarystructurename], [salarystructurevalue], [minvalue], [maxvalue]) VALUES (1005, N'HRA', 44, 10000, 30000)
GO
INSERT [dbo].[SalaryStructure] ([salarystructureid], [salarystructurename], [salarystructurevalue], [minvalue], [maxvalue]) VALUES (1006, N'PF', 12, 10000, 30000)
GO
INSERT [dbo].[SalaryStructure] ([salarystructureid], [salarystructurename], [salarystructurevalue], [minvalue], [maxvalue]) VALUES (1007, N'LTA', 2, 10000, 30000)
GO
INSERT [dbo].[SalaryStructure] ([salarystructureid], [salarystructurename], [salarystructurevalue], [minvalue], [maxvalue]) VALUES (1008, N'Medical', 2, 10000, 30000)
GO
INSERT [dbo].[SalaryStructure] ([salarystructureid], [salarystructurename], [salarystructurevalue], [minvalue], [maxvalue]) VALUES (1011, N'EmployeeStateInsuran', 2, 10000, 30000)
GO
INSERT [dbo].[SalaryStructure] ([salarystructureid], [salarystructurename], [salarystructurevalue], [minvalue], [maxvalue]) VALUES (2002, N'ProfessionalTax', 2, 10000, 30000)
GO
INSERT [dbo].[SalaryStructure] ([salarystructureid], [salarystructurename], [salarystructurevalue], [minvalue], [maxvalue]) VALUES (2015, N'fgfdgd', 54, 4, 5)
GO
INSERT [dbo].[SalaryStructure] ([salarystructureid], [salarystructurename], [salarystructurevalue], [minvalue], [maxvalue]) VALUES (2016, N'fsfdg', 56, 5656, 6765)
GO
INSERT [dbo].[SalaryStructure] ([salarystructureid], [salarystructurename], [salarystructurevalue], [minvalue], [maxvalue]) VALUES (3002, N'Basic', 50, 10000, 30000)
GO
SET IDENTITY_INSERT [dbo].[SalaryStructure] OFF
GO
SET IDENTITY_INSERT [dbo].[Task] ON 

GO
INSERT [dbo].[Task] ([taskid], [taskname], [createdon], [createdby], [assignedto], [status], [isRead]) VALUES (1, N'Submission of Documents of Past Experiences', CAST(N'2018-10-10 00:00:00.000' AS DateTime), 4, 1, N'Pending', 1)
GO
INSERT [dbo].[Task] ([taskid], [taskname], [createdon], [createdby], [assignedto], [status], [isRead]) VALUES (2, N'Installation of SmartStore on Server on 25-09-2018', CAST(N'2018-10-10 06:23:31.540' AS DateTime), 4, 1, N'Pending', 1)
GO
INSERT [dbo].[Task] ([taskid], [taskname], [createdon], [createdby], [assignedto], [status], [isRead]) VALUES (3, N'Commissioning of New Project on 01-01-2018', CAST(N'2018-10-10 07:09:06.150' AS DateTime), 4, 1, N'Pending', 1)
GO
INSERT [dbo].[Task] ([taskid], [taskname], [createdon], [createdby], [assignedto], [status], [isRead]) VALUES (4, N'Complete the HRMS Software requirements', CAST(N'2021-01-20 22:33:32.967' AS DateTime), 4, 1, N'Pending', 0)
GO
INSERT [dbo].[Task] ([taskid], [taskname], [createdon], [createdby], [assignedto], [status], [isRead]) VALUES (5, N'Complete the HRMS Software requirements 1.0', CAST(N'2021-01-20 22:35:26.053' AS DateTime), 4, 1, N'Pending', 1)
GO
INSERT [dbo].[Task] ([taskid], [taskname], [createdon], [createdby], [assignedto], [status], [isRead]) VALUES (6, N'Complete the HRMS Software requirements 2.0', CAST(N'2021-01-20 22:35:40.803' AS DateTime), 4, 1, N'Pending', 0)
GO
INSERT [dbo].[Task] ([taskid], [taskname], [createdon], [createdby], [assignedto], [status], [isRead]) VALUES (7, N'Complete the HRMS Software requirements 3.0', CAST(N'2021-01-20 22:35:53.470' AS DateTime), 4, 1, N'Pending', 0)
GO
INSERT [dbo].[Task] ([taskid], [taskname], [createdon], [createdby], [assignedto], [status], [isRead]) VALUES (1004, N'Complete the HRMS Software requirements 2.1', CAST(N'2021-01-28 15:21:44.017' AS DateTime), 4, 3, N'Pending', 1)
GO
INSERT [dbo].[Task] ([taskid], [taskname], [createdon], [createdby], [assignedto], [status], [isRead]) VALUES (2004, N'etyfg', CAST(N'2021-04-26 01:15:38.707' AS DateTime), 4, 3, N'Pending', 1)
GO
INSERT [dbo].[Task] ([taskid], [taskname], [createdon], [createdby], [assignedto], [status], [isRead]) VALUES (8, N'Complete the HRMS Software requirements', CAST(N'2021-01-20 22:36:24.707' AS DateTime), 3, 1, N'Pending', 0)
GO
SET IDENTITY_INSERT [dbo].[Task] OFF
GO
SET IDENTITY_INSERT [dbo].[Training] ON 

GO
INSERT [dbo].[Training] ([trainingid], [trainingdate], [scheduledate], [particulars], [raisedby], [employeeid], [createdby], [createddate]) VALUES (1, CAST(N'2018-09-01 00:00:00.000' AS DateTime), CAST(N'2018-08-30 00:00:00.000' AS DateTime), N'Interpersonal Skills', 1, 1, 1, CAST(N'2018-09-10 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Training] ([trainingid], [trainingdate], [scheduledate], [particulars], [raisedby], [employeeid], [createdby], [createddate]) VALUES (2, CAST(N'2020-12-01 00:00:00.000' AS DateTime), CAST(N'2020-12-05 00:00:00.000' AS DateTime), N'.Net coding', 4, 1, 4, CAST(N'2020-12-01 01:40:34.307' AS DateTime))
GO
INSERT [dbo].[Training] ([trainingid], [trainingdate], [scheduledate], [particulars], [raisedby], [employeeid], [createdby], [createddate]) VALUES (1002, CAST(N'2021-01-30 00:00:00.000' AS DateTime), CAST(N'2021-01-31 00:00:00.000' AS DateTime), N'dkjdvndfjv4512', 4, 1, 4, CAST(N'2021-01-28 18:53:46.680' AS DateTime))
GO
INSERT [dbo].[Training] ([trainingid], [trainingdate], [scheduledate], [particulars], [raisedby], [employeeid], [createdby], [createddate]) VALUES (1003, CAST(N'2021-01-30 00:00:00.000' AS DateTime), CAST(N'2021-01-31 00:00:00.000' AS DateTime), N'uhjbmnm90890::***', 4, 3, 4, CAST(N'2021-01-28 18:56:29.890' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Training] OFF
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
            TopColumn = 7
         End
         Begin Table = "Employee"
            Begin Extent = 
               Top = 45
               Left = 422
               Bottom = 193
               Right = 592
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
               Bottom = 136
               Right = 233
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
               Top = 24
               Left = 252
               Bottom = 203
               Right = 422
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
      Begin ColumnWidths = 12
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
         Begin Table = "e"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 427
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 465
               Bottom = 136
               Right = 635
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwGetEmployeeDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwGetEmployeeDetails'
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
         Configuration = "(H (1[33] 4[41] 2[13] 3) )"
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
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
               Top = 10
               Left = 245
               Bottom = 196
               Right = 415
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
USE [master]
GO
ALTER DATABASE [db.hrms.netragenix.com] SET  READ_WRITE 
GO
