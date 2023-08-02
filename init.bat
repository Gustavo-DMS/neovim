@ECHO OFF
ECHO Bem vindo ao setup do neovim do Gustavo
ECHO primeiro vamos instalar o noevim utilizando o winget
winget install Neovim.Neovim
ECHO Agora vamos levar os arquivos desse repositório para o local adequado para o funcionamento do neovim com as configs
SET arquivos=%cd%
xcopy %arquivos%\after %LOCALAPPDATA%\nvim\after\ /E
xcopy %arquivos%\lua %LOCALAPPDATA%\nvim\lua\ /E
xcopy %arquivos%\init.lua %LOCALAPPDATA%\nvim /E
xcopy %arquivos%\lazy-lock.json %LOCALAPPDATA%\nvim /E
ECHO com os arquivos movidos precisamos intalar o compilador para o plugin treesitter
curl -L https://github.com/msys2/msys2-installer/releases/download/2023-07-18/msys2-x86_64-20230718.exe --ssl-no-revoke --output MSYS2.exe
set /p "drive=Drive de instalação MSYS2(MAIUSCULO): "
.\MSYS2.exe in --confirm-command --accept-messages --root %drive%:/msys64
%drive%:
cd %drive%:\msys64\usr\bin
bash -l -c "pacman -Syu"
bash -l -c "pacman -Syu"
bash -l -c "pacman -S mingw-w64-x86_64-gcc"
bash -l -c "pacman -S mingw-w64-x86_64-gdb"
setx /M path "%path%;%drive%:\msys64\mingw64\bin"
setx /M path "%path%;%drive%:\msys64\mingw32\bin"
pause
