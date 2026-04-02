#!/bin/bash

WALLPAPER_DIR="$HOME/Documents/wallpapers"

# Check if directory exists.
if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Error: Directory $WALLPAPER_DIR does not exist."
    exit 1
fi

# Use argument if provided, otherwise pick a random image.
if [ -n "$1" ]; then
    IMAGE="$WALLPAPER_DIR/$1"
else
    # Find random image (jpg, png, jpeg)
    IMAGE=$(find "$WALLPAPER_DIR" -type f \( -iname \*.jpg -o -iname \*.png -o -iname \*.jpeg \) | shuf -n 1)
fi

# Check if image exists.
if [ ! -f "$IMAGE" ]; then
    echo "Error: Image '$IMAGE' not found!"
    exit 1
fi

echo "Applying: $IMAGE"

# Ensure swww-daemon is running.
swww query >/dev/null 2>&1 || swww-daemon &
sleep 0.5

# Apply wallpaper with swww.
swww img "$IMAGE"

echo "Wallpaper updated successfully!"
