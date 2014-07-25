@echo off  

Rem ##################################################
Rem # BASE VM BUILD
Rem ##################################################

setlocal enabledelayedexpansion
if [%1] ==[] goto usage
call:parseArguments %*
if "%l%" == "true" (
  type %cd%\vm.info
)
if "%h%" == "true" (
  goto usage
)
if NOT "%d%" == "" if NOT "%p%" == "" (
	cd %d%
  packer --version
  vagrant version
  packer inspect %d%_%p%.json
  packer build -force %d%_%p%.json
  vagrant box add --force --provider=%p% --name="%d%" %d%_%p%.box
)
GOTO Exit


Rem ==================================================
Rem Functions  
Rem ==================================================
:usage
echo Usage: %0 [-d distro] [-h] [-l] [-p provider]
goto exit

:getArg
set valname=%~1
echo arg: !%valname%!
goto:eof

:parseArguments
Rem --------------------------------------------------
@echo off
:loop
IF "%~1"=="" GOTO cont
set argname=%~1
set argname=%argname:~1,100%
set value=%~2
Rem if the next value starts with - then it's a new parameter
if "%value:~0,1%" == "-" (
  set !argname!=true
  SHIFT & GOTO loop
)
if "%value%" == "" (
  set !argname!=true
  SHIFT & GOTO loop
)
set !argname!=%~2
Rem jumps first and second parameter
SHIFT & SHIFT & GOTO loop
:cont
goto:eof

Rem --------------------------------------------------
:Exit