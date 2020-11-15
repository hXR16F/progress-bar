:: Programmed by hXR16F
:: hXR16F.ar@gmail.com, https://github.com/hXR16F

@echo off
setlocal EnableDelayedExpansion

:: chars
:: 218 196 191
:: 179 219 179
:: 192 196 217

:variables
	echo -h 0

	for /f "tokens=1,2,3 delims=:" %%i in ('call getcolor.exe') do (
		set cl=%%i
		set default_color=!cl:~2,2!
	)

	set bar_size_x=%3
	set bar_color_fill=%5
	set bar_color_bg=%4
	set "window_x=%1"
	set "window_y=%2"

	set "bar_horizontal="

	set /a bar_center_pos_x=(%window_x% - %bar_size_x%) / 2
	set /a bar_center_pos_y_1=%window_y% / 2 - 2
	set /a bar_center_pos_y_2=%window_y% / 2 - 1
	set /a bar_center_pos_y_3=%window_y% / 2

	set /a bar_center_pos_x_fill_from=%bar_center_pos_x% + 1
	set /a bar_center_pos_x_fill_to=%bar_center_pos_x_fill_from% + (%bar_size_x% - 3)

	for /l %%x in (3,1,%bar_size_x%) do set "bar_horizontal_top_botton=!bar_horizontal_top_botton!-a 196 "
	for /l %%x in (3,1,%bar_size_x%) do set "bar_horizontal_middle=!bar_horizontal_middle! "

	goto :main

:main
	echo -g %bar_center_pos_x% %bar_center_pos_y_1% -a 218 !bar_horizontal_top_botton! -a 191
	echo -g %bar_center_pos_x% %bar_center_pos_y_2% -a 179 -c 0x!bar_color_bg!!bar_color_fill! -d "!bar_horizontal_middle!" -c 0x%default_color% -a 179
	echo -g %bar_center_pos_x% %bar_center_pos_y_3% -a 192 !bar_horizontal_top_botton! -a 217

	:loop
		for %%a in (
			!bar_color_bg!!bar_color_fill!
			!bar_color_fill!!bar_color_bg!
		) do (
			if exist "progress-bar.stop" (
				del /f /q progress-bar.stop >nul
				echo. > "progress-bar.reply"
				exit
			)
			for /l %%i in (!bar_center_pos_x_fill_from!,1,!bar_center_pos_x_fill_to!) do (
				echo -g %%i %bar_center_pos_y_2% -c 0x%%a -a 219 -w 25
			)
		)

		goto :loop