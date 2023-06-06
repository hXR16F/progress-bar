@echo off
setlocal EnableDelayedExpansion
mode 80,25
color 0f

:: https://gitlab.com/TSnake41/darkbox
if defined __ goto :main
set __=.
darkbox | call %0 %* | darkbox
set __=
pause >nul
goto :eof

:main
	:: params: window_x_size window_y_size progress_width bg_color fg_color
	start /b "" "progress-bar.bat" 80 25 60 0 c

	:: your code goes here
	ping google.com > "ping.txt"
	:: --------

	echo. > "progress-bar.stop"
	:check-for-reply
		if exist "progress-bar.reply" (
			del /f /q "progress-bar.reply" >nul
			goto :reply-skip
		)
		goto :check-for-reply
	:reply-skip

	echo -g 1 %%i -c 0x0f -d "Success."

	echo -rs & cls
	color 0f&echo -g 0 0

	echo -c 0x0f -d "--- Ping results ---" -2n -c 0x07
	type ping.txt
	del /f /q "ping.txt" >nul

	for /l %%i in (;;) do pause >nul
