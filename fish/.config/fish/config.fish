
set EDITOR 'nvim'

fish_vi_key_bindings

if not test -d $HOME/.config/ranger
  mkdir $HOME/.config/ranger
end

if not test -e $HOME/.config/ranger/lastdir
  touch $HOME/.config/ranger/lastdir
end

alias rr='ranger --choosedir=$HOME/.config/ranger/lastdir; cd (cat $HOME/.config/ranger/lastdir)'

if not test -z $FULL_INIT

  alias rsync_django='rsync -vrP /home/funtik/dev/Python/test-django/backend/ root@frostgem.ru:/root/server_app'
  alias yda="youtube-dl -f 'bestaudio[ext=mp3]/bestaudio[ext=m4a]/bestaudio'"

  # environment variables
  set -gx FZF_DEFAULT_OPTS ' --color=fg:#4d4d4c,bg:#fafafa,hl:#d7005f --color=fg+:#4d4d4c,bg+:#f0f0f0,hl+:#d7005f --color=info:#4271ae,prompt:#8959a8,pointer:#d7005f --color=marker:#4271ae,spinner:#4271ae,header:#4271ae' $FZF_DEFAULT_OPTS
  set -gx ANDROID_HOME $HOME/Android/Sdk
  set -gx REACT_SECRET_DEVELOPMENT_KEY 'c15i4AejI1EJFusqhjI='

  set fish_function_path $ANDROID_HOME/emulator $fish_function_path
  set fish_function_path $ANDROID_HOME/toolsexport $fish_function_path
  set fish_function_path $ANDROID_HOME/tools/binexport $fish_function_path
  set fish_function_path $ANDROID_HOME/platform-tools $fish_function_path

  zoxide init fish | source
end


set -gx AUTOJUMP_SOURCED 1

# set user installation path
if test -d ~/.autojump
    set -x PATH ~/.autojump/bin $PATH
end

