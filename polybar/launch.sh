#!/usr/bin/env bash

killall -q polybar

polybar -q main -c ~/.config/polybar/config.ini &
polybar -q second -c ~/.config/polybar/config.ini
