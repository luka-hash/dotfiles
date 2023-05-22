if status is-interactive
    # Commands to run in interactive sessions can go here
    set DATE (date +"%Y-%m-%d")
    # cat ~/.cache/wal/sequences &
else 
    set -x XDG_CONFIG_HOME "$HOME"/.config
    set -x XDG_DATA_HOME "$HOME"/.local/share
    set -x XDG_CACHE_HOME "$HOME"/.cache
    set -x XDG_STATE_HOME "$HOME"/.local/state

    set -x VISUAL nvim
    set -x EDITOR nvim
    set -x SUDO_EDITOR nvim
    set -x BROWSER librewolf

    # set -x GOPROXY direct
    # set -x GOPATH "$XDG_DATA_HOME"/go
    # set -x GOMODCACHE "$GOPATH"/pkg/mod

    set -x STARDICT_DATA_DIR "$XDG_DATA_HOME"/stardict/stardict

    set -x DENO_DIR "$HOME"/Programming/third_party/deno
    set -x DENO_INSTALL_ROOT "$HOME"/Programming/third_party/deno/bin

    set -x PYTHONSTARTUP "$XDG_CONFIG_HOME"/python/pythonrc

    set -x LESSHISTFILE "$XDG_CACHE_HOME"/less/history

#    set -x NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME"/npm/npmrc
#    set -x NODE_REPL_HISTORY "$XDG_CACHE_HOME"/node_repl_history

    # set -x MIX_HOME "$XDG_DATA_HOME"/mix

    set -x GTK2_RC_FILES "$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

    set -x XAUTHORITY "$XDG_RUNTIME_DIR"/Xauthority

    if test -d "$HOME"/.local/bin
      set -x PATH "$PATH:$HOME"/.local/bin
    end

    # if test -d "$GOPATH"/bin
      # set -x PATH "$PATH:$GOPATH"/bin
    # end

    xrdb -load "$XDG_CONFIG_HOME"/X11/xresources

    setxkbmap -option caps:escape
    xset r rate 180 40
    # wal -R
end
