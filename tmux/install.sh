#!/bin/bash
mkdir -p ~/.tmux/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp .tmux.conf ~/
tmux source ~/.tmux.conf