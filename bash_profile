if [ -f ~/.bashrc ]; then
  .~/.bashrc
fi
export TERM=xterm-256color

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
export PATH="$PATH:/Users/cmotl/.modular/bin"
