@ECHO off

:: Check command line arguments
IF NOT "%~1"=="" IF /I NOT "%~1"=="/A" GOTO Syntax
 
:: Check if DEVCON.EXE is available and if not, offer to download it
SET DevconAvailable=
SET Download=
DEVCON.EXE /? >NUL 2>&1
IF ERRORLEVEL 1 (
	SET DevconAvailable=No
	ECHO This batch file requires Microsoft's DEVCON untility.
	SET /P Download=Do you want to download it now? [y/N] 
)
 
:: Start download if requested
IF /I "%Download%"=="Y" (
	START "DevCon" "https://superuser.com/questions/1002950/quick-method-to-install-devcon-exe"
	ECHO.
	ECHO Install the downloaded file and make sure DEVCON.EXE is in the PATH.
	ECHO Then try again.
)
 
:: Abort if DEVCON.EXE is not available yet
IF "%DevconAvailable%"=="No" GOTO End

SETLOCAL
SET Q2U=
FOR /F "tokens=1 delims=: " %%A IN ('DEVCON find ^=audioendpoint ^| FIND /I "Q2U"') DO (
	SET Q2U=%%A
	if defined Q2U (
		ECHO Mic found at address: %%A
		DEVCON remove %%A 
	) else ( ECHO No mic detected )
)
TIMEOUT /t 3
DEVCON rescan
ENDLOCAL
GOTO:EOF

ECHO Written by Gage Rozzelle
ECHO http://www.rozzelle.io
ECHO.
ECHO Notes:  This batch file uses Microsoft's (R) DEVCON utility.
ECHO         This utility can be found at http://support.microsoft.com
ECHO         by searching for Q311272 in the English Knowledge Base.
ECHO.
ECHO         The author nor this site are in any way affiliated with Microsoft (R)
 
:End