#!/usr/bin/bash

case "$*" in
    "sxhkd")
        # Reload sxhkd or start sxhkd
        pkill -usr1 -x sxhkd || (sxhkd > /dev/null &)
        [ $? -eq 0 ] && notify-send "sxhkd reloaded" "PID $(pgrep sxhkd)"
        ;;
    "keyd-application-mapper")
        pkill keyd-app
        keyd-application-mapper -d > /dev/null
        [ $? -eq 0 ] && notify-send "keyd-application-mapper reloaded" "PID $(pgrep keyd-app)"
        ;;
    "fava -> life.beancount")
        "$HOME/.local/bin/fava" "$HOME/Accounting/life.beancount" -p 5001 > /dev/null &
        [ $? -eq 0 ] && notify-send "fava life.beancount started" "PID $(pgrep fava)"
        ;;
    "Random wallpaper")
        nitrogen --random $HOME/Pictures/Wallpapers --set-zoom-fill
        ;;
    "")
        echo "sxhkd"
        echo "keyd-application-mapper"
        echo "fava -> life.beancount"
        echo "Random wallpaper"
        ;;
esac
