USE [MNSMS]
GO
/****** Object:  StoredProcedure [dbo].[connax_downloadfile_ftp]    Script Date: 2023-11-10 06:14:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[connax_downloadfile_ftp]
	@SourcePath varchar(128),
	@SourceFiles varchar(128),
	@DestPath varchar(128)
AS 
Begin
DECLARE @FTPServer varchar(128)
DECLARE @FTPUser varchar(128)
DECLARE @FTPPwd varchar(128)
DECLARE @FTPMode varchar(10)
 
-- FTP attributes.
SET @FTPServer = '172.16.24.52'
SET @FTPUser = 'sms05'
SET @FTPPwd = 'sms05'
SET @FTPMode = 'binary' -- ascii, binary or blank for default.
 
DECLARE @cmd varchar(1000)
DECLARE @workfile varchar(128)
DECLARE @nowstr varchar(25)
 
-- Get the %TEMP% environment variable.
DECLARE @tempdir varchar(128)
CREATE TABLE #tempvartable(info VARCHAR(1000))
INSERT #tempvartable EXEC master..xp_cmdshell 'echo %temp%'
SET @tempdir = (SELECT top 1 info FROM #tempvartable)
IF RIGHT(@tempdir, 1) <> '\' SET @tempdir = @tempdir + '\'
DROP TABLE #tempvartable
 
-- Generate @workfile
SET @nowstr = replace(replace(convert(varchar(30), GETDATE(), 121), ' ', '_'), ':', '-')
SET @workfile = 'FTP_SPID' + convert(varchar(128), @@spid) + '_' + @nowstr + '.txt'
 
-- Deal with special chars for echo commands.
select @FTPServer = replace(replace(replace(@FTPServer, '|', '^|'),'<','^<'),'>','^>')
select @FTPUser = replace(replace(replace(@FTPUser, '|', '^|'),'<','^<'),'>','^>')
select @FTPPwd = replace(replace(replace(@FTPPwd, '&', '^&'),'<','^<'),'>','^>')
select @SourcePath = replace(replace(replace(@SourcePath, '|', '^|'),'<','^<'),'>','^>')
IF RIGHT(@DestPath, 1) = '\' SET @DestPath = LEFT(@DestPath, LEN(@DestPath)-1)
 
-- Build the FTP script file.
select @cmd = 'echo ' + 'open ' + @FTPServer + ' > ' + @tempdir + @workfile
EXEC master..xp_cmdshell @cmd
print @cmd

select @cmd = 'echo ' + @FTPUser + '>> ' + @tempdir + @workfile
EXEC master..xp_cmdshell @cmd
print @cmd

select @cmd = 'echo ' + @FTPPwd + '>> ' + @tempdir + @workfile
EXEC master..xp_cmdshell @cmd
print @cmd

select @cmd = 'echo ' + 'prompt ' + ' >> ' + @tempdir + @workfile
EXEC master..xp_cmdshell @cmd
print @cmd

IF LEN(@FTPMode) > 0
BEGIN
    select @cmd = 'echo ' + @FTPMode + ' >> ' + @tempdir + @workfile
    EXEC master..xp_cmdshell @cmd
END
select @cmd = 'echo ' + 'lcd ' + @DestPath + ' >> ' + @tempdir + @workfile
EXEC master..xp_cmdshell @cmd
IF LEN(@SourcePath) > 0
BEGIN
    select @cmd = 'echo ' + 'cd ' + @SourcePath + ' >> ' + @tempdir + @workfile
    EXEC master..xp_cmdshell @cmd
END
--select @cmd = 'echo ' + 'mget ' + @SourcePath + @SourceFiles + ' >> ' + @tempdir + @workfile
select @cmd = 'echo ' + 'mget '  + @SourceFiles + ' >> ' + @tempdir + @workfile
EXEC master..xp_cmdshell @cmd
select @cmd = 'echo ' + 'quit' + ' >> ' + @tempdir + @workfile
EXEC master..xp_cmdshell @cmd
 
-- Execute the FTP command via script file.
select @cmd = 'ftp -s:' + @tempdir + @workfile
create table #a (id int identity(1,1), s varchar(1000))
insert #a
EXEC master..xp_cmdshell @cmd
select id, ouputtmp = s from #a
 
-- Clean up.
drop table #a
select @cmd = 'del ' + @tempdir + @workfile
EXEC master..xp_cmdshell @cmd;

End
GO
