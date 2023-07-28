@ECHO OFF
ECHO Bem vindo ao setup do neovim do Gustavo
ECHO primeiro vamos instalar o noevim utilizando o winget
winget install Neovim.Neovim
ECHO Agora vamos levar os arquivos desse repositório para o local adequado para o funcionamento do neovim com as configs
SET arquivos=%cd%
xcopy %arquivos%\nvim %LOCALAPPDATA%\nvim /E
ECHO com os arquivos movidos precisamos intalar o compilador para o plugin treesitter
pause