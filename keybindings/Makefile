SHELL := /bin/bash

dump-wm-keys:
	dconf dump /org/gnome/desktop/wm/keybindings/ > wm_keys

load-wm-keys:
	dconf load /org/gnome/desktop/wm/keybindings/ < wm_keys

dump-custom-keys:
	dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > media_keys

load-custom-keys:
	dconf load /org/gnome/settings-daemon/plugins/media-keys/ < media_keys

load-all: load-wm-keys load-custom-keys

dump-all: dump-wm-keys dump-custom-keys
