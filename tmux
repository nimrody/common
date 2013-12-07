# from http://www.unwiredcouch.com/2013/11/15/my-tmux-setup.html
#

unbind C-b
set -g prefix C-q

# force a reload of the config file
unbind r
bind r source-file ~/.tmux.conf

# start window numbering at 1 for easier switching
set -g base-index 1

# colors
set -g default-terminal "screen-256color"

# unicode
setw -g utf8 on
set -g status-utf8 on


# status bar config
set -g status-left "#h:[#S]"
set -g status-left-length 50
set -g status-right-length 50
set -g status-right "âš¡ #(~/bin/tmux-battery) [âœ‰#(~/bin/imap_check.py)] %H:%M %d-%h-%Y"
setw -g window-status-current-format "|#I:#W|"
set-window-option -g automatic-rename off

# listen to alerts from all windows
set -g bell-action any


