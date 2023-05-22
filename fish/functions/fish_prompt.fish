function fish_prompt --description 'Write out the prompt'
    # this is a simple prompt that should like something like this
    # luka@talo /home/luka/ ➜
    # with some `dynamic` parts that will show up only when in virtual env or in git dir
    # stuff like that (also a return code, and vim mode)

    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus.

    set -l color_user 34e8eb
    set -l color_sign d9d75d
    set -l color_hostname 7351c4
    set -l color_dir 3e8548

    set -g fish_color_status --background=red white
    set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)

    set -l color_cwd $fish_color_cwd
    set -l suffix "➜  "
    if functions -q fish_is_root_user; and fish_is_root_user
        set color_user ffffff
        set color_hostname ffffff
        set suffix "# "
    end


    set_color $color_user
    echo -n  $USER
    set_color $color_sign
    echo -n @
    set_color $color_hostname
    echo -n $hostname
    set_color $color_sign
    echo -n ":"
    set_color $color_dir
    echo -n $PWD
    set_color normal
    echo -n (fish_vcs_prompt)
    echo -n $prompt_status
   #set_color $fish_color_status
   #echo -n " ["
   #echo -n $__fish_last_status
   #echo -n "] "
    set_color normal
    set_color magenta
    echo -n " ➜  "
    set_color normal
end

