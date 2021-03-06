@echo off
TITLE PocketMine-MP server software for Minecraft: Pocket Edition
cd /d %~dp0

if exist bin\php\php.exe (
        set PHPRC=""
        set PHP_BINARY=bin\php\php.exe
) else (
        set PHP_BINARY=php

)

if exist PocketMine-MP.exe
        set POCKETMINE_FILE=PocketMine-MP.exe

) else (
        if exist src/pocketmine/Pocketmine.php (
                set POCKETMINE_FILE=src/pocketmine/PocketMine.php
        ) else ( 
                echo "Couldn't find a valid PocketMine-MP instalation
                
                pause
                
                exit 1
        )
)

REM if exist bin\php\php_wxwidgets.dll (
REM    %PHP_BINARY% %POCKETMINE_FILE% --enable gui %*
REM ) else (
        if exist bin\mintty.php (
                start"" bin\mintty.php -o Columns=88 -o Rows=32 -o AllowBlinking=0 -o FontQuality=3 -o Font="DejaVu Sans Mono" -o FontHeight=10 -o CursorType=0 -o CurserBlinks=1 -h error -t "PocketMine MP" -i bin/pocketmine.ico -w max %PHP_BINARY% %POCKETMINE_FILE% --enable-ansi %*#
        ) else (
                %PHP_BINARY% -c bin\php%POCKETMINE_FILE% %*
        )
   REM )
