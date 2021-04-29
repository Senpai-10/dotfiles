autoload -U colors && colors

HISTSIZE=HISTSIZE
SAVEHIST=SAVEHIST
HISTFILE=~/history

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

bindkey -v
export KEYTIMEOUT=1

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


[[ -f .profile/zsh/.zsh_aliases ]] && . .profile/zsh/.zsh_aliases
[[ -f .profile/zsh/.zsh_env ]] && . .profile/zsh/.zsh_env
[[ -f .profile/zsh/.zsh_functions ]] && . .profile/zsh/.zsh_functions
[[ -f .profile/zsh/.zsh_prompt ]] && . .profile/zsh/.zsh_prompt


