import os.path

c.completion.web_history.max_items = 10000
c.content.default_encoding = "utf-8"
# c.content.pdfjs = True
c.downloads.location.directory = os.path.expanduser("~/Downloads")
c.downloads.location.prompt = False
c.downloads.remove_finished = 30000
c.editor.command = ["nvim", "{}"]
c.hints.uppercase = True
c.keyhint.delay = 100
c.scrolling.smooth = True
c.tabs.padding = {"left": 5, "right": 5, "top": 2, "bottom": 2}
c.tabs.title.format = "{perc}{current_title}"
c.zoom.default = 100
c.content.javascript.enabled = True

config.load_autoconfig()
config.source("bindings.py")
config.source("fonts.py")
config.source("themes/onelight.py")

# urls
c.url.searchengines = {
    # "DEFAULT": "https://google.com/search?q={}",
    "DEFAULT": "https://google.com/search?q={}",
    "?": "https://duckduckgo.com/?q={}",
    "d": "https://www.ldoceonline.com/dictionary/{}",
    "g": "https://github.com/search?q=topic%3A{}",
    "gg": "https://google.com/search?q={}"
}

c.url.default_page = "https://google.com/"
# c.url.default_page = "~/.config/qutebrowser/blank.html"
# c.url.start_pages = ["~/.config/qutebrowser/blank.html"]


