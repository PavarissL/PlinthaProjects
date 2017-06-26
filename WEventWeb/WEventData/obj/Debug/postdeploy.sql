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
--MERGE INTO Account AS Target 
--USING (VALUES 
--        (1, 'A', 'qq1@gmail.com', 'password1',1,0), 
--        (2, 'B', 'qq2@gmail.com', 'password2',1,0), 
--        (3, 'C', 'qq3@gmail.com', 'password3',1,0)
--) 
--AS Source (UID, Name, Email, Password, DID, Online) 
--ON Target.UID = Source.UID 
--WHEN NOT MATCHED BY TARGET THEN 
--INSERT (UID,Name, Email, Password, DID, Online) 
--VALUES (UID,Name, Email, Password, DID, Online);

--MERGE INTO Department AS Target
--USING (VALUES 
--        (1, 'Software Development', 'WEventTeam'), 
--        (2, 'QA', 'WEventTeam'), 
--		(3, 'SA', 'WEventTeam')
--)
--AS Source (DID,Name,CompanyKey)
--ON Target.DID = Source.DID
--WHEN NOT MATCHED BY TARGET THEN
--INSERT (DID,Name,CompanyKey)
--VALUES (DID,Name,CompanyKey);

GO
