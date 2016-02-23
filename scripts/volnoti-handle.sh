STEP=5
VOLUME=$(pacmd dump-volumes | grep "Sink 1" | cut -d "," -f 1 | cut -d ":" -f 4 | sed -e 's/^[ \t]*//;s/%//')
SETVOL="pactl set-sink-volume 1 "
SETMUTE="pactl set-sink-mute 1 toggle"
DIRECTION=$1
MUTECMD="mute"


case "$1" in
    "up")
	   echo $SETVOL
	   echo $STEP
          $SETVOL +$STEP%
          ;;
  "down")
          $SETVOL -- -$STEP%
          ;;
  "mute")
          $SETMUTE
          ;;
esac


case "$1" in
	"mute")
		volnoti-show -m
		;;
	*)
		volnoti-show $VOLUME
		;;
esac


# Show volume with volnoti
#if [ $1 ==  *"mute"* ]; then
#    volnoti-show $VOLUME
#else
#    volnoti-show -m
#fi

exit 0
