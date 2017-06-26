
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/20/2017 00:48:02
-- Generated from EDMX file: D:\PavarissProjects\MVC\WEventWeb\WEventWebDF\Models\WEventModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [WEventData];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_AccountEvent]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Accounts] DROP CONSTRAINT [FK_AccountEvent];
GO
IF OBJECT_ID(N'[dbo].[FK_AccountEventAccount_Account]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AccountEventAccount] DROP CONSTRAINT [FK_AccountEventAccount_Account];
GO
IF OBJECT_ID(N'[dbo].[FK_AccountEventAccount_EventAccount]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AccountEventAccount] DROP CONSTRAINT [FK_AccountEventAccount_EventAccount];
GO
IF OBJECT_ID(N'[dbo].[FK_AccountEventComment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EventComments] DROP CONSTRAINT [FK_AccountEventComment];
GO
IF OBJECT_ID(N'[dbo].[FK_DepartmentAccount]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Accounts] DROP CONSTRAINT [FK_DepartmentAccount];
GO
IF OBJECT_ID(N'[dbo].[FK_EventEventAccount]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EventAccounts] DROP CONSTRAINT [FK_EventEventAccount];
GO
IF OBJECT_ID(N'[dbo].[FK_EventEventComment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EventComments] DROP CONSTRAINT [FK_EventEventComment];
GO
IF OBJECT_ID(N'[dbo].[FK_EventLogAccount_Account]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EventLogAccount] DROP CONSTRAINT [FK_EventLogAccount_Account];
GO
IF OBJECT_ID(N'[dbo].[FK_EventLogAccount_EventLog]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EventLogAccount] DROP CONSTRAINT [FK_EventLogAccount_EventLog];
GO
IF OBJECT_ID(N'[dbo].[FK_EventLogEvent_Event]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EventLogEvent] DROP CONSTRAINT [FK_EventLogEvent_Event];
GO
IF OBJECT_ID(N'[dbo].[FK_EventLogEvent_EventLog]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EventLogEvent] DROP CONSTRAINT [FK_EventLogEvent_EventLog];
GO
IF OBJECT_ID(N'[dbo].[FK_PlaceEvent]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Events] DROP CONSTRAINT [FK_PlaceEvent];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[AccountEventAccount]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AccountEventAccount];
GO
IF OBJECT_ID(N'[dbo].[Accounts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Accounts];
GO
IF OBJECT_ID(N'[dbo].[Departments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Departments];
GO
IF OBJECT_ID(N'[dbo].[EventAccounts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EventAccounts];
GO
IF OBJECT_ID(N'[dbo].[EventComments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EventComments];
GO
IF OBJECT_ID(N'[dbo].[EventLogAccount]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EventLogAccount];
GO
IF OBJECT_ID(N'[dbo].[EventLogEvent]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EventLogEvent];
GO
IF OBJECT_ID(N'[dbo].[EventLogs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EventLogs];
GO
IF OBJECT_ID(N'[dbo].[Events]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Events];
GO
IF OBJECT_ID(N'[dbo].[Places]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Places];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Accounts'
CREATE TABLE [dbo].[Accounts] (
    [UID] int  NOT NULL,
    [Name] nvarchar(100)  NOT NULL,
    [Email] nvarchar(100)  NOT NULL,
    [Password] nvarchar(100)  NOT NULL,
    [DID] int  NOT NULL,
    [Online] bit  NOT NULL,
    [DepartmentDID] int  NULL
);
GO

-- Creating table 'Departments'
CREATE TABLE [dbo].[Departments] (
    [DID] int  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [CompanyKey] nvarchar(150)  NULL
);
GO

-- Creating table 'Events'
CREATE TABLE [dbo].[Events] (
    [EID] int  NOT NULL,
    [Name] nvarchar(200)  NOT NULL,
    [StarDate] datetime  NOT NULL,
    [EndDate] datetime  NOT NULL,
    [PID] int  NOT NULL,
    [UID] int  NOT NULL,
    [Public] bit  NOT NULL,
    [PlacePID] int  NOT NULL,
    [Account_UID] int  NOT NULL
);
GO

-- Creating table 'EventAccounts'
CREATE TABLE [dbo].[EventAccounts] (
    [EUID] int  NOT NULL,
    [EID] int  NULL,
    [Status] nvarchar(50)  NULL,
    [Note] nvarchar(250)  NULL,
    [UID] int  NULL,
    [Event_EID] int  NOT NULL
);
GO

-- Creating table 'EventComments'
CREATE TABLE [dbo].[EventComments] (
    [ECID] int  NOT NULL,
    [UID] int  NOT NULL,
    [Comment] nvarchar(300)  NOT NULL,
    [CommentDate] datetime  NOT NULL,
    [EID] int  NOT NULL,
    [EventEID] int  NOT NULL,
    [Account_UID] int  NOT NULL
);
GO

-- Creating table 'EventLogs'
CREATE TABLE [dbo].[EventLogs] (
    [ELID] int  NOT NULL,
    [EID] int  NOT NULL,
    [UID] int  NOT NULL,
    [Status] nvarchar(50)  NOT NULL,
    [TimeStamp] datetime  NOT NULL
);
GO

-- Creating table 'Places'
CREATE TABLE [dbo].[Places] (
    [PID] int  NOT NULL,
    [Name] nvarchar(100)  NOT NULL,
    [Address] nvarchar(300)  NOT NULL,
    [ImageURI] nvarchar(max)  NULL
);
GO

-- Creating table 'AccountEventAccount'
CREATE TABLE [dbo].[AccountEventAccount] (
    [Accounts_UID] int  NOT NULL,
    [EventAccounts_EUID] int  NOT NULL
);
GO

-- Creating table 'EventLogEvent'
CREATE TABLE [dbo].[EventLogEvent] (
    [EventLogs_ELID] int  NOT NULL,
    [Events_EID] int  NOT NULL
);
GO

-- Creating table 'EventLogAccount'
CREATE TABLE [dbo].[EventLogAccount] (
    [EventLogs_ELID] int  NOT NULL,
    [Accounts_UID] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [UID] in table 'Accounts'
ALTER TABLE [dbo].[Accounts]
ADD CONSTRAINT [PK_Accounts]
    PRIMARY KEY CLUSTERED ([UID] ASC);
GO

-- Creating primary key on [DID] in table 'Departments'
ALTER TABLE [dbo].[Departments]
ADD CONSTRAINT [PK_Departments]
    PRIMARY KEY CLUSTERED ([DID] ASC);
GO

-- Creating primary key on [EID] in table 'Events'
ALTER TABLE [dbo].[Events]
ADD CONSTRAINT [PK_Events]
    PRIMARY KEY CLUSTERED ([EID] ASC);
GO

-- Creating primary key on [EUID] in table 'EventAccounts'
ALTER TABLE [dbo].[EventAccounts]
ADD CONSTRAINT [PK_EventAccounts]
    PRIMARY KEY CLUSTERED ([EUID] ASC);
GO

-- Creating primary key on [ECID] in table 'EventComments'
ALTER TABLE [dbo].[EventComments]
ADD CONSTRAINT [PK_EventComments]
    PRIMARY KEY CLUSTERED ([ECID] ASC);
GO

-- Creating primary key on [ELID] in table 'EventLogs'
ALTER TABLE [dbo].[EventLogs]
ADD CONSTRAINT [PK_EventLogs]
    PRIMARY KEY CLUSTERED ([ELID] ASC);
GO

-- Creating primary key on [PID] in table 'Places'
ALTER TABLE [dbo].[Places]
ADD CONSTRAINT [PK_Places]
    PRIMARY KEY CLUSTERED ([PID] ASC);
GO

-- Creating primary key on [Accounts_UID], [EventAccounts_EUID] in table 'AccountEventAccount'
ALTER TABLE [dbo].[AccountEventAccount]
ADD CONSTRAINT [PK_AccountEventAccount]
    PRIMARY KEY CLUSTERED ([Accounts_UID], [EventAccounts_EUID] ASC);
GO

-- Creating primary key on [EventLogs_ELID], [Events_EID] in table 'EventLogEvent'
ALTER TABLE [dbo].[EventLogEvent]
ADD CONSTRAINT [PK_EventLogEvent]
    PRIMARY KEY CLUSTERED ([EventLogs_ELID], [Events_EID] ASC);
GO

-- Creating primary key on [EventLogs_ELID], [Accounts_UID] in table 'EventLogAccount'
ALTER TABLE [dbo].[EventLogAccount]
ADD CONSTRAINT [PK_EventLogAccount]
    PRIMARY KEY CLUSTERED ([EventLogs_ELID], [Accounts_UID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Account_UID] in table 'Events'
ALTER TABLE [dbo].[Events]
ADD CONSTRAINT [FK_AccountEvent]
    FOREIGN KEY ([Account_UID])
    REFERENCES [dbo].[Accounts]
        ([UID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AccountEvent'
CREATE INDEX [IX_FK_AccountEvent]
ON [dbo].[Events]
    ([Account_UID]);
GO

-- Creating foreign key on [Event_EID] in table 'EventAccounts'
ALTER TABLE [dbo].[EventAccounts]
ADD CONSTRAINT [FK_EventEventAccount]
    FOREIGN KEY ([Event_EID])
    REFERENCES [dbo].[Events]
        ([EID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EventEventAccount'
CREATE INDEX [IX_FK_EventEventAccount]
ON [dbo].[EventAccounts]
    ([Event_EID]);
GO

-- Creating foreign key on [Accounts_UID] in table 'AccountEventAccount'
ALTER TABLE [dbo].[AccountEventAccount]
ADD CONSTRAINT [FK_AccountEventAccount_Account]
    FOREIGN KEY ([Accounts_UID])
    REFERENCES [dbo].[Accounts]
        ([UID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [EventAccounts_EUID] in table 'AccountEventAccount'
ALTER TABLE [dbo].[AccountEventAccount]
ADD CONSTRAINT [FK_AccountEventAccount_EventAccount]
    FOREIGN KEY ([EventAccounts_EUID])
    REFERENCES [dbo].[EventAccounts]
        ([EUID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AccountEventAccount_EventAccount'
CREATE INDEX [IX_FK_AccountEventAccount_EventAccount]
ON [dbo].[AccountEventAccount]
    ([EventAccounts_EUID]);
GO

-- Creating foreign key on [Account_UID] in table 'EventComments'
ALTER TABLE [dbo].[EventComments]
ADD CONSTRAINT [FK_AccountEventComment]
    FOREIGN KEY ([Account_UID])
    REFERENCES [dbo].[Accounts]
        ([UID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AccountEventComment'
CREATE INDEX [IX_FK_AccountEventComment]
ON [dbo].[EventComments]
    ([Account_UID]);
GO

-- Creating foreign key on [EventEID] in table 'EventComments'
ALTER TABLE [dbo].[EventComments]
ADD CONSTRAINT [FK_EventEventComment]
    FOREIGN KEY ([EventEID])
    REFERENCES [dbo].[Events]
        ([EID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EventEventComment'
CREATE INDEX [IX_FK_EventEventComment]
ON [dbo].[EventComments]
    ([EventEID]);
GO

-- Creating foreign key on [EventLogs_ELID] in table 'EventLogEvent'
ALTER TABLE [dbo].[EventLogEvent]
ADD CONSTRAINT [FK_EventLogEvent_EventLog]
    FOREIGN KEY ([EventLogs_ELID])
    REFERENCES [dbo].[EventLogs]
        ([ELID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Events_EID] in table 'EventLogEvent'
ALTER TABLE [dbo].[EventLogEvent]
ADD CONSTRAINT [FK_EventLogEvent_Event]
    FOREIGN KEY ([Events_EID])
    REFERENCES [dbo].[Events]
        ([EID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EventLogEvent_Event'
CREATE INDEX [IX_FK_EventLogEvent_Event]
ON [dbo].[EventLogEvent]
    ([Events_EID]);
GO

-- Creating foreign key on [EventLogs_ELID] in table 'EventLogAccount'
ALTER TABLE [dbo].[EventLogAccount]
ADD CONSTRAINT [FK_EventLogAccount_EventLog]
    FOREIGN KEY ([EventLogs_ELID])
    REFERENCES [dbo].[EventLogs]
        ([ELID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Accounts_UID] in table 'EventLogAccount'
ALTER TABLE [dbo].[EventLogAccount]
ADD CONSTRAINT [FK_EventLogAccount_Account]
    FOREIGN KEY ([Accounts_UID])
    REFERENCES [dbo].[Accounts]
        ([UID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EventLogAccount_Account'
CREATE INDEX [IX_FK_EventLogAccount_Account]
ON [dbo].[EventLogAccount]
    ([Accounts_UID]);
GO

-- Creating foreign key on [PlacePID] in table 'Events'
ALTER TABLE [dbo].[Events]
ADD CONSTRAINT [FK_PlaceEvent]
    FOREIGN KEY ([PlacePID])
    REFERENCES [dbo].[Places]
        ([PID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PlaceEvent'
CREATE INDEX [IX_FK_PlaceEvent]
ON [dbo].[Events]
    ([PlacePID]);
GO

-- Creating foreign key on [DepartmentDID] in table 'Accounts'
ALTER TABLE [dbo].[Accounts]
ADD CONSTRAINT [FK_DepartmentAccount]
    FOREIGN KEY ([DepartmentDID])
    REFERENCES [dbo].[Departments]
        ([DID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DepartmentAccount'
CREATE INDEX [IX_FK_DepartmentAccount]
ON [dbo].[Accounts]
    ([DepartmentDID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------