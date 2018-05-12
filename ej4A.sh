# !/bin/bash
find "$1" -name \*.jpg -size +1M -print -exec mogrify -resize 720 \{\} \;

