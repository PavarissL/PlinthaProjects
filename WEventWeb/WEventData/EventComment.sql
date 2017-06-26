CREATE TABLE [dbo].[EventComment]
(
	[ECID] INT IDENTITY NOT NULL, 
    [UID] INT NOT NULL, 
    [Comment] NVARCHAR(300) NOT NULL, 
    [CommentDate] DATETIME NOT NULL, 
    [EID] INT NOT NULL,
	PRIMARY KEY CLUSTERED ([ECID] ASC),
    CONSTRAINT [FK_dbo.EventComment_dbo.Account_UID] FOREIGN KEY ([UID]) 
        REFERENCES [dbo].[Account] ([UID]) ON DELETE CASCADE,
    CONSTRAINT [FK_dbo.EventComment_dbo.Event_EID] FOREIGN KEY ([EID]) 
        REFERENCES [dbo].[Event] ([EID]) ON UPDATE NO ACTION
)
