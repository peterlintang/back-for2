@echo off
:: 编码设置为UTF-8防止中文乱码
chcp 65001 >nul
title Windows 系统服务优化脚本

echo ===================================================
echo       正在优化系统服务以减少卡顿 (需要管理员权限)
echo ===================================================
echo.

:: 1. 禁用 SysMain (原 Superfetch) - 解决硬盘/CPU占用高
echo [1/6] 正在禁用超级预读服务 (SysMain)...
sc config SysMain start= disabled >nul 2>&1
net stop SysMain >nul 2>&1

:: 2. 禁用 Windows Search 索引服务 - 减少后台磁盘扫描
echo [2/6] 正在禁用 Windows 搜索索引服务 (WSearch)...
sc config WSearch start= disabled >nul 2>&1
net stop WSearch >nul 2>&1

:: 3. 禁用微软遥测服务 - 停止后台收集数据
echo [3/6] 正在禁用微软诊断遥测服务 (DiagTrack)...
sc config DiagTrack start= disabled >nul 2>&1
net stop DiagTrack >nul 2>&1

:: 4. 禁用连接用户体验和遥测
echo [4/6] 正在禁用路由体验遥测服务 (dmwappushservice)...
sc config dmwappushservice start= disabled >nul 2>&1
net stop dmwappushservice >nul 2>&1

:: 5. 禁用分布式链接跟踪客户端
echo [5/6] 正在禁用局域网链接跟踪服务 (TrkWks)...
sc config TrkWks start= disabled >nul 2>&1
net stop TrkWks >nul 2>&1

:: 6. 禁用程序兼容性助手
echo [6/6] 正在禁用程序兼容性助手服务 (PcaSvc)...
sc config PcaSvc start= disabled >nul 2>&1
net stop PcaSvc >nul 2>&1

echo.
echo ===================================================
echo 优化完成！为了使设置完全生效，建议您重启电脑。
echo ===================================================
pause
