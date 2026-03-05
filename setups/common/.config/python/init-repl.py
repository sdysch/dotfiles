"""
This file is executed when the Python REPL is started if
$PYTHONSTARTUP is in your environment and points to this file.
"""

import os
import subprocess

# Default editor
EDITOR = os.environ.get("EDITOR", "vi")


def edit(filename):
    """Open a file in the system editor."""
    subprocess.run([EDITOR, filename])


# REPL shortcut: just type e('file.py')
e = edit

# Optional: keep the namespace clean
__all__ = ["edit", "e", "EDITOR"]
