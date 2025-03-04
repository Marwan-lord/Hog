#!/usr/bin/env bash

# Everforest Dark color scheme (https://github.com/sainnhe/everforest)
BG="#ffffea"          
FG="#1d1e1f"      
SBG="#5c7696"      
SFG="#1d1e1f"       
ACCENT="#ffffea"     
HIGHLIGHT="#83C092"   

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

# Format for dmenu (show filenames with paths)
selected=$(echo "$book_list" | sed "s|$BOOKS_DIR/||" | sort | dmenu "${DMENU_OPTS[@]}" -p "$DMENU_PROMPT")

# Open selected book
if [ -n "$selected" ]; then
    full_path="$BOOKS_DIR/$selected"
    if [ -f "$full_path" ]; then
        zathura "$full_path" &
    else
        notify-send "Book Error" "File not found: $full_path"
    fi
fi
