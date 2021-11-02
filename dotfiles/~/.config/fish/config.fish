# ~/.config/fish/config.fish
set -U fish_greeting "🐟"

set -g theme_color_scheme dark
set -g theme_nerd_fonts yes
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

alias l "exa -l -g --icons --tree -L 1"
alias g "cd $HOME/documents/github"
alias e "cd $HOME/documents/github/elements-of-programming-py"

set PATH "$HOME/.local/bin:$PATH"
set PATH "$HOME/.pyenv/bin:$PATH"
set PATH (pyenv root)/shims:$PATH

# Function: Open git-fork Windows App to provided path (git repo).
set fork_path /mnt/c/Users/shawn/AppData/Local/Fork/Fork.exe
function fork --argument-names 'absolute_path'
    if test -n "$absolute_path"
        $fork_path (wslpath -w -a $absolute_path)
    else
        $fork_path (wslpath -w -a .)
    end
end

# Open starship shell (last)
starship init fish | source