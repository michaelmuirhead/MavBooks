@echo off
REM One-time git initialization for MavBooks.
REM Cleans up any partial .git folder, initializes a fresh repo, and makes the first commit.

cd /d "%~dp0"

echo.
echo ====================================
echo  MavBooks - Git setup
echo ====================================
echo.

where git >nul 2>nul
if not %ERRORLEVEL%==0 (
  echo ERROR: git is not installed or not on your PATH.
  echo Install Git from https://git-scm.com/download/win and try again.
  pause
  exit /b 1
)

if exist ".git" (
  echo Removing existing .git folder...
  rmdir /s /q ".git"
)

echo Initializing repository on the 'main' branch...
git init -b main
if not %ERRORLEVEL%==0 ( pause & exit /b 1 )

echo Configuring author for this repo...
git config user.email "michaelmuirhead21@gmail.com"
git config user.name "Michael Muirhead"

echo Staging files...
git add .

echo Committing...
git commit -m "Initial commit: MavBooks book scanner web app"
if not %ERRORLEVEL%==0 ( pause & exit /b 1 )

echo.
echo ====================================
echo  Done! Now push to GitHub:
echo ====================================
echo.
echo   1. Create a new empty repo at https://github.com/new
echo      (don't add a README, .gitignore, or license)
echo.
echo   2. Run these commands (replace YOUR-USERNAME):
echo.
echo      git remote add origin https://github.com/YOUR-USERNAME/mavbooks.git
echo      git push -u origin main
echo.
echo   3. Then go to https://vercel.com/new and import the repo.
echo      Vercel will deploy on every push automatically.
echo.
pause
