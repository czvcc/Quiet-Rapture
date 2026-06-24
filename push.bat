@echo off
setlocal

cd /d "%~dp0"

git add .
git diff --cached --quiet
if %errorlevel%==0 (
  echo No changes to commit.
) else (
  git commit -m "1"
  if errorlevel 1 goto :error
)

git push
if errorlevel 1 goto :error

echo.
echo Push completed.
pause
exit /b 0

:error
echo.
echo Push failed.
pause
exit /b 1
