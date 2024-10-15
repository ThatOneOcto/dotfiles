
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
alias spt="spotify_player"

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
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi

# export PS1="%{$(tput setaf 99)%}%n%{$(tput setaf 99)%}@%{$(tput setaf 99)%}%m %{$(tput setaf 15)%}%~ %{$(tput sgr0)%}$ "
export PS1=$'%{\e[255m%}%M%{\e[38;5;99m%}@%{\e[38;5;63m%}%n [%{\e[38;5;99m%}%~%{\e[38;5;63m%}] %{\e[36m%}%{\e[2m%}%{\e[0m%}(%?) > %{\e[255m%}'
export MAKEFLAGS="-j$(nproc)"
eval $(thefuck --alias)
export MANGOHUD=1
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"
fastfetch
export PATH=$PATH:/home/octo/.spicetify
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/doc/pkgfile/command-not-found.zsh
