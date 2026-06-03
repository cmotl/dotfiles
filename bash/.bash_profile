if [ -f ~/.bashrc ]; then
  .~/.bashrc
fi
export TERM=xterm-256color

# Nix (multi-user) + home-manager session environment.
# Prepends ~/.nix-profile/bin to PATH so the Nix tools (incl. direnv) win over
# system/app copies, and puts `nix` on PATH for direnv's `use flake`.
if [ -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]; then
  . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
fi
if [ -e "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" ]; then
  . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
fi
# Force Nix profiles to the front of PATH so the Nix `direnv` (built against a
# modern bash) wins over /Applications/Wireshark.app's copy on /etc/paths.d.
export PATH="$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:$PATH"

source ~/.shell_colors.sh
source ~/.aliases.sh

PATH=$PATH:$HOME/bin:/opt/homebrew/bin
export PATH

export HISTSIZE=100000

export GIT_PS1_SHOWDIRTYSTATE=1

source ~/.bash-git-prompt/git-completion.sh
source ~/.bash-git-prompt/git-prompt.sh

function clean_terminal() 
{
  echo -e "\xF"
}

function cd()
{
  builtin cd "$@" && ls;
}

function prompt()
{
  #  PS1="${bold_green}┌$(seq -s─ $(($COLUMNS -1 )) | tr -d '[:digit:]')\n"
  # PS1+="${bold_green}│${bold_white}[${bold_cyan}\h ${bold_green}\w\$(__git_ps1 ' ${bold_yellow}(%s)') ${bold_white} \D{%Y-%m-%d %H:%M:%S}]\n"
  # PS1+="${bold_green}└→ ${white}"
  PS1="\n${bold_white}[${bold_cyan}\h ${bold_green}\w\$(__git_ps1 ' ${bold_yellow}(%s)') ${bold_white} \D{%Y-%m-%d %H:%M:%S}]\n"
  PS1+="${bold_green}→ ${white}"

  export PS1
}

export PROMPT_COMMAND=prompt

export BASH_SILENCE_DEPRECATION_WARNING=1
export PATH="$PATH:$HOME/.local/bin:"
eval "$(direnv hook bash)"
