USE [StudentDB]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 1/13/2024 12:50:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](30) NULL,
	[PhoneNo] [nvarchar](10) NULL,
	[Address] [nvarchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [DF_Student_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteStudent]    Script Date: 1/13/2024 12:50:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteStudent] 
	@pID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	update Student set IsDeleted=1 where ID=@pID
 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetStudent]    Script Date: 1/13/2024 12:50:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetStudent] 	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	  
	SELECT ID,[Name],Email,[PhoneNo],[Address]
	FROM Student 
	WHERE IsDeleted=0
	ORDER BY [Name] 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertStudent]    Script Date: 1/13/2024 12:50:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertStudent] 
	@pName nvarchar(50),
	@pEmail nvarchar(30),
	@pPhone nvarchar(10),
	@pAddress nvarchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   INSERT INTO Student([Name],Email,[PhoneNo],[Address])
	SELECT @pName, @pEmail, @pPhone, @pAddress
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateStudent]    Script Date: 1/13/2024 12:50:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateStudent]
	@pID int,
	@pName nvarchar(50),
	@pEmail nvarchar(30),
	@pPhone nvarchar(10),
	@pAddress nvarchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   UPDATE Student SET 
   Email=@pEmail
   ,[PhoneNo]=@pPhone
   ,[Address]=@pAddress
   WHERE ID=@pID
   
END
GO
