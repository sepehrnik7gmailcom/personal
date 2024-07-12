#!/usr/bin/env bash
# Make symlinks to the canonical locations of our dot files.
if [[ -f ~/.emacs ]]; then
    echo "Warning: ~/.emacs exists and is a regular file. We will not remove it."
else 
    if [[ -h ~/.emacs ]]; then
	# removes the existing symlink for replacement 
	rm -v ~/.emacs
    fi
    ln -vs $PWD/.emacs ~/.emacs
fi
