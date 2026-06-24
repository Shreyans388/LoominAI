@echo off
title LoominAI Runner
echo ===================================================
echo          LoominAI - System Startup Script
echo ===================================================
echo.
echo IMPORTANT: Make sure MongoDB is running on your system.
echo Default URI: mongodb://localhost:27017/social_publisher
echo.

echo [1/3] Installing backend dependencies...
cd backend
call npm install
if %ERRORLEVEL% neq 0 (
    echo Error installing backend dependencies.
    pause
    exit /b %ERRORLEVEL%
)

echo.
echo [2/3] Installing frontend dependencies...
cd ..\frontend
call npm install
if %ERRORLEVEL% neq 0 (
    echo Error installing frontend dependencies.
    pause
    exit /b %ERRORLEVEL%
)

echo.
echo [3/3] Starting backend and frontend dev servers...
cd ..
start "LoominAI Backend" cmd /k "cd backend && npm run dev"
start "LoominAI Frontend" cmd /k "cd frontend && npm run dev"

echo.
echo ===================================================
echo Startup commands dispatched!
echo.
echo   - Backend: http://localhost:5004
echo   - Frontend: http://localhost:3000
echo ===================================================
echo.
pause
