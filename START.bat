@echo off
chcp 65001 >nul

REM ===== 設定環境變數 =====
REM BASE_URL 需先設定專案前對應路徑
set BASE_URL=C:\Users\flowe\OneDrive\桌面

set JAVA_HOME=C:\Program Files\Java\jdk-21.0.2
set CATALINA_HOME=%BASE_URL%\OGMK\apache-tomcat-11.0.9
set JDK_BIN=%JAVA_HOME%\bin
set TOMCAT_BIN=%CATALINA_HOME%\bin
set TOMCAT_WEBAPPS=%CATALINA_HOME%\webapps

set OGKM_LIB_BUILD=%BASE_URL%\OGMK\OGKM_Lib\build
set OGKM_LIB_JAR_OUTPUT=%BASE_URL%\OGMK\OGKM_Lib\build\jar
set OGKM_WEB_BUILD=%BASE_URL%\OGMK\OGKM_Web\build
set OGKM_WEB_EXPLODED=%BASE_URL%\OGMK\OGKM_Web\build\webapp

echo [1/5] 產生 OGKM_Lib.jar
if not exist "%OGKM_LIB_JAR_OUTPUT%" mkdir "%OGKM_LIB_JAR_OUTPUT%"
"%JDK_BIN%\jar.exe" cf "%OGKM_LIB_JAR_OUTPUT%\OGKM_Lib.jar" -C "%OGKM_LIB_BUILD%" uuu
if errorlevel 1 (
    echo [錯誤] 產生 OGKM_Lib.jar 失敗
    pause
    exit /b 1
)

echo [2/5] 複製 OGKM_Lib.jar 到 WEB-INF/lib
if not exist "%OGKM_WEB_EXPLODED%\WEB-INF\lib" mkdir "%OGKM_WEB_EXPLODED%\WEB-INF\lib"
copy /Y "%OGKM_LIB_JAR_OUTPUT%\OGKM_Lib.jar" "%OGKM_WEB_EXPLODED%\WEB-INF\lib\"

echo [3/6] 複製編譯好的 Web Classes 到 WEB-INF\classes
if not exist "%OGKM_WEB_EXPLODED%\WEB-INF\classes" mkdir "%OGKM_WEB_EXPLODED%\WEB-INF\classes"
if exist "%OGKM_WEB_BUILD%\com" xcopy /E /I /Y "%OGKM_WEB_BUILD%\com" "%OGKM_WEB_EXPLODED%\WEB-INF\classes\com"

echo [3/5] 刪除 Tomcat 舊的 OGKM
if exist "%TOMCAT_WEBAPPS%\OGKM" rmdir /S /Q "%TOMCAT_WEBAPPS%\OGKM"

echo [4/5] 複製 Exploded 目錄到 Tomcat
xcopy /E /I /Y "%OGKM_WEB_EXPLODED%" "%TOMCAT_WEBAPPS%\OGKM"

REM echo [5/5] 啟動 Tomcat
REM start "" "%TOMCAT_BIN%\startup.bat" >nul 2>&1

echo [5/5] 啟動 Tomcat (方法 2)
cd /d "%TOMCAT_BIN%"
"%JAVA_HOME%\bin\java.exe" ^
	-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:8010 ^
  -D"catalina.base=%CATALINA_HOME%" ^
  -D"catalina.home=%CATALINA_HOME%" ^
  -D"java.io.tmpdir=%CATALINA_HOME%\temp" ^
  -cp "%CATALINA_HOME%\bin\bootstrap.jar;%CATALINA_HOME%\bin\tomcat-juli.jar" ^
  org.apache.catalina.startup.Bootstrap start
REM  org.apache.catalina.startup.Bootstrap start > "%CATALINA_HOME%\logs\console.log" 2>&1
type "%CATALINA_HOME%\logs\console.log"

  
echo 部署完成：http://localhost:8080/OGKM
REM pause
