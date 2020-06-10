@ECHO off
ECHO.

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