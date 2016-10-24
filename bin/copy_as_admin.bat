@echo off

REM SET VIMRC=C:\onlinesoftware\vim\vimrc
REM SET GVIMRC=C:\onlinesoftware\vim\gvimrc
REM 
REM if exist "%VIMRC%" (
REM     del /Q "%VIMRC%"
REM )
REM 
REM if exist "%GVIMRC%" (
REM     del /Q "%GVIMRC%"
REM )
REM 
REM mklink %VIMRC% %HOMEPATH%\dotfiles\.vimrc
REM mklink %GVIMRC% %HOMEPATH%\dotfiles\gvimrc
REM mklink /D %HOMEPATH%\.vim %HOMEPATH%\dotfiles\.vim

SET NVIM=%HOMEPATH%\AppData\Local\nvim
if exist "%NVIM%" (
    del /Q "%NVIM%"
)

mklink /D %NVIM% %HOMEPATH%\src\github.com\liquidz\dotfiles\nvim
