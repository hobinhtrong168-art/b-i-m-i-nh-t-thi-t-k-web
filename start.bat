@echo off
cd /d "%~dp0"
set ADMIN_KEY=admin123
where node >nul 2>nul
if errorlevel 1 (
  echo Chua cai Node.js. Hay tai ban LTS tai https://nodejs.org roi chay lai file nay.
  start "" https://nodejs.org
  pause
  exit /b 1
)
echo Dang khoi dong may chu diem Da game...
echo Trang se tu mo tai http://localhost:3000  (neu khong tu mo, ban hay tu go dia chi do vao Chrome hoac Edge)
start "" /min cmd /c "timeout /t 2 /nobreak >nul & start http://localhost:3000"
node server\server.js
echo.
echo May chu da dung. Neu thay loi EADDRINUSE nghia la cong 3000 dang duoc dung: hay dong cua so may chu cu roi chay lai.
pause
