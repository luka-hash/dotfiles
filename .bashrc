# modified EndeavourOS .bashrc
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

_set_liveuser_PS1() {
    PS1='[\u@\h \W]\$ '
    if [ "$(whoami)" = "liveuser" ] ; then
        local iso_version="$(grep ^VERSION= /usr/lib/endeavouros-release 2>/dev/null | cut -d '=' -f 2)"
        if [ -n "$iso_version" ] ; then
            local prefix="eos-"
            local iso_info="$prefix$iso_version"
            PS1="[\u@$iso_info \W]\$ "
        fi
    fi
}
_set_liveuser_PS1
unset -f _set_liveuser_PS1

ShowInstallerIsoInfo() {
    local file=/usr/lib/endeavouros-release
    if [ -r $file ] ; then
        cat $file
    else
        echo "Sorry, installer ISO info is not available." >&2
    fi
}

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

PS1=' \[\e[33m\]in \[\e[m\]\[\e[34m\]\W\[\e[m\]\[\e[32m\] λ\[\e[m\] '
# λ,𝞿
PS2='... '

shopt -s checkwinsize

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

################################################################################
## Some generally useful functions.
## Consider uncommenting aliases below to start using these functions.
##
## October 2021: removed many obsolete functions. If you still need them, please look at
## https://github.com/EndeavourOS-archive/EndeavourOS-archiso/raw/master/airootfs/etc/skel/.bashrc

_open_files_for_editing() {
    # Open any given document file(s) for editing (or just viewing).
    # Note1:
    #    - Do not use for executable files!
    # Note2:
    #    - Uses 'mime' bindings, so you may need to use
    #      e.g. a file manager to make proper file bindings.

    if [ -x /usr/bin/exo-open ] ; then
        echo "exo-open $@" >&2
        setsid exo-open "$@" >& /dev/null
        return
    fi
    if [ -x /usr/bin/xdg-open ] ; then
        for file in "$@" ; do
            echo "xdg-open $file" >&2
            setsid xdg-open "$file" >& /dev/null
        done
        return
    fi

    echo "$FUNCNAME: package 'xdg-utils' or 'exo' is required." >&2
}

#------------------------------------------------------------

## Aliases for the functions above.
## Uncomment an alias if you want to use it.
##

# alias ef='_open_files_for_editing'     # 'ef' opens given file(s) for editing
# alias pacdiff=eos-pacdiff
################################################################################

alias vim="nvim"
alias v="nvim"
alias code="codium"

alias gh="history|grep "

# for runnit
# alias bt_start="sudo /etc/init.d/bluetooth start"

alias copyfile="rsync -ah --info=progress2 "

alias showalias="type $1"

alias difff="diff -s -y --color $1 $2" # wip

alias vimclean="nvim --clean --noplugin"

alias server="python -m http.server"

alias rm="rm -i"

alias ls="ls -AlFh --color=auto"
alias la="ls -AlFh --color=auto"
alias l="ls -AlFh --color=auto"
alias sl="ls -AlFh --color=auto"
alias ll="ls -AlFh --color=auto"

alias fixbrightness="sudo chmod o+w /sys/class/backlight/amdgpu_bl0/brightness"

alias writefile="cat <<EOF > "

copy () {
	cat "$1" | xclip -selection c
}

export HISTFILESIZE=
export HISTSIZE=


#cd ~/Desktop/
#fish

