#!/bin/bash
if [[ $(tmux list-sessions | cut -d " " -f 1) -eq "no" ]]; then
	tmux new-session -s default
else
	tmux attach-session -t default
fi
