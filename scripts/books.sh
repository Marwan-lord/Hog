#!/usr/bin/env bash

BG="#1a1b26"          # Background (Dark Navy)
FG="#a9b1d6"          # Foreground (Soft Blue-Gray)
SBG="#283457"          # Selected Background (Deep Navy Blue)
SFG="#c0caf5"          # Selected Text (Bright Ice Blue)
ACCENT="#9ece6a"       # Accent (Muted Green)
HIGHLIGHT="#7aa2f7"    # Highlight (Bright Tokyo Blue)

# Configuration
BOOKS_DIR="$HOME/Documents/books"
FILE_EXTENSIONS=("pdf" "epub" "djvu")
DMENU_PROMPT="📚 Books:"
DMENU_OPTS=(
    -i -l 15 
    -fn "ZedMono Nerd Font" 
    -nb "$BG" -nf "$FG" 
    -sb "$SBG" -sf "$SFG"
    -nf "$FG" -sf "$ACCENT"
)

# [Keep the rest of the script identical from here down]
# Verify books directory exists
if [ ! -d "$BOOKS_DIR" ]; then
    notify-send "Book Error" "Directory not found: $BOOKS_DIR"
    exit 1
fi

# Build find command extensions
find_args=()
for ext in "${FILE_EXTENSIONS[@]}"; do
    find_args+=(-iname "*.$ext" -o)
done

# Remove last '-o' and run find
unset 'find_args[${#find_args[@]}-1]'
book_list=$(find "$BOOKS_DIR" -type f \( "${find_args[@]}" \) -print 2>/dev/null)

# Check if any books found
if [ -z "$book_list" ]; then
    notify-send "Book Error" "No books found in: $BOOKS_DIR"
    exit 1
fi

selected=$(echo "$book_list" | sed "s|$BOOKS_DIR/||" | sort | dmenu "${DMENU_OPTS[@]}" -p "$DMENU_PROMPT")

if [ -n "$selected" ]; then
    full_path="$BOOKS_DIR/$selected"
    if [ -f "$full_path" ]; then
        zathura "$full_path" &
    else
        notify-send "Book Error" "File not found: $full_path"
    fi
fi
