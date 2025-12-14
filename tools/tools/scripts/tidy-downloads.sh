#!/usr/bin/env bash

# ---- defaults ----
DOWNLOADS="$HOME/Downloads"
DAYS=2
LOGGING=1
DRY_RUN=0

# ---- env overrides ----
[ -n "${TIDY_DOWNLOADS_DIR:-}" ] && DOWNLOADS="$TIDY_DOWNLOADS_DIR"
[ -n "${TIDY_DAYS:-}" ] && DAYS="$TIDY_DAYS"
[ -n "${TIDY_LOGGING:-}" ] && LOGGING="$TIDY_LOGGING"

# ---- CLI overrides ----
while [ $# -gt 0 ]; do
	case "$1" in
		--dir)
			DOWNLOADS="$2"
			shift    2
			;;
		--days)
			DAYS="$2"
			shift 2
			;;
		--log)
			LOGGING=1
			shift
			;;
		--no-log)
			LOGGING=0
			shift
			;;
		--dry-run)
			DRY_RUN=1
			shift
			;;
		*)
			shift
			;;
	esac
done

# ---- hard disable ----
if [ "${DISABLE_TIDY_DOWNLOADS:-0}" = "1" ]; then
	exit 0
fi

LOGFILE="$DOWNLOADS/.tidy_downloads.log"

EXCLUDE_NAMES=(
	"*.part"
	"*.crdownload"
	"*.download"
	"*.tmp"
	"*.temp"
	"~$*"
	".ds_store"
)

log() {
	msg="$1"
	ts="[$(date '+%Y-%m-%d %H:%M:%S')]"

	if [ "$DRY_RUN" -eq 1 ]; then
		echo "$ts $msg"
		return
	fi

	[ "$LOGGING" -eq 1 ] || return
	printf "%s %s\n" "$ts" "$msg" >>"$LOGFILE"
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

	if [ "$DRY_RUN" -eq 1 ]; then
		log "dry-run move: $src -> $target"
		return
	fi

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

	mv "$src" "$target"
	log "moved: $(basename "$src") -> $(basename "$target")"
}

log "run-start: dir=$DOWNLOADS days=$DAYS logging=$LOGGING dry_run=$DRY_RUN"

AGE_FILTER=()
if [[ ! "$DAYS" =~ ^[0-9]+$ ]]; then
    DAYS=2
fi

if [ "$DAYS" -gt 0 ]; then
    AGE_FILTER=(-mtime +"$DAYS")
elif [ "$DAYS" -eq 0 ]; then
    AGE_FILTER=()
fi

find "$DOWNLOADS" -maxdepth 1 -type f ${AGE_FILTER:+"${AGE_FILTER[@]}"} | while read -r file; do
	base="$(basename "$file")"
	is_excluded "$base" && continue
	lname="$(printf '%s' "$base" | tr '[:upper:]' '[:lower:]')"

	case "$lname" in
		screenshot* | screen_shot* | screen-shot* | screen\ shot* | scrot* | flameshot*)
			dir="$DOWNLOADS/screenshots"
			;;

		screen\ recording* | screen-recording* | screen_recording* | screencast*)
			dir="$DOWNLOADS/screen-recordings"
			;;

		*.jpg | *.jpeg | *.png | *.gif | *.webp | *.bmp | *.tiff | *.tif | *.heic | *.svg | *.ico)
			dir="$DOWNLOADS/images"
			;;

		*.ttf | *.otf | *.woff | *.woff2 | *.eot | *.ttc | *.otb | *.pfa | *.pfb | *.dfont | *.suit)
			dir="$DOWNLOADS/fonts"
			;;

		*.mp4 | *.mkv | *.avi | *.mov | *.webm | *.flv | *.wmv | *.m4v | *.3gp)
			dir="$DOWNLOADS/videos"
			;;

		*.mp3 | *.wav | *.flac | *.aac | *.ogg | *.opus | *.m4a | *.wma | *.aiff)
			dir="$DOWNLOADS/audio"
			;;

		*.pdf | *.txt | *.rtf | *.md | *.doc | *.docx | *.odt | *.xls | *.xlsx | *.ods | *.csv | *.ppt | *.pptx | *.odp)
			dir="$DOWNLOADS/documents"
			;;

		*.zip | *.tar | *.gz | *.tgz | *.bz2 | *.xz | *.rar | *.7z | *.iso)
			dir="$DOWNLOADS/archives"
			;;

		*.js | *.ts | *.jsx | *.tsx | *.java | *.py | *.go | *.rs | *.cpp | *.c | *.h | *.cs | *.kt | *.swift | *.rb | *.php | *.sh | *.sql | *.yaml | *.yml | *.json | *.xml)
			dir="$DOWNLOADS/code"
			;;

		*)
			dir="$DOWNLOADS/others"
			;;
	esac

	move_safe "$file" "$dir"
done
