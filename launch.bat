@echo off
REM MavBooks launcher - starts a local server so the camera works, then opens the app.
cd /d "%~dp0"

echo.
echo ====================================
echo  Starting MavBooks on localhost:8080
echo ====================================
echo.
echo Keep this window open while using the app.
echo Close it (or press Ctrl+C) to stop the server.
echo.

REM Open the browser shortly after the server starts.
start "" "http://localhost:8080"

REM Try Python 3 first, fall back to py launcher, then to Node's npx serve.
where python >nul 2>nul
if %ERRORLEVEL%==0 (
  python -m http.server 8080
  goto :eof
)

where py >nul 2>nul
if %ERRORLEVEL%==0 (
  py -3 -m http.server 8080
  goto :eof
)

where npx >nul 2>nul
if %ERRORLEVEL%==0 (
  echo Python not found - using npx serve instead.
  npx --yes serve -l 8080 .
  goto :eof
)

echo.
echo ERROR: Couldn't find Python or Node on your system.
echo Install Python from https://python.org and try again,
echo or just drag this folder onto https://app.netlify.com/drop
echo to host it for free.
echo.
pause
