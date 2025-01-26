# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

export PNPM_HOME="/home/zakharovdev/.local/share/pnpm"

case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac

. "$HOME/.asdf/asdf.sh"
export EDITOR="nvim"

# DOOM EMACS
export PATH=$PATH:$HOME/.emacs.d/bin

. "$HOME/.cargo/env"
# aliases
alias m='mkdir'
alias t="touch"
alias gr="go run"
alias nrd="npm run dev"
alias js="node"
alias n="node"
alias ts="ts-node"
alias vpnc="adguardvpn-cli connect -l Finland"
alias vpnd="adguardvpn-cli disconnect"

# Changing "ls" to "exa"
alias l='exa -al --color=always --group-directories-first'  # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

alias vi="nvim"
alias pm="pnpm"

function yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi

unset rc

eval "$(zoxide init bash)"
eval "$(starship init bash)"

# pnpm
export PNPM_HOME="/home/zakharovdev/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export GOPATH=$HOME/go
. ~/.asdf/plugins/golang/set-env.bash
