#this file will be filled with actual script later 

#we will update and get brightness using 

#/sys/class/backlight/intel_backlight/brightness

#files and added a chmod go+w /sys/class/backlight/intel_backlight/brightness in /etc/rc.local
#


#lets get the maximum brightness first

MAXIMUM=$(cat /sys/class/backlight/intel_backlight/max_brightness)
CURRENT_BRIGHTNESS=$(cat /sys/class/backlight/intel_backlight/actual_brightness)
STEP=10

BRIGHTNESS_LOCATION="/sys/class/backlight/intel_backlight/brightness"

case "$1" in
    "up")
        NEW_BRIGHTNESS=`expr $CURRENT_BRIGHTNESS + $STEP`
        echo $NEW_BRIGHTNESS
        if [ $NEW_BRIGHTNESS -le $MAXIMUM ]
        then
            $(echo $NEW_BRIGHTNESS  > $BRIGHTNESS_LOCATION)
        fi
        ;;
    "down")
        NEW_BRIGHTNESS=`expr $CURRENT_BRIGHTNESS - $STEP`
        echo $NEW_BRIGHTNESS
        if [ "$NEW_BRIGHTNESS" -ge "10" ]
        then
            $(echo $NEW_BRIGHTNESS  > $BRIGHTNESS_LOCATION)
        fi
        ;;
esac
