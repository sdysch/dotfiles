#!/usr/bin/env python3
# shellcheck disable=all

# Replace tags from mp3s in directory, with optional dry-run category

"""
clean_titles.py ' (Audio Only)' ' (Other tag)'

clean_titles.py --dry-run ' (Audio Only)' ' (Other tag)'

clean_titles.py --recursive ' (Audio Only)' ' (Other tag)'
"""

import argparse
import pathlib
import eyed3

def parse_args():
    parser = argparse.ArgumentParser(
        description='Remove substrings from MP3 title tags'
    )
    parser.add_argument(
        'strings',
        nargs='+',
        help='Substrings to remove from the title'
    )
    parser.add_argument(
        '--recursive',
        action='store_true',
        help='Process MP3s recursively'
    )
    parser.add_argument(
        '--dry-run',
        action='store_true',
        help='Show changes without saving'
    )
    return parser.parse_args()

def clean_title(title: str, strings) -> str:
    for s in strings:
        title = title.replace(s, '')
    return title

def iter_mp3s(recursive: bool):
    if recursive:
        yield from pathlib.Path('.').rglob('*.mp3')
    else:
        yield from pathlib.Path('.').glob('*.mp3')

def main():
    args = parse_args()
    mp3s = sorted(iter_mp3s(args.recursive))

    if not mp3s:
        print('No MP3 files found.')
        return

    for path in mp3s:
        audio = eyed3.load(path)

        if audio is None or audio.tag is None or not audio.tag.title:
            print(f'Skipping: {path.name}')
            continue

        old_title = audio.tag.title
        new_title = clean_title(old_title, args.strings)

        if new_title == old_title:
            continue

        print(f'{path.name}')
        print(f'  "{old_title}" → "{new_title}"')

        if not args.dry_run:
            audio.tag.title = new_title
            audio.tag.save(version=eyed3.id3.ID3_V2_3)

if __name__ == '__main__':
    main()
