laptop_screen=$(xrandr | grep -E " connected\s*" | grep "primary\s*" | sed -e "s/\([A-Z0-9]\+\) connected.*/\1/")
hdmi_screen=$(xrandr | grep -E " connected\s*" | grep -v "primary\s*" | sed -e "s/\([A-Z0-9]\?\) connected.*/\1/")

echo $hdmi_screen
echo $laptop_screen
execute="xrandr --output $hdmi_screen --auto --left-of $laptop_screen"

echo $execute
`$execute`
