CREATE TABLE [dbo].[EventAccount]
(
	[EUID] INT IDENTITY NOT NULL, 
    [EID] INT NULL, 
    [Status] NVARCHAR(50) NULL, 
    [Note] NVARCHAR(250) NULL, 
    [UID] INT NULL,
	PRIMARY KEY CLUSTERED ([EUID] ASC),
    CONSTRAINT [FK_dbo.EventAccount_dbo.Event_EID] FOREIGN KEY ([EID]) 
        REFERENCES [dbo].[Event] ([EID]) ON DELETE CASCADE,
    CONSTRAINT [FK_dbo.EventAccount_dbo.Account_UID] FOREIGN KEY ([UID]) 
        REFERENCES [dbo].[Account] ([UID]) ON UPDATE NO ACTION
)
