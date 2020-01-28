#!/bin/sh
########################################################################
# File name: srcery.tmux
# Project: srcery color scheme for tmux
# Version: 0.0.1
# Copyright:
#
# This is the main file for the tmux color scheme.  This file loads the
# theme files, and run throug the options by the user.
#
########################################################################


SRCERY_TMUX_COLOR_THEME_FILE=themes/srcery.conf
SRCERY_TMUX_STATUS_PATCHED_FILE=themes/srcery_patched.conf
SRCERY_TMUX_STATUS_NO_PATCHED_FILE=themes/srcery_no_patched.conf
SRCERY_TMUX_PATCHED_FONT_OPTION="@srcery_tmux_patched_font"
CURRENT_DIR="$(cd "$(dirname "${0}")" && pwd)"

__cleanup() {
    unset -v SRCERY_TMUX_COLOR_THEME_FILE SRCERY_TMUX_VERSION
    unset -v SRCERY_TMUX_STATUS_PATCHED_FILE
    unset -v SRCERY_TMUX_STATUS_NO_PATCHED_FILE
    unset -v SRCERY_TMUX_PATCHED_FONT_OPTION
    unset -v CURRENT_DIR
    unset -v patched_font
    unset -f __load __cleanup
}

__load() {
    tmux source-file "$CURRENT_DIR/$SRCERY_TMUX_COLOR_THEME_FILE"
    tmux source-file "$CURRENT_DIR/$SRCERY_TMUX_STATUS_PATCHED_FILE"
}

__load
__cleanup

# vim: filetype=sh
