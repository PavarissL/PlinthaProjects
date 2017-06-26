CREATE TABLE [dbo].[EventLog]
(
	[ELID] INT IDENTITY NOT NULL, 
    [EID] INT NOT NULL, 
    [UID] INT NOT NULL, 
    [Status] NVARCHAR(50) NOT NULL, 
    [TimeStamp] DATETIME NOT NULL,
	PRIMARY KEY CLUSTERED ([ELID] ASC),
    CONSTRAINT [FK_dbo.EventLog_dbo.Event_EID] FOREIGN KEY ([EID]) 
        REFERENCES [dbo].[Event] ([EID]) ON UPDATE NO ACTION,
    CONSTRAINT [FK_dbo.EventLog_dbo.Account_UID] FOREIGN KEY ([UID]) 
        REFERENCES [dbo].[Account] ([UID]) ON UPDATE NO ACTION
)
