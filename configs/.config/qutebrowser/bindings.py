
config.bind('<Ctrl-h>', 'tab-prev')
config.bind('<Ctrl-l>', 'tab-next')
config.bind('<Shift-h>', 'history')

config.bind('<Ctrl-j>', 'scroll_down')
config.bind('<Ctrl-k>', 'scroll_up')

# Restart qutebrowser
config.bind('<Ctrl-r>', 'restart')

# Go back / forward in history
config.bind('<Ctrl-o>', 'back')
config.bind('<Ctrl-p>', 'forward')

# Quickly navigate to websites
config.bind('\\g',  'open -- https://github.com/search?q=topic%3Areact-native')
config.bind('\\s',  'open -- https://google.com')
config.bind('\\d',  'open -- https://www.ldoceonline.com/dictionary/eat-away')

config.bind('q', 'tab-close')
config.unbind("<ctrl+q>")
config.bind("<ctrl+q>", "tab-close")


config.bind("xjt", "set content.javascript.enabled true")
config.bind("xjf", "set content.javascript.enabled false")

