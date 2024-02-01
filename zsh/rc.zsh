source "$HOME/.zsh/path.zsh"
source "$HOME/.zsh/antigen.zsh"

antigen use oh-my-zsh
antigen bundle git
antigen bundle docker
antigen bundle command-not-found
antigen bundle fzf
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle history
antigen bundle pip
antigen bundle pipenv
antigen bundle zsh-history-substring-search.zsh
antigen bundle docker/cli contrib/completion/zsh
antigen bundle docker/compose contrib/completion/zsh
antigen theme romkatv/powerlevel10k
antigen apply

HISTSIZE=10000000
HISTFILESIZE=10000000

h=()
if [[ -r "$HOME/.ssh/config" ]]; then
   h=($h ${${${(@M)${(f)"$(cat $HOME/.ssh/config)"}:#Host *}#Host }:#*[*?]*})
fi
if [[ $#h -gt 0 ]]; then
   zstyle ':completion:*:ssh:*' hosts $h
fi

setopt nonomatch

setopt NO_HUP

[[ ! -f "$HOME/google-cloud-sdk/path.zsh.inc" ]] || . "$HOME/google-cloud-sdk/path.zsh.inc"
[[ ! -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]] || . "$HOME/google-cloud-sdk/completion.zsh.inc"

if [[ $OSTYPE == 'darwin'* ]]; then
    eval $(/opt/homebrew/bin/brew shellenv)
    export LDFLAGS="-L/opt/homebrew/lib"
    export CPPFLAGS="-I/opt/homebrew/include"
    export CXXFLAGS="-I/opt/homebrew/include"
    export JUPYTER_PATH=/opt/homebrew/share/jupyter
    export JUPYTER_CONFIG_PATH=/opt/homebrew/etc/jupyter
else
    source /etc/zsh_command_not_found
fi

[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
[[ -f "$HOME/.zsh/p10k.zsh" ]] && source "$HOME/.zsh/p10k.zsh"
[[ -x "$(which opam)" ]] && [[ -f "$HOME/.zsh/ocaml.zsh" ]] && source "$HOME/.zsh/ocaml.zsh"
[[ -x "$(which opam)" ]] && [[ -f "$HOME/.zsh/hook.zsh" ]] && source "$HOME/.zsh/hook.zsh"
[[ -f "$HOME/.config/z/z.sh" ]] && source "$HOME/.config/z/z.sh"
[[ -f "$HOME/.fzf.zsh" ]] && source "$HOME/.fzf.zsh"
[[ -d "$HOME/.nvm" ]] && source "$HOME/.zsh/nvm.zsh"

# load alias finally
[[ ! -f "$HOME/.zsh/alias.zsh" ]] || source "$HOME/.zsh/alias.zsh"

[[ -x "$(which rbenv)" ]] && eval "$(rbenv init - zsh)"
