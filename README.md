# windows-terminal-setup
Some setup snips

1. Install WSL2
2. Install Ubuntu
3. Install [WT Preview](https://www.microsoft.com/en-us/p/windows-terminal-preview/9n8g5rfz9xk3?rtc=1#activetab=pivot:overviewtab)
4. Install fish shell
```sh
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install fish
```
5. Make sure ~ points to linux home for faster WSL2 access
```
Press Win + R
Enter cmd /C wsl -u root
A root terminal will open and now you can use the usermod -d <path> <user> command with no problem (e.g. usermod -d /mnt/c/Users/Alex alex)
```
6. In end of ~/.profile load fish
```
LS_COLORS=$LS_COLORS:'ow=1;34:' ; export LS_COLORS
fish
```
7. Fix git fork and add starship in ~/.config/fish/config.fish
```
# ~/.config/fish/config.fish
set -U fish_greeting "🐟"
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
```
8. Install fisher for plugins (need for nvm, poetry, etc)
```
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
```

## Python
- WSL ubuntu has python3 already.
- Need pyenv to manage python version installs.
```
# Fix ubuntu dependencies to build python
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev
```

```
cd $HOME/.pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
cd $HOME/.pyenv/bin
```
- Follow [instructions for fish or other shell for Pyenv](https://github.com/pyenv/pyenv#automatic-installer)
- Poetry:
  - The poetry website lists a new install script - use and then use dotenv $PATH
  

### Other snips
- For ~/.bashrc
```
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```
