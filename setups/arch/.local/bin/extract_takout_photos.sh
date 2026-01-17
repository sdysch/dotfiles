#!/bin/bash
# Safely extract Google Takeout photos from multiple zips into Photos/YYYY/MM
# Applies timestamps + GPS metadata
# No overwrites, zip-by-zip processing

IFS=$'\n\t'

PHOTOS='./Photos'

# ---------- helpers ----------

require_cmd() {
    command -v "$1" >/dev/null 2>&1 || {
        echo "Required command not found: $1"
        exit 1
    }
}

extract_zip() {
    local zip="$1"
    local tmp="$2"

    rm -rf "$tmp"
    mkdir -p "$tmp"

    echo "Extracting $zip → $tmp"

    if ! 7z x -y "$zip" -o"$tmp"; then
        rc=$?
        if [ "$rc" -ne 1 ]; then
            echo "7z failed for $zip (exit code $rc)"
            exit 1
        fi
        echo "7z warning for $zip (continuing)"
    fi
}

unique_dest() {
    local dir="$1"
    local filename="$2"

    local base="$dir/$filename"
    local dest="$base"

    if [ -e "$dest" ]; then
        local name ext i=1
        ext="${filename##*.}"
        name="${filename%.*}"
        while [ -e "$dir/${name}__${i}.${ext}" ]; do
            i=$((i + 1))
        done
        dest="$dir/${name}__${i}.${ext}"
    fi

    echo "$dest"
}

apply_metadata() {
    local file="$1"
    local ts="$2"
    local lat="$3"
    local lon="$4"

    exiftool -overwrite_original \
        -AllDates="$(date -d "@$ts" '+%Y:%m:%d %H:%M:%S')" \
        "$file" >/dev/null

    if [ -n "$lat" ] && [ -n "$lon" ]; then
        exiftool -overwrite_original \
            -GPSLatitude="$lat" -GPSLongitude="$lon" \
            -GPSLatitudeRef=N -GPSLongitudeRef=E \
            "$file" >/dev/null
    fi
}

process_json() {
    local json="$1"

    local photo ts lat lon src year month target_dir dest

    photo=$(jq -r '.title // empty' "$json")
    ts=$(jq -r '.photoTakenTime.timestamp // empty' "$json")
    lat=$(jq -r '.geoData.latitude // empty' "$json")
    lon=$(jq -r '.geoData.longitude // empty' "$json")

    [ -n "$photo" ] || return
    [ -n "$ts" ] || return

    src="$(dirname "$json")/$photo"
    [ -f "$src" ] || return

    year=$(date -d "@$ts" '+%Y')
    month=$(date -d "@$ts" '+%m')
    target_dir="$PHOTOS/$year/$month"
    mkdir -p "$target_dir"

    dest=$(unique_dest "$target_dir" "$photo")

    mv "$src" "$dest"
    apply_metadata "$dest" "$ts" "$lat" "$lon"
}

process_zip() {
    local zip="$1"
    local tmp="./tmp_$(basename "$zip" .zip)"

    echo "=== Processing $zip ==="

    extract_zip "$zip" "$tmp"

    find "$tmp" -type f -name '*.json' | while read json; do
        process_json "$json"
    done

    rm -rf "$tmp"
    echo "Finished $zip"
    echo
}

# ---------- main ----------

require_cmd jq
require_cmd exiftool
require_cmd 7z

mkdir -p "$PHOTOS"

for zip in *.zip; do
    [ -f "$zip" ] || continue
    process_zip "$zip"
done

echo "All done. Photos are in $PHOTOS/YYYY/MM"
