# Path to your oh-my-fish.
set fish_path $HOME/dotfiles/.oh-my-fish

# Theme
set fish_theme robbyrussell

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
set fish_plugins autojump vi-mode

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# ENVIRONMENT VARIABLE
# -------------------------------------------
if status --is-login
    if test -e ~/bin
        set -x PATH $PATH ~/bin
        set -x PATH $PATH ~/bin/git-tasukete
    end
    if test -e ~/.autojump/bin
        set -x PATH $PATH ~/.autojump/bin
    end
    set -x PATH $PATH /opt/local/bin
    set -x PATH $PATH /usr/local/bin
    set -x PATH $PATH /usr/local/sbin
    set -x PATH $PATH /usr/local/heroku/bin

    set -x LD_LIBRARY_PATH $LD_LIBRARY_PATH /usr/local/lib

    # docker
    set -x DOCKER_HOST tcp://localhost:4243

    # autojump
    if test -f $HOME/.autojump/etc/profile.d/autojump.fish
        . $HOME/.autojump/etc/profile.d/autojump.fish
    end

    # git prompt setting
    set -xg __fish_git_prompt_showdirtystate 1
    set -xg __fish_git_prompt_showuntrackedfiles 1
    set -xg __fish_git_prompt_color_dirtystate red
    set -xg __fish_git_prompt_color_untrackedfiles red
    set -xg __fish_git_prompt_color_branch normal
    set -xg __fish_git_prompt_color_prefix normal
    set -xg __fish_git_prompt_color_suffix normal
    set -xg __fish_git_prompt_color_stagedstate "green"
    set -xg __fish_git_prompt_color_bare red
    set -xg __fish_git_prompt_color_invalidstate red

    # vi mode
    set -g vi_mode_normal  '[N]'
    set -g vi_mode_insert  '[I]'
end

# PROMPT
# -------------------------------------------
function fish_prompt --description 'Write out the prompt'

    set -l last_status $status

    if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color normal)
    end

    # pwd
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal

    # dollar
    if not test $last_status -eq 0
        set_color $fish_color_error
    else
        set_color yellow
    end
    echo -n " $vi_mode "
    set_color normal
end

function fish_right_prompt
    # git status
    printf '%s ' (__fish_git_prompt)
end

function dl
    docker ps -lq
end

function reload
    source ~/.config/fish/config.fish
end
