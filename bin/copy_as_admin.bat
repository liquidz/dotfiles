@echo off

SET VIMRC=C:\onlinesoftware\vim74-kaoriya-win64\vimrc
SET GVIMRC=C:\onlinesoftware\vim74-kaoriya-win64\gvimrc

if exist "%VIMRC%" (
    del /Q "%VIMRC%"
)

if exist "%GVIMRC%" (
    del /Q "%GVIMRC%"
)

mklink %VIMRC% %HOMEPATH%\dotfiles\.vimrc
mklink %GVIMRC% %HOMEPATH%\dotfiles\gvimrc
mklink /D %HOMEPATH%\.vim %HOMEPATH%\dotfiles\.vim