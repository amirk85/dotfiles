#!/usr/bin/env bash

# Terminate already running bar instances
polybar-msg cmd quit

# Optionally wait for Polybar to shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch your bar (change 'main' if your bar has a different name in config)
echo "---" | tee -a /tmp/polybar.log
polybar main 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."

