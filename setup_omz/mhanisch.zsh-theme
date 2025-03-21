if [[ -n $SSH_CONNECTION ]]; then
    PROMPT="%F{141}%B%n@%m "  # Purple for SSH
else
    PROMPT="%F{yellow}%B%n@%m "  # Yellow for locals
fi
PROMPT+="%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} )"
PROMPT+=" %F{cyan}%B%~%b%f"  # Full path, with home shortened to ~

PROMPT+=' $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
