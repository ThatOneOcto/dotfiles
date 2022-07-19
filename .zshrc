

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Lines configured by zsh-newuser-install
 HISTFILE=~/.histfile
 HISTSIZE=1000
 SAVEHIST=1000

 alias ssh="kitty +kitten ssh "
 alias sudo="sudo -E "
 alias mkdir="mkdir -p "
 alias forgor="sudo !!"
 alias myip="curl ifconfig.me"
 alias c="clear"
 alias mkdir="mkdir -p"
 alias ls="lsd -l"
 alias ll="lsd -la"
 alias grep="grep --color=auto"
 alias halt="loginctl poweroff"
 alias shutdown="systemctl poweroff"
 alias reboot="systemctl reboot"
 alias pswdfix="faillock --user $USER --reset"
 alias nf="neofetch"
 alias glg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold green)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold yellow)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"

PROMPT="%B%F{69}%n%f%b %F{102}%~%f
%F{8}$ %f"


# ~/.zshrc

transfer(){ if [ $# -eq 0 ];then echo "No arguments specified.\nUsage:\n  transfer <file|directory>\n  ... | transfer <file_name>">&2;return 1;fi;if tty -s;then file="$1";file_name=$(basename "$file");if [ ! -e "$file" ];then echo "$file: No such file or directory">&2;return 1;fi;if [ -d "$file" ];then file_name="$file_name.zip" ,;(cd "$file"&&zip -r -q - .)|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null,;else cat "$file"|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;else file_name=$1;curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;}

#keybinds

bindkey '^[[5~' beginning-of-line
bindkey '^[[6~' end-of-line
bindkey "\e[3~" delete-char

#variables
export EDITOR=nvim
export VISUAL=nvim

# If you're having issues with command not found, remove the export PATH variable, if you want local bin added run 
# echo $PATH >> .zshrc
# Then at the end add :$HOME/.local/bin/
export PATH=${PATH}:~/.local/bin
source $HOME/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/powerlevel10k/powerlevel10k.zsh-theme
alias luamake=/home/octo/git/lua-language-server/3rd/luamake/luamake

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# function aliases
