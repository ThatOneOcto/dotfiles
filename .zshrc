
# Lines configured by zsh-newuser-install
 HISTFILE=~/.histfile
 HISTSIZE=1000
 SAVEHIST=1000

 alias mkdir="mkdir -p "
 alias c="clear"
 alias ls="lsd -l"
 alias ll="lsd -la"
 alias grep="grep --color=auto"
 alias pswdfix="faillock --user $USER --reset"
 alias glg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold green)%~%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold yellow)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"


# ~/.zshrc

transfer(){ if [ $# -eq 0 ];then echo "No arguments specified.\nUsage:\n  transfer <file|directory>\n  ... | transfer <file_name>">&2;return 1;fi;if tty -s;then file="$1";file_name=$(basename "$file");if [ ! -e "$file" ];then echo "$file: No such file or directory">&2;return 1;fi;if [ -d "$file" ];then file_name="$file_name.zip" ,;(cd "$file"&&zip -r -q - .)|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null,;else cat "$file"|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;else file_name=$1;curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;}

#keybinds

bindkey '^[[5~' beginning-of-line
bindkey '^[[6~' end-of-line
bindkey "\e[3~" delete-char

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

#variables
export EDITOR=nvim
export VISUAL=nvim
export QT_QPA_PLATFORMTHEME=qt5ct



# export PS1="%{$(tput setaf 99)%}%n%{$(tput setaf 99)%}@%{$(tput setaf 99)%}%m %{$(tput setaf 15)%}%~ %{$(tput sgr0)%}$ "
export PS1=$'%{\e[255m%}%M%{\e[38;5;99m%}@%{\e[38;5;63m%}%n [%{\e[38;5;99m%}%~%{\e[38;5;63m%}] %{\e[36m%}%{\e[2m%}%{\e[0m%}(%?) > %{\e[255m%}'


[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"
fastfetch
export PATH=$PATH:/home/octo/.spicetify
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/doc/pkgfile/command-not-found.zsh
