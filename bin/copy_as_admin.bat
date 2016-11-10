@echo off

SET VIMRC=C:\onlinesoftware\vim\vimrc
SET GVIMRC=C:\onlinesoftware\vim\gvimrc

if exist "%VIMRC%" (
    del /Q "%VIMRC%"
)

if exist "%GVIMRC%" (
    del /Q "%GVIMRC%"
)

mklink %VIMRC% %HOMEPATH%\src\github.com\liquidz\dotfiles\.vimrc
mklink %GVIMRC% %HOMEPATH%\src\github.com\liquidz\dotfiles\gvimrc
mklink /D %HOMEPATH%\.vim %HOMEPATH%\src\github.com\liquidz\dotfiles\.vim

SET NVIM=%HOMEPATH%\AppData\Local\nvim
if exist "%NVIM%" (
    del /Q "%NVIM%"
)

mklink /D %NVIM% %HOMEPATH%\src\github.com\liquidz\dotfiles\nvim
