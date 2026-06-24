@echo off
title Push to GitHub
echo ===================================================
echo   LoominAI - Push to GitHub Repository
echo ===================================================
echo.

:: Check if git is installed
where git >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo Error: Git is not installed or not in your system PATH.
    echo Please install Git and try again.
    pause
    exit /b 1
)

:: Reinitialize remote origin to match target repo
echo Setting remote origin to: https://github.com/Shreyans388/LoominAI.git
git remote remove origin >nul 2>&1
git remote add origin https://github.com/Shreyans388/LoominAI.git

:: Rename branch to main
git branch -M main

:: Stage files
echo.
echo Staging files...
git add .

:: Commit changes
echo.
echo Committing files...
git commit -m "Setup LoominAI project with local runner and database configuration"

:: Push to GitHub
echo.
echo Pushing to GitHub (main branch)...
git push -u origin main

if %ERRORLEVEL% neq 0 (
    echo.
    echo Push failed. 
    echo Common reasons:
    echo 1. You need to log in to GitHub in this terminal (Run: gh auth login or enter credentials when prompted).
    echo 2. The repository 'LoominAI' does not exist under 'Shreyans388'.
    echo.
    pause
    exit /b %ERRORLEVEL%
)

echo.
echo ===================================================
echo Push Successful!
echo ===================================================
echo.
pause
