source ~/.zsh/antigen.zsh

antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle docker
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme romkatv/powerlevel10k
antigen apply

HISTSIZE=10000000
HISTFILESIZE=10000000

h=()
if [[ -r ~/.ssh/config ]]; then
   h=($h ${${${(@M)${(f)"$(cat ~/.ssh/config)"}:#Host *}#Host }:#*[*?]*})
fi
if [[ $#h -gt 0 ]]; then
   zstyle ':completion:*:ssh:*' hosts $h
fi

setopt nonomatch

setopt NO_HUP

source ~/.cargo/env

if [ $(uname -s) = Darwin ]; then
    eval $(/opt/homebrew/bin/brew shellenv)
else
    source /etc/zsh_command_not_found
fi


[[ ! -f ~/.zsh/p10k.zsh ]] || source ~/.zsh/p10k.zsh
[[ ! -f ~/.zsh/ocaml.zsh ]] || source ~/.zsh/ocaml.zsh
[[ ! -f ~/.zsh/hook.zsh ]] || source ~/.zsh/hook.zsh
[[ ! -f ~/.config/z/z.sh ]] || source ~/.config/z/z.sh
[[ ! -f ~/.fzf.zsh ]] || source ~/.fzf.zsh
[[ ! -f ~/.zsh/nvm.zsh ]] || source ~/.zsh/nvm.zsh

# conditional rtags
if [ -d ~/.dotfiles/rtags ]; then
    export PATH=$PATH:~/.dotfiles/rtags/bin
fi

export GEM_HOME="$HOME/.gems"
export PATH="$HOME/.gems/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc"]; then . "$HOME/google-cloud-sdk/path.zsh.inc" fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc"]; then . "$HOME/google-cloud-sdk/completion.zsh.inc" fi

[ -d "$HOME/.local/bin" ] && export PATH="$PATH:$HOME/.local/bin"
export PATH=$PATH:"$HOME/.emacs.d/bin"

if [[ $OSTYPE == 'darwin'* ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
    export LDFLAGS="-L/opt/homebrew/lib"
    export CPPFLAGS="-I/opt/homebrew/include"
    export CXXFLAGS="-I/opt/homebrew/include"
fi

[[ ! -f ~/.zsh/alias.zsh ]] || source ~/.zsh/alias.zsh

export PATH="$HOME/.rbenv/bin":$PATH
eval "$(rbenv init -)"
