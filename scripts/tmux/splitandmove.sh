#!/bin/bash

if tmux display -p '#{pane_current_command}' | grep -q nvim; then
	# if running nvim
	tmux send C-$1
else
	if [ "$1" = "h" ]; then
		if [ $(tmux display-message -p '#{pane_at_left}') -ne 1 ]; then
			tmux select-pane -L
		fi
	elif [ "$1" = "k" ]; then
		if [ $(tmux display-message -p '#{pane_at_top}') -ne 1 ]; then
			tmux select-pane -U
		fi
	elif [ "$1" = "j" ]; then
		if [ $(tmux display-message -p '#{pane_at_bottom}') -ne 1 ]; then
			tmux select-pane -D
		else
			tmux split-window -v
		fi
	elif [ "$1" = "l" ]; then
		if [ $(tmux display-message -p '#{pane_at_right}') -ne 1 ]; then
			tmux select-pane -R
		else
			tmux split-window -h
		fi
	fi
fi
