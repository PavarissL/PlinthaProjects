﻿/*
Deployment script for WEventData

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "WEventData"
:setvar DefaultFilePrefix "WEventData"
:setvar DefaultDataPath "C:\Users\peter\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB"
:setvar DefaultLogPath "C:\Users\peter\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Rename refactoring operation with key 799c1ae2-2257-4403-b7ae-f14f430fbcfe is skipped, element [dbo].[Account].[Id] (SqlSimpleColumn) will not be renamed to UID';


GO
PRINT N'Rename refactoring operation with key a269b316-0d7a-4692-981d-6a7cbef0c7ed is skipped, element [dbo].[Department].[Id] (SqlSimpleColumn) will not be renamed to DID';


GO
PRINT N'Rename refactoring operation with key 37734db2-98e1-4d05-b088-05f56496239f is skipped, element [dbo].[Event].[Id] (SqlSimpleColumn) will not be renamed to EID';


GO
PRINT N'Rename refactoring operation with key 7ae394c0-09ee-4ba3-a76e-071d2c6bdbf9, 05edd668-55fb-4b35-b5ed-310895e22aef, 840128bb-b0b5-4e8b-9f90-b779625e08d9, e6f58861-6170-4168-886a-db6fdf1910be is skipped, element [dbo].[EventAccount].[Id] (SqlSimpleColumn) will not be renamed to EID';


GO
PRINT N'Rename refactoring operation with key 3e339a84-c737-4887-bebb-0e689a673e2e, 6d6dcb42-3190-4a6f-aa35-90f2ba4b37fc is skipped, element [dbo].[EventComment].[Id] (SqlSimpleColumn) will not be renamed to ECID';


GO
PRINT N'Rename refactoring operation with key ba3bd780-8b07-4ed5-98da-3cc2a17a26a8 is skipped, element [dbo].[EventLog].[Id] (SqlSimpleColumn) will not be renamed to ELID';


GO
PRINT N'Rename refactoring operation with key e11540d3-2cae-4759-bcb7-98e34b651a2b is skipped, element [dbo].[Place].[Id] (SqlSimpleColumn) will not be renamed to PID';


GO
PRINT N'Creating [dbo].[FK_dbo.EventAccount_dbo.Account_UID]...';


GO
ALTER TABLE [dbo].[EventAccount] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.EventAccount_dbo.Account_UID] FOREIGN KEY ([UID]) REFERENCES [dbo].[Account] ([UID]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.EventComment_dbo.Account_UID]...';


GO
ALTER TABLE [dbo].[EventComment] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.EventComment_dbo.Account_UID] FOREIGN KEY ([UID]) REFERENCES [dbo].[Account] ([UID]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.EventComment_dbo.Event_EID]...';


GO
ALTER TABLE [dbo].[EventComment] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.EventComment_dbo.Event_EID] FOREIGN KEY ([EID]) REFERENCES [dbo].[Event] ([EID]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.EventLog_dbo.Account_UID]...';


GO
ALTER TABLE [dbo].[EventLog] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.EventLog_dbo.Account_UID] FOREIGN KEY ([UID]) REFERENCES [dbo].[Account] ([UID]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.EventLog_dbo.Event_EID]...';


GO
ALTER TABLE [dbo].[EventLog] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.EventLog_dbo.Event_EID] FOREIGN KEY ([EID]) REFERENCES [dbo].[Event] ([EID]) ON DELETE CASCADE;


GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '799c1ae2-2257-4403-b7ae-f14f430fbcfe')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('799c1ae2-2257-4403-b7ae-f14f430fbcfe')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'a269b316-0d7a-4692-981d-6a7cbef0c7ed')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('a269b316-0d7a-4692-981d-6a7cbef0c7ed')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '37734db2-98e1-4d05-b088-05f56496239f')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('37734db2-98e1-4d05-b088-05f56496239f')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '7ae394c0-09ee-4ba3-a76e-071d2c6bdbf9')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('7ae394c0-09ee-4ba3-a76e-071d2c6bdbf9')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '05edd668-55fb-4b35-b5ed-310895e22aef')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('05edd668-55fb-4b35-b5ed-310895e22aef')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '840128bb-b0b5-4e8b-9f90-b779625e08d9')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('840128bb-b0b5-4e8b-9f90-b779625e08d9')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'e6f58861-6170-4168-886a-db6fdf1910be')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('e6f58861-6170-4168-886a-db6fdf1910be')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '3e339a84-c737-4887-bebb-0e689a673e2e')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('3e339a84-c737-4887-bebb-0e689a673e2e')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '6d6dcb42-3190-4a6f-aa35-90f2ba4b37fc')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('6d6dcb42-3190-4a6f-aa35-90f2ba4b37fc')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'ba3bd780-8b07-4ed5-98da-3cc2a17a26a8')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('ba3bd780-8b07-4ed5-98da-3cc2a17a26a8')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'e11540d3-2cae-4759-bcb7-98e34b651a2b')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('e11540d3-2cae-4759-bcb7-98e34b651a2b')

GO

GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
MERGE INTO Account AS Target 
USING (VALUES 
        (1, 'A', 'qq1@gmail.com', 'password1',1,0), 
        (2, 'B', 'qq2@gmail.com', 'password2',1,0), 
        (3, 'C', 'qq3@gmail.com', 'password3',1,0)
) 
AS Source (UID, Name, Email, Password, DID, Online) 
ON Target.UID = Source.UID 
WHEN NOT MATCHED BY TARGET THEN 
INSERT (UID,Name, Email, Password, DID, Online) 
VALUES (UID,Name, Email, Password, DID, Online);

MERGE INTO Department AS Target
USING (VALUES 
        (1, 'Software Development', 'WEventTeam'), 
        (2, 'QA', 'WEventTeam'), 
		(3, 'SA', 'WEventTeam')
)
AS Source (DID,Name,CompanyKey)
ON Target.DID = Source.DID
WHEN NOT MATCHED BY TARGET THEN
INSERT (DID,Name,CompanyKey)
VALUES (DID,Name,CompanyKey);

GO

GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[EventAccount] WITH CHECK CHECK CONSTRAINT [FK_dbo.EventAccount_dbo.Account_UID];

ALTER TABLE [dbo].[EventComment] WITH CHECK CHECK CONSTRAINT [FK_dbo.EventComment_dbo.Account_UID];

ALTER TABLE [dbo].[EventComment] WITH CHECK CHECK CONSTRAINT [FK_dbo.EventComment_dbo.Event_EID];

ALTER TABLE [dbo].[EventLog] WITH CHECK CHECK CONSTRAINT [FK_dbo.EventLog_dbo.Account_UID];

ALTER TABLE [dbo].[EventLog] WITH CHECK CHECK CONSTRAINT [FK_dbo.EventLog_dbo.Event_EID];


GO
PRINT N'Update complete.';


GO
