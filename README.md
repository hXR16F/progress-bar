<p align="center">
	<b>progress-bar</b>
	<br>
 	<i>Fancy and customizable progress bar for your batch scripts.</i>
	<br><br><br>
	<img alt="preview" src="https://raw.githubusercontent.com/hXR16F/progress-bar/main/preview.gif">
</p>

# What is this?
This is a batch script that displays a progress bar while executing a task and provides feedback upon completion.\
It uses the [darkbox](https://gitlab.com/TSnake41/darkbox) utility for enhanced display.

# Usage
Please note that this documentation assumes familiarity with batch scripting and the [darkbox](https://gitlab.com/TSnake41/darkbox) utility.\
If your code displays something instead of just doing stuff in the background, redirect the output to a file, f.e. `my-script-output.txt`.

First, to make it working add this code below at the top of your script:
```bat
if defined __ goto :main
set __=.
darkbox | call %0 %* | darkbox
set __=
pause >nul
goto :eof
```

In the main section, where your code is located, add this line above:
```bat
start /b "" "progress-bar.bat" window_x_size window_y_size progress_width bg_color fg_color
```
* window_x_size: The desired width of the console window in characters.
* window_y_size: The desired height of the console window in characters.
* progress_width: The width of the progress bar in characters.
* bg_color: The background color of the progress bar.
* fg_color: The foreground color of the progress bar.

For example:
```bat
start /b "" "progress-bar.bat" 80 25 40 f 1
```

After that, copy and paste this code at the bottom of your code (it will notify the progress function that your code has finished):
```bat
echo. > "progress-bar.stop"
:check-for-reply
    if exist "progress-bar.reply" (
        del /f /q "progress-bar.reply" >nul
        goto :reply-skip
    )
    goto :check-for-reply
:reply-skip
```

That's all.
Once your code execution is complete, the progress bar will disappear.\
If you want to display the results of your code, add the following at the end:
```bat
type my-script-output.txt
```

Refer to the  [example.bat](https://github.com/hXR16F/progress-bar/blob/main/example.bat) file for a better understanding.

# Donate
If you support my work or like my projects, [you can donate me some money](https://github.com/hXR16F/donate/blob/master/README.md). Thank you 💙
