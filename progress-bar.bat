:: Programmed by hXR16F
:: hXR16F.ar@gmail.com, https://github.com/hXR16F

@echo off
if defined __ goto :variables
set __=.
darkbox | call %0 %* | darkbox
set __=
pause >nul
goto :eof

:: chars
:: 218 196 191
:: 179 219 179
:: 192 196 217

:variables
	color 0f
	setlocal EnableDelayedExpansion
	echo -h 0

	set "window_x=80"
	set "window_y=25"
	mode %window_x%,%window_y%

	set bar_size_x=60
	set "bar_horizontal="
	set bar_color=9

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
	echo -g %bar_center_pos_x% %bar_center_pos_y_2% -a 179 -d "!bar_horizontal_middle!" -a 179
	echo -g %bar_center_pos_x% %bar_center_pos_y_3% -a 192 !bar_horizontal_top_botton! -a 217

	:loop
		for %%a in (
			"0x0!bar_color!"
			"0x!bar_color!0"
		) do (
			for /l %%i in (!bar_center_pos_x_fill_from!,1,!bar_center_pos_x_fill_to!) do (
				echo -g %%i %bar_center_pos_y_2% -c %%~a -a 219 -w 25
			)
		)
		goto :loop