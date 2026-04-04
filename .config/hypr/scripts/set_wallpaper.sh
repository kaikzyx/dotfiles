#!/usr/bin/env bash

set -euo pipefail

WALLPAPER_DIR="${HOME}/Documents/wallpapers"

if [[ ! -d "${WALLPAPER_DIR}" ]]; then
  echo "Error: Directory ${WALLPAPER_DIR} does not exist."
  exit 1
fi

if [[ $# -gt 0 ]]; then
  IMAGE="${WALLPAPER_DIR}/$1"
else
  IMAGE="$(find "${WALLPAPER_DIR}" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' \) | shuf -n 1)"
fi

if [[ -z "${IMAGE}" || ! -f "${IMAGE}" ]]; then
  echo "Error: Image '${IMAGE}' not found!"
  exit 1
fi

echo "Applying: ${IMAGE}"

awww query >/dev/null 2>&1 || awww-daemon &
sleep 0.5
awww img "${IMAGE}"

echo "Wallpaper updated successfully!"
