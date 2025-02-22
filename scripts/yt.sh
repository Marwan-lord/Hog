#!/usr/bin/env bash

# YT-DLP 480p Video+Audio Downloader
# Usage: yt480 <url>

VIDEOS_DIR="$HOME/Videos/yt-dlp-downloads"
MAX_HEIGHT=480

# Create directory if needed
mkdir -p "$VIDEOS_DIR"

# Check dependencies
if ! command -v ffmpeg &> /dev/null; then
    echo -e "\033[1;31mError: ffmpeg is required for merging streams\033[0m"
    exit 1
fi

# Check URL
if [ -z "$1" ]; then
    echo -e "\033[1;31mError: No URL provided\033[0m"
    echo "Usage: yt480 <youtube-url>"
    exit 1
fi

# Download with forced video+audio merge
yt-dlp -f "bestvideo[height<=$MAX_HEIGHT][vcodec!=av01]+bestaudio" \
    --merge-output-format mp4 \
    --output "$VIDEOS_DIR/%(title)s [%(id)s].%(ext)s" \
    --embed-thumbnail \
    --embed-metadata \
    --no-playlist \
    --progress \
    --console-title \
    "$1"

# Notification
if [ $? -eq 0 ]; then
    notify-send "YT-DLP Download Complete" "480p video saved to:\n$VIDEOS_DIR"
else
    notify-send "YT-DLP Error" "Failed to download video"
fi
