#!/usr/bin/env bash

DOWNLOADS="$HOME/Downloads"
LOGFILE="$DOWNLOADS/.tidy-downloads.log"
DRY_RUN=1   # set to 1 for dry-run

# ---- exclusion patterns (lowercase) ----
EXCLUDE_NAMES=(
  "*.part"
  "*.crdownload"
  "*.download"
  "*.tmp"
  "*.temp"
  "~$*"
  ".ds_store"
)

EXCLUDE_DIRS=(
  "$DOWNLOADS/screenshots"
  "$DOWNLOADS/screen-recordings"
  "$DOWNLOADS/images"
  "$DOWNLOADS/videos"
  "$DOWNLOADS/audio"
  "$DOWNLOADS/documents"
  "$DOWNLOADS/archives"
  "$DOWNLOADS/code"
  "$DOWNLOADS/others"
)

log() {
  printf "[%s] %s\n" "$(date '+%Y-%m-%d %H:%M:%S')" "$1" >> "$LOGFILE"
}

ensure_dir() {
  [ -d "$1" ] || mkdir -p "$1"
}

is_excluded() {
  local f="$1"
  local lname
  lname="$(printf '%s' "$f" | tr '[:upper:]' '[:lower:]')"

  for p in "${EXCLUDE_NAMES[@]}"; do
    case "$lname" in
      $p) return 0 ;;
    esac
  done
  return 1
}

move_safe() {
  src="$1"
  dest_dir="$2"
  base="$(basename "$src")"
  target="$dest_dir/$base"

  ensure_dir "$dest_dir"

  if [ -e "$target" ]; then
    ext="${base##*.}"
    name="${base%.*}"
    i=1
    while [ -e "$dest_dir/${name}_$i.$ext" ]; do
      i=$((i + 1))
    done
    target="$dest_dir/${name}_$i.$ext"
  fi

  if [ "$DRY_RUN" -eq 1 ]; then
    echo "DRY-RUN: $src -> $target"
  else
    mv "$src" "$target"
    log "moved: $(basename "$src") -> $(basename "$target")"
  fi
}

find "$DOWNLOADS" -maxdepth 1 -type f -mtime +2 | while read -r file; do
  base="$(basename "$file")"
  is_excluded "$base" && continue
  lname="$(printf '%s' "$base" | tr '[:upper:]' '[:lower:]')"

  case "$lname" in
    screenshot*|screen_shot*|screen-shot*|screen\ shot*|scrot*|flameshot*)
      dir="$DOWNLOADS/screenshots" ;;

    screen\ recording*|screen-recording*|screen_recording*|screencast*)
      dir="$DOWNLOADS/screen-recordings" ;;

    *.jpg|*.jpeg|*.png|*.gif|*.webp|*.bmp|*.tiff|*.tif|*.heic|*.svg|*.ico)
      dir="$DOWNLOADS/images" ;;

    *.mp4|*.mkv|*.avi|*.mov|*.webm|*.flv|*.wmv|*.m4v|*.3gp)
      dir="$DOWNLOADS/videos" ;;

    *.mp3|*.wav|*.flac|*.aac|*.ogg|*.opus|*.m4a|*.wma|*.aiff)
      dir="$DOWNLOADS/audio" ;;

    *.pdf|*.txt|*.rtf|*.md|*.doc|*.docx|*.odt|*.xls|*.xlsx|*.ods|*.csv|*.ppt|*.pptx|*.odp)
      dir="$DOWNLOADS/documents" ;;

    *.zip|*.tar|*.gz|*.tgz|*.bz2|*.xz|*.rar|*.7z|*.iso)
      dir="$DOWNLOADS/archives" ;;

    *.js|*.ts|*.jsx|*.tsx|*.java|*.py|*.go|*.rs|*.cpp|*.c|*.h|*.cs|*.kt|*.swift|*.rb|*.php|*.sh|*.sql|*.yaml|*.yml|*.json|*.xml)
      dir="$DOWNLOADS/code" ;;

    *)
      dir="$DOWNLOADS/others" ;;
  esac

  move_safe "$file" "$dir"
done
